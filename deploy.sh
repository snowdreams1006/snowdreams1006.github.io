#!/bin/bash

# pull latest 
git pull

# remove cache dir
rm -rf _book/

# generate docs 
gitbook build

# copy to docs
cp -rf _book/* .

# push to server,only for myself
scp -r _book/* ali:~/nginx/html/blog

# add commits
git add .

# commit 
git commit -m "auto deploy website"

# push to github and others
git push