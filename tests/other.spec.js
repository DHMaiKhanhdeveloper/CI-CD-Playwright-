// @ts-check
import { test, expect } from '@playwright/test';

test('page loads and has correct URL', async ({ page }) => {
  await page.goto('https://playwright.dev/');
  await expect(page).toHaveURL(/playwright\.dev/);
});

test('navigation menu is visible', async ({ page }) => {
  await page.goto('https://playwright.dev/');
  await expect(page.getByRole('link', { name: 'Get started' })).toBeVisible();
  await expect(page.getByRole('link', { name: 'API' })).toBeVisible();
});

test('search or docs link works', async ({ page }) => {
  await page.goto('https://playwright.dev/');
  await page.getByRole('link', { name: 'API' }).click();
  await expect(page).toHaveURL(/api/);
});
