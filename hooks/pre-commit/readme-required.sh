#!/bin/sh

README_FILE=${README_FILE:-README.md}

echo "[INFO] looking for readme file at '${README_FILE}'"

if ! ls "${README_FILE}" > /dev/null 2>&1; then
    echo "[ERROR] readme in file '${README_FILE}' not found"
    exit 1
fi