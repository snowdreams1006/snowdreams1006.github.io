# svn 快速入门

- Recursively ignores folders

```bash
svn propset svn:ignore -R *.class .  
svn propset svn:ignore -R *.apk .   
svn propset svn:ignore -R Thumbs.db .
```

> `.svnignore`

```
build
bin
gen  
proguard  
.classpath  
.project  
local.properties  
Thumbs.db  
*.apk  
*.ap_  
*.class  
*.dex
```

> `svn propset svn:ignore -R -F .svnignore .`

```bash
svn add --force .
```

```bash
svn propset svn:ignore -R node_modules .
svn propset svn:ignore -R unpackage .

svn propset svn:ignore -R -F .svnignore .
```

## ref docs

- [SVN中设置忽略文件](https://www.jianshu.com/p/fea4625c8fd3)
- [使用svn进行文件和文件夹的忽略](https://www.jianshu.com/p/c02d8b335495)