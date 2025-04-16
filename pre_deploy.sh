#!/bin/bash

set -e

echo "🟢 Starting pre-deployment checks..."

# 1. Check if Java is installed
if ! command -v java &> /dev/null; then
  echo "java not found"
  exit 1
fi

# 2. Check if the build folder exists
if [ ! -d "build/libs" ]; then
  echo "build directory not found!"
  exit 1
fi

# 3. Show Java version
echo "java version:"
java -version

# 4. List all .jar files
echo "listing jar files in build/libs:"
ls build/libs/*.jar || echo "no jar files found."

# 5. Simulate DB connection check
echo "checking database connectivity..."
sleep 1
echo "connection successful (simulated)."

# 6. Export deployment flag
export DEPLOY_READY=true
echo "Deployment readiness: $DEPLOY_READY"

# 7. Final message
echo "pre-deployment checks passed."
