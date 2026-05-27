#!/bin/bash

# Define the target file name
OUTPUT_FILE="book/status.qmd"
FILE="counter.txt"

# Format the date and time strings
CURRENT_DATE=$(date "+%Y-%m-%d")
CURRENT_TIME=$(date "+%H:%M:%S")


echo "# Theory of Computation v2 Build Information {.unnumbered}"  > "$OUTPUT_FILE"
echo "* Generated on: **$CURRENT_DATE** at **$CURRENT_TIME**" >> "$OUTPUT_FILE"




# Read number (defaults to 0 if file is empty or missing)
NUM=$(cat "$FILE" 2>/dev/null || echo 0)

# Increment by 1
NEW_NUM=$((NUM + 1))

# Write back to file
echo "$NEW_NUM" > "$FILE"
echo "* Build number **$NEW_NUM**" >> "$OUTPUT_FILE"

echo "Output successfully written to $OUTPUT_FILE"
quarto render --to html
echo "Version **$NEW_NUM** ready for publication"