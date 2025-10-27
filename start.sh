#!/bin/bash

echo "Starting Smart Devices App..."
echo ""

echo "Installing backend dependencies..."
npm install
echo ""

echo "Seeding database..."
node seed.js
echo ""

echo "Starting backend server..."
npm run dev &
BACKEND_PID=$!
echo "Backend started with PID: $BACKEND_PID"

sleep 3

echo "Installing frontend dependencies..."
cd frontend
npm install
echo ""

echo "Starting frontend server..."
npm start &
FRONTEND_PID=$!

cd ..

echo ""
echo "Both servers are running..."
echo "Backend: http://localhost:5000"
echo "Frontend: http://localhost:3000"
echo ""
echo "Press Ctrl+C to stop both servers"

wait $BACKEND_PID $FRONTEND_PID


