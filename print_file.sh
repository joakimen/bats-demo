#!/usr/bin/env bash

[[ -z $1 ]] && {
    echo "Please specify a filename" >&2
    exit 1
}

cat "$1"
