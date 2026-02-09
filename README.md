# Playwright Test Project

This project contains Playwright E2E tests with CI/CD integration.

## Features

- Automated testing with Playwright
- GitHub Actions CI/CD
- Test sharding for parallel execution
- PR comment integration for test results

## Installation

```bash
npm install
npx playwright install
```

## Running Tests

```bash
# Run all tests
npx playwright test

# Run tests in UI mode
npx playwright test --ui
```

## CI/CD

The project uses GitHub Actions for:
- Running tests on push and pull requests
- Parallel test execution with sharding
- Automatic PR comments with test results
