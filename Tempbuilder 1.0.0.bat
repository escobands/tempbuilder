@echo off
title Tempbuilder
chcp 65001 >nul

:wybor
cls
echo  ______                           __                   ___       __                  
echo /\__  _\                         /\ \              __ /\_ \     /\ \ 
echo \/_/\ \/    __    ___ ___   _____\ \ \____  __  __/\_\\//\ \    \_\ \
echo    \ \ \  /'__`\/' __` __`\/\ '__`\ \ '__`\/\ \/\ \/\ \ \ \ \   /'_` \  /'__`\/\`'__\
echo     \ \ \/\  __//\ \/\ \/\ \ \ \L\ \ \ \L\ \ \ \_\ \ \ \ \_\ \_/\ \L\ \/\  __/\ \ \/
echo      \ \_\ \____\ \_\ \_\ \_\ \ ,__/\ \_,__/\ \____/\ \_\/\____\ \___,_\ \____\\ \_\
echo       \/_/\/____/\/_/\/_/\/_/\ \ \/  \/___/  \/___/  \/_/\/____/\/__,_ /\/____/ \/_/
echo                               \ \_\                                                 
echo                                \/_/
echo.
echo                                 Witamy w Tempbuilder!
echo                            Po listę komend, wpisz "pomoc".
echo                   Żeby program działał najlepiej, wyłącz inne aplikacje.
echo.
goto kommm

:kommm
set /p komenda=^>^>^>
if "%komenda%"=="pomoc" goto pomocy
if "%komenda%"=="tempbuilder" goto tempbuilder0
if "%komenda%"=="usun" goto usun
echo Nieznana komenda - użyj "pomoc".
goto kommm

:pomocy
echo Lista komend
echo pomoc          \ Pokaż ten ekran
echo tempbuilder    / Informacje o programie
echo usun           \ Usuń foldery
goto kommm

:tempbuilder0
cls
echo  ______                          
echo /\__  _\
echo \/_/\ \/    __    ___ ___   _____       Wersja: 1.0.0
echo    \ \ \  /'__`\/' __` __`\/\ '__`\     Autor programu: Escobar
echo     \ \ \/\  __//\ \/\ \/\ \ \ \L\ \    
echo      \ \_\ \____\ \_\ \_\ \_\ \ ,__/    Krótko o programie
echo       \/_/\/____/\/_/\/_/\/_/\ \ \/     Ten program wykonuje skrypt, który usuwa
echo                               \ \_\     zawartość folderów Temp.
echo                                \/_/                               
goto kommm

:usun
cls
echo  __  __                              __   
echo /\ \/\ \                            /\ \__ 
echo \ \ \ \ \    ____  __  __    ___    \ \ ,_\    __    ___ ___   _____   
echo  \ \ \ \ \  /',__\/\ \/\ \ /' _ `\   \ \ \/  /'__`\/' __` __`\/\ '__`\   
echo   \ \ \_\ \/\__, `\ \ \_\ \/\ \/\ \   \ \ \_/\  __//\ \/\ \/\ \ \ \L\ \ 
echo    \ \_____\/\____/\ \____/\ \_\ \_\   \ \__\ \____\ \_\ \_\ \_\ \ ,__/
echo     \/_____/\/___/  \/___/  \/_/\/_/    \/__/\/____/\/_/\/_/\/_/\ \ \/
echo                                                                  \ \_\
echo                                                                   \/_/
echo.
echo Wybierz, co program ma zrobić.
echo 1 / Usuń pliki z folderu %TEMP%
echo 2 \ Usuń pliki z folderu C:\Windows\Temp
echo 3 / Usuń pliki z obu folderów
echo 4 \ Co mam wybrać?
echo 5 / Powrót do menu głównego
echo.
choice /c 12345 /m "Program: "

