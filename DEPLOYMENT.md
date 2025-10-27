# How to Run Smart Devices App on Android Device

## Method 1: Access via Local Network (Easiest)

### Step 1: Find Your Computer's IP Address

**On Windows:**
```bash
ipconfig
```
Look for "IPv4 Address" (e.g., 192.168.1.100)

**On Mac/Linux:**
```bash
ifconfig
```
or
```bash
hostname -I
```

### Step 2: Start the Backend Server

```bash
cd backend
npm install
node seed.js
npm run dev
```

The backend will run on `http://localhost:5000`

### Step 3: Start the Frontend with Network Access

```bash
cd frontend
npm install
npm start
```

By default, React dev server only listens on localhost. To access from your phone:

**Option A: Change the start script (Recommended)**

In `frontend/package.json`, change:
```json
"scripts": {
  "start": "react-scripts start",
  "start-mobile": "set HOST=0.0.0.0 && react-scripts start"
}
```

Then run:
```bash
npm run start-mobile
```

Or manually:
```bash
set HOST=0.0.0.0 && npm start
```

**Option B: Set environment variable**

On Windows:
```powershell
$env:HOST="0.0.0.0"
npm start
```

On Mac/Linux:
```bash
HOST=0.0.0.0 npm start
```

### Step 4: Access from Your Android Device

1. Make sure your phone is connected to the same Wi-Fi network as your computer
2. Open Chrome browser on your Android device
3. Navigate to: `http://YOUR-COMPUTER-IP:3000`
   - Example: `http://192.168.1.100:3000`
4. You should see the Smart Devices app!

### Step 5: Configure API URL

Update the frontend to use your computer's IP address for the backend API.

In `frontend/src/utils/api.js`, change:
```javascript
const API_URL = 'http://YOUR-COMPUTER-IP:5000/api';
```

Or create `frontend/.env`:
```
REACT_APP_API_URL=http://192.168.1.100:5000/api
```

## Method 2: Deploy to a Cloud Service

### Option 1: Deploy to Heroku (Free)

1. Install Heroku CLI
2. Login:
```bash
heroku login
```

3. Create a new app:
```bash
heroku create smart-devices-app
```

4. Deploy backend:
```bash
cd backend
heroku addons:create mongolab:sandbox
git init
git add .
git commit -m "Initial commit"
git push heroku master
```

5. Deploy frontend using React build:
```bash
cd frontend
npm run build
# Then deploy build folder to a static hosting service
```

### Option 2: Use Firebase Hosting (Free)

1. Install Firebase CLI:
```bash
npm install -g firebase-tools
```

2. Login:
```bash
firebase login
```

3. Initialize in frontend directory:
```bash
cd frontend
firebase init
```

4. Build and deploy:
```bash
npm run build
firebase deploy
```

5. Your app will be live at: `https://your-project.firebaseapp.com`

### Option 3: Use Vercel (Free & Easy)

1. Install Vercel CLI:
```bash
npm install -g vercel
```

2. Deploy:
```bash
cd frontend
vercel
```

3. Follow the prompts and your app will be deployed!

## Method 3: Create an APK (Hybrid App)

### Using Capacitor (Recommended)

1. Install Capacitor:
```bash
cd frontend
npm install @capacitor/core @capacitor/cli
npm install @capacitor/android
```

2. Initialize:
```bash
npx cap init
```

3. Add Android platform:
```bash
npx cap add android
```

4. Build the React app:
```bash
npm run build
npx cap sync
```

5. Open in Android Studio:
```bash
npx cap open android
```

6. In Android Studio:
   - Build the APK
   - Run on device or emulator
   - Generate signed APK for distribution

### Using Cordova

1. Install Cordova:
```bash
npm install -g cordova
```

2. Create Cordova app:
```bash
cd ..
cordova create smart-devices-app
```

3. Add React build to Cordova:
```bash
cd frontend
npm run build
# Copy build files to Cordova www folder
```

4. Add Android platform:
```bash
cd smart-devices-app
cordova platform add android
```

5. Build APK:
```bash
cordova build android
```

## Quick Start (Simplest Method)

### For Testing on Your Device Right Now:

1. **Start Backend:**
```bash
cd backend
npm install
node seed.js
```

Open `server.js` and change line:
```javascript
app.listen(PORT, '0.0.0.0', () => {
```

Then:
```bash
npm run dev
```

2. **Start Frontend with Network Access:**
```bash
cd frontend
npm install
HOST=0.0.0.0 npm start
```

3. **Find Your Computer's IP:**
   - Windows: `ipconfig`
   - Mac/Linux: `ifconfig`

4. **On Your Android:**
   - Open Chrome
   - Go to `http://YOUR-IP:3000`
   - Done! 🎉

5. **Optional - Add to Home Screen:**
   - In Chrome, tap Menu (3 dots)
   - Select "Add to Home screen"
   - The app will now appear like a native app!

## Troubleshooting

### Can't Connect?
- Make sure both devices are on the same Wi-Fi
- Check firewall settings (allow port 3000)
- Try disabling VPN if active
- Check that your phone's Wi-Fi isn't set to "metered"

### API Not Working?
- Update the API URL in `.env` file
- Make sure backend is running on `0.0.0.0`, not `localhost`
- Check backend is accessible: `http://YOUR-IP:5000/api/products`

### Performance Issues?
- The app loads images from placeholder.com which might be slow
- Consider using local images or a CDN
- Check network speed

## Best Practices

1. **For Development:** Use Method 1 (Local Network) - Fastest iteration
2. **For Testing:** Deploy to a staging URL - Share easily
3. **For Production:** Build APK with Capacitor - Native experience

## Security Note

⚠️ When accessing via local network (Method 1), anyone on your Wi-Fi can access the app. This is fine for development but not recommended for production.

