chcp 936
@echo off
netstat -a -n >> test.txt
type test.txt | find "3306" && echo "�Ѿ�������Mysql"
dir >> test.txt
pause