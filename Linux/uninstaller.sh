#!/bin/bash
# ScanConn Uninstaller v0.1.0


FILES=(
  "/usr/local/bin/API-key.txt"
  "/usr/local/bin/log.txt"
  "/usr/local/bin/report.txt"
  "/usr/local/bin/scanconn"
  "/usr/local/bin/ScanConn.py"
)

# Remove the symlinks and executables from /usr/local/bin
for file in "${FILES[@]}"; do
  if [ -e "$file" ]; then
    echo "Removing $file"
    rm "$file"
  else
    echo "File $file not found, skipping."
  fi
done
