#!/bin/bash

set -eu

echo "Formatting $1"
cljstyle fix "$1"
