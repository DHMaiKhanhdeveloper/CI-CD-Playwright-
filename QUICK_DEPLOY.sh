#!/bin/bash
# Quick Deployment Script for PlaywrightP1 CI/CD
# Usage: bash QUICK_DEPLOY.sh

echo "🚀 PlaywrightP1 CI/CD Deployment Script"
echo "========================================"
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "📦 Step 1: Initializing Git repository..."
    git init
    echo "✅ Git initialized"
else
    echo "✅ Git already initialized"
fi

# Check git config
if [ -z "$(git config user.name)" ]; then
    echo ""
    echo "⚠️  Git user.name is not set"
    echo "Please run: git config user.name 'Your Name'"
    echo "Then run this script again"
    exit 1
fi

if [ -z "$(git config user.email)" ]; then
    echo ""
    echo "⚠️  Git user.email is not set"
    echo "Please run: git config user.email 'your.email@example.com'"
    echo "Then run this script again"
    exit 1
fi

# Stage files
echo ""
echo "📝 Step 2: Staging files..."
git add .
echo "✅ Files staged"

# Commit
echo ""
echo "💾 Step 3: Creating commit..."
git commit -m "feat: Initial CI/CD setup with Playwright testing and sharding"
echo "✅ Commit created"

# Remote setup
echo ""
echo "🔗 Step 4: Setting up remote repository"
echo ""
echo "Please enter your GitHub username:"
read -r GITHUB_USERNAME
echo ""
echo "Please enter your repository name (default: PlaywrightP1):"
read -r REPO_NAME
REPO_NAME=${REPO_NAME:-PlaywrightP1}

echo ""
echo "Setting remote origin to: https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git" 2>/dev/null || {
    echo "⚠️  Remote origin already exists. Updating..."
    git remote set-url origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
}
echo "✅ Remote configured"

# Branch setup
echo ""
echo "🌿 Step 5: Setting up main branch..."
git branch -M main
echo "✅ Main branch set"

# Push
echo ""
echo "🚀 Step 6: Pushing to GitHub..."
echo "⚠️  Make sure you have created the repository on GitHub first!"
echo "Visit: https://github.com/new"
echo ""
read -p "Press Enter when repository is created on GitHub..."

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 SUCCESS! Deployment complete!"
    echo ""
    echo "📊 Next steps:"
    echo "1. Visit: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo "2. Click on 'Actions' tab"
    echo "3. Watch your CI/CD pipeline run!"
    echo ""
    echo "📚 For more information, check DEPLOYMENT_GUIDE.md"
else
    echo ""
    echo "❌ Push failed. Please check:"
    echo "1. Repository exists on GitHub"
    echo "2. You have correct permissions"
    echo "3. GitHub credentials are correct"
    echo ""
    echo "Manual push command:"
    echo "git push -u origin main"
fi

