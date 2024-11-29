#!/bin/bash

# Input: Folders to check
FOLDERS_TO_CHECK=($1)

# Get the list of changed files in the last commit
CHANGED_FILES=$(git diff-tree --no-commit-id --name-only -r HEAD)

# Check if any changed file belongs to the specified folders
for folder in "${FOLDERS_TO_CHECK[@]}"; do
  if echo "$CHANGED_FILES" | grep -q "^$folder/"; then
    echo "changes_detected=true" >> "$GITHUB_OUTPUT"
    exit 0
  fi
done

echo "changes_detected=false" >> "$GITHUB_OUTPUT"
exit 0
