@echo off
REM REM �趨dos���ڵı���
chcp 936
cls
:redo
set /a con=1 
rem rem ���֮ǰ�Ļ���ֵ

echo +++++++++++++++++  �����б�  ++++++++++++++++++++++++
echo +
echo +    ns  :   �򿪷�������
echo +    no  :   ���� Oracle ����
echo +    co  :   �ر� Oracle ����
echo +    nv  :   ���� VMWare ����
echo +    cv  :   �ر� VMWare ����
echo +    ex  :   �˳�����
echo +
echo +++++++++++++++++  �����б�  ++++++++++++++++++++++++


echo �����������Ӧ������:
set /p action=Action :  
if "%action%"=="no" goto NO
if "%action%"=="co" goto CO
if "%action%"=="nv" goto NV
if "%action%"=="cv" goto CV
if "%action%"=="ns" goto NS
if "%action%"=="ex" goto EX
rem rem �������������еĲ�����ִ������Ĵ��룺
cls 
echo ## ��������Ч������ ����������������
goto redo

echo +++++++++++++++++ ��������  +++++++++++++++++++++++
REM REM ����Oracle����
:NO
echo ++ ���� Oracle ����
net start "OracleServiceORCL"
net start "OracleOraDb11g_home1TNSListener"
goto end

REM REM �ر�Oracle����
:CO
echo �ر� Oracle ����
net stop "OracleOraDb11g_home1TNSListener"
net stop "OracleServiceORCL"
goto end
:NV
echo ++���� VMWare ����
net start "VMAuthdService"
net start "VMnetDHCP"
net start "VMware NAT Service"
net start "VMUSBArbService"
goto end 
:CV
echo ++�ر� VMWare ����
net stop "VMAuthdService"
net stop "VMnetDHCP"
net stop "VMware NAT Service"
net stop "VMUSBArbService"
goto end 

:NS
echo ++�򿪷�������
start "myth" "services.msc"
goto end 

:end
set /a action="myth" 
rem rem ���֮ǰ�Ļ���ֵ
set /p con=���� c ���� ����ֱ���˳� �� 
cls
if "%con%"=="c" goto redo
exit

:EX 
exit