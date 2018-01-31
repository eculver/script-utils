#!/bin/bash
# shellcheck disable=SC1091,SC1090,SC2154

# uncomment for debugging
#set -x
set -e

# globals
_total=0

_usage() {
    echo "Usage: ./scriptname.sh <arg1>"
    echo
}

_finish() {
    echo "DONE"
    echo "Did ${_total} things. "
    echo
}

main() {
    local arg1="$1"
    if [[ -z "${arg1}" ]]; then
        _usage
        echo "arg1 is required" >&2
        exit 1
    fi

    for i in {1..10}; do
        echo ${i};
        _total=$((_total + 1))
    done
}

trap _finish EXIT

main "$@"
