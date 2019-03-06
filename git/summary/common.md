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
git reset HEAD 
```






