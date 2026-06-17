#!/bin/bash

# backup.sh - Automated backup utility
# no extra options

# -- Customize section ---------------------------------
TARGET="$HOME/backups"

# Directories/Files to backup (absolute paths)
WHITELIST=(
    # "$HOME/Documents"                      # Every file under the "Documents" folder
    # "$HOME/.bashrc"                        # My .bashrc file
    # "$HOME/Images/cat_picture.png"         # My cat picture should be saved too!
)

# Directories/Files to ignore explicitly (supports wildcards like */folder/*)
BLACKLIST=(
    # "*/my_directory_here/*"                # ignore one subdirectory
    # "*.sh"                                 # ignore .sh files
    # "*/fake_cat_picture_.png"              # ignore fake cat picture
)

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.zip"
# ------------------------------------------------------

OUTPUT="$TARGET/$BACKUP_NAME"


echo "Checking whitelist Entries..."

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
    echo "ERROR: the zip command failed to make $OUTPUT"
    exit 1
else
    echo "Backup done!"
fi
