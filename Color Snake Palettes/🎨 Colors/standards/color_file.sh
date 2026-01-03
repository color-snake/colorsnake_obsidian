#!/bin/bash

# Read the CSV file (assuming it's named "NTC.csv")
while IFS=, read -r name hex; do
    # Create a file with the hex value as the name
    touch "$hex.md"
    
    # Write content to the file
    echo "funlow"  >> "$hex.md"
    echo "$name" > "$hex.md"
    echo "UNQU1 #$hex UNQ2" >> "$hex.md"
    echo "RGB"  >> "$hex.md"
done < NTC.csv
