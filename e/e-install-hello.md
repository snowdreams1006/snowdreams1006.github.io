# 你好易语言

> 声明：该公众号大部分文章来自作者日常学习笔记,也有部分文章是经过作者授权和其他公众号白名单转载.
>
> 未经授权,严禁转载,如需转,联系开白.
>
> 请勿利用文章内的相关技术从事非法测试,如因此产生的一切不良后果与文章作者和本公众号无关.
  
现在只对**常读和星标**的公众号才展示大图推送,建议大家把「雪之梦技术驿站」“设为星标”,否则下次可能看不到了！

![微信公众号「雪之梦技术驿站」](/assets/picgo/478bce29701d85c60553d9ddc3d1afea.gif)

## 引言

寻找桌面软件开发的过程中,发现了易语言这门中文编程语音可以轻松胜任,于是想要开发这么一款一键提取小程序的https接口,那就要用到了易语言的开发环境.

![](/assets/picgo/740057c948774094ba06b7db385d7375.png)

## 安装

首先我们要在浏览器中输入”www.dywt.com.cn”,进入到易语言的下载页面,如图所示

![](/assets/picgo/c0c23a1a6798f1eea6b2869162577be1.png)

看起来很有历史感不太像官网的网站下来了`e595_chs_all.exe`安装包,一步一步安装没什么太大问题.

```
e595_chs_all.exe
```

![](/assets/picgo/fbc4319089b66dec2f9673e1e42f1c57.png)

![](/assets/picgo/11cbd9a17a623326d21dba13e773ce33.png)

![](/assets/picgo/58f2f61f4d1d68aedc48313e7622c476.png)

![](/assets/picgo/d6e1f7acab5d6d100e2bee7c1bb51ef2.png)

![](/assets/picgo/029255602d09633f9ee234789f5f3126.png)

![](/assets/picgo/ab36312fb41e085e6b78e4c777e70abe.png)

![](/assets/picgo/2465087ced218c27ae876eb7f4029895.png)

![](/assets/picgo/a3698a7505e9ef6a2cb4b277e365d5a0.png)

![](/assets/picgo/7aec2bfbe0a8050d7442429eb34c5024.png)

![](/assets/picgo/0b082641312e3eb71aa6e7d586e41d33.png)

> 这一步可以不用勾选下下面两个选项,默认安装软件是需要授权购买的,请支持正版进行购买,仅用于学习研究用途的另说!

![](/assets/picgo/d3878ef7aef68dcb94dab6e874d5f788.png)

![](/assets/picgo/83871c77f1c1568e4f6915a7cd701c02.png)

## 激活

下载提供激活安装包,解压缩后目录结构如下:

![](/assets/picgo/a4a2c69cdca8ce04d9f9785ac3a6dca9.png)

```bash
链接：https://pan.quark.cn/s/449a1ec591e3
提取码：R2S6
```

找到易语言的安装位置,也可以在桌面快捷方式中右键属性找到安装位置.

![](/assets/picgo/dc9f85c5fb77612112c5ab6df4a29c5f.png)

将激活包的全部文件复制到安装目录,根据提示覆盖安装某些文件或目录.

![](/assets/picgo/77b5c16ceb45982c451a3cba3bab7d7d.png)

![](/assets/picgo/9c61fe6c2e0adc45befd8de73eed9036.png)

## 验证

如果现在再次打开易语言快捷方式,不再提示购买,则说明安装成功!

![](/assets/picgo/b593eb0459ecd1206c99216cba5d0c40.png)

下面进行一些相关配置,准备好开发"你好世界"吧!

- 添加全部支持库

顶部菜单: 工具 / 支持库配置 / 全选 /确定

![](/assets/picgo/b8c18a96a2ae88d640a5a49afe8ea761.png)

![](/assets/picgo/f38f1169831bb49e85ce87a5d6fc0870.png)

- 修改易语言静态版link.ink

![image-20241204165119252](C:/Users/Administrator/AppData/Roaming/Typora/typora-user-images/image-20241204165119252.png)

