#!/bin/bash

scripts/get-backup.sh
scripts/restore-wp.sh
scripts/build-all.sh
fig up -d
sleep 20 
scripts/restore-db.sh

