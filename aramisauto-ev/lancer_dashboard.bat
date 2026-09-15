@echo off
title Dashboard Auto Dispo CIC

echo ==========================================
echo       Dashboard Auto Dispo CIC
echo ==========================================
echo.

if not exist ".venv\Scripts\python.exe" (
    echo ERREUR : l'environnement Python n'existe pas.
    echo Lancez d'abord install.bat
    pause
    exit /b 1
)

echo Lancement du dashboard...
echo.

".venv\Scripts\python.exe" -m streamlit run dashboard.py

pause