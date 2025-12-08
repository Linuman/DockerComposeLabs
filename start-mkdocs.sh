#!/bin/bash

# Start MkDocs development server with live reload
# This script sets up a Python virtual environment and runs MkDocs in watch mode

set -e

echo "🚀 Starting MkDocs development server..."

# Create virtual environment if it doesn't exist
if [ ! -d ".venv" ]; then
    echo "📦 Creating Python virtual environment..."
    python3 -m venv .venv
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source .venv/bin/activate

# Install/upgrade dependencies
echo "📥 Installing/upgrading dependencies..."
pip install --upgrade pip
pip install -r mkdocs/requirements.txt

# Start MkDocs server with live reload
echo "🌐 Starting MkDocs server on http://127.0.0.1:8000"
echo "📝 Live reload is enabled - changes will be reflected automatically"
echo "⏹️  Press CTRL+C to stop the server"
echo ""

mkdocs serve --livereload --dev-addr=127.0.0.1:8000
