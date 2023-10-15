#!/bin/bash

# Check if a package root argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <package_root>"
  exit 1
fi

# Set the package root directory and the output file
package_root="$1"
output_file="checksum.txt"

# Remove the output file if it exists
rm -f "$output_file"

# Iterate through all files in the package, calculate their SHA-256 checksum, and save the result to the output file
find "$package_root" -type f -not -path "*/.git/*" -exec sha256sum {} \; | sort -k 2 > "$output_file"

# Print the final checksum of the output file
sha256sum "$output_file"
