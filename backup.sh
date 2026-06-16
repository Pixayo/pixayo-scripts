#!/bin/bash

# backup.sh - Automated backup utility
# no extra options

# -- Customize section ---------------------------------
TARGET="$HOME/backups"

# Directories/Files to backup (absolute paths)
WHITELIST=(
    # "$HOME/my/path/here"
)

# Directories/Files to ignore explicitly (supports wildcards like */folder/*)
BLACKLIST=(
    # "*/my_directory_here/*"         # ignore one subdirectory
    # "*.sh"                          # ignore .sh files
    # "*/cat_picture_231.png"         # ignore cat picture
)

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.zip"
# ------------------------------------------------------

OUTPUT="$TARGET/$BACKUP_NAME"


echo "Checking Whitelist Entries..."

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

if ! zip -r "$OUTPUT" "${WHITELIST[@]}" -x "${BLACKLIST[@]}"; then
    echo "ERROR: zip failed to make $OUTPUT"
    exit 1
else
    echo "Backup done!"
fi
