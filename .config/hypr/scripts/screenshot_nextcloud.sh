#!/bin/bash

# fetch variables from .env
set -a
source ~/.config/hypr/scripts/nextcloud.env
set +a

user="$NC_USER"
app_password="$NC_PASS"

# if [[ -z "$user" || -z "$app_password" ]]; then
#   echo "Error: User or password not set. Please check your .env file."
#   exit 1
# fi

file="/tmp/screenshot-$(date +%Y%m%d-%H%M%S).png"
filename=$(basename "$file")

remote_path="/$filename"
upload_url="https://cloud.nukeops.com/remote.php/dav/files/$user$remote_path"
share_api="https://cloud.nukeops.com/ocs/v2.php/apps/files_sharing/api/v1/shares"


# Screenshot with grimblast
grimblast --freeze save area "$file" || exit 1

# Upload the file to Nextcloud via WebDAV
curl -s -u "$user:$app_password" -T "$file" "$upload_url" || {
    notify-send "❌ Upload failed" "$filename"
    exit 1
}

# Create public share link
response=$(curl -s -u "$user:$app_password" \
    -H "OCS-APIRequest: true" \
    -H "Accept: application/json" \
    -d "path=$remote_path&shareType=3" \
    "$share_api")

# Debugging tip (optional): uncomment to see raw response
# echo "$response"

# Parse share link
share_url=$(echo "$response" | jq -r '.ocs.data.url')

if [[ "$share_url" == http* ]]; then
    echo -n "$share_url/preview" | wl-copy
    notify-send "☁️ Screenshot shared" "Link copied to clipboard"
else
    notify-send "⚠️ Uploaded" "But failed to create share link"
fi

