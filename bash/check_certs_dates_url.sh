#!/bin/bash

# Input file with list of URLs
input_file="list.txt"

# Output file for results
output_file="certs.txt"

# Timeout in seconds
timeout_duration=5

# Clear the output file if it exists
> "$output_file"

# Read URLs from the input file
while IFS= read -r url
do
    echo "Checking certificate for $url"
    echo "URL: $url" >> "$output_file"
    
    # Use timeout command with openssl
    if output=$(timeout $timeout_duration openssl s_client -connect "$url":443 2>/dev/null </dev/null | openssl x509 -noout -dates); then
        echo "$output" >> "$output_file"
    else
        if [ $? -eq 124 ]; then
            echo "Connection timed out after $timeout_duration seconds" >> "$output_file"
        else
            echo "Failed to retrieve certificate information" >> "$output_file"
        fi
    fi
    echo "" >> "$output_file"  # Add a blank line for readability
done < "$input_file"

echo "Certificate date check complete. Results written to $output_file"
