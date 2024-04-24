#!/bin/bash

echo "test sample"

# Get the name of the current branch
current_branch=$(git rev-parse --abbrev-ref HEAD)
echo "current branch name is: $current_branch"

# Name of the output file
output_file="branch_diff.txt"

# Perform the diff with the main branch and write output to a file
#git diff main "$current_branch" > "$output_file"

# Inform the user about the output file
#echo "Git diff between main branch and $current_branch saved to: $output_file"
