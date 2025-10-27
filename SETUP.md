# Smart Devices App - Setup Guide

This is a MERN stack application for a Smart Devices e-commerce platform.

## Project Structure

```
backend/
├── models/              # MongoDB schemas
├── routes/              # API routes
├── server.js           # Express server
├── seed.js             # Database seeder
└── package.json

frontend/
├── public/             # Static files
├── src/
│   ├── components/      # React components
│   ├── utils/          # Utility functions
│   └── App.js          # Main app component
└── package.json
```

## Prerequisites

- Node.js (v14 or higher)
- MongoDB (local installation or MongoDB Atlas account)
- npm or yarn

## Backend Setup

1. Navigate to the backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the backend root:
```
MONGODB_URI=mongodb://localhost:27017/smartdevices
PORT=5000
NODE_ENV=development
```

4. Make sure MongoDB is running:
   - For local MongoDB: Start the MongoDB service
   - For MongoDB Atlas: Update the connection string in `.env`

5. Seed the database:
```bash
node seed.js
```

6. Start the backend server:
```bash
npm run dev
```

The backend will run on `http://localhost:5000`

## Frontend Setup

1. Navigate to the frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file (optional, for custom API URL):
```
REACT_APP_API_URL=http://localhost:5000/api
```

4. Start the React development server:
```bash
npm start
```

The frontend will run on `http://localhost:3000`

## API Endpoints

### Products
- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get a single product
- `POST /api/products` - Create a new product (body: name, price, originalPrice, image, etc.)
- `PUT /api/products/:id` - Update a product
- `DELETE /api/products/:id` - Delete a product

### Featured Products
- `GET /api/featured` - Get all active featured products
- `POST /api/featured` - Create a featured product

## Using the App

1. Start both the backend and frontend servers
2. Open your browser to `http://localhost:3000`
3. The app will display the Smart Devices page with:
   - Featured video doorbell product
   - List of smart device accessories
   - Bottom navigation bar
   - Floating chat button

## Features Implemented

- ✅ Responsive mobile-first design
- ✅ Product listing with horizontal scroll
- ✅ Featured product card
- ✅ Price display with discounts
- ✅ Bottom navigation with active states
- ✅ Floating chat icon
- ✅ RESTful API with MongoDB
- ✅ Mock data fallback if API is unavailable

## Customization

### Adding New Products

Use the API:
```javascript
POST /api/products
{
  "name": "Product Name",
  "price": 1990,
  "originalPrice": 2990,
  "image": "https://example.com/image.jpg",
  "description": "Product description",
  "category": "accessories"
}
```

Or directly in the database:
```bash
node seed.js
```

### Styling

Modify `frontend/src/components/SmartDevicesPage.css` to customize the appearance.

### Adding Routes

Add new routes in `backend/routes/` and connect them in `backend/server.js`.

## Troubleshooting

### MongoDB Connection Issues
- Ensure MongoDB is running
- Check the connection string in `.env`
- For Atlas, verify network access settings

### CORS Issues
- Backend already has CORS enabled
- Ensure proxy is set correctly in `frontend/package.json`

### Port Already in Use
- Change the PORT in `.env` (backend)
- React's default port can be changed via environment variable


