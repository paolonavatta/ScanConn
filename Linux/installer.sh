#!/bin/bash
# ScanConn Installer v0.1.0


# Get the current script path
SRC_DIR="$(pwd)"

# Copy the executable files to /usr/local/bin
cp "$SRC_DIR/scanconn" /usr/local/bin/
cp "$SRC_DIR/ScanConn.py" /usr/local/bin/

# Ensure permissions to the executables
chmod +x /usr/local/bin/scanconn
chmod +x /usr/local/bin/ScanConn.py
chmod +x "$SRC_DIR/scanconn"
chmod +x "$SRC_DIR/ScanConn.py"
chmod +x "$SRC_DIR/uninstaller.sh"

# Create symbolic links in /usr/local/bin pointing to configuration and log files
ln -sf "$SRC_DIR/API-key.txt" /usr/local/bin/API-key.txt
ln -sf "$SRC_DIR/log.txt" /usr/local/bin/log.txt
ln -sf "$SRC_DIR/report.txt" /usr/local/bin/report.txt
