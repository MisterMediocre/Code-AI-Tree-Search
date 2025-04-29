#!/bin/bash

for file in APPS_Solutions/test/*/tutorial.txt; do
  dir=$(basename $(dirname "$file"))
  dest_dir="APPS/test/$dir"
  
  if [ -d "$dest_dir" ]; then
    cp "$file" "$dest_dir/tutorial.txt"
    echo "Copied $file -> $dest_dir/tutorial.txt"
  fi
done

