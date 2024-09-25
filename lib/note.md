
# 项目笔记

## 第一步：创建项目

使用终端命令创建项目：

```js
flutter create ky_flutter_favorcate
```

报错：command not found: flutter

原因：没有配置环境变量。

找到相关文档：

[Flutter(二)之环境搭建](https://juejin.cn/post/6844903935132581902)
[在中国网络环境下使用 Flutter](https://docs.flutter.cn/community/china)

在 ~/.bash_profile 文件中添加 Path。

一、~/.bash_profile 文件是什么文件？

.bash_profile 是一个Unix和类Unix系统中的隐藏文件，用于Bash shell的配置。当你以Bash作为你的登录shell时，每次你打开一个新的终端会话时，.bash_profile 都会被执行。它通常包含环境变量、shell配置、别名、函数定义等，这些设置会应用到每个新的终端会话中。

以下是一些 .bash_profile 文件的常见用途：

设置环境变量：比如 PATH、EDITOR、PYTHONPATH 等。
定义别名：为常用的命令设置别名，比如 alias ll='ls -l'。
执行其他配置文件：比如 source .bashrc 或其他脚本文件。
配置终端提示符：设置 PS1 变量以自定义命令提示符的外观。
运行脚本或命令：在每次启动新的终端会话时自动执行某些脚本或命令。
由于 .bash_profile 是隐藏的（文件名以点 . 开头），它通常不会在文件浏览器中显示，除非你设置了显示隐藏文件的选项。在终端中，你可以使用 ls -a 命令来查看包括隐藏文件在内的所有文件。

如果你使用的是macOS Catalina或更新版本，系统的默认shell已经从Bash更改为Zsh。在这种情况下，你可能需要查看或编辑 .zshrc 文件，它对Zsh shell的作用类似于 .bash_profile 对Bash的作用。

二、 ~/.zshrc 文件在什么位置？

在用户的根目录下的隐藏文件。（/Users/yq/）

三、 怎么往 ~/.zshrc 文件里添加 path？

使用文本编辑器打开，直接粘贴到文件里。

```js
open -e ~/.zshrc
```

.zshrc 文件内容如下：

```js
alias kkb='ssh root@kkb'

export PATH=$PATH:/Applications/flutter/bin
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter
```

手动执行：

```js
source ~/.zshrc
```

以上内容配置完成后，再次执行命令创建 ky_flutter_favorcate 项目成功

```js
flutter create ky_flutter_favorcate
```

## 工程配置



## 快捷键


## 使用mac开启本地服务器


启动Apache服务

```js
sudo apachectl start
```

暂停

```js
sudo apachectl stop
```

重启

```js
sudo apachectl restart
```

打开finder =》 Command +Shift+G=》/资源库/WebServer 进入WebServer中的Document文件夹，将需要启动web服务的文件拖入Document文件夹下。sudo apachectl start 启动服务，通过127.0.0.1/文件名可以访问对应的文件了。

[Mac Apache启动web服务](https://www.jianshu.com/p/38e1a008ca30)