# 🚀 Quick Command Reference

Copy and paste these commands in order!

---

## 📦 PART 1: CREATE GITHUB REPOSITORY

**Go to:** https://github.com/new

Fill in:
- Repository name: `PlaywrightP1`
- Visibility: Public or Private
- ⚠️ **DO NOT** check any initialization options
- Click "Create repository"

---

## 🔧 PART 2: SETUP LOCALLY

### Configure Git (First Time Only)
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Initialize and Commit
```bash
# Navigate to project folder
cd D:\Project\Devops\Setup_Source_Github\PlaywrightP1

# Initialize git (if not already)
git init

# Stage all files
git add .

# Check what will be committed
git status

# Create first commit
git commit -m "feat: Initial commit with CI/CD pipeline setup"
```

### Connect to GitHub
```bash
# ⚠️ Replace YOUR_USERNAME with your actual GitHub username
git remote add origin https://github.com/YOUR_USERNAME/PlaywrightP1.git

# Verify remote
git remote -v

# Set main branch
git branch -M main

# Push to GitHub
git push -u origin main
```

**If prompted for password:** Use Personal Access Token from https://github.com/settings/tokens

---

## 🚀 PART 3: VERIFY CI/CD

### Check Actions on GitHub
1. Go to: `https://github.com/YOUR_USERNAME/PlaywrightP1/actions`
2. Wait 5-15 minutes for completion
3. Download "playwright-report-merged" artifact
4. Open `index.html` to view results

### Enable Branch Protection
1. Go to: `https://github.com/YOUR_USERNAME/PlaywrightP1/settings/branches`
2. Click "Add branch protection rule"
3. Branch pattern: `main`
4. Check: "Require status checks to pass before merging"
5. Select: "test"
6. Save

---

## 🧪 TEST CI/CD WITH PULL REQUEST

```bash
# Create test branch
git checkout -b test-cicd

# Make a small change
echo "// Test CI/CD" >> tests/example.spec.js

# Commit
git add .
git commit -m "test: Verify CI/CD pipeline"

# Push
git push -u origin test-cicd
```

**Then on GitHub:**
1. Click "Compare & pull request"
2. Create pull request
3. Watch tests run automatically
4. Merge when tests pass

---

## 📝 DAILY WORKFLOW (After Setup)

```bash
# Make your code changes
# ...

# Stage changes
git add .

# Commit with meaningful message
git commit -m "feat: Description of your changes"

# Push (CI/CD runs automatically)
git push
```

**View results:** https://github.com/YOUR_USERNAME/PlaywrightP1/actions

---

## 🔄 BRANCH WORKFLOW

### Create Feature Branch
```bash
git checkout -b feature/new-feature
# Make changes
git add .
git commit -m "feat: New feature"
git push -u origin feature/new-feature
# Create PR on GitHub - tests run automatically
```

### Update from Main
```bash
git checkout main
git pull origin main
git checkout feature/new-feature
git merge main
```

### Delete Branch After Merge
```bash
git checkout main
git branch -d feature/new-feature
git push origin --delete feature/new-feature
```

---

## 🛠️ USEFUL COMMANDS

### Check Status
```bash
git status                  # See changes
git log --oneline          # View commits
git branch                 # List branches
git remote -v              # View remotes
```

### Undo Changes
```bash
git restore file.js        # Undo changes to file
git restore .              # Undo all changes
git reset HEAD~1           # Undo last commit (keep changes)
git reset --hard HEAD~1    # Undo last commit (discard changes)
```

### View Differences
```bash
git diff                   # See unstaged changes
git diff --staged          # See staged changes
git diff main..branch-name # Compare branches
```

---

## 🧪 PLAYWRIGHT COMMANDS

