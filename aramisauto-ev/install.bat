@echo off

title Installation Projet

echo ==========================================
echo        Installation du projet
echo ==========================================
echo.

echo [1/4] Verification de Python...
python --version

if errorlevel 1 (
    echo.
    echo ERREUR : Python n'est pas installe ou n'est pas dans le PATH.
    pause
    exit /b 1
)

echo.
echo [2/4] Creation de l'environnement virtuel...

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
echo [3/4] Installation des dependances...

".venv\Scripts\python.exe" -m pip install --upgrade pip

".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 (
    echo ERREUR avec requirements.txt
    pause
    exit /b 1
)

".venv\Scripts\python.exe" -m pip install -r requirements-scraping.txt
if errorlevel 1 (
    echo ERREUR avec requirements-scraping.txt
    pause
    exit /b 1
)

echo.
echo [4/4] Installation de Chromium pour Playwright...

".venv\Scripts\python.exe" -m playwright install chromium
if errorlevel 1 (
    echo ERREUR lors de l'installation de Chromium
    pause
    exit /b 1
)

echo.
echo ==========================================
echo       Installation terminee !
echo ==========================================
echo.
pause