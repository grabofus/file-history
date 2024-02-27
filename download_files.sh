#!/bin/bash

URL_FILE=$1
OUTPUT_DIR="downloads"

mkdir -p $OUTPUT_DIR

while IFS= read -r url; do
  # Extract relevant path from URL and create directories if needed
  file_path=$(echo "$url" | awk -F '//' '{print $2}' | sed 's/\/$//') 
  mkdir -p "$OUTPUT_DIR/$(dirname "$file_path")"

  # Download file
  curl -o "$OUTPUT_DIR/$file_path" "$url"
done < "$URL_FILE"
