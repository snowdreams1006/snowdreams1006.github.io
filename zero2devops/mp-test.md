# 微信公众号开发原来如此简单呐!

![微信公众号「雪之梦技术驿站」](https://files.mdnice.com/user/71390/cdf074dc-564e-4016-aaa5-4517826bf9c2.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！  

> 偷偷溜进文章的小**广告**，别害羞，点进去瞅瞅，说不定能发现什么宝藏呢！
>
> 文末那个也别错过，说不定是通往秘密花园的钥匙哦！

## 引言

前一阵子突然想到小而美的取关需求,决定了开发微信公众号,但是结果却卡在了**自定义菜单**权限上,于是乎有种鸡肋的感觉.

![](https://files.mdnice.com/user/71390/18ed7f6b-bb42-456d-aa49-bce80c1bfb42.png)

最后,抱着一丝丝侥幸的心理申请了个人兴趣认证,万一不一定非得是**微信认证**呢?

> [个人兴趣认证描述示例](https://kf.qq.com/faq/220422FBf6vu220422ruMFb2.html)

![](https://files.mdnice.com/user/71390/6dc6dc70-1466-484b-a045-cd2636e6f730.png)

在等待的日子里,那就继续研究一下微信公众号开发的**自定义菜单**吧!

## 快速上手

俗话说: "磨刀不误砍柴工",先找打趁手的工具,往往能达到事半功倍的效果!

![](https://files.mdnice.com/user/71390/36e7f3d0-b793-4199-9b8a-bbfedd5e4705.png)

如果是`Java`开发微信公众号,这里强烈推荐[WxJava](https://github.com/Wechat-Group/WxJava)项目,真的很省心!

> WxJava - 微信开发 Java SDK
码云Gitee Github GitHub release Maven Central Build Status 使用IntelliJ IDEA开发维护 License
>
> 微信Java开发工具包，支持包括微信支付、开放平台、公众号、企业微信、视频号、小程序等微信功能模块的后端开发。

![](https://files.mdnice.com/user/71390/ba51895d-520b-4141-9c63-f190efe88884.png)

## 公众平台测试账号

打开微信公众号后台,在`设置与开发 --> 开发者工具` 里面有个**公众平台测试账号**栏目,进入申请测试公众号,这里的权限真的大!

> 无需申请公众账号、可在测试账号中体验并测试微信公众平台所有高级接口。

![](https://files.mdnice.com/user/71390/885427c6-c6e1-4c54-bfa1-9f46d850c5f4.png)

微信扫一扫进入`公众平台测试平台`

![](https://files.mdnice.com/user/71390/3b93ae65-20eb-480f-a73c-0408759930c5.png)

填写`接口配置信息`

![](https://files.mdnice.com/user/71390/9ce5a97c-fe25-4320-b2cf-bbbb5c8aeaca.png)

测试账号的权限真的是应有尽有,是个学习技术的好地方!

![](https://files.mdnice.com/user/71390/86715981-9a1b-409a-8a30-f1d79da41e73.png)

### 自动回复

自动回复的权限默认已获得,上次内容也已经详细解释了有关内容,这里不再赘述.

```
关键词回复
收到消息回复
被关注回复
```

![](https://files.mdnice.com/user/71390/97bc1255-56cc-4390-98a9-d9c01aa33ed0.png)

值得强调的是,粉丝可以在和公众号的对话里,发送各种各样的消息,包括文字,图片,视频,定位等等.

![](https://files.mdnice.com/user/71390/157ef210-39f1-4f42-92be-3f94f853c308.png)

然而,实际开发过程中大可不必对全部类型的消息进行处理,只需要关注想要关注的消息即可.

> [接收普通消息](https://developers.weixin.qq.com/doc/offiaccount/Message_Management/Receiving_standard_messages.html)

**文本消息**

```xml
<xml>
  <ToUserName><![CDATA[toUser]]></ToUserName>
  <FromUserName><![CDATA[fromUser]]></FromUserName>
  <CreateTime>1348831860</CreateTime>
  <MsgType><![CDATA[text]]></MsgType>
  <Content><![CDATA[this is a test]]></Content>
  <MsgId>1234567890123456</MsgId>
  <MsgDataId>xxxx</MsgDataId>
  <Idx>xxxx</Idx>
</xml>
```

**图片消息**

```xml
<xml>
  <ToUserName><![CDATA[toUser]]></ToUserName>
  <FromUserName><![CDATA[fromUser]]></FromUserName>
  <CreateTime>1348831860</CreateTime>
  <MsgType><![CDATA[image]]></MsgType>
  <PicUrl><![CDATA[this is a url]]></PicUrl>
  <MediaId><![CDATA[media_id]]></MediaId>
  <MsgId>1234567890123456</MsgId>
   <MsgDataId>xxxx</MsgDataId>
  <Idx>xxxx</Idx>
</xml>
```

**语音消息**

```xml
<xml>
  <ToUserName><![CDATA[toUser]]></ToUserName>
  <FromUserName><![CDATA[fromUser]]></FromUserName>
  <CreateTime>1357290913</CreateTime>
  <MsgType><![CDATA[voice]]></MsgType>
  <MediaId><![CDATA[media_id]]></MediaId>
  <Format><![CDATA[Format]]></Format>
  <MsgId>1234567890123456</MsgId>
  <MsgDataId>xxxx</MsgDataId>
  <Idx>xxxx</Idx>
  <MediaId16K><![CDATA[media_id_16k]]></MediaId16K>
</xml>
```

**视频消息**

```xml
<xml>
  <ToUserName><![CDATA[toUser]]></ToUserName>
  <FromUserName><![CDATA[fromUser]]></FromUserName>
  <CreateTime>1357290913</CreateTime>
  <MsgType><![CDATA[video]]></MsgType>
  <MediaId><![CDATA[media_id]]></MediaId>
  <ThumbMediaId><![CDATA[thumb_media_id]]></ThumbMediaId>
  <MsgId>1234567890123456</MsgId>
   <MsgDataId>xxxx</MsgDataId>
  <Idx>xxxx</Idx>
</xml>
```

**小视频消息**

```xml
<xml>
  <ToUserName><![CDATA[toUser]]></ToUserName>
  <FromUserName><![CDATA[fromUser]]></FromUserName>
  <CreateTime>1357290913</CreateTime>
  <MsgType><![CDATA[shortvideo]]></MsgType>
  <MediaId><![CDATA[media_id]]></MediaId>
  <ThumbMediaId><![CDATA[thumb_media_id]]></ThumbMediaId>
  <MsgId>1234567890123456</MsgId>
   <MsgDataId>xxxx</MsgDataId>
  <Idx>xxxx</Idx>
</xml>
```

**地理位置消息**

```xml
<xml>
  <ToUserName><![CDATA[toUser]]></ToUserName>
  <FromUserName><![CDATA[fromUser]]></FromUserName>
  <CreateTime>1351776360</CreateTime>
  <MsgType><![CDATA[location]]></MsgType>
  <Location_X>23.134521</Location_X>
  <Location_Y>113.358803</Location_Y>
  <Scale>20</Scale>
  <Label><![CDATA[位置信息]]></Label>
  <MsgId>1234567890123456</MsgId>
   <MsgDataId>xxxx</MsgDataId>
  <Idx>xxxx</Idx>
</xml>
```

**链接消息**

```xml
<xml>
  <ToUserName><![CDATA[toUser]]></ToUserName>
  <FromUserName><![CDATA[fromUser]]></FromUserName>
  <CreateTime>1351776360</CreateTime>
  <MsgType><![CDATA[link]]></MsgType>
  <Title><![CDATA[公众平台官网链接]]></Title>
  <Description><![CDATA[公众平台官网链接]]></Description>
  <Url><![CDATA[url]]></Url>
  <MsgId>1234567890123456</MsgId>
   <MsgDataId>xxxx</MsgDataId>
  <Idx>xxxx</Idx>
</xml>
```

> 以上消息既可以来自粉丝发送给微信公众号的对话,也可以来自微信公众号发布图文推送文章等.

### 自定义菜单

> [自定义菜单](https://developers.weixin.qq.com/doc/offiaccount/Custom_Menus/Creating_Custom-Defined_Menu.html)

自定义菜单能够帮助公众号丰富界面，让用户更好更快地理解公众号的功能。开启自定义菜单后，公众号界面如图所示：

![](https://files.mdnice.com/user/71390/4690b13a-cff7-419b-86e7-a2a8027849b4.png)

> 1. 自定义菜单最多包括3个一级菜单，每个一级菜单最多包含5个二级菜单。
> 
> 2. 一级菜单最多4个汉字，二级菜单最多8个汉字，多出来的部分将会以“...”代替。
> 
> 3. 创建自定义菜单后，菜单的刷新策略是，在用户进入公众号会话页或公众号profile页时，如果发现上一次拉取菜单的请求在5分钟以前，就会拉取一下菜单，如果菜单有更新，就会刷新客户端的菜单。测试时可以以尝试取消关注公众账号后再次关注，则可以看到创建后的效果。

![](https://files.mdnice.com/user/71390/15bd3db1-c632-43e7-b079-3b3e66f697cd.png)

**click和view的请求示例**

按照官方文档配置`click`点击按钮和`view`跳转链接,示例如下:

```json
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

恭喜你,踩坑成功,因为配置的第二个子菜单`miniprogram`没有权限.

```
【错误信息】：错误代码：45064, 错误信息：no permission to use weapp in menu rid: 66b18514-565169e1-5b36d3f2，微信原始报文：{"errcode":45064,"errmsg":"no permission to use weapp in menu rid: 66b18514-565169e1-5b36d3f2"}
```

**修改后的测试示例**

所以,去掉第二个子菜单,重新配置即可.

> `click`：点击推事件用户点击`click`类型按钮后，微信服务器会通过消息接口推送消息类型为`event`的结构给开发者（参考消息接口指南），并且带上按钮中开发者填写的key值，开发者可以通过自定义的key值与用户进行交互；
> 
> `view`：跳转URL用户点击`view`类型按钮后，微信客户端将会打开开发者在按钮中填写的网页`URL`，可与网页授权获取用户基本信息接口结合，获得用户基本信息。

```json
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
                    "type": "click",
                    "name": "赞一下我们",
                    "key": "V1001_GOOD"
                }
            ]
        }
    ]
}
```

![](https://files.mdnice.com/user/71390/9af695e4-6688-4dd7-8d22-94f3f7cdc1e4.png)

> 不知道你有没有注意到,`view`跳转菜单是支持外链跳转的,这一点比微信公众号后台要强!

**click和view的消息推送**

> [接收事件推送](https://developers.weixin.qq.com/doc/offiaccount/Message_Management/Receiving_event_pushes.html#%E8%87%AA%E5%AE%9A%E4%B9%89%E8%8F%9C%E5%8D%95%E4%BA%8B%E4%BB%B6)

- 点击菜单`click`消息时的事件推送,XML数据包示例：

```xml
<xml>
  <ToUserName><![CDATA[toUser]]></ToUserName>
  <FromUserName><![CDATA[FromUser]]></FromUserName>
  <CreateTime>123456789</CreateTime>
  <MsgType><![CDATA[event]]></MsgType>
  <Event><![CDATA[CLICK]]></Event>
  <EventKey><![CDATA[EVENTKEY]]></EventKey>
</xml>
```

- 点击菜单`view`跳转链接时的事件推送,XML数据包示例：

```xml
<xml>
  <ToUserName><![CDATA[toUser]]></ToUserName>
  <FromUserName><![CDATA[FromUser]]></FromUserName>
  <CreateTime>123456789</CreateTime>
  <MsgType><![CDATA[event]]></MsgType>
  <Event><![CDATA[VIEW]]></Event>
  <EventKey><![CDATA[www.qq.com]]></EventKey>
</xml>
```

**其他新增按钮类型的请求示例**

```json
{
    "button": [
        {
            "name": "扫码",
            "sub_button": [
                {
                    "type": "scancode_waitmsg",
                    "name": "扫码带提示",
                    "key": "rselfmenu_0_0",
                    "sub_button": []
                },
                {
                    "type": "scancode_push",
                    "name": "扫码推事件",
                    "key": "rselfmenu_0_1",
                    "sub_button": []
                }
            ]
        },
        {
            "name": "发图",
            "sub_button": [
                {
                    "type": "pic_sysphoto",
                    "name": "系统拍照发图",
                    "key": "rselfmenu_1_0",
                    "sub_button": []
                },
                {
                    "type": "pic_photo_or_album",
                    "name": "拍照或者相册发图",
                    "key": "rselfmenu_1_1",
                    "sub_button": []
                },
                {
                    "type": "pic_weixin",
                    "name": "微信相册发图",
                    "key": "rselfmenu_1_2",
                    "sub_button": []
                }
            ]
        },
        {
            "name": "发送位置",
            "type": "location_select",
            "key": "rselfmenu_2_0"
        },
        {
            "type": "media_id",
            "name": "图片",
            "media_id": "MEDIA_ID1"
        },
        {
            "type": "view_limited",
            "name": "图文消息",
            "media_id": "MEDIA_ID2"
        },
        {
            "type": "article_id",
            "name": "发布后的图文消息",
            "article_id": "ARTICLE_ID1"
        },
        {
            "type": "article_view_limited",
            "name": "发布后的图文消息",
            "article_id": "ARTICLE_ID2"
        }
    ]
}
```

估计是文档过时了,示例代码都不能直接运行,不过这个报错很明显是按钮数量不合法.

```
【错误信息】：错误代码：40016, 错误信息：不合法的按钮个数，微信原始报文：{"errcode":40016,"errmsg":"invalid button size rid: 66b185d2-4ad3d18c-4281747d"}
```

**改正后的测试示例**

```json
{
    "button": [
        {
            "name": "扫码",
            "sub_button": [
                {
                    "type": "scancode_waitmsg",
                    "name": "扫码带提示",
                    "key": "rselfmenu_0_0",
                    "sub_button": []
                },
                {
                    "type": "scancode_push",
                    "name": "扫码推事件",
                    "key": "rselfmenu_0_1",
                    "sub_button": []
                }
            ]
        },
        {
            "name": "发图",
            "sub_button": [
                {
                    "type": "pic_sysphoto",
                    "name": "系统拍照发图",
                    "key": "rselfmenu_1_0",
                    "sub_button": []
                },
                {
                    "type": "pic_photo_or_album",
                    "name": "拍照或者相册发图",
                    "key": "rselfmenu_1_1",
                    "sub_button": []
                },
                {
                    "type": "pic_weixin",
                    "name": "微信相册发图",
                    "key": "rselfmenu_1_2",
                    "sub_button": []
                }
            ]
        },
        {
            "name": "发送位置",
            "type": "location_select",
            "key": "rselfmenu_2_0"
        }
    ]
}
```

![](https://files.mdnice.com/user/71390/949fe3c9-86cb-4c9a-977b-79c656e35452.png)

> `scancode_waitmsg`：扫码推事件且弹出“消息接收中”提示框用户点击按钮后，微信客户端将调起扫一扫工具，完成扫码操作后，将扫码的结果传给开发者，同时收起扫一扫工具，然后弹出“消息接收中”提示框，随后可能会收到开发者下发的消息。

```json
{
    "ScanCodeInfo": {
        "ScanType": "qrcode",
        "ScanResult": "http://weixin.qq.com/r/test"
    },
    "CreateTime": "1722913369",
    "EventKey": "rselfmenu_0_0",
    "Event": "scancode_waitmsg",
    "ToUserName": "gh_test",
    "FromUserName": "oygXc6HxeAfd4yjjm1-test",
    "MsgType": "event"
}
```

> `scancode_push`：扫码推事件用户点击按钮后，微信客户端将调起扫一扫工具，完成扫码操作后显示扫描结果（如果是URL，将进入URL），且会将扫码的结果传给开发者，开发者可以下发消息。

```json
{
    "ScanCodeInfo": {
        "ScanType": "qrcode",
        "ScanResult": "http://weixin.qq.com/r/test"
    },
    "CreateTime": "1722914371",
    "EventKey": "rselfmenu_0_1",
    "Event": "scancode_push",
    "ToUserName": "gh_test",
    "FromUserName": "oygXc6HxeAfd4yjjm1-test",
    "MsgType": "event"
}
```

> `scancode_waitmsg` 和 `scancode_push` 类型的区别有两点:
> 
> 1. `scancode_waitmsg` 扫码后会触发自动回复消息而 `scancode_push` 不会等待消息系统消息回复
>
> 2. `scancode_waitmsg`扫码结果不会自动触发,同样的二维码`scancode_push`可以直接执行扫码结果,例如跳转到另外的公众号!

> `pic_sysphoto`：弹出系统拍照发图用户点击按钮后，微信客户端将调起系统相机，完成拍照操作后，会将拍摄的相片发送给开发者，并推送事件给开发者，同时收起系统相机，随后可能会收到开发者下发的消息。

> 经测试: 没有收到消息,无反应

> `pic_photo_or_album`：弹出拍照或者相册发图用户点击按钮后，微信客户端将弹出选择器供用户选择“拍照”或者“从手机相册选择”。用户选择后即走其他两种流程。

```json
{
    "CreateTime": "1722915726",
    "EventKey": "rselfmenu_test",
    "Event": "pic_photo_or_album",
    "ToUserName": "gh_test",
    "FromUserName": "oygXc6HxeAfd4yjjm1-test",
    "MsgType": "event",
    "SendPicsInfo": {
        "Count": "1",
        "PicList": {
            "item": [
                {
                    "PicMd5Sum": [
                        "7790eb06e33cf5a4eae080cd5ae29e03"
                    ]
                }
            ]
        }
    }
}
```

> 经测试: 拍照没有收到消息,无反应.但是选择相册是可以正常接收到信息反馈.

![](https://files.mdnice.com/user/71390/ec43ceec-f9b0-46a2-8d22-31b8f919ed40.png)

> `pic_weixin`：弹出微信相册发图器用户点击按钮后，微信客户端将调起微信相册，完成选择操作后，将选择的相片发送给开发者的服务器，并推送事件给开发者，同时收起相册，随后可能会收到开发者下发的消息。

```json
{
    "CreateTime": "1722915993",
    "EventKey": "rselfmenu_test",
    "Event": "pic_weixin",
    "ToUserName": "gh_test",
    "FromUserName": "oygXc6HxeAfd4yjjm1-test",
    "MsgType": "event",
    "SendPicsInfo": {
        "Count": "1",
        "PicList": {
            "item": [
                {
                    "PicMd5Sum": [
                        "5726bb58dd3407500a7b88e61cd180ca"
                    ]
                }
            ]
        }
    }
}
```

> `location_select`：弹出地理位置选择器用户点击按钮后，微信客户端将调起地理位置选择工具，完成选择操作后，将选择的地理位置发送给开发者的服务器，同时收起位置选择工具，随后可能会收到开发者下发的消息。

![](https://files.mdnice.com/user/71390/b5ce4f53-342f-4056-bc17-406048813ab6.png)

```json
{
    "CreateTime": "1722916673",
    "EventKey": "rselfmenu_rest",
    "SendLocationInfo": {
        "Poiname": "测试",
        "Location_X": "10",
        "Location_Y": "110",
        "Label": "测试",
        "Scale": "15"
    },
    "Event": "location_select",
    "ToUserName": "gh_test",
    "FromUserName": "oygXc6HxeAfd4yjjm1-test",
    "MsgType": "event"
}
```

## 常见错误

```
【错误信息】：错误代码：45064, 错误信息：no permission to use weapp in menu rid: 66b18514-565169e1-5b36d3f2，微信原始报文：{"errcode":45064,"errmsg":"no permission to use weapp in menu rid: 66b18514-565169e1-5b36d3f2"}
```

> 测试公众号没有相关资源的权限

```
【错误信息】：错误代码：40155, 错误信息：请勿添加其他公众号的主页链接，微信原始报文：{"errcode":40155,"errmsg":"please don't contain other home page url rid: 66b18a05-60f7a4f3-6ce08531"}
```

> 测试公众号没有其他公众号的主页链接权限

```
【错误信息】：错误代码：40020, 错误信息：不合法的按钮 URL 长度，微信原始报文：{"errcode":40020,"errmsg":"invalid button url size rid: 66b18b45-12114fbc-59938cb2"}
```

> 可能是配置错误,检测`click`和`url`之类的是否搭配错误!

```
【错误信息】：错误代码：40007, 错误信息：不合法的媒体文件 id，微信原始报文：{"errcode":40007,"errmsg":"invalid media_id rid: 66b190e0-38d2f7c9-71f2c233"}
```

> 微信认证后才能有临时素材的管理权限,永久素材管理权限要求先上传再获取.

```
【错误信息】：错误代码：48001, 错误信息：api 功能未授权，请确认公众号已获得该接口，可以在公众平台官网 - 开发者中心页中查看接口权限，微信原始报文：{"errcode":48001,"errmsg":"api unauthorized rid: 66b225ed-4bdd1a42-115feb8d"}
```

> 测试公众号部分权限不足

```
【错误信息】：错误代码：40164, 错误信息：invalid ip 183.155.242.143 ipv6 ::ffff:183.155.242.143, not in whitelist rid: 66b2251b-59e5467f-4220f10e，微信原始报文：{"errcode":40164,"errmsg":"invalid ip 183.155.242.143 ipv6 ::ffff:183.155.242.143, not in whitelist rid: 66b2251b-59e5467f-4220f10e"}
```

> 测试服务器没有被添加到服务器白名单,解决方法是将外网白名单添加进去即可!

## 总结

本文主要以申请了测试公众号再测试平台上测试了**自定义菜单**功能,并详细讲解了自定义菜单的类型.

其中,最常用的是`click`点击按钮和`view`跳转链接以及其他图文素材相关菜单.

```json
{
    "button": [
        {
            "name": "点击和跳转",
            "sub_button": [
                {
                    "type": "click",
                    "name": "点我试试",
                    "key": "V1001_GOOD"
                },
                {
                    "type": "view",
                    "name": "搜索看看",
                    "url": "http://www.soso.com/"
                }
            ]
        },
        {
            "name": "图文素材",
            "sub_button": [
                {
                    "type": "media_id",
                    "name": "图片",
                    "media_id": "MEDIA_ID1"
                },
                {
                    "type": "view_limited",
                    "name": "图文消息",
                    "media_id": "MEDIA_ID2"
                },
                {
                    "type": "article_id",
                    "name": "发布后的图文消息",
                    "article_id": "ARTICLE_ID1"
                },
                {
                    "type": "article_view_limited",
                    "name": "发布后的图文消息",
                    "article_id": "ARTICLE_ID2"
                }
            ]
        }
    ]
}
```

其中图文素材类可能需要获取素材id或者是已发布的图文消息.

![](https://files.mdnice.com/user/71390/dd34bb94-7c52-4aa3-9da4-8f4ef88dc8fc.png)

在测试公众号中,很多高级权限是无限制开放的,这为测试接口能力提供了极大的方便,但实际上不可过度依赖,因为某些权限并没有!

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
