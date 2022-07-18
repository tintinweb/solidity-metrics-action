#!/usr/bin/env bash
set -e
solidity-code-metrics --html "$@" > __metrics.html
echo "::set-output name=report::__metrics.html"