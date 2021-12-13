@Echo off

git pull

rm -rf _book/

gitbook build

scp -r _book/* sn:~/blog

cp -rf _book/* .

git add .

git commit -m "auto deploy website"

git push origin 