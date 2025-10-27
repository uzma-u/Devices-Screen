# 📱 Simple Mobile Setup Guide

## Quick Method (Takes 5 Minutes) ⚡

### Step 1: Start Servers

**Open PowerShell or Terminal and run:**

```bash
# Navigate to backend folder
cd backend

# Install dependencies (first time only)
npm install

# Seed the database
node seed.js

# Start backend server
npm run dev
```

**Open a NEW terminal window:**

```bash
# Navigate to frontend folder
cd frontend

# Install dependencies (first time only)
npm install

# Start frontend (mobile accessible)
npm run start-mobile
```

### Step 2: Find Your Computer's IP Address

**In PowerShell (Windows):**
```powershell
ipconfig
```

Look for something like:
```
IPv4 Address . . . . . . . . . . . : 192.168.1.100
```

**Write down this IP address!** (Yours might be different)

### Step 3: Get the IP Address on Your Phone

1. Open Chrome on your Android phone
2. Go to: `http://192.168.1.100:3000`
   *(Replace 192.168.1.100 with YOUR IP address)*

### Step 4: You're Done! 🎉

The Smart Devices app should now be working on your phone!

### Step 5: Add to Home Screen (Make it Like a Real App)

1. In Chrome, tap the **Menu** (3 dots ⋮)
2. Tap **"Add to Home screen"**
3. Name it **"Smart Devices"**
4. Tap **Add**

Now you can launch it from your home screen like a native app!

---

## Troubleshooting

### ❌ Phone can't connect?

**Make sure:**
- ✅ Both devices are on the SAME WiFi network
- ✅ Computer firewall isn't blocking (allow ports 3000 & 5000)
- ✅ VPN is turned OFF
- ✅ Phone WiFi isn't set to "metered"

**Quick Test:**
Open Chrome on your computer and go to: `http://localhost:3000`
If it works on computer but not phone → WiFi/Firewall issue

### ❌ Data not loading (products/videos don't show)?

**Fix the API connection:**

1. Create a file named `.env` in the `frontend` folder
2. Add this line (replace with YOUR IP):
```
REACT_APP_API_URL=http://192.168.1.100:5000/api
```

3. Restart the frontend server:
```bash
Ctrl+C  (stop the server)
npm run start-mobile  (start again)
```

### ❌ "Port 3000 already in use"?

**Kill the process:**
```powershell
# Find the process
netstat -ano | findstr :3000

# Kill it (replace PID with actual number)
taskkill /PID 1234 /F
```

Or just restart your computer!

### ❌ Still having issues?

**Try these:**
1. Disable Windows Defender temporarily
2. Check if another app is using port 3000
3. Try a different browser on your phone
4. Restart both servers

---

## What You Should See

✅ Status bar showing time
✅ "Smart Devices" header with house icon 🏠
✅ "Explore" section with video cards
✅ "mygate Promise" with 4 promise cards
✅ Product listings with prices
✅ FAQ card
✅ Floating yellow chat button
✅ Bottom navigation with 5 tabs
✅ All scrollable with smooth scrolling

---

## Running in Background

**Want to keep it running?**

Both terminal windows need to stay open. You can minimize them but don't close them.

To run in background (Windows):
```powershell
# Start backend
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd backend; npm run dev"

# Start frontend  
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd frontend; npm run start-mobile"
```

---

## Alternative: Use a Cloud Service

Don't want to keep your computer on?

Deploy to a free hosting service:
- **Vercel** - vercel.com (easiest)
- **Netlify** - netlify.com
- **Heroku** - heroku.com

See `DEPLOYMENT.md` for detailed instructions.

---

## Support

If you're still stuck:
1. Check `QUICK_ANDROID_SETUP.md`
2. Check `DEPLOYMENT.md`
3. Make sure both servers show "0.0.0.0" in their startup logs

**Most common issue:** Not on same WiFi network! 📶

