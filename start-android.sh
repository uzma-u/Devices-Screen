#!/bin/bash

echo "========================================"
echo "Smart Devices App - Android Setup"
echo "========================================"
echo ""

echo "[Step 1/3] Finding your IP address..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    IP=$(hostname -I | awk '{print $1}')
elif [[ "$OSTYPE" == "darwin"* ]]; then
    IP=$(ipconfig getifaddr en0)
else
    IP=$(hostname -I | awk '{print $1}')
fi

echo "Your IP Address: $IP"
echo ""
echo "On your Android device:"
echo "1. Connect to same WiFi network"
echo "2. Open Chrome browser"
echo "3. Go to: http://$IP:3000"
echo ""
read -p "Press Enter to continue..."

echo ""
echo "[Step 2/3] Seeding database..."
node seed.js

echo ""
echo "[Step 3/3] Starting servers..."
echo "Backend: http://$IP:5000"
echo "Frontend: http://$IP:3000"
echo ""

# Set environment variable for network access
export HOST=0.0.0.0

# Start backend in background
npm run dev &
BACKEND_PID=$!

# Wait a bit for backend to start
sleep 3

# Start frontend in foreground
cd frontend
npm start

# Cleanup on exit
trap "kill $BACKEND_PID" EXIT

