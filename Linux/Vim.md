# Vim 
> 学习曲线很高，但是学会熟练使用后就效率很高

## 基本配置
- 在文件 全局：`/etc/vim/vimrc` 先备份一下 `sudo cp /etc/vim/vimrc /etc/vim/vimrc.bak`
	- 或者当前用户：`~/.vimrc` 中添加如下内容就差不多了（但是高亮不见了）
```
set showcmd		" Show (partial) command in status line.
set autowrite		" Automatically save before commands like :next and :make
set nocompatible
set number
filetype on 
set history=1000
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set guioptions=T
set ruler
set nohls
set backspace=2

imap jj <Esc>
```

## 基础操作
> [参考博客](http://www.jianshu.com/p/bcbe916f97e1)
### 跳转
- k j h l  上下左右
- Ctrl+f 上翻一页
- Ctrl+b 下翻一页
- H M L  跳转到屏幕 顶 中 尾
	- 2H 第二行 3L 倒数第三行

- `*` 当光标在某单词上 会进行搜索跳转到下一个
- `#` 与`*` 一样，不过是跳转到上一个
- `/)`和`/(` 跳转到 后和前 语句的位置 为了() 跳转方便
- `/}`和`/{` 跳转到 后和前 段落的位置  
- `g_` 跳转到最后一个不是空格的字符的位置
- `gg` 跳转到文件第一行的起始位置
- `G` 跳转到文件最后一行起始位置
- `5gg`或`5G` `:5` 跳转到 5 行的起始位置

`行内移动`
- `w` 右移到下一个字的开头
- `e` 右移到下一个字的末尾
- `b` 左移到前一个字的开头
- `0` 左移光标到本行的开始
- `$` 右移光标到行末尾
- `^` 移动到本行第一个非空字符


### 搜索匹配
- `/name`  正向搜索字符串 name
	- `n` 搜索后跳下一个 
	- `N` 搜索后跳上一个
- `?name` 方向搜索字符串

### 复制粘贴
- `yy` 复制当前行 `nyy` 是复制该行开始的共n行(是vim内的剪贴板)
- `"+nyy` 同理复制n行，操作系统级的剪贴板
- `P`和`p`  将剪贴板的内容粘贴在 前 后
- `u` 撤销上一条命令的效果
- `.` 重复最后一条修改正文的命令

### 插入模式
- i  在光标左侧插入
- a  在光标右侧插入
- o  在光标该行下一行新增一行
- O  在光标该行上一行新增一行
- I  在光标该行开头插入
- A  在光标该行末尾插入


### 命令模式
- `:e path` 打开指定路径下文件
- `:w` 保存当前编辑的文件 后接文件名就是另存为
- `ZZ` 退出Vim 并将所做修改覆盖原始文件
- `:q` 未修改的情况下退出
- `:q!` 放弃所有修改，退出
- `wq` `x` 先保存后退出


