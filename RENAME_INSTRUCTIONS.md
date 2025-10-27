# Rename Frontend Folder Instructions

## Quick Method

### Step 1: Stop the Frontend Server
- In the terminal where you ran `npm start`
- Press `Ctrl+C` to stop the server
- Close that terminal window

### Step 2: Rename the Folder

**Option A: Using PowerShell (in backend folder)**
```powershell
Move-Item -Path "frontend" -Destination "device frontend"
```

**Option B: Manual Rename**
1. Navigate to: `C:\Users\Admin\Downloads\SM_app\backend`
2. Find the `frontend` folder
3. Right-click on it
4. Select "Rename"
5. Type: `device frontend`
6. Press Enter

### Step 3: Update Scripts

After renaming, update these files:

**Update: start-android.bat**
Change:
```batch
cd frontend
```
To:
```batch
cd "device frontend"
```

**Update: package.json scripts (if needed)**
No changes needed - they use relative paths

### Step 4: Restart Server

```powershell
cd "device frontend"
npm start
```

---

## Alternative: Create a Copy Instead

If you want to keep both versions:

```powershell
Copy-Item -Path "frontend" -Destination "device frontend" -Recurse
```

This creates a copy while keeping the original.

---

## Complete Project Structure

After renaming, your structure will be:
```
SM_app/
└── backend/
    ├── device frontend/  ← Renamed folder
    ├── models/
    ├── routes/
    ├── package.json
    └── server.js
```

---

## Note

All file paths will still work because we use relative paths in the code. Only terminal commands need to be updated to use `"device frontend"` instead of `frontend`.

