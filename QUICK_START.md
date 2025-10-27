# Quick Start Guide

Follow these steps to get the Smart Devices app running in minutes!

## Step 1: Install Backend Dependencies

```bash
cd backend
npm install
```

## Step 2: Setup Environment

Create a file named `.env` in the `backend` folder:

```env
MONGODB_URI=mongodb://localhost:27017/smartdevices
PORT=5000
NODE_ENV=development
```

**Note:** Make sure MongoDB is running on your system. If using MongoDB Atlas, replace the URI with your connection string.

## Step 3: Seed the Database

```bash
node seed.js
```

This will create sample products and featured items.

## Step 4: Start the Backend Server

```bash
npm run dev
```

The backend will start on `http://localhost:5000`

## Step 5: Setup Frontend (New Terminal)

Open a new terminal and navigate to the frontend:

```bash
cd frontend
npm install
```

## Step 6: Start the Frontend

```bash
npm start
```

The frontend will automatically open in your browser at `http://localhost:3000`

## That's It! 🎉

You should now see:
- A mobile-style interface with yellow accent colors
- Featured video doorbell product
- Scrollable product cards
- Bottom navigation
- All the UI elements from the design

## Testing the API

You can test the backend API using these endpoints:

```bash
# Get all products
curl http://localhost:5000/api/products

# Get featured products
curl http://localhost:5000/api/featured

# Create a new product
curl -X POST http://localhost:5000/api/products \
  -H "Content-Type: application/json" \
  -d '{"name":"Test Product","price":999,"originalPrice":1499,"image":"https://example.com/image.jpg"}'
```

## Troubleshooting

### MongoDB Not Running
- Install MongoDB: https://www.mongodb.com/try/download/community
- Or use MongoDB Atlas (free cloud option)

### Port Already in Use
- Change `PORT=5000` to a different port in `.env`
- Or kill the process using that port

### API Not Connecting
- Check backend is running on port 5000
- Check CORS is enabled in backend
- Check network tab in browser DevTools

### Still Having Issues?
Check the detailed `SETUP.md` or `README.md` files for more information.


