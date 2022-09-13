#!/bin/sh

check_file() {
    echo "[INFO] Checking script in file '${1}'"
    if ! shellcheck "${1}"; then
        echo "[ERROR] Shell script '${1}' did not pass the shellcheck test"
        exit 1
    fi
}

if ! shellcheck -V > /dev/null 2>&1; then
    printf "[ERROR] shellcheck binary not found\n  Check 'https://github.com/koalaman/shellcheck#installing' on how to install shellcheck\n"
    exit 1
fi

printf "[INFO] Running with shellcheck version:\n\n%s\n\n" "$(shellcheck -V)"

script_files=$(find . -type f -name "*.sh")

for script_file in ${script_files}; do
    check_file "${script_file}"
done