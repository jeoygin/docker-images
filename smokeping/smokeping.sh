#!/bin/bash

timezone() { 
    local timezone="${1:-EST5EDT}"
    if [ ! -e /usr/share/zoneinfo/$timezone ]; then
        echo "ERROR: invalid timezone specified" >&2
        return
    fi

    ln -sf /usr/share/zoneinfo/$timezone /etc/localtime
}

usage() { 
    local RC=${1:-0}
    echo "Usage: $( basename $0) [OPTIONS]" >&2
    echo -e "\t-h              This help" >&2
    echo -e "\t-T timezone     Configure timezone" >&2
    exit $RC
}

while getopts ":hT:" opt; do
    case "$opt" in
        h) usage ;;
        T) timezone "$OPTARG" ;;
        "?") echo "Unknown option: -$OPTARG"; usage 1 ;;
        ":") echo "No argument value for option: -$OPTARG"; usage 2 ;;
    esac
done
shift $(( OPTIND - 1 ))

test -n "$TIMEZONE" && timezone "$TIMEZONE"

service smokeping start

apache2 -DFOREGROUND
