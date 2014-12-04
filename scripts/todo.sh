#!/bin/bash

scripts/get-backup.sh
scripts/restore-wp.sh
scripts/get-images.sh
scripts/load-images.sh
scripts/configure-fig.sh
fig up -d
