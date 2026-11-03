@echo off
setlocal EnableDelayedExpansion
title SafeMove - Push Policies to GitHub

echo ==============================================================
echo    SafeMove Express - Google Play Compliance Web Pages
echo ==============================================================
echo.
echo This script will help you push these policy pages to GitHub 
echo so you can use GitHub Pages for Google Play Console.
echo.
echo If you haven't created a GitHub repository yet:
echo 1. Go to https://github.com/new
echo 2. Repository name: safemove-policies (or your preferred name)
echo 3. Set to PUBLIC
echo 4. Do NOT initialize with README/gitignore.
echo 5. Click "Create repository"
echo.
set /p REPO_URL="Enter your GitHub Repository URL (e.g., https://github.com/username/safemove-policies.git): "

if "%REPO_URL%"=="" (
    echo [ERROR] No URL provided. Exiting.
    pause
    exit /b 1
)

echo.
echo [1/4] Initializing Git...
git init -b main

echo [2/4] Staging files...
git add .

echo [3/4] Creating commit...
git commit -m "Add SafeMove Google Play Console policy and account deletion pages"

echo [4/4] Setting remote and pushing to GitHub...
git remote remove origin 2>nul
git remote add origin %REPO_URL%
git branch -M main
git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ==============================================================
    echo [SUCCESS] Files successfully pushed to GitHub!
    echo ==============================================================
    echo.
    echo Next step:
    echo 1. Go to your repo on GitHub: Settings -> Pages
    echo 2. Under 'Build and deployment', set Branch to 'main' / (root)
    echo 3. Click Save.
    echo 4. Your URLs will be live in 1-2 minutes!
    echo.
) else (
    echo.
    echo [ERROR] Push failed. Please check your credentials or repo URL.
)

pause

