@echo off
title Installation Auto Dispo CIC

echo ==========================================
echo      Installation Auto Dispo CIC
echo ==========================================
echo.

echo [1/3] Verification de Python...
python --version
if errorlevel 1 (
    echo.
    echo ERREUR : Python n'est pas installe ou n'est pas dans le PATH.
    echo Installez Python puis relancez ce fichier.
    pause
    exit /b 1
)

echo.
echo [2/3] Creation de l'environnement virtuel...

if not exist ".venv\Scripts\python.exe" (
    python -m venv .venv
    if errorlevel 1 (
        echo ERREUR lors de la creation de .venv
        pause
        exit /b 1
    )
) else (
    echo L'environnement .venv existe deja.
)

echo.
echo [3/3] Installation des dependances...

".venv\Scripts\python.exe" -m pip install --upgrade pip
".venv\Scripts\python.exe" -m pip install -r requirements.txt

if errorlevel 1 (
    echo.
    echo ERREUR lors de l'installation des dependances.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo Installation terminee avec succes !
echo ==========================================
echo.
echo Vous pouvez maintenant lancer :
echo lancer_scraping.bat
echo ou
echo lancer_dashboard.bat
echo.
pause