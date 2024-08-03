#!/bin/bash

# generate docs 
gitbook build

# push to blog.snowdreams1006.cn
scp -r _book/* ali:~/nginx/html/blog

# copy to snowdreams1006.github.io
cp -rf _book/* ../snowdreams1006.github.io

# cd snowdreams1006.github.io
cd ../snowdreams1006.github.io

# add commits
git add .

# commit 
git commit -m "auto deploy website"

# push to github and others
git push

# cd blog
cd ../blog

# add commits
git add .

# commit 
git commit -m "automatic update"

# push to github and others
git push