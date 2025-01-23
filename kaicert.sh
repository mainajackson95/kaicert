#!/bin/bash

echo "Enter a domain (example domain.com):"
read Domain

if [ -z "$Domain" ]; then
  echo "No Domain Provided. Exiting!"
  exit 1
fi


Organization=$(echo "$Domain" | sed 's/\..*//')  
output_file="${Domain}_subdomains_$(date +%Y%m%d).txt"


{
  
  curl -s "https://crt.sh/?q=$Domain&output=json" | jq -r '.[] | .name_value, .common_name'
  
  
  curl -s "https://crt.sh/?cn=%.$Domain&output=json" | jq -r '.[] | .name_value'
  
  
  curl -s "https://crt.sh/?O=$Organization&output=json" | jq -r '.[] | .common_name'
} | sed 's/^\*\.//g' | awk '!seen[tolower($0)]++' | tee "$output_file"

echo "domains saved to: $output_file"
