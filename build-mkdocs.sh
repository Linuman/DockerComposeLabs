#!/bin/bash

# Build MkDocs static site for production deployment
# This script generates the static HTML site in the mkdocs-site/ directory

set -e

echo "🏗️  Building MkDocs static site..."

# Check if virtual environment exists
if [ ! -d ".venv" ]; then
    echo "❌ Virtual environment not found. Please run ./start-mkdocs.sh first."
    exit 1
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source .venv/bin/activate

# Build the site
echo "📦 Building static site..."
mkdocs build --clean

echo "✅ Build complete! Static site is in mkdocs-site/"
echo "📁 You can deploy the contents of mkdocs-site/ to any web server"
