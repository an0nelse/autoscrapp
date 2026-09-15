@echo off
title Scraping Auto Dispo CIC

echo ==========================================
echo       Scraping Auto Dispo CIC
echo ==========================================
echo.

if not exist ".venv\Scripts\python.exe" (
    echo ERREUR : l'environnement Python n'existe pas.
    echo Lancez d'abord install.bat
    pause
    exit /b 1
)

echo Lancement du scraping...
echo.
".venv\Scripts\python.exe" scraper.py

echo.
echo ==========================================
echo       Scraping termine
echo ==========================================
echo.
pause