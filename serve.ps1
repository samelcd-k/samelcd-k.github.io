# Jekyll 로컬 서버 실행 스크립트 (Windows PowerShell)
$env:PATH = "C:\Ruby32-x64\bin;C:\Program Files\Git\cmd;" + $env:PATH
Write-Host "Starting Jekyll local server..." -ForegroundColor Green
bundle exec jekyll serve
