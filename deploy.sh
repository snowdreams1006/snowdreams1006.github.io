#!/bin/bash

# 检查第一个参数是否为空
if [ -z "$1" ]; then
    # copy to blog
    cp -rf ../snowdreams1006.github.io/assets/picgo/* assets/picgo
fi

# status latest 
git status
# pull latest
git pull
# add commits
git add .
# commit 
git commit -m "upload changes"
# push to github and others
git push
# status latest 
git status

# 检查第一个参数是否为空
if [ -z "$1" ]; then
    # generate docs 
    gitbook build

    # push to blog.snowdreams1006.cn
    scp -r _book/* al:/usr/share/nginx/html/blog

    # copy to snowdreams1006.github.io
    cp -rf _book/* ../snowdreams1006.github.io

    # cd snowdreams1006.github.io
    cd ../snowdreams1006.github.io

    # 删除全部md文件
    find . -type f -name "*.md" -delete

    # status latest 
    git status
    # pull latest
    git pull
    # add commits
    git add .
    # commit 
    git commit -m "deploy website"
    # push to github and others
    git push
    # status latest 
    git status

    # cd blog
    cd ../blog
fi


