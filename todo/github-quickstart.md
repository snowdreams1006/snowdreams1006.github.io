# github 快速入门

Quick setup — if you’ve done this kind of thing before

## …or create a new repository on the command line

```bash
echo "# mycustomer" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M master
git remote add origin git@github.com:snowdreams1006/mycustomer.git
git push -u origin master
```

## …or push an existing repository from the command line

```bash
git remote add origin git@github.com:snowdreams1006/mycustomer.git
git branch -M master
git push -u origin master
```

## …or import code from another repository

```bash
You can initialize this repository with code from a Subversion, Mercurial, or TFS project.
```

- [GitHub Corners](https://tholman.com/github-corners/)