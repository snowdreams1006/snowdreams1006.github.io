# 本地仓库

## 要求
- 了解本地仓库的概念,掌握创建本地仓库的命令
- 体验`git`的个人工作流程,将文件加入到版本控制中
- 学以致用,从示例背景中独立提炼出关键操作命令

## 背景


## 小结
- 初始化本地仓库 `git init ` 
- 添加文件到本地仓库分两步 `git add <file>` 和 `git commit -m <message>`
- 实际工作中,大致以下流程

```
# 在工作空间创建指定目录
mkdir demo

# 切换至工作目录
cd demo

# 初始化本地仓库
git init 

# 创建新文件
touch test.txt

# 编辑新文件,输入 git test
echo "git test" > test.txt

# 添加到本地仓库: 第一步指定要添加的文件
git add test.txt

# 添加到本地仓库: 第二步指定添加文件备注
git commit -m "add test.txt"

...

# 继续编辑目标文件,追加 git init
echo "git init" >> test.txt

# 将目标文件添加到本地仓库
git add test.txt

# 添加本次新增文件的备注
git commit -m "add git init"

```
