@echo off
chcp 936
echo �����������Ӧ�Ĵ���:����/�ر� 1/2
set /p action=Action :  
if "%action%"=="1" goto OPEN
if "%action%"=="2" goto COLOSE

REM REM ����Oracle����
:OPEN
echo ++ ����WIFI
netsh wlan set hostednetwork mode=allow ssid=GitHub key=git1234567
netsh wlan start hostednetwork
netsh wlan show hostednetwork
goto end

:OPEN
echo ++ �ر�WIFI
netsh wlan stop hostednetwork
goto end

:end
pause
