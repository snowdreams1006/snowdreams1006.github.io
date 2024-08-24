# 两处改动升级到多公众号

> 教你如何使用springboot开发微信公众号之两处改动轻松升级到多公众号

![微信公众号「雪之梦技术驿站」](/assets/picgo/de68dbb1ee06fe6cf066645411cb5579.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！  

## 引言

如果你正在开发微信公众号,那么这个项目一定不能错过: [WxJava - 微信开发 Java SDK](https://github.com/Wechat-Group/WxJava)

![](/assets/picgo/5e6d1da0337f47e072e34030829d9993.png)

真的可以少走很多弯路,之前使用`wx-java-mp-spring-boot-starter`快速集成了单个微信公众号,想来只能部署一个公众号太过单一需求,本想着如何研究一下多公众号部署教程,没想到人家自己就提供了`wx-java-mp-multi-spring-boot-starter`.

话不多说,直接上核心代码,相信有点基础的开发者都能看得懂,不啰嗦,上干货!

> 如果还没有开发过微信公众号,建议先从这篇系列文章开始,结尾也提供了相关文章链接.
>
> [这么小而美的取关功能为什么无法实现呢?为了它,我决定入坑开发微信公众号!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485083&idx=1&sn=edeb79ba4dfe1d838e48bd1f1efd034a&chksm=fd1f2f51ca68a647fc8dcea35f6973dd36bcc0d50687a6dd2aa5761700e281dcf5c007f0d49e&token=156946282&lang=zh_CN#rd)

## 单账号公众号如何集成到springboot项目

> 以下是最精简的核心代码,如果想要了解更详细配置可参考官方文档: [wx-java-mp-spring-boot-starter](https://github.com/Wechat-Group/WxJava/tree/develop/spring-boot-starters/wx-java-mp-spring-boot-starter)

最终实现效果如下:

> 支持自动回复消息,不仅包括关键词回复,收到消息回复以及被关注回复等常规消息,还能接收到用户取消订阅等特殊事件的消息推送.

![](/assets/picgo/749b6932d4d7c659ecd1b9f5992236a5.png)

- `pom.xml`依赖文件

> 当前最新版本`4.6.0`,点击这里查询最新版[https://developer.aliyun.com/mvn/search}(https://developer.aliyun.com/mvn/search)

![](/assets/picgo/04dcf23ffdc1c2236b96592691921981.png)

```xml
<dependency>
    <groupId>com.github.binarywang</groupId>
    <artifactId>wx-java-mp-spring-boot-starter</artifactId>
    <version>4.6.3.B</version>
    <type>pom</type>
</dependency>
```

- `application.yml`配置文件

```yaml
# 雪之梦技术驿站
wx:
  mp:
    # 单公众号配置(必填)
    app-id: yourappid
    secret: yoursecret
    token: yourtoken
    aes-key: youraeskey
```

- `WxMpController.java`接口请求

这是java后台服务自动和微信公众号服务器后台交互的唯一途径,通过暴露出公共接口开放给微信公众号服务器,来完成消息的验证以及自动回复等相关接口调用.

![](/assets/picgo/268812a42cb4a37282f5d0699259166c.png)

**验证消息来自微信服务器**

> 验证签名无误后原封不动返回随机字符串`echostr`文本格式

```java
@AnonymousGetMapping(produces = "text/plain;charset=utf-8")
public String checkSignature(@PathVariable String appId,
                             @RequestParam(name = "signature", required = false) String signature,
                             @RequestParam(name = "timestamp", required = false) String timestamp,
                             @RequestParam(name = "nonce", required = false) String nonce,
                             @RequestParam(name = "echostr", required = false) String echostr) {
    // 校验签名
    log.info("签名校验 ===》 微信加密签名: {} 时间戳: {} 随机数: {} 随机字符串: {}",signature,timestamp,nonce,echostr);
    if (StringUtils.isAnyBlank(signature, timestamp, nonce, echostr)) {
        throw new IllegalArgumentException("非法请求,可能属于伪造的请求!");
    }
    if (!wxMpService.switchover(appId)) {
        throw new IllegalArgumentException(String.format("未找到对应appId=[%s]的配置,请核实！", appId));
    }
    if (!wxMpService.checkSignature(timestamp, nonce, signature)) {
        log.error("签名校验 ===》 非法请求");
        throw new IllegalArgumentException("非法请求,可能属于伪造的请求!");
    }
    log.info("签名校验 ===》 验证成功");
    return echostr;
}
```

**接收并自动回复微信公众号消息**

![](/assets/picgo/2704a790b8ae1e0f639d266550ee2a9f.png)

> 支持明文和密文两种加密方式,测试时建议明文不需要加密解密,正式上线时请改为密文方式,同时要支持加解密等协议规范.

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

通过上述的简单配置即可实现验证微信公众号消息以及接收消息时的被动回复,更多高级功能需要开通相关权限,实测下来能用的权限主要就是消息回复和永久素材两大板块,其余权限只能望洋兴叹!

![](/assets/picgo/acb8a8da5766712d24c3b1a8b75cb1e8.png)

## 升级到多账号原来竟如此简单

只需要更换多公众号以来,动态获取当前公众号即可轻松实现单账号到多账号的升级迁移工作,竟然如此简单!

> 详细配置可参考官方文档: [wx-java-mp-multi-spring-boot-starter](https://github.com/Wechat-Group/WxJava/tree/develop/spring-boot-starters/wx-java-mp-multi-spring-boot-starter)

![](/assets/picgo/f07eb7d3a48c301f74e7a888d85f2830.png)

如果是从单账号升级到多账号,只需要两处更改.

- 变更maven依赖`wx-java-mp-multi-spring-boot-starter`
- 变更WxMpController注入类`private final WxMpMultiServices wxMpMultiServices`

![](/assets/picgo/0c951058bf66265d105e4f1dc7099a4f.png)

如果是直接集成多公众号,请忽略上述内容,直接按照下面的教程整合到已有的springboot项目即可.

- `pom.xml`依赖文件

![](/assets/picgo/eb053250934f2a454e0b9f74ee54b186.png)

```xml
<dependency>
    <groupId>com.github.binarywang</groupId>
    <artifactId>wx-java-mp-multi-spring-boot-starter</artifactId>
    <version>4.6.3.B</version>
</dependency>
```

- `application.yml`配置文件

![](/assets/picgo/24a5696db9c9ff2385bce452d1edf35e.png)

> 多账号配置时这里使用了一个小技巧,通过请求路径区分具体的公众号,即应用的id就是`app-id`.

![](/assets/picgo/658070540d1b3f0525cab7bc1942045e.png)

- `WxMpController.java`接口请求

**验证消息来自微信服务器**

> 验证签名无误后原封不动返回随机字符串`echostr`文本格式

```java
@AnonymousGetMapping(produces = "text/plain;charset=utf-8")
public String checkSignature(@PathVariable String appId,
                             @RequestParam(name = "signature", required = false) String signature,
                             @RequestParam(name = "timestamp", required = false) String timestamp,
                             @RequestParam(name = "nonce", required = false) String nonce,
                             @RequestParam(name = "echostr", required = false) String echostr) {
     // 获取当前公众号服务类
    WxMpService wxMpService = wxMpMultiServices.getWxMpService(appId);        
    // 校验签名
    log.info("签名校验 ===》 微信加密签名: {} 时间戳: {} 随机数: {} 随机字符串: {}",signature,timestamp,nonce,echostr);
    if (StringUtils.isAnyBlank(signature, timestamp, nonce, echostr)) {
        throw new IllegalArgumentException("非法请求,可能属于伪造的请求!");
    }
    if (!wxMpService.switchover(appId)) {
        throw new IllegalArgumentException(String.format("未找到对应appId=[%s]的配置,请核实！", appId));
    }
    if (!wxMpService.checkSignature(timestamp, nonce, signature)) {
        log.error("签名校验 ===》 非法请求");
        throw new IllegalArgumentException("非法请求,可能属于伪造的请求!");
    }
    log.info("签名校验 ===》 验证成功");
    return echostr;
}
```

> 相对比单公众号不能直接注入相关的service,需要根据公众号id动态获取`WxMpService`实现类.

**接收并自动回复微信公众号消息**

> 支持明文和密文两种加密方式

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
     // 获取当前公众号服务类
    WxMpService wxMpService = wxMpMultiServices.getWxMpService(appId);
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

两个公众号的微信公众号后台完全按照统一的开发配置服务器url,java后台根据不同的`appid`识别到具体公众号,轻松实现统一管理.

![](/assets/picgo/6c55c7690624555eaccfcc1a5ae74a34.png)

通过聊天回复能力也可以看到现在的回复能力是统一的,如何实现差异化设置?

```java
// 应用 1 的 WxMpService
WxMpService wxMpService1 = wxMpMultiServices.getWxMpService("tenantId1");
WxMpUserService userService1 = wxMpService1.getUserService();
userService1.userInfo("xxx");
// todo ...

// 应用 2 的 WxMpService
WxMpService wxMpService2 = wxMpMultiServices.getWxMpService("tenantId2");
WxMpUserService userService2 = wxMpService2.getUserService();
userService2.userInfo("xxx");
```

> 我们的配置文件`tenantId1`就是`appid1`,`tenantId2`就是`appid2`,直接区分出公众号.

可以看到具体的消息对象包含了发送消息来源以及公众号id `gh_XXXXXX`,也是可以区分出公众号.

![](/assets/picgo/5ec172a98dbbec76fcd9bb044d0c07fe.png)

```json
{
    "allFieldsMap": {
        "Content": "你是谁？",
        "CreateTime": "1724281534",
        "ToUserName": "gh_XXXXXX",
        "FromUserName": "XXXXXX_kM",
        "MsgType": "text",
        "MsgId": "24685777429644709"
    },
    "articleUrlResult": {},
    "content": "你是谁？",
    "createTime": 1724281534,
    "fromUser": "XXXXXX_kM",
    "hardWare": {},
    "msgId": 24685777429644709,
    "msgType": "text",
    "scanCodeInfo": {},
    "sendLocationInfo": {},
    "sendPicsInfo": {
        "picList": []
    },
    "toUser": "gh_XXXXXX"
}
```

**引入ai智障回复**

保持微信公众号后台自动回复相同的逻辑,当收到消息时开启ai智能回复.

![](/assets/picgo/a353823df17bbaa45944aca0acc87f01.png)

编程时需要考虑**关键词回复和收到消息回复**不能有冲突,关键词回复直接返回消息,其余的消息则默认启用自动回复.

![](/assets/picgo/c27398fcb70842c908d6fd88be7dfc68.png)

> 想要体验ai智障回复的用户直接搜索: `雪之梦技术驿站`或者`情感美食` 均已实现相同回复.

![](/assets/picgo/33e4b08a5627c640882495f1267f9318.jpg)

## 总结

本文主要介绍了`SpringBoot`开发微信公众号的正确姿势,通过优秀项目`WxJava`实现快速整合到已有项目.

![](/assets/picgo/bd2725991b2b240334e918c6b916a38a.png)

> 优秀的项目不单单支持微信公众号,还支持超级多的微信全家桶.

- 微信小程序：weixin-java-miniapp
- 微信支付：weixin-java-pay
- 微信开放平台：weixin-java-open
- 公众号（包括订阅号和服务号）：weixin-java-mp
- 企业号/企业微信：weixin-java-cp

原来是单个微信公众号,升级到多公众号设置也可以如此简单,更换`maven`依赖,通过`WxMpMultiServices`实现类动态获取原来单一微信公众号服务类`WxMpService`,其余代码均可保持不变.

```java
// 获取当前公众号服务类
WxMpService wxMpService = wxMpMultiServices.getWxMpService(appId);
```

最后,欢迎关注公众号`情感美食`每日分享一道家常菜,来一起分享深夜emo小故事.

![](/assets/picgo/e631ce52dcb48a9fa39a44abde983d24.png)

## 公众号开发系列文章

- [这么小而美的取关功能为什么无法实现呢?为了它,我决定入坑开发微信公众号!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485083&idx=1&sn=edeb79ba4dfe1d838e48bd1f1efd034a&chksm=fd1f2f51ca68a647fc8dcea35f6973dd36bcc0d50687a6dd2aa5761700e281dcf5c007f0d49e&token=156946282&lang=zh_CN#rd)
- [微信公众号开发原来如此简单,这么多高级权限应有尽有!](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485114&idx=1&sn=0eb97f345505bb868e0c2b29c50ba577&chksm=fd1f2f70ca68a666e7e0ed08c7662b36d77617eb02d43f6014fffe0dadb1f7cd941984df3cb5&token=156946282&lang=zh_CN#rd)
- [解锁微信公众号新技能！一键上传图片秒获URL，永久素材管理全攻略，让内容创作如虎添翼！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485250&idx=1&sn=4d8618568b3cf3a5420d3c7f5225c36b&chksm=fd1f2e88ca68a79eb73aa616059ea465db9770de5bac880c9a2473d0e614467b8919680fbdfd&token=156946282&lang=zh_CN#rd)
- [【硬核防白嫖秘籍】一键取关？直接拉黑，让你的公众号再无回头白嫖党！](https://mp.weixin.qq.com/s?__biz=MzU3NTc1MDMwOQ==&mid=2247485193&idx=1&sn=d873ab35b0e987dd868e1685d89dc547&chksm=fd1f2ec3ca68a7d54faed25b3830545c86351802991170a9d8bd86bfe85f305beaf5b2843632&token=156946282&lang=zh_CN#rd)

## 黑夜里和自己的对话

- [<黑神话：悟空>：国产游戏的震撼崛起](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484315&idx=1&sn=0fc6607bf9ff6388a8a4f636d5474e84&chksm=c2150278f5628b6e7f959f5018274ed6b6d924da8b69980228183158f3a08756ba010f5049b9&token=658409695&lang=zh_CN#rd)
- [恋爱年龄差背后的秘密](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484177&idx=1&sn=bb9e916c34bfaa9c4559a556df295d48&chksm=c21502f2f5628be4149cf91a652d500b23b1c1da2279fd6a09990c1967c0f8a52d3a5995bb5c&token=658409695&lang=zh_CN#rd)
- [每天一道美味佳肴《糖醋排骨》](https://mp.weixin.qq.com/s?__biz=MzkyODczMzMyNA==&mid=2247484315&idx=2&sn=dc77fadf4cd5dd3a22bf055b3fee300f&chksm=c2150278f5628b6eb64dd78ebef9d0dda668bdef2a5d73214a1f622235a00212dbcae7058092&token=658409695&lang=zh_CN#rd)

![](/assets/picgo/33e4b08a5627c640882495f1267f9318.jpg)

## 欢迎扫码关注

![微信公众号「雪之梦技术驿站」](/assets/picgo/5a1e568689707dad2aa213fa712046b0.jpg)

> `欢迎扫码关注,私信回复『加群』一起交流技术`