#!/bin/bash

scripts/get-backup.sh
scripts/restore-wp.sh
scripts/get-image.sh
scripts/load-image.sh
docker pull mysql
#scripts/build-all.sh
scripts/genera-pass.sh
fig up 
