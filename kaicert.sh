#!/bin/bash

echo "Enter a domain (example domain.com):"
read Domain

if [ -z "$Domain" ]; then
  echo "No Domain Provided. Exiting!"
  exit 1
fi

# Extract organization name (remove TLDs like .com, .ai, etc.)
Organization=$(echo "$Domain" | sed 's/\..*//')  # "outlier.ai" → "outlier"
output_file="${Domain}_subdomains_$(date +%Y%m%d).txt"

# Fetch and process data from all endpoints
{
  # Query 1: q=DOMAIN → name_value and common_name
  curl -s "https://crt.sh/?q=$Domain&output=json" | jq -r '.[] | .name_value, .common_name'
  
  # Query 2: cn=%.DOMAIN → name_value
  curl -s "https://crt.sh/?cn=%.$Domain&output=json" | jq -r '.[] | .name_value'
  
  # Query 3: O=ORGANIZATION → common_name
  curl -s "https://crt.sh/?O=$Organization&output=json" | jq -r '.[] | .common_name'
} | sed 's/^\*\.//g' | awk '!seen[tolower($0)]++' | tee "$output_file"

echo "domains saved to: $output_file"
