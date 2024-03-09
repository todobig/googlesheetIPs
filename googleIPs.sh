#!/bin/bash

# Loop through each line in goog.txt
while IFS= read -r ip; do
    # Check if line is not empty and doesn't start with a comment (#)
    if [[ ! -z "$ip" && ! "$ip" =~ ^# ]]; then
        # Add the IP address or range to the firewall as a permanent rule
        sudo firewall-cmd --zone=public --permanent --add-rich-rule="rule family=\"ipv4\" source address=$ip accept"
    fi
done < goog.txt

# Reload the firewall to apply changes
sudo firewall-cmd --reload
