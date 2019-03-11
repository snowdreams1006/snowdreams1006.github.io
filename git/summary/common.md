# 知识速查

## 创建版本库

### 初始化项目 git init 

从零开始创建项目

**示例** 

```
git init 
```

### 克隆项目 git clone

将已有项目拷贝到本地

**示例** 

```
git clone git@github.com:snowdreams1006/snowdreams1006.github.io.git
```

## 添加文件 git add

将新文件或已修改文件添加到缓存区

**示例** 

```
git add README.md
```

## 查看状态 git status

查看当前文件是否和上次提交内容是否有修改

**示例** 

```
git status README.md
```

## 比较差异 git diff

查看当前文件和上次提交内容的具体差异

- 尚未缓存的修改: `git diff`
- 查看已缓存修改: `git diff --cached`
- 查看已缓存与未缓存的所有修改: `git diff HEAD`
- 显示摘要而非整个差异: `git diff --stat`

**示例** 

```
git diff README.md
```

## 提交文件 git commit

将缓存区内容添加到版本库

**示例** 

```
git commit -m "remark"
```

## 取消已缓存内容 git reset HEAD

将缓存区内容添加到版本库

**示例** 

```
git reset HEAD 
```

## 删除文件 git rm <file>

- 从暂存区中移除且不保留在工作目录: `git rm <file>`
- 强制从暂存区中移除且不保留在工作目录: `git rm -f <file>`
- 从暂存区中移除但保留工作目录: `git rm --cached <file>`

**示例** 

```
git rm README.md
```

## 移动文件 git mv <file_old> <file_new>

移动或重命名文件,目录,软连接

**示例** 

```
git mv README.md README_NEW.md
```

`commit push pull fetch merge` 的区别与含义:

- `git commit` : 将本地修改过的文件提交到本地仓库中
- `git push` : 将本地仓库的最新版本推送到远程库中
- `git pull` : 从远程库获取最新版本到本地,并自动`merge`
- `git fetch` : 从远程库获取最新版本到本地,不会自动`merge`
- `git merge` : 将指定版本合并到当前分支

## 替换本地改动

丢弃当前文件修改内容,已添加到暂存区以及新文件都不会受到影响

**示例** 

```
git checkout -- <file>
```

丢弃本地所有改动

**示例** 

```
git reset --hard 
```

## 分支管理

### 创建分支 git branch <name>

创建本地分支,但不自动切换新分支
  
**示例** 

```
git branch dev
```

### 切换分支 git checkout <name>

切换到指定分支

**示例** 

```
git checkout dev
```

### 创建并切换分支 git checkout -b <name>

创建本地分支并自动切换到新分支

**示例** 

```
git checkout -b feature
```

### 合并分支 git merge <name> 

将指定分支合并到当前分支

**示例** 

```
git merge dev
```

### 删除分支 git branch -d <name> 

删除指定分支

**示例** 

```
git branch -d dev
```

### 列出分支 git branch 

列出本地全部分支

**示例** 

```
git branch
```

## 提交日志 git log 
 
查看纳入版本库的提交日志

**示例** 

```
git log
```

## 标签管理

### 创建标签 git tag -a <name>

创建标签并提交备注
  
**示例** 

```
git tag -a v1.0.0
```

### 追加标签 git tag -a <name> <commit>

追加标签并更新备注
  
**示例** 

```
git tag -a v0.9.0 6ad8956bc09a6a62c731711eabe796690aa6471c
```

### 删除标签 git tag -d <name> 

删除指定标签

**示例** 

```
git tag -d v1.0.0
```

### 查看标签 git show <name> 

查看指定标签

**示例** 

```
git show v1.0.0
```

### 列出标签 git tag 

列出本地全部标签

**示例** 

```
git tag
```