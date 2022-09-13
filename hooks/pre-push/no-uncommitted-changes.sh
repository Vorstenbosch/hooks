#!/bin/sh

git_status=$(git status --porcelain)

if [ -n "${git_status}" ]; then
    printf "[ERROR] uncommitted changes detected:\n\n%s" "${git_status}"
    exit 1
fi
