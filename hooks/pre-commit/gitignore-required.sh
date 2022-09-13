#!/bin/sh

if ! ls .gitignore > /dev/null 2>&1; then
    echo "[ERROR] no '.gitignore' file was found"
    exit 1
fi