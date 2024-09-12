@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

REM Color settings
color 0A
set "winrarPath=%~dp0WinRAR\WinRAR.exe"
set "listFile=%~dp0lista_para_zip.txt"

REM Ask for the Batoto comic ID
set /p "comicId=Enter the Batoto comic ID: "

REM Initial message
echo.
echo ===============================
echo        BATOTO MULTIUPLOAD FOR BEGINNERS
echo ===============================
echo.
echo Zipping folders listed in "%listFile%"
echo.
echo Make sure the folders listed in "%listFile%" are in the same directory as this script.
echo.
echo Press any key to start...
pause >nul

REM Start zipping process
echo [INFO] Starting the ZIP process...
echo.

REM Loop through each folder listed in lista_para_zip.txt
for /F "tokens=*" %%i in (%listFile%) do (
    set "folder=%%i"
    set "folderPath=%~dp0!folder!"
    set "zipFile=%~dp0!folder!.zip"
    set "txtFile=!folderPath!\bato-chapter-info.txt"

    REM Create the chapter info TXT file
    echo comic=%comicId%> "!txtFile!"
    echo chapter=%%i>> "!txtFile!"

    REM Check if the folder exists
    if exist "!folderPath!\" (
        echo [INFO] Zipping folder "!folder!"...
        cd /d "%~dp0"
        "%winrarPath%" a -afzip "!zipFile!" "!folder!\*" -x"!folder!\preview*.jpg" -x"!folder!\preview*.jpeg" -x"!folder!\preview*.webp" -x"!folder!\preview*.png" -x"!folder!\desktop.ini"
        echo [SUCCESS] Folder "!folder!" successfully zipped!

        REM Delete the chapter info TXT file after zipping
        del "!txtFile!"
    ) else (
        echo [ERROR] Folder "!folder!" missing. Place the folder in the same directory as the script and try again.
    )
    echo.
)

REM Completion message
echo [INFO] ZIP process finished!
echo.
echo ===============================
echo        BATOTO MULTIUPLOAD FOR BEGINNERS
echo ===============================
echo.
echo Press any key to exit...
pause >nul
