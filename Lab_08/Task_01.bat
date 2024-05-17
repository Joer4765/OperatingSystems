@echo off
setlocal
chcp 65001

set /p folderPath="Вкажіть шлях до папки: "

set /p oldExt="Вкажіть поточне розширення файлів (наприклад .txt): "

set /p newExt="Вкажіть нове розширення файлів (наприклад .log): "

pushd %folderPath%
for %%i in (*%oldExt%) do ren "%%i" "%%~ni%newExt%"
popd

echo Зміна розширення файлів завершена!

:end
endlocal