# ✅ CI/CD Setup Checklist

Print this page and check off each step as you complete it!

---

## 📦 PHASE 1: CREATE GITHUB REPOSITORY

### □ Step 1: Visit GitHub
- [ ] Go to https://github.com/new
- [ ] Make sure you're logged in

### □ Step 2: Fill Repository Form
```
Repository name: PlaywrightP1
Description: Playwright E2E Testing with CI/CD Pipeline
Visibility: ○ Public  ● Private (your choice)

⚠️ IMPORTANT: Leave these UNCHECKED:
☐ Add a README file
☐ Add .gitignore  
☐ Choose a license
```
- [ ] Click "Create repository"
- [ ] Copy the repository URL shown

---

## 🔧 PHASE 2: SETUP GITHUB LOCALLY

### □ Step 3: Configure Git (First Time Only)
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```
- [ ] Commands executed
- [ ] Run `git config --list` to verify

### □ Step 4: Initialize Git Repository
```bash
cd D:\Project\Devops\Setup_Source_Github\PlaywrightP1
git init
```
- [ ] Repository initialized
- [ ] See message: "Initialized empty Git repository"

### □ Step 5: Stage All Files
```bash
git add .
git status
```
- [ ] All files shown in green
- [ ] Verify workflow files are included

### □ Step 6: Create First Commit
```bash
git commit -m "feat: Initial commit with CI/CD pipeline setup"
```
- [ ] Commit created successfully
- [ ] See message with files changed

### □ Step 7: Connect to GitHub
```bash
git remote add origin https://github.com/YOUR_USERNAME/PlaywrightP1.git
git remote -v
```
- [ ] Remote added (replace YOUR_USERNAME with your username)
- [ ] Verify with `git remote -v`

### □ Step 8: Push to GitHub
```bash
git branch -M main
git push -u origin main
```
- [ ] Code pushed successfully
- [ ] If asked for password, use Personal Access Token

#### Need Personal Access Token?
- [ ] Visit: https://github.com/settings/tokens
- [ ] Click "Generate new token (classic)"
- [ ] Name: "Playwright CI/CD"
- [ ] Scopes: ☑ repo, ☑ workflow
- [ ] Copy token and use as password

---

## 🚀 PHASE 3: APPLY CI/CD TO GITHUB

### □ Step 9: Enable GitHub Actions
- [ ] Go to repository Settings → Actions → General
- [ ] Select: "Allow all actions and reusable workflows"
- [ ] Click "Save"

### □ Step 10: Verify CI/CD Started
- [ ] Go to "Actions" tab
- [ ] See "Playwright Tests" workflow running
- [ ] Status shows "In progress" or completed

### □ Step 11: Wait for Pipeline Completion
Watch for these jobs to complete:
- [ ] test (1, 4) - ✓ Success
- [ ] test (2, 4) - ✓ Success
- [ ] test (3, 4) - ✓ Success
- [ ] test (4, 4) - ✓ Success
- [ ] merge-reports - ✓ Success

⏱️ Estimated time: 5-15 minutes

### □ Step 12: Download Test Reports
- [ ] Scroll to "Artifacts" section
- [ ] Click "playwright-report-merged" to download
- [ ] Extract ZIP file
- [ ] Open `index.html` in browser
- [ ] Verify test results are displayed

### □ Step 13: Setup Branch Protection
- [ ] Go to Settings → Branches
- [ ] Click "Add branch protection rule"
- [ ] Branch name pattern: `main`
- [ ] Enable:
  - [ ] ☑ Require status checks to pass before merging
  - [ ] ☑ Search and select "test" 
  - [ ] ☑ Require branches to be up to date
- [ ] Click "Create" or "Save changes"

### □ Step 14: Update Status Badge
- [ ] Open README.md
- [ ] Replace `YOUR_USERNAME` with your actual GitHub username
- [ ] Commit and push:
```bash
git add README.md
git commit -m "docs: Update status badge"
git push
```
- [ ] Verify badge shows on GitHub repository page

---

## 🧪 PHASE 4: TEST THE CI/CD PIPELINE

### □ Step 15: Test with Pull Request
```bash
# Create test branch
git checkout -b test-cicd

# Make a small change
echo "// Test CI/CD" >> tests/example.spec.js

# Commit and push
git add .
git commit -m "test: Verify CI/CD pipeline"
git push -u origin test-cicd
```
- [ ] Branch created and pushed

### □ Step 16: Create Pull Request
- [ ] Go to GitHub repository
- [ ] Click "Compare & pull request" button
- [ ] Title: "Test CI/CD Pipeline"
- [ ] Click "Create pull request"
- [ ] Watch status checks run automatically
- [ ] Verify all checks pass: ✓

### □ Step 17: Verify Automated Features
- [ ] Status checks appear on PR
- [ ] All tests run automatically
- [ ] See comment from bot (if configured)
- [ ] Merge button only enabled after tests pass

### □ Step 18: Merge Pull Request
- [ ] Click "Merge pull request"
- [ ] Click "Confirm merge"
- [ ] See success message
- [ ] CI/CD runs again on main branch

---

## ✅ FINAL VERIFICATION

### □ Check All Features Working
- [ ] ✓ Tests run automatically on push
- [ ] ✓ Tests run automatically on PR
- [ ] ✓ 4 parallel jobs execute
- [ ] ✓ Reports generated and downloadable
- [ ] ✓ Status badge shows on README
- [ ] ✓ Branch protection prevents merging if tests fail
- [ ] ✓ Scheduled workflow configured (runs daily at 6 AM UTC)

### □ Optional Enhancements
- [ ] Email notifications configured
- [ ] Slack notifications setup (optional)
- [ ] Team members have access
- [ ] Documentation shared with team

---

## 🎉 CONGRATULATIONS!

Your CI/CD pipeline is fully operational!

### What Happens Now?
Every time you push code:
1. ✅ GitHub Actions triggers automatically
2. ✅ Tests run in parallel (4 jobs)
3. ✅ Reports are generated
4. ✅ You get notified of results
5. ✅ Can't merge if tests fail

### Quick Commands for Daily Use:
```bash
# Make changes to code
# ...

# Stage, commit, push
git add .
git commit -m "feat: Your changes"
git push

# CI/CD runs automatically!
# View at: https://github.com/YOUR_USERNAME/PlaywrightP1/actions
```

---

## 📞 TROUBLESHOOTING

If something doesn't work, check:
- [ ] GitHub Actions is enabled in Settings
- [ ] Workflow files exist in `.github/workflows/`
- [ ] YAML syntax is correct (no tabs, proper indentation)
- [ ] Personal Access Token has correct permissions
- [ ] Repository is not empty

**Need detailed help?** 
See: `GITHUB_SETUP_STEPS.md` for full documentation

---

**Setup Date:** _______________

**Setup By:** _______________

**Repository URL:** https://github.com/_______________/PlaywrightP1

**Status:** □ In Progress  □ Completed ✓

---

*Keep this checklist for reference and future CI/CD setups!*

