@echo OFF
chcp 65001
REM 设置变量
set CONFIG_FILE="config_file.ccxml"
set BOOTLOADER_FILE="out\Bootloader.out"
set MAIN_APP_FILE="out\main.out"
set BOOTLOADER_SESSION="uniflashsession\bootloader.uniflashsession"
set MAIN_SESSION="uniflashsession\main.uniflashsession"

:START
echo *************************************************************
echo 开始烧录 Bootloader 文件...
echo *************************************************************


call uniflash -ccxml %CONFIG_FILE% -loadSettings %BOOTLOADER_SESSION% -program %BOOTLOADER_FILE% 

if %ERRORLEVEL% neq 0 (
    echo Bootloader 烧录失败！
    pause
    goto END
)

echo Bootloader 烧录成功！

echo *************************************************************
echo 开始烧录主程序文件...
echo *************************************************************

call uniflash -ccxml %CONFIG_FILE% -loadSettings %MAIN_SESSION% -program %MAIN_APP_FILE%

if %ERRORLEVEL% neq 0 (
    echo 主程序烧录失败！
    pause
    goto END
)

echo 主程序烧录成功！
echo 烧录完成，请更换下一台设备...

REM 等待用户确认后继续下一次烧录
pause
goto START

:END
echo 烧录结束。
pause