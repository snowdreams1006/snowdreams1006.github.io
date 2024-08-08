# 微信公众号开发指南之从入门到弃坑

![微信公众号「雪之梦技术驿站」](https://files.mdnice.com/user/71390/cdf074dc-564e-4016-aaa5-4517826bf9c2.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！  

> 偷偷溜进文章的小**广告**，别害羞，点进去瞅瞅，说不定能发现什么宝藏呢！
>
> 文末那个也别错过，说不定是通往秘密花园的钥匙哦！

作为小小的公众号作者,一直坚持原创,虽然中间有过长时间的断更,但是坚持原创的初心一直未变.

前些天偶然间想起来了我还有一个公众号,于是乎又重新下载了`订阅号助手`APP,观察了几天的时间.

本来就少的又少的粉丝还上上下下关注脱粉,分析下来大多数还是来源于引流网站的导流.

![](https://files.mdnice.com/user/71390/a6678314-3bfb-4b88-b118-05b8c9ba0b9e.png)

明明记得早上还能多涨一个粉丝,结果晚上好像又恢复了原样子.我想大概是白嫖结束取关了.

所以,我决定做出了一个艰难的决定: **开发微信公众号,实时统计取关的粉丝!**

> 原创不易,且行且珍惜吧!

## 先决条件

### 前提

> 想清楚目标再行动

正常来说,个人订阅号的权限足够使用,而且微信公众号后台都是可视化操作页面.

然而,翻遍了公众号后台和`订阅号助手`app 也没有实现找出`取关粉丝`这一朴素需求.

甚至想过利用`爬虫技术`定期抓取全部用户,筛选比较也能得到取关用户.

然而,这种技术显然不够优雅也不能实时统计取关明细.

于是乎,翻开了微信公众号开发文档,有了这么的接口,接下来就可以进行公众号开发咯!

![](https://files.mdnice.com/user/71390/9567f18a-0589-4751-9a4c-89c80a4838d6.png)

> [关注-取消关注事件](https://developers.weixin.qq.com/doc/offiaccount/Message_Management/Receiving_event_pushes.html#%E5%85%B3%E6%B3%A8-%E5%8F%96%E6%B6%88%E5%85%B3%E6%B3%A8%E4%BA%8B%E4%BB%B6 "关注-取消关注事件")

![](https://files.mdnice.com/user/71390/17f43ffd-a6bd-415e-833c-242c4dfe610f.png)

```xml
<xml>
  <ToUserName><![CDATA[toUser]]></ToUserName>
  <FromUserName><![CDATA[FromUser]]></FromUserName>
  <CreateTime>123456789</CreateTime>
  <MsgType><![CDATA[event]]></MsgType>
  <Event><![CDATA[subscribe]]></Event>
</xml>
```

参数说明：

- oUserName 开发者微信号
- FromUserName 发送方账号（一个 OpenID）
- CreateTime 消息创建时间 （整型）
- MsgType 消息类型，event
- Event 事件类型，`subscribe(订阅)`、`unsubscribe(取消订阅)`

> 众里寻他千百度,蓦然回首,那人却在灯火阑珊处!

![](https://files.mdnice.com/user/71390/d416b264-92e5-4cff-812e-999faee7ded4.png)

### 困难

> 自动回复和自定义菜单全部失效了,需要自行开发实现!

这里不得不吐槽一下公众号的产品设计思路,只要开启了公众号开发,原来后台设定的自动回复和自定义菜单就统统失效了!

如果公众号开发的功能与微信公众号后台设置的功能有冲突的话,可以设置优先级而不是简单粗暴地以开发为准,二者选其一,这一点就让人很纠结.

所以,务必要考虑清楚能否承受自行开发之痛,相当于要全部实现与公众号后台完全相同的功能.

![](https://files.mdnice.com/user/71390/779ce808-2fca-41c5-ac61-1ba491f3b0dc.png)

**未开启自定义菜单**

> 由于开发者通过接口修改了菜单配置，当前菜单配置已失效并停用。你可以前往 开发者中心进行停用，或者通过接口配置发布菜单。

![](https://files.mdnice.com/user/71390/ea35bc93-2f44-4aae-9f15-3269d99b66d1.png)

## 后台设置

由于已经开发完毕,为了复盘写公众号开发系列的文章,因此反复开关后台开发功能.

为了新手的完整的体验,尽可能地还原从入门到弃坑的完整过程.

### 自动回复

> 微信公众号后台: `内容与互动` --> `自动回复`

尽可能地完整记录下`关键词回复`,`收到消息回复`和`被关注回复`的具体规则.

因为接下来的开发过程要完整实现这部分的逻辑,如果之前没有设置过相关规则可以忽略,继续接下来的开发.

**关键词回复**

```bash
解锁博客  vip, 验证码, 解锁博客  1 文本

<a href="www.test.com">点击该链接，获取博客解锁验证码</a>
```

![](https://files.mdnice.com/user/71390/19a33937-a1e9-4dff-98f1-28558e0c8f3d.png)

**被关注回复**

`感谢你的关注,希望雪之梦技术驿站能够对您有所帮助!`

![](https://files.mdnice.com/user/71390/e9020170-3b79-404d-ad91-40797c28270e.png)

**收到消息回复**

`如果后台长时间没能回复的话,欢迎添加微信「snowdreams1109」加急提醒一下`

![](https://files.mdnice.com/user/71390/1e4859d9-2ba8-47a9-96c5-c3a136a732e0.png)

### 自定义菜单

> 微信公众号后台: `内容与互动` --> `自定义菜单`

![](https://files.mdnice.com/user/71390/a5c2f40c-9bd9-4c30-a505-c892fdb1bfc1.png)

**子菜单信息**

![](https://files.mdnice.com/user/71390/3774eb72-7f98-42f4-a737-0b86cf1a7d4b.png)

**完整菜单**

```bash
系列教程
  [Go笔记](http://mp.weixin.qq.com/mp/homepage?__biz=MzU3NTc1MDMwOQ==&hid=1&sn=6766242fb7c9b28220e6d1aafb0b6151&scene=18#wechat_redirect)
  [Gitbook教程](http://mp.weixin.qq.com/mp/homepage?__biz=MzU3NTc1MDMwOQ==&hid=5&sn=23f95d8376484dbd9c8ae087a8abf24d&scene=18#wechat_redirect)
  [Github教程](http://mp.weixin.qq.com/mp/homepage?__biz=MzU3NTc1MDMwOQ==&hid=3&sn=d92d36448112fe6737fe0bdfc43ec2c5&scene=18#wechat_redirect)
  [Git教程](http://mp.weixin.qq.com/mp/homepage?__biz=MzU3NTc1MDMwOQ==&hid=2&sn=2c4e11cc497907211cf22007affe1243&scene=18#wechat_redirect)
  [Markdown教程](http://mp.weixin.qq.com/mp/homepage?__biz=MzU3NTc1MDMwOQ==&hid=4&sn=2df16c18749da184ac671c2c110baa15&scene=18#wechat_redirect)

[精选文章](http://mp.weixin.qq.com/mp/homepage?__biz=MzU3NTc1MDMwOQ==&hid=6&sn=1490a24795eca5c71d9554ff50054148&scene=18#wechat_redirect)

了解更多
  [历史消息](https://mp.weixin.qq.com/mp/profile_ext?action=home&__biz=MzU3NTc1MDMwOQ==#wechat_redirect)
  [我的博客](图片 "我的博客")
  [交流合作](图片 "交流合作")
```

## 公众号开发

> 微信公众号后台: `设置与开发` --> `基本配置`

![](https://files.mdnice.com/user/71390/e2420637-2ef9-4302-aa66-fefceb8d8a5c.png)

这里`服务器地址(URL)`和`消息加解密方式`需要重点关注,`令牌(Token)`是自定义字符串,`消息加解密密钥(EncodingAESKey)`可以随机生成.

开发阶段`消息加解密方式`推荐`明文模式`,不要选其他方式!

![](https://files.mdnice.com/user/71390/0589edd9-843f-4239-a52c-44a01be25f0d.png)

看到这里,真正的调整才刚刚开始,除了`服务器地址(URL)`之外的其余参数是不是很简单,毫无压力?

![](https://files.mdnice.com/user/71390/5154dcbb-efa1-4371-8767-8c3379995917.png)

> [微信公众平台开发概述](https://developers.weixin.qq.com/doc/offiaccount/Getting_Started/Overview.html "微信公众平台开发概述")
>
> [微信公众平台入门指引](https://developers.weixin.qq.com/doc/offiaccount/Getting_Started/Getting_Started_Guide.html#_1-1-%E7%94%B3%E8%AF%B7%E6%9C%8D%E5%8A%A1%E5%99%A8 "微信公众平台入门指引")

**服务器地址(URL)**

首先你应该有个能正常访问的公网,支持域名或者 ip,如果没有的话,临时测试也可以搜索`内网穿透技术`相关文章,这里不再赘述.

![](https://files.mdnice.com/user/71390/a82f14e2-d899-4561-a046-94d0b0ee3a53.png)

这里的`服务器地址(URL)`是以后微信公众号推送消息给开发后台的`唯一入口`.

不管是用户私信消息还是关注或者取消关注事件,都是统一这个`url`链接.

唯一的区别在于不同的请求方式不一样,例如现在的验证`服务器`功能发送的是`GET`请求,其余的大多数是`POST`请求.

![](https://files.mdnice.com/user/71390/5fe286ca-cfda-4c85-8c8c-353043567e36.png)

> `服务器配置(已启用)`: 请先确保上述校验服务器的 url 地址外网可以无限制访问才能成功启用!!!

![](https://files.mdnice.com/user/71390/822a1c7f-7474-4be1-a54e-806635d63ab7.png)

一旦开启后,**自定义菜单和自动回复均失效**,都需要通过程序接口调用方式重新设置!

**选择已有工具包**

现在已经弄清楚了基本流程,工欲善其事,必先利其器.选择好适合的开发工具,能做到事半功倍.

不再关心具体的繁琐的内部逻辑,只需要把重点放在业务逻辑的实现即可.

如果是`Java`开发,推荐[WxJava](https://github.com/Wechat-Group/WxJava "WxJava")项目,实现了全部的微信公众号功能接口,非常好用!

![](https://files.mdnice.com/user/71390/fc7da784-2d3e-4eb9-a6e6-dfc33619554f.png)

下面以`Java`语言演示`服务器地址(URL)`接口应该如何编写:

```java
@AnonymousGetMapping(produces = "text/plain;charset=utf-8")
public String checkSignature(@PathVariable String appId,
                             @RequestParam(name = "signature", required = false) String signature,
                             @RequestParam(name = "timestamp", required = false) String timestamp,
                             @RequestParam(name = "nonce", required = false) String nonce,
                             @RequestParam(name = "echostr", required = false) String echostr) {
    // 校验签名
    log.info("签名校验 ===》 微信加密签名: {} 时间戳: {} 随机数: {} 随机字符串: {}",signature,timestamp,nonce,echostr);
    return echostr;
}
```

> 这里忽略具体的验证逻辑,不同的语言实现方式不同,重点关注接口验证成功后的返回值应该是原`echostr随机字符串`.

大多数的`Java`项目接口可能返回的都是统一的`json`格式,请确保`text/plain;charset=utf-8`能够返回**echostr 随机字符串文本**,而不是带有**双引号**的奇怪字符串!

**自动回复**

![](https://files.mdnice.com/user/71390/59e0191a-9611-48f4-83a0-7c779d5f9a80.png)

**自定义菜单**

![](https://files.mdnice.com/user/71390/1c175dfd-61a3-4929-96d5-17237759b394.png)

### 上手开发

始终牢记微信公众号后台无论是开启服务器 url 的验证还是以后正常推送消息,永远都是相同的`URL`,不同的是具体的请求方法或者是请求格式不一样而已!

![](https://files.mdnice.com/user/71390/d6e6dca4-be6d-403e-ac66-3ebfba5a6f3e.png)

```java
@AnonymousPostMapping(produces = "text/xml; charset=UTF-8")
public String replyMessage(
        @PathVariable String appId,
        @RequestBody String requestBody,
        @RequestParam("signature") String signature,
        @RequestParam("timestamp") String timestamp,
        @RequestParam("nonce") String nonce,
        @RequestParam("openid") String openid,
        @RequestParam(name = "encrypt_type", required = false) String encryptType,
        @RequestParam(name = "msg_signature", required = false) String msgSignature) {
    if (!wxMpService.switchover(appId)) {
        throw new IllegalArgumentException(String.format("未找到对应appId=[%s]的配置，请核实！", appId));
    }
    if (!wxMpService.checkSignature(timestamp, nonce, signature)) {
        throw new IllegalArgumentException("非法请求,可能属于伪造的请求!");
    }

    // 消息加解密方式
    String out = null;
    if (encryptType == null) {
        // 明文传输的消息
        WxMpXmlMessage inMessage = WxMpXmlMessage.fromXml(requestBody);
        WxMpXmlOutMessage outMessage = myWxMpService.replyWxMpMsg(inMessage);
        if (outMessage == null) {
            return "";
        }
        out = outMessage.toXml();
    } else if ("aes".equalsIgnoreCase(encryptType)) {
        // aes加密的消息
        WxMpXmlMessage inMessage = WxMpXmlMessage.fromEncryptedXml(requestBody, wxMpService.getWxMpConfigStorage(),timestamp, nonce, msgSignature);
        WxMpXmlOutMessage outMessage = myWxMpService.replyWxMpMsg(inMessage);
        if (outMessage == null) {
            return "";
        }
        out = outMessage.toEncryptedXml(wxMpService.getWxMpConfigStorage());
    }
    return out;
}
```

> 依然是相同的`url`路径,不同是请求参数不同,响应格式不同`text/xml; charset=UTF-8`.

所以请确保项目支持返回`text/plain;charset=utf-8`和`text/xml; charset=UTF-8`等格式.

> 这里是踩了坑的亲身体验才会反复强调,参考网络上的文章结果就是: 明明是相同的代码,为什么我的项目却运行不成功?

![](https://files.mdnice.com/user/71390/17d7e465-fbeb-44ff-a295-d4506b8f6c24.png)

**实现自动回复**

> 粉丝给公众号一条文本消息，公众号立马回复一条文本消息给粉丝，不需要通过公众平台网页操作。

**接受文本消息**

粉丝给公众号发送文本消息：“欢迎开启公众号开发者模式”，在开发者后台，收到公众平台发送的 xml 如下：

```xml
<xml>
 <ToUserName><![CDATA[公众号]]></ToUserName>
 <FromUserName><![CDATA[粉丝号]]></FromUserName>
 <CreateTime>1460537339</CreateTime>
 <MsgType><![CDATA[text]]></MsgType>
 <Content><![CDATA[欢迎开启公众号开发者模式]]></Content>
 <MsgId>6272960105994287618</MsgId>
</xml>
```

**被动回复文本消息**

公众号想回复给粉丝一条文本消息，内容为“test”, 那么开发者发送给公众平台后台的 xml 内容如下：

```xml
<xml>
 <ToUserName><![CDATA[粉丝号]]></ToUserName>
 <FromUserName><![CDATA[公众号]]></FromUserName>
 <CreateTime>1460541339</CreateTime>
 <MsgType><![CDATA[text]]></MsgType>
 <Content><![CDATA[test]]></Content>
</xml>
```

关键代码:

```java
// 关键词回复
if(StringUtils.equals("text",msgType) && StringUtils.equalsIgnoreCase("vip",content)){
    outContent = "<a href=\"https://www.test.com\">点击该链接，获取博客解锁验证码</a>";
}
```

![](https://files.mdnice.com/user/71390/b15e133c-a9ad-4422-b80a-30145bb38555.png)

```json
{
    "allFieldsMap": {
        "Content": "vip",
        "CreateTime": "1722873498",
        "ToUserName": "gh_test",
        "FromUserName": "opZ4h1Xs40_test",
        "MsgType": "text",
        "MsgId": "24665616993629308"
    },
    "articleUrlResult": {},
    "content": "vip",
    "createTime": 1722873498,
    "fromUser": "opZ4h1Xs40_test",
    "hardWare": {},
    "msgId": 24665616993629308,
    "msgType": "text",
    "scanCodeInfo": {},
    "sendLocationInfo": {},
    "sendPicsInfo": {
        "picList": []
    },
    "toUser": "gh_test"
}
```

关键词回复以及收到消息回复

> 关键词回复: 可以根据关键词自定义匹配规则,例如接收到`vip`关键词,回复验证码
>
> 收到消息回复: 没有被关键词匹配成功的默认回复,也可以引入 ai 实现智能问答

![](https://files.mdnice.com/user/71390/ae7b9b4a-ea29-450c-b5f1-6eee4f5d65fb.png)

**接收图片消息**

![](https://files.mdnice.com/user/71390/0faaddaf-48d3-48ba-a60a-bba38866541c.png)

```xml
<xml>
 <ToUserName><![CDATA[公众号]]></ToUserName>
 <FromUserName><![CDATA[粉丝号]]></FromUserName>
 <CreateTime>1460536575</CreateTime>
 <MsgType><![CDATA[image]]></MsgType>
 <PicUrl><![CDATA[http://mmbiz.qpic.cn/xxxxxx /0]]></PicUrl>
 <MsgId>6272956824639273066</MsgId>
 <MediaId><![CDATA[gyci5a-xxxxx-OL]]></MediaId>
</xml>
```

**被动回复图片消息**

```xml
<xml>
 <ToUserName><![CDATA[粉丝号]]></ToUserName>
 <FromUserName><![CDATA[公众号]]></FromUserName>
 <CreateTime>1460536576</CreateTime>
 <MsgType><![CDATA[image]]></MsgType>
 <Image>
 <MediaId><![CDATA[gyci5oxxxxxxv3cOL]]></MediaId>
 </Image>
</xml>
```

关键代码:

```java
// 图片消息
if(StringUtils.equals("image",msgType)) {
    wxMpXmlOutMessage = WxMpXmlOutMessage.IMAGE()
            .mediaId(mediaId)
            .fromUser(message.getToUser())
            .toUser(message.getFromUser())
            .build();
}
```

效果如下:

```json
{
    "allFieldsMap": {
        "MediaId": "YLMZPCB2M6Ba4IH8Hzikn_test",
        "CreateTime": "1722879118",
        "ToUserName": "gh_test",
        "FromUserName": "opZ4h1Xs40_test",
        "MsgType": "image",
        "PicUrl": "http://mmbiz.qpic.cn/sz_mmbiz_jpg/test",
        "MsgId": "24665697128505882"
    },
    "articleUrlResult": {},
    "createTime": 1722879118,
    "fromUser": "opZ4h1Xs40_test",
    "hardWare": {},
    "mediaId": "YLMZPCB2M6Ba4IH8Hzikn_test",
    "msgId": 24665697128505882,
    "msgType": "image",
    "picUrl": "http://mmbiz.qpic.cn/sz_mmbiz_jpg/test",
    "scanCodeInfo": {},
    "sendLocationInfo": {},
    "sendPicsInfo": {
        "picList": []
    },
    "toUser": "gh_test"
}
```

> 收到消息回复: 根据消息类型不同,定义不同的处理逻辑,返回图片必须来源于素材库`mediaId`!

![](https://files.mdnice.com/user/71390/f6bef832-71c1-4418-8219-0615471e4a03.png)

**关注/取消关注事件**

实际上,当新用户关注了公众号也会收到消息,取消关注也是同样的道理!

![](https://files.mdnice.com/user/71390/c82df246-7389-455e-81b3-e548199f1a5d.png)

> 遗憾的是,取消关注无法发送消息给用户,最后的留言不带走一丝遗憾.

![](https://files.mdnice.com/user/71390/44d9bc8e-5303-481a-843e-a9f7e1430a9d.png)

**更多参考**

[接收普通消息](https://developers.weixin.qq.com/doc/offiaccount/Message_Management/Receiving_standard_messages.html "接收普通消息")

```bash
文本消息
图片消息
语音消息
视频消息
小视频消息
地理位置消息
链接消息
```

[接收事件推送](https://developers.weixin.qq.com/doc/offiaccount/Message_Management/Receiving_event_pushes.html "接收事件推送")

```bash
关注/取消关注事件
扫描带参数二维码事件
上报地理位置事件
自定义菜单事件
```

[被动回复用户消息](https://developers.weixin.qq.com/doc/offiaccount/Message_Management/Passive_user_reply_message.html "被动回复用户消息")

```bash
回复文本消息
回复图片消息
回复语音消息
回复视频消息
回复音乐消息
回复图文消息
```

**自定义菜单**

> 推荐参考 [自定义菜单](https://developers.weixin.qq.com/doc/offiaccount/Custom_Menus/Creating_Custom-Defined_Menu.html "自定义菜单")
>
> 可选参考 [个性化菜单接口](https://developers.weixin.qq.com/doc/offiaccount/Custom_Menus/Personalized_menu_interface.html "个性化菜单接口")

![](https://files.mdnice.com/user/71390/9edded60-d3b8-4a4f-a02e-370021361f23.png)

根据官方文档指引,创建自定义菜单是配置模式的,菜单有多种类型可供选择.

![](https://files.mdnice.com/user/71390/c0f6e149-d59b-4bca-ad4e-c6d3b00809f4.png)

其中`click`和`view`的请求示例:

```bash
{
    "button": [
        {
            "type": "click",
            "name": "今日歌曲",
            "key": "V1001_TODAY_MUSIC"
        },
        {
            "name": "菜单",
            "sub_button": [
                {
                    "type": "view",
                    "name": "搜索",
                    "url": "http://www.soso.com/"
                },
                {
                    "type": "miniprogram",
                    "name": "wxa",
                    "url": "http://mp.weixin.qq.com",
                    "appid": "wx286b93c14bbf93aa",
                    "pagepath": "pages/lunar/index"
                },
                {
                    "type": "click",
                    "name": "赞一下我们",
                    "key": "V1001_GOOD"
                }
            ]
        }
    ]
}
```

关键代码:

```java
@Test
public void testCreateMenu() throws WxErrorException {
    String menuJson = "{\"button\":[{\"type\":\"click\",\"name\":\"今日歌曲\",\"key\":\"V1001_TODAY_MUSIC\"},{\"name\":\"菜单\",\"sub_button\":[{\"type\":\"view\",\"name\":\"搜索\",\"url\":\"http://www.soso.com/\"},{\"type\":\"miniprogram\",\"name\":\"wxa\",\"url\":\"http://mp.weixin.qq.com\",\"appid\":\"wx286b93c14bbf93aa\",\"pagepath\":\"pages/lunar/index\"},{\"type\":\"click\",\"name\":\"赞一下我们\",\"key\":\"V1001_GOOD\"}]}]}";
    wxMpService.getMenuService().menuCreate(menuJson);
}
```

然而,看到了这条错误消息,懵逼了!

```
【错误信息】：错误代码：48001, 错误信息：api 功能未授权，请确认公众号已获得该接口，可以在公众平台官网 - 开发者中心页中查看接口权限，微信原始报文：{"errcode":48001,"errmsg":"api unauthorized rid: 66b225ed-4bdd1a42-115feb8d"}
```

按照提示,再次确认了**自定义菜单**的权限竟然没有获得?!

![](https://files.mdnice.com/user/71390/55248700-052f-47bf-be77-e6c8585e0c1f.png)

个人订阅号还要微信认证才能获取,然而**个人订阅号根本就无法微信认证!**

![](https://files.mdnice.com/user/71390/2c164a66-f35b-48b7-9628-afcffd788caf.png)

很完美的闭环了,搞来搞去还搞丢了**自定义菜单**,只能实现**自动回复**.

![](https://files.mdnice.com/user/71390/f7d15b84-1ac6-48d1-bb61-1aaf0a461daa.png)

由于没有**自定义菜单**的权限,`Game Over` 到此结束,等待后续更新...

## 回到原点

> 你要允许遗憾发生,允许一切意想不到的事情突然打破所有的努力!

![](https://files.mdnice.com/user/71390/17418991-42c5-4dc3-aca6-6b88b908144a.png)

暂时决定先恢复原样,在获取到自定义菜单前不轻易放弃,毕竟更加看重
的是取关用户!

先停用服务器配置,然后再重新启用自动回复和自定义菜单.

### 停用服务器配置

![](https://files.mdnice.com/user/71390/9b3fa5bb-c14b-497a-a5ad-50b541d15411.png)

### 启用自动回复

![](https://files.mdnice.com/user/71390/a4ce5bab-a98a-4104-a154-3a9a8d6d2e74.png)

庆幸的是,原先后台设置的自动回复规则并没有被删除,重新启用即可!

![](https://files.mdnice.com/user/71390/891b2944-3ed5-468f-a1cd-cced562374ad.png)

### 启用自定义菜单

![](https://files.mdnice.com/user/71390/a6185d63-ea3d-4c65-955c-c19c81c5c8b9.png)

开启自定义菜单,也是会恢复原来设置过的自定义菜单.

![](https://files.mdnice.com/user/71390/1f5b5078-ec7e-4dd8-8f32-57bf8ac54df8.png)

顺利一切恢复原样,仿佛什么都没有发生过,只有服务器配置是否启用还证明曾经来过!

## 总结

公众号开发需要慎重考虑,普通个人订阅号后台功能已经足够使用了,自动回复和自定义菜单看起来不起眼的功能,没想到真正开发起来还涉及到账号权限问题.

**从入门微信公众号开发到放弃**

我想你或多或少也会经历这些步骤:

1. 考虑是否需要开发公众号以及准备好开发必备的公网环境;

2. 熟悉公众号开发入门指引文档,有哪些接口能力以及对应的限制等;

3. 接收普通消息和消息推送事件;

4. 回复消息,不同类型账号有不同的权限;

5. 具体的坑只有自己踩过才知道,毕竟不同的项目环境不同的配置.

**关于开发微信公众号要知道的几件事**

1. 第一步的配置服务器 URL 和后续接收消息的接口 URL 是相同路径

> 不同的是,验证消息是否来自微信服务器的返回值是**文本**,被动回复公众号消息是**xml**.

2. 自动回复消息和自定义菜单会全部失效,需要利用接口能力重新配置.

> 但是`自定义菜单`需要**微信认证**才能有权调用相关接口,否则你将收获如下错误:

```
【错误信息】：错误代码：48001, 错误信息：api 功能未授权，请确认公众号已获得该接口，可以在公众平台官网 - 开发者中心页中查看接口权限，微信原始报文：{"errcode":48001,"errmsg":"api unauthorized rid: 66b225ed-4bdd1a42-115feb8d"}
```

3. 接收到消息类型以及消息事件大概分为以下几类:

```
文本消息
图片消息
语音消息
视频消息
小视频消息
地理位置消息
链接消息

关注/取消关注事件
扫描带参数二维码事件
上报地理位置事件
自定义菜单事件
```

4. 接收到消息大多数类型是可以回复的,但要在`5`秒内迅速响应,否则微信会重发三次,直到出现**公众号服务故障,不可用**

```
回复文本消息
回复图片消息
回复语音消息
回复视频消息
回复音乐消息
回复图文消息
```

5. 个人不能微信认证,但是可以个人兴趣认证

> 申请个人兴趣认证有哪些特殊权限?是免费还是付费?能否解锁**自定义菜单**权限?

尚未可知,已申请,待后续更新...

> [个人兴趣认证描述示例](https://kf.qq.com/faq/220422FBf6vu220422ruMFb2.html "个人兴趣认证描述示例")

![](https://files.mdnice.com/user/71390/6dc6dc70-1466-484b-a045-cd2636e6f730.png)

嘿，小伙伴们，你们知道吗？这字儿可不是白码的，每一颗键帽下的汗水都能浇出一朵花来！所以，要是看得开心，就请大方地撒点阳光——**评论点赞转发**走一波，让我这花园更加灿烂！

![](https://files.mdnice.com/user/71390/44ab1fd4-0495-4a66-9259-f83e57dc0e76.png)

## 往期精彩文章

- [解锁Nginx日志的宝藏：GoAccess——你的实时、交互式Web日志分析神器！](https://mp.weixin.qq.com/s/CcbhNsdorentS9jHTwAOMQ)
- [GoAccess中配置geoip支持ip地理位置](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484416&idx=1&sn=769d951e80b61b6d9de4d543dfab0a96&chksm=fd1f2dcaca68a4dcc06c741978d3555ad4c2d2cce58cecbdbdfdc0e1278be084c592b1aa7dfd&payreadticket=HArebnqO4mbeqKrubRMmUIqSqlwjekBCPRKSH5bmrwrxcP3pDPPAoUg2kxZjPVpDUIlyjFo#rd)
- [GoAccess中配置websocket支持实时日志](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484441&idx=1&sn=12996994a835aba76076d0b749ef9aaf&chksm=fd1f2dd3ca68a4c5417ff3b2d02cedf1f6f721db1616f2f8824b9824c000a28226901888f6b5&token=1667898534&lang=zh_CN#rd)
- [谁家爬虫这么明目张胆?连UserAgent都不要了!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484695&idx=1&sn=91c6afb16c400ac5c23d7e13b4d4971f&chksm=fd1f2cddca68a5cbdecd9e383efd87461af8f8d00e9495a33063ade73f72eceb207cdc93615f&token=1289104885&lang=zh_CN#rd)
- [GoAccess自定义每日独立访客面板时间格式：利用html-custom-js实现日期显示调整](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484696&idx=1&sn=06bb0691a84c3ab3e3a942f1bf05128f&chksm=fd1f2cd2ca68a5c4e0566ce60a92c6d75622e222cf38dd19a3fcb94208ec1ced68731efa072e&token=1289104885&lang=zh_CN#rd)
- [GoAccess实战秘籍：从新手到高手，跨越那些“坑”与“惑”！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247484472&idx=1&sn=ff44b15ef5e8ac75e6f17837f23d8321&chksm=fd1f2df2ca68a4e4f0b2e1d1c18c0bde441f908476a11823fbb656697747f65ddf5c7ae15da7&token=1289104885&lang=zh_CN#rd)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](https://files.mdnice.com/user/71390/2f6cef19-53af-4934-aa53-1e91924b3364.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`