#! /bin/bash

# re-generate docs
rm -rf _book/ && gitbook build

# copy to docs
cp -rf _book/ .

# pull lastest 
git pull

# add commits
git add .

# commit 
git commit -m "auto deploy website"

# push to github and others
git push origin master