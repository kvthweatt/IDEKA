# Discord Library

`discord.idk` is a Discord bot library written entirely in IDEKA. It talks to the Discord REST API (v10) and the Discord Gateway over native TLS 1.3, with no FFI crypto and no external TLS library. JSON handling uses `json.idk`.

It is built on these modules:

| Module | Role |
|---|---|
| `webclient.idk` | HTTP/1.1 client and WebSocket client |
| `tls.idk` (`standard::tls13`) | Native TLS 1.3 client |
| `cryptography.idk` | X.509 chain validation, RSA, ECDSA, AES-GCM, SHA-2, X25519 |
| `json.idk` | Building and parsing gateway and REST payloads |

## Contents

1. [Quick start](#quick-start)
2. [Setup](#setup)
3. [High level API](#high-level-api)
4. [Types](#types)
5. [Low level API](#low-level-api)
6. [Intents](#intents)
7. [How it works](#how-it-works)
8. [Limitations](#limitations)
9. [Troubleshooting](#troubleshooting)
10. [Testing](#testing)

---

## Quick start

A bot that answers `!ping` with `pong`:

```
#import <standard.idk>, <webclient.idk>, <discord.idk>;

using standard::discord;

global DISCORD_BOT g_bot;
global DISCORD_EVENT g_ev;

main() -> int
{
    if (discord_start(@g_bot, "discord_token.txt\0",
                      INTENT_GUILD_MESSAGES + INTENT_DIRECT_MESSAGES + INTENT_MESSAGE_CONTENT) != 0) { return 1; };

    while (discord_next(@g_bot, @g_ev) == 1)
    {
        if (g_ev.author_bot == 0 & discord_content_is(@g_ev, "!ping\0"))
        {
            discord_reply(@g_bot, @g_ev, "pong\0");
        };
    };
    -> 0;
};

```

This is `examples/discord_ping_bot.idk`.

---

## Setup

### 1. Create the bot

1. Create an application in the Discord developer portal.
2. Open **Bot** and copy the bot token.
3. Under **Privileged Gateway Intents**, enable **Message Content Intent**. Without it the gateway closes the connection with code `4014`.
4. Invite the bot to a server with permission to read and send messages in the channels it should use.

### 2. Token file

Put the token on one line in `discord_token.txt` in the working directory. The text is cut at the first line break, so a trailing newline is fine. Do not commit this file. Add it to `.gitignore`.

### 3. Trusted root certificates

The library verifies Discord's certificate chain, so it needs trusted roots.

| Platform | Where roots are read from |
|---|---|
| Linux | `/etc/ssl/certs/ca-certificates.crt` |
| Windows (and Linux fallback) | `cacert.pem` in the working directory |

On Windows, download https://curl.se/ca/cacert.pem into the directory the bot runs from.

---

## High level API

These four functions cover most bots.

### `discord_start`

```
def discord_start(DISCORD_BOT* bot, byte* token_path, int intents) -> int
```

Loads the token from `token_path`, loads the trusted roots, and prepares the bot. Returns `0` on success and `1` on failure. On failure it prints one of:

- `discord: token file missing or empty`
- `discord: no trusted roots, put cacert.pem (https://curl.se/ca/cacert.pem) in the working directory`

### `discord_next`

```
def discord_next(DISCORD_BOT* bot, DISCORD_EVENT* ev) -> int
```

Blocks until a message arrives and stores it in `ev`. Always returns `1` with an event stored. It connects on first use and reconnects automatically if the gateway drops the session, retrying every 5 seconds when a connect fails. Heartbeats are sent automatically while it waits.

### `discord_reply`

```
def discord_reply(DISCORD_BOT* bot, DISCORD_EVENT* ev, byte* text) -> int
```

Sends `text` to the channel the event came from. Returns the HTTP status (`200` on success) or `-1` on a transport error.

### `discord_content_is`

```
def discord_content_is(DISCORD_EVENT* ev, byte* text) -> bool
```

True when the message text equals `text` exactly. For other matching, read `ev.content` directly (see [DISCORD_EVENT](#discord_event)).

---

## Types

### DISCORD_EVENT

A received message (`MESSAGE_CREATE`).

| Field | Type | Meaning |
|---|---|---|
| `guild_id` | `byte[32]` | Server id, empty for direct messages |
| `channel_id` | `byte[32]` | Channel id |
| `message_id` | `byte[32]` | Message id |
| `author_id` | `byte[32]` | Author's user id |
| `username` | `byte[96]` | Author's username |
| `author_bot` | `int` | `1` when the author is a bot, else `0` |
| `content_len` | `int` | Length of `content` in bytes |
| `content` | `byte[4100]` | Message text, zero terminated, UTF-8 |

Ids are strings, as Discord sends them. Check `author_bot == 0` before replying, otherwise the bot can answer its own messages and other bots.

### DISCORD_BOT

All connection state for one bot: token, intents, host names and ports, the gateway and REST streams, the receive buffer, and heartbeat timing. It is large (it holds a 70000 byte receive buffer), so declare it `global`. One `DISCORD_BOT` is one bot connection.

Fields you may read or set:

| Field | Meaning |
|---|---|
| `intents` | Intent bits sent when identifying |
| `close_code` | Last gateway close code. `0` none, `-1` transport error, otherwise the Discord code (for example `4014`) |
| `gw_host`, `gw_path`, `gw_port` | Gateway address (default `gateway.discord.gg`, `/?v=10&encoding=json`, `443`) |
| `rest_host`, `rest_prefix`, `rest_port` | REST address (default `discord.com`, `/api/v10`, `443`) |
| `use_tls` | `1` for TLS (default), `0` for plain TCP |

The host, port and `use_tls` fields exist mainly so tests can point the library at a local mock.

---

## Low level API

Use these when you want your own loop or control over connecting. `discord_start`/`discord_next` are built from them.

### `discord_init`

```
def discord_init(DISCORD_BOT* bot, byte* token, int intents, X509_CERT* roots, int nroots) -> void
```

Sets the token, intents and roots, and fills in the default Discord hosts and ports. Use this instead of `discord_start` when you supply the token and roots yourself (`X509::x509_load_pem_bundle` loads a PEM bundle into `X509_CERT` entries).

### `discord_connect`

```
def discord_connect(DISCORD_BOT* bot) -> int
```

Opens the gateway WebSocket, reads Hello, and sends Identify. Returns `0` on success. Non-zero codes:

| Code | Meaning |
|---|---|
| `1` | TCP connect failed |
| `100 + n` | TLS failed, `n` is the TLS error. `104` is a certificate chain failure, and `bot.gw_tls.vrc` holds the X.509 result |
| `200` | WebSocket handshake failed. `bot.gw.hs_line` holds the response lines |
| `201` | No Hello received |
| `202` | First gateway message was not a valid Hello |
| `203` | Sending Identify failed |

### `discord_poll`

```
def discord_poll(DISCORD_BOT* bot, DISCORD_EVENT* ev, int timeout_ms) -> int
```

Waits up to `timeout_ms` for the next gateway message and sends heartbeats on schedule.

| Return | Meaning |
|---|---|
| `1` | A `MESSAGE_CREATE` was stored in `ev` |
| `0` | Nothing happened within the timeout |
| `-1` | The session ended. Call `discord_connect` again. `bot.close_code` says why |

A Reconnect (op 7), an Invalid Session (op 9), a close frame, and transport errors all return `-1`.

### `discord_send_message`

```
def discord_send_message(DISCORD_BOT* bot, byte* channel_id, byte* text) -> int
```

POSTs `text` to `/channels/{channel_id}/messages` with the `Authorization: Bot <token>` header. Quotes, backslashes, newlines and control characters in `text` are escaped. Returns the HTTP status or `-1`.

### `discord_close`

```
def discord_close(DISCORD_BOT* bot) -> void
```

Sends a WebSocket close frame and closes the gateway connection.

### Custom loop

```
discord_init(@bot, token, INTENT_GUILD_MESSAGES + INTENT_MESSAGE_CONTENT, roots, nroots);
while (true)
{
    if (discord_connect(@bot) != 0) { /* wait and retry */ continue; };
    while (true)
    {
        got = discord_poll(@bot, @ev, 30000);
        if (got < 0) { break; };
        if (got == 1) { /* handle ev */ };
    };
};
```

---

## Intents

Passed to `discord_start` or `discord_init`. Add them together.

| Constant | Value | Purpose |
|---|---|---|
| `INTENT_GUILDS` | `1` | Guild create/update events |
| `INTENT_GUILD_MESSAGES` | `512` | Messages in servers |
| `INTENT_DIRECT_MESSAGES` | `4096` | Direct messages |
| `INTENT_MESSAGE_CONTENT` | `32768` | Message text (privileged, enable in the portal) |

---

## How it works

- **Gateway:** `wss://gateway.discord.gg/?v=10&encoding=json`. After connecting, the library reads Hello (op 10), starts heartbeating at the interval it gives (op 1, with the last sequence number), and sends Identify (op 2). It tracks the sequence number from every dispatch (op 0).
- **REST:** each `discord_send_message` call opens a TLS connection to `discord.com`, sends the request with `Connection: close`, and reads the response.
- **TLS:** native TLS 1.3, cipher suite `TLS_AES_128_GCM_SHA256`, key exchange X25519. The server chain is verified: signatures (RSA PKCS#1 and PSS, ECDSA P-256 and P-384), validity dates, CA flags, path length, and the host name. The chain is accepted when any certificate in it is vouched for by a trusted root, so the cross-signed roots Discord sends do not matter.
- **Waiting:** `discord_poll` uses `select` on the socket, so it sleeps instead of spinning while waiting for events.

---

## Limitations

- Only `MESSAGE_CREATE` events are delivered. Other gateway events are read and ignored.
- Replies are plain text messages. There are no embeds, attachments, reactions, slash commands, or components yet.
- No session resume: after a disconnect the bot identifies again and misses events sent in between.
- No sharding. One connection handles one bot, which is enough for small and medium bots.
- No gateway compression and no rate limit handling. A `429` from REST is returned as the status code.
- TLS is TLS 1.3 only, with one cipher suite and one key exchange group. A server that requires anything else will fail to connect. This covers Discord.
- The receive buffer holds 70000 bytes. A larger gateway message is dropped.
- Messages longer than Discord's 2000 character limit are rejected by Discord, not split by the library.
- `discord_start` reads roots from the Linux system bundle or `cacert.pem`. It does not use the Windows certificate store.

---

## Troubleshooting

| Symptom | Cause and fix |
|---|---|
| `discord: token file missing or empty` | `discord_token.txt` is not in the working directory, or is empty |
| `discord: no trusted roots ...` | On Windows put `cacert.pem` in the working directory |
| `connect failed 104` | Certificate chain rejected. Check the clock is correct and `cacert.pem` is current. `bot.gw_tls.vrc`: `2` expired, `3` bad signature, `4` not a CA, `5` no trusted root, `6` host name, `7` unsupported algorithm, `8` path length, `9` key usage |
| `connect failed 200` | WebSocket handshake failed. Read `bot.gw.hs_line` |
| Disconnect with close code `4004` | The token is wrong |
| Disconnect with close code `4014` | Enable **Message Content Intent** in the developer portal |
| Disconnect with close code `4013` | An intent value was invalid |
| Bot connects but never sees messages | The bot lacks permission to view the channel, or the Message Content intent is off |
| `discord_reply` returns `403` | The bot lacks permission to send in that channel |
| `discord_reply` returns `401` | The token is wrong |

---

## Testing

`tests/discord_test.idk` runs the library against `tests/discord_mock.py`, a local mock of the gateway and REST endpoints. From the repository root:

```
python3 tests/discord_mock.py
build/discord_test/discord_test
```

The test covers connecting, Identify, event decoding with escapes, REST sending with the bot authorization header, heartbeats, Invalid Session handling, and reconnecting. It prints `ALL PASS` on success.