#!/bin/bash

# Execute all scripts in the shells.d directory
TARGET_FILES=$(find shells.d -type f -name "*.sh")
for file in $TARGET_FILES; do
    bash "$file"
done
