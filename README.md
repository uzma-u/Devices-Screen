# Devices Screen

A MERN stack frontend for the Devices-Screen mobile application.

## Features

- Product management (CRUD operations)
- Featured product management
- Video tutorial management
- RESTful API endpoints
- MongoDB database integration
- Complete mobile UI with all features

## Setup

1. Install dependencies:
```bash
npm install
```

2. Create a `.env` file in the root directory:
```
MONGODB_URI=mongodb://localhost:27017/smartdevices
PORT=5000
```

3. Make sure MongoDB is running on your system

4. Start the server:
```bash
npm run dev
```

## API Endpoints

### Products
- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get a single product
- `POST /api/products` - Create a new product
- `PUT /api/products/:id` - Update a product
- `DELETE /api/products/:id` - Delete a product

### Featured Products
- `GET /api/featured` - Get all active featured products
- `POST /api/featured` - Create a featured product

### Videos
- `GET /api/videos` - Get all active videos
- `POST /api/videos` - Create a new video

## Frontend

The frontend React app is located in the `frontend` directory. Navigate there and run `npm install` and `npm start` to start the development server.



