#!/bin/bash

set -euo pipefail

# Move to the Notes directory
cd /home/hammad/Notes

# Get only the changed files from Git
changed_files=$(git status -s | awk '{print $2}')

# Check if there are changes
if [ -n "$changed_files" ]; then
    # Commit changes with current date/time and changed files in commit message body
    commit_message="Update on $(date +'%Y-%m-%d %H:%M:%S')

Changed files:
$changed_files"

    git add $changed_files
    git commit -m "$commit_message"

    # Push changes to remote origin
    git push origin master
fi
