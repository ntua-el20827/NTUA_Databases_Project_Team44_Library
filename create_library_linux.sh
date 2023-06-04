#!/bin/bash

# Get the current directory
current_dir=$(cd "$(dirname "$0")" && pwd)

# Print the current directory
echo "Current directory: $current_dir"

# Construct the file paths
schema_file="${current_dir}/library/sql/library_schema.sql"
data_file="${current_dir}/library/sql/insert_data.sql"

# Change directory to /opt/lampp/bin
cd /opt/lampp/bin

# Run MySQL and load the files
sudo ./mysql -u root -p <<EOF
DROP DATABASE IF EXISTS library;
SOURCE $schema_file
SOURCE $data_file
EOF

