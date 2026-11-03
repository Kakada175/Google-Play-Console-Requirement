# SafeMove - Push Policies to GitHub
Write-Host "==============================================================" -ForegroundColor Cyan
Write-Host "   SafeMove Express - Google Play Compliance Web Pages        " -ForegroundColor Cyan
Write-Host "==============================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Before running this script, ensure you have created a PUBLIC repository on GitHub." -ForegroundColor Yellow
Write-Host "Example: https://github.com/new -> Name: safemove-policies (Public)" -ForegroundColor Yellow
Write-Host ""

$repoUrl = Read-Host "Enter your GitHub Repository URL (e.g. https://github.com/username/safemove-policies.git)"

if ([string]::IsNullOrWhiteSpace($repoUrl)) {
    Write-Host "[ERROR] No repository URL provided." -ForegroundColor Red
    exit 1
}

Write-Host "`n[1/4] Initializing Git repository..." -ForegroundColor Green
git init -b main

Write-Host "[2/4] Staging policy files..." -ForegroundColor Green
git add .

Write-Host "[3/4] Creating commit..." -ForegroundColor Green
git commit -m "Add SafeMove Google Play Console policy and account deletion pages"

Write-Host "[4/4] Configuring remote and pushing to $repoUrl..." -ForegroundColor Green
git remote remove origin 2>$null
git remote add origin $repoUrl
git branch -M main
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n==============================================================" -ForegroundColor Green
    Write-Host "[SUCCESS] Files pushed to GitHub!" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Green
    Write-Host "`nTo publish via GitHub Pages:" -ForegroundColor Cyan
    Write-Host "1. Go to repository Settings -> Pages"
    Write-Host "2. Select 'Deploy from a branch', choose 'main' and '/ (root)'"
    Write-Host "3. Click Save. Your website will be live in 1-2 minutes!"
} else {
    Write-Host "`n[ERROR] Git push encountered an issue. Check your repository URL or permissions." -ForegroundColor Red
}

