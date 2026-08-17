#!/bin/bash

echo "=== Git Commit ==="
echo ""

read -p "Enter Commit Message: " message

if [ -z "$message" ]; then
    echo "Commit Message can't be nothing"
    exit 1
fi

echo ""
echo "Upload."
git add .

echo "Commit: $message"
git commit -m "$message"

if [ $? -ne 0 ]; then
    echo "Commit Failed"
    exit 1
fi

echo "Uploading to GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "Upload Done！"
else
    echo ""
    echo "Push Failed"
    exit 1
fi