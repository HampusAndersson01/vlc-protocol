
Setlocal EnableDelayedExpansion
set url=%~1
set url=!url: =%%20!

:: Remove leading 'vlc://' (6 chars)
set "stripped=!url:~6!"

:: Fix Chromium's missing colon in http(s) URLs
if /i "!stripped:~0,6!"=="http//" set "stripped=http://!stripped:~6!"
if /i "!stripped:~0,7!"=="https//" set "stripped=https://!stripped:~7!"

start "VLC" "%~dp0vlc.exe" --open "!stripped!"
