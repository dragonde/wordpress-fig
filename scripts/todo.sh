#!/bin/bash

scripts/get-backup.sh
scripts/restore-wp.sh
scripts/build-all.sh
fig up -d
sleep 10 
scripts/restore-db.sh

