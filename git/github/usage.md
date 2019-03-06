# github 教程

`github` 作为目前流行的开源平台,是我们工作学习的好帮手,学会如何用好 `github` 才能更好分享你的代码或者与其他开发人员合作.

## 注册 github 账号

## 配置 github

一般本地仓库和远程 `github` 仓库之间是通过 `ssh` 加密传输信息的,所以我们需要先配置好验证信息:

**第一步: 生成密钥对**

```
ssh-keygen -t rsa -C "youremail@example.com"
```

这里的邮箱 `youremail@example.com` 需要填写自己在 `github` 上注册邮箱,之后会提示输入路径和密码,一路回车确认采用默认值即可.正常的话会在当前用户目录下
生成一对密钥对,包括公钥和私钥.其中公钥可以发送给任何人,而私钥千万不可泄露.

**第二步: 复制公钥**

在当前用户根目录下找到 `.ssh` 目录下有两个文件,一个是公钥 `id_rsa.pub` ,另一个是私钥 `id_rsa`,用记事本或者其他方式打开公钥文件,复制其中内容,准备粘贴到`github` 设置项.

```
# 查看当前用户下的 ssh 目录
ls ~/.ssh

# 查看生成的公钥内容
cat ~/.ssh/id_rsa.pub
```

**第三步: 设置 github**

回到 `github`,点击头像(Acount),选择设置(Settings),再选择左侧的 SSH and GPG keys,点击右侧的NEW SSH Key,然后填写标题(Title),最好是有意义的名称,比如`youremail@example.com for github`,密钥(Key)填写上一边生成的公钥,一般是以`ssh-rsa` 开头的一大串字符,最后保存(Add SSH Key).

**第四步: 验证 ssh**

利用 ssh 协议测试一下是否能够访问`github`,如果出现成功提示的话,那就证明我们的配置没问题.

```
ssh -T git@github.com
```

## 创建远程仓库

在`github` 网页端新建远程仓库,例如`git-demo`,默认权限是公开的(public),也可以选择私有的(private),初始化 `README.md ` 文件和 `.gitignore` 文件以及选择开源协议这些都是可选的,视具体情况而定.

刷新当前页面,应该能到看到已经创建好的`git-demo`仓库,接下来我们就可以将其克隆到本地电脑上开始开发了.

## 克隆到本地仓库

将远程项目克隆到本地工作空间,和之前本地仓库开发流程一样,`add commit status` 等等,唯一不同的是,本地仓库的最新版本需要推送到远程仓库中,只有这样其他小伙伴才能从远程仓库拉取最新版本,进而才能看到你的代码,彻底打破各自为政局面,实现团队协同开发.

```
# 克隆到本地仓库
git clone git@github.com:snowdreams1006/git-demo.git

# 创建新文件
touch test.txt
echo "add test.txt" > test.txt

# 添加文件到暂存区
git add test.txt

# 提交文件到本地仓库
git commit -m "add test.txt"

# 推送到远程仓库
git push origin master
```

提交完成后,返回`github` 网页版,刷新当前项目`git-demo`,应该能看到我们刚刚提交了一个新文件`test.txt`.

## 查看远程仓库

查看当前配置有哪些远程仓库

```
git remote
```

## 下载远程仓库

从远程仓库下载最新分支数据,注意: 并不会和当前分支合并,需要手动执行`git merge` 命令.

```
git fetch
```

## 拉取远程仓库

从远程仓库拉取最新分支数据,自动尝试合并到当前分支,如有冲突,需先解决冲突再合并到当前分支.

```
git pull
```

## 推送远程分支

将本地最新版本推送到远程仓库

```
git push origin master
```

## 删除远程仓库

```
git remote rm origin
```