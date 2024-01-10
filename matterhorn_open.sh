#!/bin/bash
#
echo "Command and arguments: $0 $@" >> ~/debug.log

# Check if there is exactly one argument
if [ $# -ne 1 ]; then
     echo "Usage: $0 <URL>"
     exit 1
fi

url="$1"

# Define domains to be ignored
ignore_domains=("tel.meet" "another.domain")

# Define domains to be opened with Google Chrome
chrome_domains=("google" "figma")

# Extract the domain from the URL
domain=$(echo $url | awk -F/ '{print $3}')

# Check if the domain is in the ignore list
for ignore_domain in "${ignore_domains[@]}"; do
    if [[ "$domain" == *"$ignore_domain"* ]]; then
        exit
    fi
done

# Check if the domain is in the Chrome list
for chrome_domain in "${chrome_domains[@]}"; do
    if [[ "$domain" == *"$chrome_domain"* ]]; then
        /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --profile-directory="Profile 1" "$url"
        exit
    fi
done

# If it's not in either list, execute the 'open' command
open "$url"