chcp 936
@echo off

rem rem @echo ����һ����ʱ����ʾ��
rem rem set /p t=������ʱ��:
rem rem ping -n %t% 127.0.0.1>nul
rem rem @echo ʱ�䵽
rem rem pause

for /L %%a in (
 59,-1,0
)do(
echo 60�������
echo ��ʣ�� %%a ��
ping -n 2 localhost 1>nul 2>nul
cls
)
echo ���� 
pause
