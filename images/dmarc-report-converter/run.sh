#!/bin/bash
set -Eeuo pipefail

# `fdfind` is https://github.com/sharkdp/fd and a lot nicer than `find` imho
# Don't touch the input dir.
# dmarc-report-converter needs all reports to be in one dir.
fdfind --full-path input/ --type file --exec cp {} ./work/

# Unzipping is done by dmarc-report-converter.

# Empty the output dir, but don't error on it.
set +e
rm -r output/*
set -e

# Convert the reports
./dmarc-report-converter/bin/dmarc-report-converter -config config.yaml
