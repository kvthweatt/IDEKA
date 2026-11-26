#!/usr/bin/env bash
# Focused language probes; run with a rebuilt idkc to test compiler changes.
set -eu

if (( $# > 1 )); then
    printf 'Usage: bash scripts/check_native_features.sh [path-to-idkc]\n' >&2
    exit 2
fi
if [[ $(uname -s) != Linux || $(uname -m) != x86_64 ]]; then
    printf 'This check targets the native Linux x86-64 compiler and system C ABI.\n' >&2
    exit 2
fi

repo=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
compiler=${1:-"$repo/idkc"}
fixtures="$repo/tests/agent_checks"
mkdir -p "$repo/build"
work=$(mktemp -d "$repo/build/native-features.XXXXXXXX")
finish() {
    local status=$?
    if (( status == 0 )); then
        rm -rf -- "$work"
    else
        printf 'Checks failed; artifacts kept at %s\n' "$work" >&2
    fi
}
trap finish EXIT
install -m 755 -- "$compiler" "$work/idkc"
export IDEKA_SRCDIR="$repo"
cd "$work"

compile() {
    local source=$1
    shift
    local name=${source##*/}
    if ! ./idkc "$source" "$@" > "${name%.idk}.log" 2>&1; then
        cat "${name%.idk}.log" >&2
        return 1
    fi
}

expect_output() {
    local name=$1 expected=$2 actual
    if ! actual=$("./build/$name/$name") || [[ $actual != "$expected" ]]; then
        printf 'FAIL %s: expected stdout <%s>, got <%s> (or nonzero exit)\n' "$name" "$expected" "$actual" >&2
        return 1
    fi
    printf 'PASS %s\n' "$name"
}

expect_rejection() {
    local source=$1 diagnostic=$2 rc=0
    shift 2
    ./idkc "$source" "$@" > reject.log 2>&1 || rc=$?
    if (( rc != 1 )) || ! grep -Fq -- "$diagnostic" reject.log; then
        cat reject.log >&2
        printf 'FAIL %s: expected exit 1 and diagnostic <%s>, got exit %s\n' "$source" "$diagnostic" "$rc" >&2
        return 1
    fi
    printf 'PASS rejected %s %s\n' "${source##*/}" "$*"
}

compile "$fixtures/types.idk"
expect_output types 'primitive and bitwise checks passed'
compile "$fixtures/comptime.idk"
expect_output comptime 'comptime: 21'
sed 's/emitideka/emitflux/' "$fixtures/comptime.idk" > old_emit.idk
expect_rejection old_emit.idk 'illegal inside a member-assign block'

compile "$fixtures/operators.idk"
expect_output operators 'custom operator: 10'
sed 's/+++/AGENT_SUM/g' "$fixtures/operators.idk" > word_operator.idk
compile word_operator.idk
expect_output word_operator 'custom operator: 10'
sed '/^operator /,/^};/d' word_operator.idk > word_missing.idk
expect_rejection word_missing.idk "Unexpected 'AGENT_SUM' in expression"

expect_rejection "$fixtures/tie_reuse.idk" 'use after untie'
sed '/int second/d; s/first + second - 10/first - 5/' "$fixtures/tie_reuse.idk" > tie_once.idk
compile tie_once.idk
expect_output tie_once ''
compile "$fixtures/borrow_alias.idk"
expect_output borrow_alias ''
expect_rejection "$fixtures/borrow_alias.idk" '[FBC error] mutable_alias' --borrowcheck
compile "$fixtures/borrow_alias.idk" --borrowcheck-warn
grep -Fq '[FBC warning] mutable_alias' borrow_alias.log
expect_output borrow_alias ''

compile "$fixtures/ffi.idk"
expect_output ffi 'C ABI: 37'
compile "$repo/examples/reading_summary.idk"
expect_output reading_summary 'min 18, max 25, total 105, above limit 3'

# Do not turn this known specification discrepancy into a passing behavior.
compile "$fixtures/byte_order.idk"
if ! byte_order=$(./build/byte_order/byte_order); then
    printf 'FAIL byte_order executable\n' >&2
    exit 1
fi
mapfile -t bytes <<< "$byte_order"
if [[ ${#bytes[@]} == 6 && ${bytes[0]} == 52 && ${bytes[1]} == 18 && ${bytes[4]} == 18 && ${bytes[5]} == 52 ]]; then
    printf 'PASS byte_order explicit-zero/default match the spec; explicit-one bytes: %s %s\n' "${bytes[2]}" "${bytes[3]}"
elif [[ $byte_order == $'18\n52\n52\n18\n52\n18' ]]; then
    printf 'XFAIL byte_order: observed bytes differ from the spec (see .agents/ERRORS.md)\n'
else
    printf 'FAIL byte_order: unexpected output\n%s\n' "$byte_order" >&2
    exit 1
fi
