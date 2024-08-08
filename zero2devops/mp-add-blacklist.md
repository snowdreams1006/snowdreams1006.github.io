# 你敢取关我就拉黑防白嫖

![微信公众号「雪之梦技术驿站」](https://files.mdnice.com/user/71390/cdf074dc-564e-4016-aaa5-4517826bf9c2.gif)

---

**致读者**: 点击上方 “雪之梦技术驿站” → 点击右上角“ ... ”→ 点选“设为星标★ ” 加上星标，就不会找不到我啦！  

## 前言

开发公众号的初衷就是为了拉黑取关用户,拒绝白嫖,刻不容缓,如果对你造成不便,深表歉意.

![](https://files.mdnice.com/user/71390/e22bf532-e97c-4bd0-b73b-2231a5bc50af.png)

所以,接下来的工作,那就让我们一起开始愉快编程,轻松实现**取关拉黑**功能吧!

## 回顾

如果你看过之前的文章,那么相信你已经学会了如何快速上手开发微信工作号,这里只做简短的回顾.

1. 如果是个人订阅号无法进行微信认证,也没有高级接口权限,其中目前对我来说,影响最大的就是**自定义菜单**的权限.

![](https://files.mdnice.com/user/71390/bac4e595-95a7-4a2e-afb4-ef165afb4b8f.png)

> 原来的自定义菜单可以在微信公众号后台自行编辑设置,一旦开启微信公众号开发,则自动失效.

![](https://files.mdnice.com/user/71390/f3532576-5aef-4fbe-a982-28f96f8f592f.png)

> 注意: 申请的测试公众号自动获得高级权限,容易让人迷惑,真实的个人订阅号是没有**自定义菜单**权限的,实际上长这样.

2. 自动回复的接口权限是已获得状态,包括接受来自粉丝私信对话消息以及关注取消等事件消息.

![](https://files.mdnice.com/user/71390/a67e2ee5-cdff-41a3-9eb8-26587eff640b.png)

> 了解更详细的消息类型可参考: 
>
> [基础消息能力 /接收普通消息](https://developers.weixin.qq.com/doc/offiaccount/Message_Management/Receiving_standard_messages.html)
> 
> [基础消息能力 /接收事件推送](https://developers.weixin.qq.com/doc/offiaccount/Message_Management/Receiving_event_pushes.html)
> 
> [基础消息能力 /被动回复用户消息](https://developers.weixin.qq.com/doc/offiaccount/Message_Management/Passive_user_reply_message.html)

3. 如果还没有正式订阅号或者说想要测试接口权限,可以申请测试公众号自行验证随便测试.

![](https://files.mdnice.com/user/71390/34800e97-5f04-4954-86d1-ead448447a60.png)

> 一切以实际为准,时刻牢记,现实中部分权限可能无法获取,请不要过于依赖,并不是特别推荐测试公众号!

4. `Java`开发环境,推荐[Wechat-Group/WxJava](https://github.com/Wechat-Group/WxJava)项目帮助快速上手,无需关注具体实现细节,只需要关注业务逻辑即可.

![](https://files.mdnice.com/user/71390/deddc4b5-bc90-414c-8882-e0d979fb082c.png) 

5. 认真看文档,多看文档,有疑问请查阅官方文档.

有些事情没有接口权限想做也做不了,而有些需求则是根本没有相关的接口.
> [开发前必读 /入门指引](https://developers.weixin.qq.com/doc/offiaccount/Getting_Started/Getting_Started_Guide.html)

## 实现

思路分析:

```
1. 获取取关用户
  1.1 订阅取关事件中的用户id
  1.2 根据用户id获取用户详情
  1.3 推送取关用户处理详情
2. 拉黑取关用户
  2.1 调用公众号接口自动拉黑
  2.2 通知运营者手动拉黑
  2.3 自定义拉黑逻辑实现
3. 验证拉黑效果
  3.1 官方拉黑行为验证
  3.2 自定义拉黑行为验证
4. 如何解除拉黑
```

### 1. 获取取关用户

**1.1 订阅取关事件中的用户id**

根据官方文档[基础消息能力 /接收事件推送](https://developers.weixin.qq.com/doc/offiaccount/Message_Management/Receiving_event_pushes.html)我们知道取消订阅时,微信公众号会向我们自己的服务器后台推送取关事件,其中就有用户id.

> 关注/取消关注事件

用户在关注与取消关注公众号时，微信会把这个事件推送到开发者填写的URL。方便开发者给用户下发欢迎消息或者做账号的解绑。为保护用户数据隐私，开发者收到用户取消关注事件时需要删除该用户的所有信息。

**微信服务器在五秒内收不到响应会断掉连接，并且重新发起请求，总共重试三次。**

关于重试的消息排重，推荐使用FromUserName + CreateTime 排重。

**假如服务器无法保证在五秒内处理并回复，可以直接回复空串，微信服务器不会对此作任何处理，并且不会发起重试。**

推送XML数据包示例：

```xml
<xml>
  <ToUserName><![CDATA[toUser]]></ToUserName>
  <FromUserName><![CDATA[FromUser]]></FromUserName>
  <CreateTime>123456789</CreateTime>
  <MsgType><![CDATA[event]]></MsgType>
  <Event><![CDATA[subscribe]]></Event>
</xml>
```

结合实际情况,接收到的取关用户只有字段`FromUserName`发送方账号（一个OpenID）标记.

**1.2 根据用户id获取用户详情**

**用户管理**的接口权限必须通过**微信认证**

![](https://files.mdnice.com/user/71390/f522eef0-5847-43e3-b3e9-7ca442a9bec6.png)

所以,用申请的测试公众号简单看一下用户的基本信息大概是什么样子的数据吧!

> [获取用户基本信息(UnionID机制)](https://developers.weixin.qq.com/doc/offiaccount/User_Management/Get_users_basic_information_UnionID.html#UinonId)

![](https://files.mdnice.com/user/71390/47ae9a21-5cc4-49f6-a26e-63fc76a7f0e0.png)

```json
{
    "subscribe": 1, 
    "openid": "o6_bmjrPTlm6_2sgVt7hMZOPfL2M", 
    "language": "zh_CN", 
    "subscribe_time": 1382694957,
    "unionid": " o6_bmasdasdsad6_2sgVt7hMZOPfL",
    "remark": "",
    "groupid": 0,
    "tagid_list":[128,2],
    "subscribe_scene": "ADD_SCENE_QR_CODE",
    "qr_scene": 98765,
    "qr_scene_str": ""
}
```

- `subscribe` 用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息。

> 这个字段很好,能够区分用户是否仍然订阅号,可作为从用户列表中单独查询订阅状态.

- `subscribe_scene` 返回用户关注的渠道来源，ADD_SCENE_SEARCH 公众号搜索，ADD_SCENE_ACCOUNT_MIGRATION 公众号迁移，ADD_SCENE_PROFILE_CARD 名片分享，ADD_SCENE_QR_CODE 扫描二维码，ADD_SCENE_PROFILE_LINK 图文页内名称点击，ADD_SCENE_PROFILE_ITEM 图文页右上角菜单，ADD_SCENE_PAID 支付后关注，ADD_SCENE_WECHAT_ADVERTISEMENT 微信广告，ADD_SCENE_REPRINT 他人转载，ADD_SCENE_LIVESTREAM 视频号直播，ADD_SCENE_CHANNELS 视频号，ADD_SCENE_WXA 小程序关注，ADD_SCENE_OTHERS 其他

> 关注渠道,听起来也不错,能看到具体的用户关注渠道,弥补了后台自带的数据分析的不足.

除了获取单个用户的基本信息接口,还有批量获取用户基本信息.

那就赶紧用测试微信号演示一下吧.

```java
/**
 * 用户管理
 * https://github.com/Wechat-Group/WxJava/wiki/MP_%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86
 *
 * @throws WxErrorException
 */
@Test
public void testGetUserInfo() throws WxErrorException {
    String openid = "oygXc6HxeAfd4yjjm1-test";
    String lang = "zh_CN";
    WxMpUser user = wxMpService.getUserService().userInfo(openid,lang);
    System.out.println(JSON.toJSONString(user));
}
```

返回如下格式类型数据,和接口描述一致,就连最起码的用户昵称都没有.

```json
{
    "groupId": 0,
    "headImgUrl": "",
    "language": "zh_CN",
    "nickname": "",
    "openId": "oygXc6HxeAfd4yjjm1-test",
    "qrScene": "0",
    "qrSceneStr": "",
    "remark": "",
    "subscribe": true,
    "subscribeScene": "ADD_SCENE_OTHERS",
    "subscribeTime": 1723006180,
    "tagIds": []
}
```

其他接口不用演示了,反正也没有接口权限,想要了解具体详情看看文档也就足够了.

**1.3 推送取关用户处理详情**

不管是取关推送事件还是调用查询用户基本信息接口判断`subscribe`字段,两种方式都能得到取关用户.

经过上述步骤的实际演示,高级权限调用而来的用户基本信息也没有多么具体的信息,除了关注渠道外,其余信息可以说毫无特殊价值.

所以,在接收微信消息那一节中,特殊关注取关事件发送的消息,然后调用`http`推送接口通知给相关人员,从而做到了实时洞悉谁取关了公众号!

```
// 被关注回复
if(StringUtils.equals("event",msgType) && StringUtils.equals("subscribe",event)) {
    outContent = "恭喜你真有眼光关注了我,未来有你,真好!";

    // 关注提醒
    String pushTitle = String.format("eladmin公众号「%s」提醒","关注");
    String pushContent = String.format("新增粉丝: %s\n关注微信: %s\n关注时间: %s",fromUser,toUser,createTimeStr);
    DeveloperApiUtils.pushMsgForSelf(pushTitle,pushContent);
}
// 取消关注
if(StringUtils.equals("event",msgType) && StringUtils.equals("unsubscribe",event)) {
    outContent = "很遗憾要和你说声再见,江湖路远,保重!";

    // 取关提醒
    String pushTitle = String.format("eladmin公众号「%s」提醒","取关");
    String pushContent = String.format("取关粉丝: %s\n取关微信: %s\n取关时间: %s",fromUser,toUser,createTimeStr);
    DeveloperApiUtils.pushMsgForSelf(pushTitle,pushContent);
}
```

![](https://files.mdnice.com/user/71390/88ed3d27-922b-4837-8699-7b2044768d70.png)

### 2. 拉黑取关用户

**2.1 调用公众号接口自动拉黑**

> [用户管理 /黑名单管理](https://developers.weixin.qq.com/doc/offiaccount/User_Management/Manage_blacklist.html)

![](https://files.mdnice.com/user/71390/498f8d6b-fa0f-41f2-881c-1ebd29cda741.png)

**2.2 通知运营者手动拉黑**

虽然微信公众号后台或者`订阅号助手`均提供了拉黑功能,但是想要实现取关拉黑操作很是不太现实的.

![](https://files.mdnice.com/user/71390/bffd2f1b-55c9-4abd-b379-0d94cb29a0fa.png)

因为取关时只能获取到用户的openId,连昵称头像都没有,哪怕调用用户基本信息也没法确定对应的到底是哪个用户.

所以,这种拉黑更适合可视化操作,例如粉丝发布了不当言论,可以根据用户昵称头像直接操作拉黑.

![](https://files.mdnice.com/user/71390/392d9c27-fbd6-4043-ba0b-2f88daf88877.png)

**2.3 自定义拉黑逻辑实现**

上述两种拉黑途径都无法实现**取关拉黑**这么简单朴素的想法,所以只能自定义拉黑逻辑.

思路分析: 只有用户取关行为是需要拉黑的,其余互动消息均是健康行为.

所以,当用户取关时加入自定义黑名单列表,当用户后悔了再次关注时,哪怕发生互动消息,也要验证是否被拉黑从而拒绝提供自动回复服务.

如果取关后没有再次关注,那就一别两宽,相忘于江湖.否则,需要为上次的取关买单.

```java
// 取关-加入黑名单
if(StringUtils.equals("event:unsubscribe",type)){
    redisUtils.set("wxMpBlackListReply:" + SecureUtil.md5(fromUser), fromUser);
}
```

再次关注时可以像正常用户一样浏览文章,留言赞赏等行为,唯一限制的就是不再提供自动回复服务.

```java
// 是否在自动回复黑名单列表
if (redisUtils.hasKey("wxMpBlackListReply:" + SecureUtil.md5(fromUser))) {
    wxMpXmlOutTextMessage.setContent(String.format("对不起,由于反复取关,您已被拉黑!\n\n微信号: snowdreams1109\n如需恢复,请点击该链接%s",me));
}
```

这种自定义拉黑逻辑有了更多灵活性,同时注重了隐私保护,只有干瘪瘪的字符串,说到底我也不知道是谁取关公众号.

### 3. 验证拉黑效果

**3.1 官方拉黑行为验证**

![](https://files.mdnice.com/user/71390/392d9c27-fbd6-4043-ba0b-2f88daf88877.png)

> 拉黑行为可以看到历史消息,但是不能接受新发布的消息推送.无论是留言还是私信,后台均看不到消息.

**3.2 自定义拉黑行为验证**

![](https://files.mdnice.com/user/71390/e22bf532-e97c-4bd0-b73b-2231a5bc50af.png)

> 取关自动触发拉黑动作,再次关注后会限制自动回复能力,但可以正常留言接收新的文章推送等.

### 4. 如何解除拉黑

> [用户管理 /黑名单管理](https://developers.weixin.qq.com/doc/offiaccount/User_Management/Manage_blacklist.html)

![](https://files.mdnice.com/user/71390/89d7536f-b63b-4b25-aa81-0d1b362ffc14.png)

如果是官方拉黑行为,那么可以手动移除黑名单,也可以调用取消拉黑用户的接口重新恢复权限.

![](https://files.mdnice.com/user/71390/98706e73-e7db-4450-8ade-efa2a2fd66a5.png)

当然,如果是自定义拉黑方式,触发了取关拉黑规则,那么只能联系开发者手动移除黑名单了.

## 总结

本文主要讲解了微信公众号如何开发**取关拉黑**这一简单功能,拒绝白嫖资源.

回顾值得关注的可能就是**自动回复**以及**自定义菜单**相关权限问题了.

给新手入坑微信公众号开发的几点建议:

1. 多看官方文档,微信入门指引非常全面,能帮助了解大概流程.
2. 能直接复制粘贴就不要自己造轮子,去`Github`找找现成项目.
3. 凡事留一线,事后好相见,多一些宽容,少一些苛责.

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

