#!/bin/bash

scripts/get-backup.sh
scripts/restore-wp.sh
scripts/get-images.sh
scripts/load-images.sh
#scripts/build-all.sh
scripts/genera-pass.sh
fig up -d
