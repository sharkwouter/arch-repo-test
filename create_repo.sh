#!/bin/bash
set -e
set -u

cd "$(dirname "$0")"
OUTPUT_DIR="${PWD}/output"

# Make sure the output directory exists
mkdir -p "${OUTPUT_DIR}"
rm -rf "${OUTPUT_DIR}/*"

find . -type f -name "*.pkg.tar.zst" -exec cp {} "${OUTPUT_DIR}/" \;

cd "${OUTPUT_DIR}"
repo-add minigalaxy.db.tar.gz *.pkg.tar.zst