### Run Tests Locally
```bash
# All tests
npx playwright test

# Headed mode (see browser)
npx playwright test --headed

# Specific browser
npx playwright test --project=chromium
npx playwright test --project=firefox
npx playwright test --project=webkit

# Specific test file
npx playwright test tests/example.spec.js

# Debug mode
npx playwright test --debug

# UI mode (interactive)
npx playwright test --ui
```

### View Reports
```bash
# Show last test report
npx playwright show-report

# Generate report
npx playwright show-report playwright-report
```

### Update Snapshots
```bash
npx playwright test --update-snapshots
```

---

## 🔐 PERSONAL ACCESS TOKEN

### Create Token
1. Go to: https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Name: "Playwright CI/CD"
4. Scopes:
   - ☑ repo (all)
   - ☑ workflow
5. Click "Generate token"
6. **COPY and SAVE** the token immediately

### Use Token
When git asks for password:
```
Username: your-github-username
Password: paste-your-token-here
```

### Store Token (Optional)
```bash
# Windows (Git Credential Manager)
git config --global credential.helper wincred

# After first use, token is saved
```

---

## 📊 GITHUB ACTIONS LOCATIONS

### View Workflows
- All runs: `https://github.com/YOUR_USERNAME/PlaywrightP1/actions`
- Specific workflow: `https://github.com/YOUR_USERNAME/PlaywrightP1/actions/workflows/playwright.yml`

### Manual Trigger
1. Go to Actions tab
2. Select workflow from left sidebar
3. Click "Run workflow" dropdown
4. Click "Run workflow" button

### Download Artifacts
1. Go to specific workflow run
2. Scroll to "Artifacts" section
3. Click artifact name to download

---

## ⚡ ONE-LINE COMMANDS

```bash
# Quick commit and push
git add . && git commit -m "update" && git push

# Create branch, commit, push
git checkout -b new-feature && git add . && git commit -m "feat: new feature" && git push -u origin new-feature

# Pull latest, run tests
git pull && npx playwright test

# Run tests and show report
npx playwright test && npx playwright show-report
```

---

## 🆘 EMERGENCY COMMANDS

### Forgot to Pull Before Push
```bash
git pull --rebase origin main
git push
```

### Merge Conflict
```bash
# Open conflicted files and resolve manually
# Look for <<<<<<< ======= >>>>>>>
# Edit to keep desired code, remove markers

git add .
git commit -m "fix: Resolve merge conflict"
git push
```

### Accidentally Committed to Main
```bash
# Create new branch with current changes
git branch feature/fix-branch

# Reset main to previous commit
git reset --hard origin/main

# Switch to new branch
git checkout feature/fix-branch

# Push and create PR
git push -u origin feature/fix-branch
```

### Revert Last Commit (Already Pushed)
```bash
# Creates new commit that undoes changes
git revert HEAD
git push
```

---

## 📖 QUICK REFERENCE URLs

### Your Repository
- Repository: `https://github.com/YOUR_USERNAME/PlaywrightP1`
- Actions: `https://github.com/YOUR_USERNAME/PlaywrightP1/actions`
- Settings: `https://github.com/YOUR_USERNAME/PlaywrightP1/settings`
- Branches: `https://github.com/YOUR_USERNAME/PlaywrightP1/settings/branches`

### GitHub Settings
- Personal tokens: https://github.com/settings/tokens
- SSH keys: https://github.com/settings/keys
- Notifications: https://github.com/settings/notifications

### Documentation
- Playwright: https://playwright.dev
- GitHub Actions: https://docs.github.com/actions
- Git: https://git-scm.com/doc

---

## ✅ VERIFICATION CHECKLIST

After setup, verify:
- [ ] Repository exists on GitHub
- [ ] Actions tab shows workflow runs
- [ ] Tests pass successfully
- [ ] Reports downloadable
- [ ] Status badge works in README
- [ ] Branch protection active
- [ ] PR triggers tests automatically

---

**Remember:** After initial setup, your daily workflow is just:
```bash
git add .
git commit -m "your message"
git push
```

CI/CD handles the rest! 🎉