if errorlevel 5 goto wybor
if errorlevel 4 goto usun-pomoc
if errorlevel 3 goto usun-oba
if errorlevel 2 goto usun-windows-temp
if errorlevel 1 goto usun-uzytkownik-temp

:usun-pomoc
cls
echo  __  __                              __   
echo /\ \/\ \                            /\ \__ 
echo \ \ \ \ \    ____  __  __    ___    \ \ ,_\    __    ___ ___   _____   
echo  \ \ \ \ \  /',__\/\ \/\ \ /' _ `\   \ \ \/  /'__`\/' __` __`\/\ '__`\   
echo   \ \ \_\ \/\__, `\ \ \_\ \/\ \/\ \   \ \ \_/\  __//\ \/\ \/\ \ \ \L\ \ 
echo    \ \_____\/\____/\ \____/\ \_\ \_\   \ \__\ \____\ \_\ \_\ \_\ \ ,__/
echo     \/_____/\/___/  \/___/  \/_/\/_/    \/__/\/____/\/_/\/_/\/_/\ \ \/
echo                                                                  \ \_\
echo                                                                   \/_/
echo Co zawiera %Temp%?
echo Folder %TEMP% w systemie Windows zawiera pliki tymczasowe, które są tworzone 
echo przez aplikacje podczas ich działania. Te pliki są zazwyczaj usuwane po zakończeniu
echo pracy aplikacji, ale czasami mogą pozostać i zajmować miejsce na dysku.
echo Dlatego ten program został zrobiony, żeby je usuwać!
echo.
echo Co zawiera C:\Windows\Temp?
echo Dosłownie to same co %Temp%; ale mogą jeszcze się tam znaleźć po instalacjach
echo aktualizacji. Dlatego ten program został zrobiony, żeby je usuwać!
echo.
echo Naciśnij dowolny klawisz, aby kontynuować.
pause >nul
goto usun

:usun-uzytkownik-temp
echo Usuwanie plików z folderu %TEMP%...
for %%f in ("%TEMP%\*.*") do (
    echo Usuwanie pliku: %%f
    del /f /q "%%f"
)
for /d %%d in ("%TEMP%\*") do (
    echo Usuwanie folderu: %%d
    rd /s /q "%%d"
)
echo Usuwanie zakończone; można spokojnie wyłączyć program.
echo Aby dokonać dalsze zadania, naciśnij dowolny klawisz.
pause >nul
goto usun

:usun-windows-temp
echo Usuwanie plików z folderu C:\Windows\Temp...
for %%f in ("C:\Windows\Temp\*.*") do (
    echo Usuwanie pliku: %%f
    del /f /q "%%f"
)
for /d %%d in ("C:\Windows\Temp\*") do (
    echo Usuwanie folderu: %%d
    rd /s /q "%%d"
)
echo Usuwanie zakończone; można spokojnie wyłączyć program.
echo Aby dokonać dalsze zadania, naciśnij dowolny klawisz.
pause >nul
goto usun

:usun-oba
echo Usuwanie plików z folderu %TEMP%...
for %%f in ("%TEMP%\*.*") do (
    echo Usuwanie pliku: %%f
    del /f /q "%%f"
)
for /d %%d in ("%TEMP%\*") do (
    echo Usuwanie folderu: %%d
    rd /s /q "%%d"
)
echo Usunięto zawartość "%TEMP".
echo Przygotowywanie się na usuwanie plików "C:\Windows\Temp"...
timeout /t 2 /nobreak >nul

echo Usuwanie plików z folderu C:\Windows\Temp...
for %%f in ("C:\Windows\Temp\*.*") do (
    echo Usuwanie pliku: %%f
    del /f /q "%%f"
)
for /d %%d in ("C:\Windows\Temp\*") do (
    echo Usuwanie folderu: %%d
    rd /s /q "%%d"
)
echo Usuwanie zakończone; można spokojnie wyłączyć program.
echo Aby dokonać dalsze zadania, naciśnij dowolny klawisz.
pause >nul
goto usun
