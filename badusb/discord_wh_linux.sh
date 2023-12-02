export WEBHOOK_URL="https://discord.com/api/webhooks/1180459253924909118/JP-HpTFSYUStv8nitmhmXn_nJzOTdCY84f7YhNOhbXtkSm-5ERSGWk4Bsey8oxvrDJpx"
curl \
  -H "Content-Type: application/json" \
  -d '{"username": "Murerig", "content": "Coin ?"}' \
  $WEBHOOK_URL