cd 路径 ： 跳转到本盘符下的路径
cd /d 路径  ：跳转到别的盘符下的路径
"盘符：” ： 切换盘符
netstat -an ：查看开启了哪些端口
netstat -v : 查看正在进行的工作
netstat -ano ：查看端口占用 

- 使用VmWare创建的虚拟机如果报错，就找到虚拟机目录下vmx后缀的文件  用记事本打开，手动找到vmci0.present=‘TRUE’,把true改为false。保存。即可。