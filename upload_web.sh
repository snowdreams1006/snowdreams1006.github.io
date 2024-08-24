#!/bin/bash

# copy to blog
cp -rf ../snowdreams1006.github.io/assets/picgo/* assets/picgo

# status latest 
git status
# pull latest
git pull

# generate docs 
gitbook build

# add commits
git add .
# commit 
git commit -m "build website and update"
# push to github and others
git push
# status latest 
git status

# push to blog.snowdreams1006.cn
scp -r _book/* ali:~/nginx/html/blog

# copy to snowdreams1006.github.io
rm -rf ../snowdreams1006.github.io/*
cp -rf _book/* ../snowdreams1006.github.io

# cd snowdreams1006.github.io
cd ../snowdreams1006.github.io

# status latest 
git status
# pull latest 
git pull
# add commits
git add .
# commit 
git commit -m "auto deploy website"
# push to github and others
git push
# status latest 
git status

# cd blog
cd ../blog

