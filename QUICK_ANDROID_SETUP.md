# Quick Android Setup - 5 Minutes ⚡

## Super Easy Method 🚀

### Step 1: Start Both Servers

**On Windows:**
```bash
start-android.bat
```

**On Mac/Linux:**
```bash
chmod +x start-android.sh
./start-android.sh
```

**Or manually:**

1. **Terminal 1 - Backend:**
```bash
cd backend
npm install
node seed.js
npm run dev
```

2. **Terminal 2 - Frontend:**
```bash
cd frontend
npm install
HOST=0.0.0.0 npm start
```
(On Windows: `set HOST=0.0.0.0 && npm start`)

### Step 2: Find Your IP Address

**Windows:**
```bash
ipconfig
```
Look for "IPv4 Address" (e.g., 192.168.1.100)

**Mac/Linux:**
```bash
ifconfig
```
Look for "inet" under your WiFi adapter (e.g., 192.168.1.100)

### Step 3: Access on Android

1. **Connect your phone to the SAME WiFi network** as your computer
2. **Open Chrome** on your Android device
3. **Go to:** `http://YOUR-IP-ADDRESS:3000`
   - Example: `http://192.168.1.100:3000`

### Step 4: Add to Home Screen (Optional)

Make it look like a real app:

1. In Chrome, tap **Menu** (3 dots top right)
2. Tap **"Add to Home screen"**
3. Name it "Smart Devices"
4. Now it's on your home screen like a native app! 🎉

## Fix API Connection

If products/videos don't load:

1. Create/edit `frontend/.env` file:
```
REACT_APP_API_URL=http://YOUR-IP-ADDRESS:5000/api
```

2. Restart the frontend server

## Troubleshooting

### ❌ Can't connect?
- ✅ Check both devices are on **same WiFi**
- ✅ Check firewall (allow ports 3000 & 5000)
- ✅ Try turning off VPN
- ✅ Make sure backend shows: `0.0.0.0` in console

### ❌ API not working?
- ✅ Update `.env` file with correct IP
- ✅ Check backend is running (see Terminal 1)
- ✅ Test: `http://YOUR-IP:5000/api/products`

### ❌ Port already in use?
```bash
# Find what's using port 3000
netstat -ano | findstr :3000

# Kill it (replace PID with actual process ID)
taskkill /PID <PID> /F
```

## What You'll See

✅ Status bar with time
✅ Header with house icon
✅ Explore section with video cards
✅ Mygate Promise grid
✅ Product listings
✅ FAQ section
✅ Floating chat button
✅ Bottom navigation (5 tabs)
✅ System navigation bar

## Enjoy! 🎉

You now have the Smart Devices app running on your Android device!

---

**Note:** This works on any device connected to your local network - phone, tablet, another computer!