双击`link.e`文件,点击“修改”按钮，提示成功后即可即可！

![](/assets/picgo/84f4ec3d0f7aa1f78e0a56909bdbe5c1.png)

## 使用

在菜单栏中`新建`,选择`windows窗口程序`,确定后就可以打开窗口设计面板.

![](/assets/picgo/e5f350bddf060b5d33f14b2d9c82def4.png)

![](/assets/picgo/f4927a887d5c26b3b28238c9d492de40.png)

在最右侧的基本组件中,包括按钮和标签等控件,**鼠标点一下**就表示选中了该组件,然后在左侧的窗口设计面板按住鼠标不松手即可拖拽划出一块区域大小.

![](/assets/picgo/a9a0fb93f542ddeb338bd0dd6f01ae2a.png)

例如,这里拖拽了标签和按钮,想要实现的效果就是点击按钮会将标签的标题设置为"我爱易语言"

```
标签1.标题 ＝ “我爱易语言！”
```

![](/assets/picgo/34b502ef45a430b1c43644bb8450bb82.png)

完整代码参考如下:

```
.版本 2

.程序集 窗口程序集_启动窗口

.子程序 _按钮1_被单击

标签1.标题 ＝ “我爱易语言！”
```

点击运行即可看到调试效果,点击按钮将标签的标题更改为了`我爱易语言`

![](/assets/picgo/e19644340f6cbe0a7fd1f4b4ddac8a88.gif)

## 总结

本文主要介绍了易语言的安装配置以及入门版的"你好,世界",中文编程说简单也简单,说麻烦也挺难的!

最后说一句: 经过三天三夜终于借助易语言开发了一款小工具,一键提取小程序token,取代了原来手动下载Charles等抓包工具,又要安装证书,设置代理,监听请求等繁琐步骤.

![](/assets/picgo/20218adfafb92f8b989cd4624d88991f.gif)

感兴趣的小伙伴欢迎私聊咨询哦,一机一码,亲测好用~

![](/assets/picgo/c1a8f476bb6f8ef95a86575da9fb546e.gif)

## 往期精彩文章

- [Mac版本Burpsuite下载安装超详细教程,专业版中文激活教程(附下载)](https://mp.weixin.qq.com/s/CqBcQpZYLY33iF0DdWrdiA?token=327782893&lang=zh_CN)
- [Burpsuite下载安装超详细教程,社区版永久有效,专业版汉化激活到2099年,不看会后悔系列,亲测好用!](https://mp.weixin.qq.com/s/lQuBxUPPwx0cFdhGo9YWEg?token=327782893&lang=zh_CN)
- [终极防窥秘籍！禁用右键+F12，竟还拦不住好奇宝宝？揭秘防窥新境界！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485664&idx=1&sn=b3cccb1d3da0c4dc4c3fe67312dba788&chksm=fd1f212aca68a83c7ba61f9f930b3d21aa700d5b4dee7beb3c793a707e5858eeddb1c7d18a26&token=440466482&lang=zh_CN#rd)
- [【硬核防白嫖秘籍】一键取关？直接拉黑，让你的公众号再无回头白嫖党！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485193&idx=1&sn=d873ab35b0e987dd868e1685d89dc547&chksm=fd1f2ec3ca68a7d54faed25b3830545c86351802991170a9d8bd86bfe85f305beaf5b2843632&token=156946282&lang=zh_CN#rd)
- [谁家爬虫这么明目张胆?连UserAgent都不要了!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484695&idx=1&sn=91c6afb16c400ac5c23d7e13b4d4971f&chksm=fd1f2cddca68a5cbdecd9e383efd87461af8f8d00e9495a33063ade73f72eceb207cdc93615f&token=312545539&lang=zh_CN#rd)

## 欢迎扫码关注
                  
![微信公众号「雪之梦技术驿站」](/assets/picgo/a92b2e6f79ec25e79869ec6783fba19a.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`




