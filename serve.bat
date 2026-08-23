@echo off
set "PATH=C:\Ruby32-x64\bin;C:\Program Files\Git\cmd;%PATH%"
echo Starting Jekyll local server...
bundle exec jekyll serve
pause
