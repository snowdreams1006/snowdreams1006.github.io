#!/bin/sh

# 借用git
if [ -f ".gitignore" ]; then
    cat .gitignore > .svnignore
fi

# 忽略所有以.开头的文件
ls -a | grep '^\.\w' >> .svnignore

# 还有一些不是.开头的，但是没必要加入库的文件或目录
printf 'node_modules\n' >> .svnignore

# 接受命令行的输入
while [ -n "$1" ]
do
    echo "$1" >> .svnignore
    shift 1
done

svn propset svn:ignore -F .svnignore .
svn ci -m 'ignoring some files'
rm .svnignore