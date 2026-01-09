# 🚀 GitHub CI/CD Setup - Complete Step-by-Step Guide

## PHASE 1: CREATE GITHUB REPOSITORY

### Step 1: Navigate to GitHub

- URL: https://github.com/new
- Make sure you're logged in

### Step 2: Configure Repository Settings

```
Repository Details:
┌─────────────────────────────────────────────────────┐
│ Owner: YOUR_USERNAME                                │
│ Repository name: PlaywrightP1                       │
│                                                     │
│ Description (optional):                             │
│ Playwright E2E Testing with CI/CD Pipeline         │
│                                                     │
│ ○ Public  ● Private                                 │
│                                                     │
│ Initialize this repository with:                    │
│ ☐ Add a README file                                 │
│ ☐ Add .gitignore                                    │
│ ☐ Choose a license                                  │
│                                                     │
│ ⚠️ IMPORTANT: DO NOT check any boxes above!        │
│    (We already have these files locally)           │
│                                                     │
│         [Create repository]                         │
└─────────────────────────────────────────────────────┘
```

### Step 3: Copy Repository URL

After creating, you'll see:

```
Quick setup — if you've done this kind of thing before

HTTPS: https://github.com/YOUR_USERNAME/PlaywrightP1.git
```

**Copy this URL** - you'll need it later!

---

## PHASE 2: SETUP GITHUB LOCALLY

### Step 4: Open Terminal/Git Bash

- Windows: Open Git Bash in your project folder
- Location: D:\Project\Devops\Setup_Source_Github\PlaywrightP1

### Step 5: Configure Git (First Time Only)

```bash
# Set your name (appears in commits)
git config --global user.name "Your Full Name"

# Set your email (use your GitHub email)
git config --global user.email "your.email@example.com"

# Verify configuration
git config --list
```

### Step 6: Initialize Local Git Repository

```bash
# Check if git is already initialized
git status

# If you see "fatal: not a git repository", run:
git init

# You should see: "Initialized empty Git repository"
```

### Step 7: Add All Files to Staging

```bash
# Stage all files
git add .

# Verify what will be committed
git status
```

You should see files in green:

```
On branch main

Changes to be committed:
  new file:   .github/workflows/playwright.yml
  new file:   .github/workflows/playwright-scheduled.yml
  new file:   .github/workflows/playwright-pr-comment.yml
  new file:   .gitignore
  new file:   README.md
  new file:   DEPLOYMENT_GUIDE.md
  new file:   QUICK_DEPLOY.sh
  new file:   package.json
  new file:   playwright.config.js
  new file:   tests/example.spec.js
```

### Step 8: Create First Commit

```bash
git commit -m "feat: Initial commit with CI/CD pipeline setup"
```

You should see output like:

```
[main (root-commit) abc1234] feat: Initial commit with CI/CD pipeline setup
 10 files changed, 500 insertions(+)
 create mode 100644 .github/workflows/playwright.yml
 ...
```

### Step 9: Connect to GitHub Repository

```bash
# Add remote origin (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/PlaywrightP1.git

# Verify remote is added
git remote -v
```

You should see:

```
origin  https://github.com/YOUR_USERNAME/PlaywrightP1.git (fetch)
origin  https://github.com/YOUR_USERNAME/PlaywrightP1.git (push)
```

### Step 10: Rename Branch to Main

```bash
# Rename current branch to 'main'
git branch -M main

# Verify current branch
git branch
```

### Step 11: Push to GitHub

```bash
# Push code to GitHub
git push -u origin main
```

**First time?** GitHub will ask for authentication:

- Username: your GitHub username
- Password: use **Personal Access Token** (not your account password)

#### How to Create Personal Access Token:

1. Go to: https://github.com/settings/tokens
2. Click "Generate new token" → "Generate new token (classic)"
3. Give it a name: "Playwright CI/CD"
4. Select scopes:
   - ☑ repo (all)
   - ☑ workflow
