# 🚀 CI/CD Deployment Guide for PlaywrightP1

## Quick Start Commands

### Step 1: Initialize Git Repository
```bash
git init
```

### Step 2: Configure Git (First Time Only)
```bash
git config user.name "Your Name"
git config user.email "your.email@example.com"
```

### Step 3: Stage All Files
```bash
git add .
```

### Step 4: Create Initial Commit
```bash
git commit -m "feat: Initial CI/CD setup with Playwright testing"
```

### Step 5: Create GitHub Repository
1. Visit: https://github.com/new
2. Repository name: `PlaywrightP1`
3. Description: "Playwright E2E Testing with CI/CD"
4. Visibility: Public or Private (your choice)
5. **DO NOT** check any initialization options
6. Click "Create repository"

### Step 6: Connect to GitHub
```bash
# Replace YOUR_USERNAME with your GitHub username
git remote add origin https://github.com/YOUR_USERNAME/PlaywrightP1.git
git branch -M main
git push -u origin main
```

## 🎯 What Happens After Push?

1. **GitHub Actions Activates**: CI/CD pipeline starts automatically
2. **4 Parallel Jobs**: Tests run in 4 shards simultaneously
3. **Browser Testing**: Tests run on Chromium, Firefox, and WebKit
4. **Report Generation**: HTML reports generated for each shard
5. **Report Merging**: All reports merged into unified report
6. **Artifact Upload**: Reports available for download (30 days)

## 📊 Viewing Test Results

### Method 1: GitHub Actions Tab
1. Go to your repository on GitHub
2. Click "Actions" tab
3. Click on latest workflow run
4. View logs in real-time
5. Download "playwright-report-merged" artifact

### Method 2: Run Locally
```bash
npx playwright test
npx playwright show-report
```

## 🔧 CI/CD Workflows Configured

### 1. Main Workflow (`playwright.yml`)
- **Triggers**: Push & Pull Request to main/master
- **Features**: 
  - Test sharding (4 parallel jobs)
  - Multi-browser testing
  - Report merging
  - Artifact upload
- **Execution Time**: ~60 minutes timeout

### 2. Scheduled Tests (`playwright-scheduled.yml`)
- **Triggers**: Daily at 6 AM UTC + Manual
- **Features**:
  - Runs on all 3 browsers separately
  - 7-day artifact retention
  - Failure notifications

### 3. PR Comments (`playwright-pr-comment.yml`)
- **Triggers**: When Playwright Tests complete
- **Features**:
  - Posts results to PR comments
  - Links to detailed reports

## 🛡️ Setting Up Branch Protection

After deployment, protect your main branch:

1. Go to **Settings** → **Branches**
2. Click **"Add rule"** or **"Add branch protection rule"**
3. Branch name pattern: `main`
4. Enable these options:
   - ☑ Require a pull request before merging
   - ☑ Require status checks to pass before merging
   - ☑ Require branches to be up to date before merging
   - ☑ Status check: "test" (from Playwright Tests)
5. Click **"Create"** or **"Save changes"**

## 🔑 Managing Secrets (If Needed)

For sensitive data like passwords or API keys:

1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Click **"New repository secret"**
3. Add secrets (e.g., `TEST_USERNAME`, `TEST_PASSWORD`)
4. Use in workflow: `${{ secrets.TEST_USERNAME }}`

## 📈 Performance Optimization Tips

### Current Setup (4 Shards):
- Best for: 20-100 tests
- Execution time: Divided by 4

### Scale Up (8 Shards):
Edit `.github/workflows/playwright.yml`:
```yaml
matrix:
  shardIndex: [1, 2, 3, 4, 5, 6, 7, 8]
  shardTotal: [8]
```

### Scale Down (2 Shards):
```yaml
matrix:
  shardIndex: [1, 2]
  shardTotal: [2]
```

## 🐛 Troubleshooting

### Issue: "npm ci" fails
**Solution**: Ensure `package-lock.json` is committed
```bash
git add package-lock.json
git commit -m "chore: Add package-lock.json"
git push
```

### Issue: Tests fail in CI but pass locally
**Solution**: Check environment differences
- Set `CI=true` locally: `CI=true npx playwright test`
- Check browser versions
- Verify network conditions

### Issue: Workflows don't trigger
**Solution**: Check GitHub Actions settings
1. Settings → Actions → General
2. Ensure "Allow all actions" is selected
3. Verify workflow file syntax (YAML)

## 📱 Monitoring & Notifications

### Enable Email Notifications:
1. Go to your GitHub profile
2. Settings → Notifications
3. Enable "Actions" notifications

### Slack Integration (Optional):
Add to workflow:
```yaml
- name: Slack Notification
  uses: 8398a7/action-slack@v3
  with:
    status: ${{ job.status }}
    webhook_url: ${{ secrets.SLACK_WEBHOOK }}
```

## 🔄 Future Improvements

- [ ] Add visual regression testing
- [ ] Integrate with Playwright Trace Viewer
- [ ] Add performance metrics
- [ ] Deploy test reports to GitHub Pages
- [ ] Add Slack/Discord notifications
- [ ] Integrate with test management tools

## 📞 Support Resources

- **Playwright Docs**: https://playwright.dev/
- **GitHub Actions Docs**: https://docs.github.com/en/actions
- **This Project**: Check README.md for more info

## ✅ Deployment Checklist

- [ ] Git repository initialized
- [ ] All files committed
- [ ] GitHub repository created
- [ ] Remote origin added
- [ ] Code pushed to main branch
- [ ] GitHub Actions enabled
- [ ] First workflow run successful
- [ ] Test reports downloaded and verified
- [ ] Branch protection rules configured
- [ ] README badge updated with repo URL
- [ ] Team members notified

---

**Last Updated**: January 7, 2026
**Status**: Ready for Deployment 🚀

