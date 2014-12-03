#!/bin/bash

scripts/get-backup.sh
scripts/restore-wp.sh
scripts/build-all.sh
scripts/genera-pass.sh
fig up -d
