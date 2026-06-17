#!/bin/bash

# backup.sh - Automated backup utility
# no extra options

# -- Customize section ---------------------------------
TARGET="$HOME/backups"

# Directories/Files to backup (absolute paths)
WHITELIST=(
    # "$HOME/Images/cat_picture.png"         # My cat picture should be saved too!
)

# Directories/Files to ignore explicitly (supports wildcards like */folder/*)
BLACKLIST=(
    # "*/fake_cat_picture_.png"              # ignore fake cat picture
)

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.zip"
# ------------------------------------------------------

OUTPUT="$TARGET/$BACKUP_NAME"


echo "Checking whitelist Entries..."

if [ ${#WHITELIST[@]} -eq 0 ]; then
    echo "ERROR: Whitelist is empty. Nothing to backup."
    exit 1
fi

for dir in "${WHITELIST[@]}"; do
    if [ ! -e "$dir" ]; then
        echo "ERROR: could not find '$dir'."
        echo "Aborting. Nothing has changed."
        exit 1 
    fi
done

echo "Valid whitelist!"

mkdir -p "$TARGET"

echo "Trying to make: $OUTPUT"

TAR_OPTS=()
if [ ${#BLACKLIST[@]} -gt 0 ]; then
    for item in "${BLACKLIST[@]}"; do
        TAR_OPTS+=("--exclude=$item")
    done
else
    echo "WARNING: blacklist is empty"
fi

if ! tar -czf "$OUTPUT" "${TAR_OPTS[@]}" "${WHITELIST[@]}"; then
    echo "ERROR: the tar command failed to make $OUTPUT"
    exit 1
else
    echo "Backup done!"
fi
