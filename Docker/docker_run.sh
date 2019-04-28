#!/usr/bin/env bash
set -xeuo pipefail

docker run \
-it --rm \
-v "$PWD":/application \
litteraux.hf \
sh -c "$@"
