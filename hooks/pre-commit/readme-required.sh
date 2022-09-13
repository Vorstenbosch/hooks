#! /usr/bin/env bash

README_FILE=${README_FILE:-README.md}

ls "${README_FILE}" || (echo "[ERROR] readme in file '${README_FILE}' not found"; exit 1) 