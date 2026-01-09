# PlaywrightP1 - E2E Testing

![Playwright Tests](https://github.com/YOUR_USERNAME/PlaywrightP1/actions/workflows/playwright.yml/badge.svg)

## 🚀 About

Automated end-to-end testing project using Playwright with CI/CD integration.

## ✨ Features

- ✅ Multi-browser testing (Chromium, Firefox, WebKit)
- ✅ Parallel test execution with sharding
- ✅ Automated CI/CD with GitHub Actions
- ✅ HTML test reports
- ✅ Artifact storage for 30 days

## 🛠️ Setup

### Prerequisites
- Node.js (LTS version)
- npm

### Installation

```bash
# Install dependencies
npm install

# Install Playwright browsers
npx playwright install
```

## 🧪 Running Tests

```bash
# Run all tests
npx playwright test

# Run tests in headed mode
npx playwright test --headed

# Run tests in specific browser
npx playwright test --project=chromium

# Run specific test file
npx playwright test tests/example.spec.js

# Show test report
npx playwright show-report
```

## 📊 CI/CD Pipeline

The project uses GitHub Actions for continuous integration:

- **Trigger**: Automatic on push/pull request to main/master
- **Execution**: 4 parallel shards for faster testing
- **Reports**: Automatically uploaded as artifacts
- **Retention**: Reports stored for 30 days

### View Test Results

1. Go to the **Actions** tab in GitHub
2. Click on latest workflow run
3. Download **playwright-report-merged** artifact
4. Open `index.html` in your browser

## 📁 Project Structure

```
PlaywrightP1/
├── .github/
│   └── workflows/
│       └── playwright.yml    # CI/CD configuration
├── tests/
│   └── example.spec.js      # Test files
├── playwright.config.js     # Playwright configuration
├── package.json             # Dependencies
└── .gitignore              # Git ignore rules
```

## 🤝 Contributing

1. Create a feature branch
2. Make your changes
3. Run tests locally
4. Submit a pull request

## 📝 License

ISC

## 🔗 Links

- [Playwright Documentation](https://playwright.dev/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