5. Click "Generate token"
6. **COPY the token immediately** (you won't see it again!)
7. Use this token as password when pushing

---

## PHASE 3: APPLY CI/CD TO GITHUB

### Step 12: Verify GitHub Actions is Enabled

1. Go to your repository: `https://github.com/YOUR_USERNAME/PlaywrightP1`
2. Click **"Settings"** tab (top menu)
3. In left sidebar, click **"Actions"** → **"General"**
4. Under "Actions permissions", select:
   - ● **Allow all actions and reusable workflows**
5. Scroll down and click **"Save"**

### Step 13: Check CI/CD Pipeline Started

1. Go to **"Actions"** tab (top menu)
2. You should see:

   ```
   All workflows

   ✓ Playwright Tests
     #1: feat: Initial commit with CI/CD pipeline setup
     main • abc1234 • Your Name pushed 1 minute ago
     ⏱ In progress
   ```

3. Click on the workflow run to see details

### Step 14: Monitor Pipeline Execution

You'll see the workflow with multiple jobs:

```
Playwright Tests

Jobs:
  ┌─────────────────────────────┐
  │ test (1, 4)    ⏱ Running    │
  │ test (2, 4)    ⏱ Running    │
  │ test (3, 4)    ⏱ Running    │
  │ test (4, 4)    ⏱ Running    │
  │ merge-reports  ⏳ Queued    │
  └─────────────────────────────┘
```

Wait for all jobs to complete (5-15 minutes)

### Step 15: View Test Results

After completion:

```
Jobs:
  ┌─────────────────────────────┐
  │ test (1, 4)    ✓ Success    │
  │ test (2, 4)    ✓ Success    │
  │ test (3, 4)    ✓ Success    │
  │ test (4, 4)    ✓ Success    │
  │ merge-reports  ✓ Success    │
  └─────────────────────────────┘
```

### Step 16: Download Test Reports

1. Scroll down to **"Artifacts"** section
2. You'll see:

   ```
   Artifacts
   - playwright-report-1       Expires in 30 days
   - playwright-report-2       Expires in 30 days
   - playwright-report-3       Expires in 30 days
   - playwright-report-4       Expires in 30 days
   - playwright-report-merged  Expires in 30 days  ⬇ Download
   ```

3. Click **"playwright-report-merged"** to download
4. Extract the ZIP file
5. Open `index.html` in browser to view beautiful HTML report

### Step 17: Setup Branch Protection (Recommended)

1. Go to **"Settings"** → **"Branches"**
2. Click **"Add branch protection rule"** or **"Add rule"**
3. Configure:

   ```
   Branch name pattern: main

   ☑ Require a pull request before merging
     ☑ Require approvals: 1

   ☑ Require status checks to pass before merging
     ☑ Require branches to be up to date before merging
     Search for status checks: "test"
     ☑ test

   ☑ Do not allow bypassing the above settings
   ```

4. Click **"Create"** or **"Save changes"**

**Result**: Now no one can merge to main if tests fail! ✅

### Step 18: Add Status Badge to README

1. Go to **"Actions"** tab
2. Click on **"Playwright Tests"** workflow (left sidebar)
3. Click **"..."** (three dots) → **"Create status badge"**
4. Copy the markdown code
5. Edit `README.md`:

```bash
# Open README.md and replace the badge URL
# Change:
![Playwright Tests](https://github.com/YOUR_USERNAME/PlaywrightP1/actions/workflows/playwright.yml/badge.svg)

# To your actual username
![Playwright Tests](https://github.com/yourusername/PlaywrightP1/actions/workflows/playwright.yml/badge.svg)
```

6. Commit and push:

```bash
git add README.md
git commit -m "docs: Update status badge with correct username"
git push
```

### Step 19: Test CI/CD with a New Change

Let's test that CI/CD works:

```bash
# Create a new branch
git checkout -b test-cicd

# Make a small change to test file
echo "// Test CI/CD" >> tests/example.spec.js

# Commit and push
git add .
git commit -m "test: Verify CI/CD pipeline"
git push -u origin test-cicd
```

### Step 20: Create Pull Request

1. Go to your GitHub repository
2. You'll see a yellow banner:
   ```
   test-cicd had recent pushes
   [Compare & pull request]
   ```
3. Click **"Compare & pull request"**
4. Fill in:
   - Title: "Test CI/CD Pipeline"
   - Description: "Testing automatic CI/CD execution"
5. Click **"Create pull request"**

6. Watch the magic happen:

   ```
   Some checks haven't completed yet
   ⏱ test (1, 4)  •  Expected — Waiting for status to be reported
   ⏱ test (2, 4)  •  Expected — Waiting for status to be reported
   ⏱ test (3, 4)  •  Expected — Waiting for status to be reported
   ⏱ test (4, 4)  •  Expected — Waiting for status to be reported
   ```

7. After completion:

   ```
   ✓ All checks have passed
   ✓ test (1, 4)
   ✓ test (2, 4)
   ✓ test (3, 4)
   ✓ test (4, 4)

   [Merge pull request ▼]
   ```

8. You may also see an automatic comment from the bot:

   ```
   playwright-bot commented 2 minutes ago

   ✅ Playwright Tests success

   View detailed report
   ```

---

## PHASE 4: VERIFY AND MAINTAIN (Optional)

### Step 21: Setup Scheduled Tests

Your scheduled workflow is already configured! It will:

- Run automatically every day at 6 AM UTC
- Can also be triggered manually

To run manually:

1. Go to **"Actions"** → **"Scheduled E2E Tests"**
2. Click **"Run workflow"** → **"Run workflow"**

### Step 22: Configure Notifications

#### Email Notifications:

1. Go to: https://github.com/settings/notifications
2. Enable:
   - ☑ Actions
   - Choose: "Only notify on failure" or "Always"

#### Slack Notifications (Optional):

Add to `.github/workflows/playwright.yml`:

```yaml
- name: Slack Notification
  if: always()
  uses: 8398a7/action-slack@v3
  with:
    status: ${{ job.status }}
    webhook_url: ${{ secrets.SLACK_WEBHOOK }}
    text: "Playwright Tests ${{ job.status }}"
```

### Step 23: Monitor CI/CD Usage

1. Go to **"Settings"** → **"Billing"**
2. View **"Actions"** usage:
   ```
   GitHub Actions
   2,000 minutes free per month
   Used: 45 minutes (2.25%)
   Remaining: 1,955 minutes
   ```

---

## 🎯 VERIFICATION CHECKLIST

After completing all steps, verify:

- [ ] ✅ Repository created on GitHub
- [ ] ✅ Local git repository initialized
- [ ] ✅ Code pushed to GitHub
- [ ] ✅ GitHub Actions enabled
- [ ] ✅ First CI/CD pipeline completed successfully
- [ ] ✅ Test reports downloaded and verified
- [ ] ✅ Branch protection enabled
- [ ] ✅ Status badge working in README
- [ ] ✅ Pull request test successful
- [ ] ✅ PR status checks visible
- [ ] ✅ Scheduled workflow configured
- [ ] ✅ Notifications setup (optional)

---

## 🔧 QUICK REFERENCE COMMANDS

### Daily Workflow (After Setup):

```bash
# Make changes to your code
# ...

# Stage changes
git add .

# Commit with meaningful message
git commit -m "feat: Add new test case"

# Push to GitHub (CI/CD runs automatically)
git push

# View results at: https://github.com/YOUR_USERNAME/PlaywrightP1/actions
```

### Create Feature Branch:

```bash
# Create and switch to new branch
git checkout -b feature/my-feature

# Make changes, then commit
git add .
git commit -m "feat: My new feature"

# Push and create PR
git push -u origin feature/my-feature

# Go to GitHub and create Pull Request
# CI/CD will run automatically on PR
```

### Update from Main:

```bash
# Switch to main branch
git checkout main

# Pull latest changes
git pull origin main

# Switch back to your branch
git checkout feature/my-feature

# Merge main into your branch
git merge main
```

---

## 📊 CI/CD WORKFLOW VISUALIZATION

```
Developer Workflow:
┌─────────────────────────────────────────────────────────┐
│                                                         │
│  Developer writes code                                  │
│         ↓                                               │
│  git add . && git commit                                │
│         ↓                                               │
│  git push origin main                                   │
│         ↓                                               │
│  ┌──────────────────────────────────┐                  │
│  │   GitHub Receives Push Event     │                  │
│  └──────────────────────────────────┘                  │
│         ↓                                               │
│  ┌──────────────────────────────────┐                  │
│  │  GitHub Actions Triggers         │                  │
│  │  (playwright.yml)                │                  │
│  └──────────────────────────────────┘                  │
│         ↓                                               │
│  ┌──────────────────────────────────────────────┐      │
│  │  4 Parallel Jobs Start:                      │      │
│  │  ┌─────────────┐  ┌─────────────┐           │      │
│  │  │ test (1/4)  │  │ test (2/4)  │           │      │
│  │  │ - Install   │  │ - Install   │           │      │
│  │  │ - Run tests │  │ - Run tests │           │      │
│  │  │ - Upload    │  │ - Upload    │           │      │
│  │  └─────────────┘  └─────────────┘           │      │
│  │  ┌─────────────┐  ┌─────────────┐           │      │
│  │  │ test (3/4)  │  │ test (4/4)  │           │      │
│  │  │ - Install   │  │ - Install   │           │      │
│  │  │ - Run tests │  │ - Run tests │           │      │
│  │  │ - Upload    │  │ - Upload    │           │      │
│  │  └─────────────┘  └─────────────┘           │      │
│  └──────────────────────────────────────────────┘      │
│         ↓                                               │
│  ┌──────────────────────────────────┐                  │
│  │  merge-reports Job:              │                  │
│  │  - Download all reports          │                  │
│  │  - Merge into single report      │                  │
│  │  - Upload merged report          │                  │
│  └──────────────────────────────────┘                  │
│         ↓                                               │
│  ┌──────────────────────────────────┐                  │
│  │  ✅ Success!                      │                  │
│  │  - Status badge updated          │                  │
│  │  - Reports available             │                  │
│  │  - Notifications sent            │                  │
│  └──────────────────────────────────┘                  │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

---

## ⚠️ COMMON ISSUES & SOLUTIONS

### Issue 1: Push to GitHub Failed

```
Error: remote: Permission to username/repo.git denied
```

**Solution:**

- Use Personal Access Token instead of password
- Get token at: https://github.com/settings/tokens

### Issue 2: Actions Not Running

```
No workflows found
```

**Solution:**

1. Check Settings → Actions → Allow all actions
2. Verify `.github/workflows/` folder exists
3. Check YAML syntax is correct

### Issue 3: Tests Failing on CI but Pass Locally

```
✓ Local: All tests pass
✗ CI: Tests fail
```

**Solution:**

- Set environment variable locally: `CI=true npx playwright test`
- Check if tests depend on local files/data
- Verify browser versions match

### Issue 4: Can't Download Artifacts

```
Artifacts not found
```

**Solution:**

- Check retention period (default: 30 days)
- Verify workflow completed successfully
- Check if artifacts were uploaded

---

## 🎉 SUCCESS!

Your CI/CD pipeline is now fully operational!

### What You've Achieved:

✅ Automated testing on every push
✅ Parallel test execution (4x faster)
✅ Multi-browser testing
✅ Automated reports
✅ Branch protection
✅ Pull request automation
✅ Scheduled daily tests

### Next Steps:

1. Write more test cases
2. Configure notifications
3. Add more workflows as needed
4. Share with your team

---

**Need Help?**

- GitHub Actions Docs: https://docs.github.com/actions
- Playwright Docs: https://playwright.dev
- This Project: Check README.md

**Last Updated:** January 8, 2026
