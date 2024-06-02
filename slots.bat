@echo off
setlocal enabledelayedexpansion

REM Set the path to the source and destination folders
set "source_folder=D:\slots\source"
set "destination_folder=D:\slots\party"

REM Check if source and destination folders exist
if not exist "%source_folder%" (
    echo Source folder "%source_folder%" does not exist.
    pause
    exit /b
)

if not exist "%destination_folder%" (
    echo Destination folder "%destination_folder%" does not exist.
    pause
    exit /b
)

REM Loop through slots 1 to 6
for /L %%i in (1,1,6) do (
    set "slot=slot%%i"
    set "number="
    set /p "number=Enter the number corresponding to the image for !slot! (or leave blank to skip): "

    REM Check if input is not empty
    if not "!number!"=="" (
        REM Check if the file exists in the source folder
        if exist "%source_folder%\!number!.png" (
            REM Copy and rename the file to the destination folder as slotX.png
            copy /y "%source_folder%\!number!.png" "%destination_folder%\!slot!.png"
            echo File has been moved and renamed to !slot!.png in the destination folder.
        ) else (
            echo File with number !number! does not exist in the source folder.
        )
    ) else (
        echo No input provided for !slot!. Skipping.
    )
)

echo All operations completed.
pause
