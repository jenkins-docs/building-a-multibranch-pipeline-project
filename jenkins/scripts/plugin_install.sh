#!/bin/bash

# Variables
EXCEL_FILE="stc-plugins.xlsx"
CSV_FILE="stc-plugins.csv"
PLUGINS_DIR="jenkins-plugins"
ZIP_FILE="jenkins-plugins.zip"

# Convert Excel file to CSV
xlsx2csv $EXCEL_FILE $CSV_FILE

# Create a directory for the plugins
mkdir -p $PLUGINS_DIR

# Extract URLs from the specific columns and download if not already present
grep -o -E 'https?://[^,]+' "$CSV_FILE" | while read -r url; do
    if [[ $url =~ ^https?:// ]]; then
        wget -P $PLUGINS_DIR "$url"
    fi
done

# Create a zip file of the downloaded plugins
zip -r $ZIP_FILE $PLUGINS_DIR

# Cleanup
rm $CSV_FILE

echo "Plugins downloaded and zipped successfully in $ZIP_FILE"