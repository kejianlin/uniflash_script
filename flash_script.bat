@echo OFF
REM 设置变量
set CONFIG_FILE="config_file.ccxml"
set BOOTLOADER_FILE="Bootloader.out"
set MAIN_APP_FILE="40K80K.out"
set BOOTLOADER_SESSION="bootloader.uniflashsession"
set MAIN_SESSION="main.uniflashsession"

echo Burning BOOTLOADER_FILE...

call uniflash -ccxml %CONFIG_FILE% -loadSettings %BOOTLOADER_SESSION% -program %BOOTLOADER_FILE% 

echo Burning MAIN_APP_FILE...

call uniflash -ccxml %CONFIG_FILE% -loadSettings %MAIN_SESSION% -program %MAIN_APP_FILE%