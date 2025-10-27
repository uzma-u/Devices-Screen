# Build APK for Android - Step by Step

## Prerequisites

1. **Install Android Studio**: https://developer.android.com/studio
2. **Install Java JDK**: https://www.oracle.com/java/technologies/downloads/
3. **Install Node.js**: https://nodejs.org/

## Step 1: Install Capacitor

```bash
cd frontend
npm install @capacitor/core @capacitor/cli
npm install @capacitor/android
```

## Step 2: Initialize Capacitor

```bash
npx cap init
```

When prompted, enter:
- **App name**: Smart Devices
- **App ID**: com.smartdevices.app
- **Web Dir**: build

## Step 3: Build React App

```bash
npm run build
```

## Step 4: Add Android Platform

```bash
npx cap add android
npx cap sync
```

## Step 5: Open in Android Studio

```bash
npx cap open android
```

## Step 6: Build APK in Android Studio

1. In Android Studio, wait for Gradle sync to complete
2. Go to **Build** → **Build Bundle(s) / APK(s)** → **Build APK(s)**
3. Wait for the build to complete
4. Click **locate** when prompted
5. The APK will be in: `android/app/build/outputs/apk/debug/`

## Step 7: Install APK on Your Phone

**Method A: Via USB**
1. Enable USB debugging on your phone
2. Connect phone to computer
3. Copy the APK file to your phone
4. Open the APK on your phone to install

**Method B: Via Email/Cloud**
1. Email the APK to yourself
2. Open email on your phone
3. Download and install

## Step 8: Sign the APK (For Release)

For Google Play Store or production:

```bash
cd android/app
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore app-release-unsigned.apk my-key-alias
```

## Troubleshooting

### "SDK not found"
- Open Android Studio
- Go to SDK Manager
- Install required SDK versions

### "Gradle sync failed"
- Check internet connection
- File → Invalidate Caches / Restart

### "App crashes on phone"
- Check backend API URL in `android/app/src/main/assets/config.json`
- Make sure backend is accessible from phone's network

## Alternative: Build Debug APK via Command Line

```bash
cd android
./gradlew assembleDebug
```

APK will be in: `app/build/outputs/apk/debug/`

