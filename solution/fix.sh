#!/bin/bash

# Fix dependency
echo "flask==2.2.5" > /app/requirements.txt

pip install -r /app/requirements.txt

# Fix app.py bug (replace invalid default)
sed -i 's/notanumber/8000/' /app/app.py

# Set environment variable
export APP_PORT=8000

# Run app in background
nohup python /app/app.py > /app/output.log 2>&1 &
