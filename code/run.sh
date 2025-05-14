#!/bin/bash

# Clone repository
echo "Installing node dependencies..."

# Navigate to back-end and install dependencies
cd back-end
npm i &  # Run npm install in the background for the back-end

# Navigate to front-end and install dependencies
cd ../front-end
npm i &  # Run npm install in the background for the front-end

# Wait for both npm installs to complete
wait

# Start back-end
cd ../back-end
npm run start &
BACKEND_PID=$!

# Start front-end
cd ../front-end
npm run dev &
FRONTEND_PID=$!

# Set up a trap to catch SIGINT (Ctrl+C) and kill the background processes
trap 'kill $BACKEND_PID $FRONTEND_PID' SIGINT

# Wait for both processes to finish
wait $BACKEND_PID
wait $FRONTEND_PID