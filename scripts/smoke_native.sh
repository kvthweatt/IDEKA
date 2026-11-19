#!/usr/bin/env bash
# Compile and run two small IDEKA programs on Linux x86-64.
set -eu

if (( $# > 1 )); then
    printf 'Usage: bash scripts/smoke_native.sh [path-to-idkc]\n' >&2
    exit 2
fi
if [[ $(uname -s) != Linux || $(uname -m) != x86_64 ]]; then
    printf 'This smoke test uses the bundled Linux x86-64 assembler and linker.\n' >&2
    exit 2
fi

root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
compiler=${1:-"$root/idkc"}
mkdir -p -- "$root/build"
work=$(mktemp -d "$root/build/native-smoke.XXXXXXXX")
cleanup() {
    local status=$?
    if (( status == 0 )); then
        rm -rf -- "$work"
    else
        printf 'Smoke test failed; artifacts kept at %s\n' "$work" >&2
    fi
}
trap cleanup EXIT

# Stage a copy: Git stores the bundled compiler without the execute bit.
# The default x64 backend assembles and links inside idkc.
install -m 755 -- "$compiler" "$work/idkc"
export IDEKA_SRCDIR="$root"
cd -- "$work"

check_program() {
    local source=$1 expected=$2 stem actual
    stem=${source##*/}
    stem=${stem%.idk}
    if ! ./idkc "$root/$source" > "${stem}.compile.log" 2>&1; then
        cat -- "${stem}.compile.log" >&2
        return 1
    fi
    actual=$("./build/$stem/$stem") || {
        local status=$?
        printf 'Executable failed (exit %s): %s\n' "$status" "$source" >&2
        return "$status"
    }
    if [[ $actual != "$expected" ]]; then
        printf '%s: expected <%s>, got <%s>\n' "$source" "$expected" "$actual" >&2
        return 1
    fi
    printf 'PASS %s\n' "$source"
}

check_program examples/helloworld.idk 'Hello World!'
check_program tests/language_smoke.idk 'IDEKA language smoke passed'
