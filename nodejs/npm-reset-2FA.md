# 重置npm双重因素认证

## 前言

很早以前注册登录`npm`官网,需要开启双重因素认证,多年前的子弹刚好落在了此时此刻的自己.

![](https://files.mdnice.com/user/71390/77706dfe-b8b9-4544-b7b7-13b31acf97bb.png)

遥想当年,初见npm,强制要求开启双重因素认证,像极了AppleId的风格.

而如今,`Two-Factor Authentication`早已不见了身影,更别提动态验证码.

![](https://files.mdnice.com/user/71390/9669b16b-3ec9-4e58-bc38-90ea4be7574e.png)

## 申请恢复npm账号

所以,继续登录`npm`就很遗憾,提示要求输入的这个一次性密码是个什么鬼?

并不知道,双因素认证器也没有网络同步保存,所以没办法输入验证码,接下来按照网站提示一步一步尝试是否能够恢复账号,禁用双重认证!

![](https://files.mdnice.com/user/71390/a16d1a4b-0c28-4770-a254-5cf874b47d37.png)

点击下方的`Use a recovery code or request a reset`链接,又被要求输入恢复密码.

```
If you are unable to acces your two-factor device, enter one of your recovery codes to verify your identity.
```

![](https://files.mdnice.com/user/71390/f20fbe7b-2bcd-422f-aa55-d133a7fb8afb.png)

所以,依然没有恢复密码,继续点击`Try recovering your account`恢复账号链接.

```
If you can't access your recovery codes, you can request an account recovery. For security reasons, this process can take 1-3 business days.

Next: We will be sending one-time password(OTP) in your registered email.
```

![](https://files.mdnice.com/user/71390/19c21f8d-fce5-4afa-9867-c4390b3e2167.png)

接下来,终于到了能够操作的页面,一步步按照提示说明,注册邮箱将会收到邮件.

## 邮箱辅助验证

![](https://files.mdnice.com/user/71390/bbdac128-2343-443d-a741-b937db09bf8e.png)

```
It looks like you are trying to recover your account. As an additional security measure you are requested to enter the OTP code (one-time password) provided in this email.

If you did not intend to recover your account in npm, please ignore this email.

The OTP code is: ******
```

输入邮箱收到的`The OTP code is: ******`一次性密码完整验证,接下来会得到第二封邮件提示`Ticket ID: ******`凭证编号.

![](https://files.mdnice.com/user/71390/09543949-9609-45b3-a3f2-937f0a3cfdc3.png)

> 勾选`Reset my two-factor authentication (2FA)`申请重置双重认证.

```
Thank you for contacting npm Support. We wanted to let you know that we've received your message and will get to it as quickly as possible.

Ticket ID: ******
```

继续等待,大概过了1~3个工作日,将会收到`Github`辅助认证的邮件,按照要求创建`secret gist`并包括`Nature's Particle Manager`短语.

```
GitHub (GitHub Support)

Aug 6, 2024, 12:20 PM UTC

Hi,

Thanks for contacting npm Support! I can help.
 
As we are able to associate your npm account with a GitHub account by your account profile or publishing history we can use that account to verify your identity. Please create a secret gist with your GitHub account including the phrase "Nature's Particle Manager".
 
Please share a link to the gist here.
 
Once received and verified, we'll disable 2FA and you can configure it anew.
https://docs.npmjs.com/configuring-two-factor-authentication
 
Thank you so much.
Jude
GitHub Support
Supporting the npm registry
```

按照这封邮件的要求,继续使用`Github`账号创建私密[ secret gist ](https://gist.github.com/),包括`"Nature's Particle Manager"`短语.

![](https://files.mdnice.com/user/71390/7a09bbd0-9fcf-44ea-a96a-920e32995f7c.png)

然后,直接**邮箱回复私密链接**,等待后续邮件通知.

![](https://files.mdnice.com/user/71390/0fd006ba-5a06-4d2e-8a7c-904220af4c45.png)

## 账号恢复成功

第二天,收到了npm的邮箱通知,第一封邮件主题是`[npm] Two-factor authentication disabled`,说明双重认证已禁用.

```
Hi, snowdreams1006!

It looks like you disabled two-factor authentication (2FA) on your npm account.

2FA is an extra layer of security used when logging into websites or apps. We encourage users to setup 2FA on their accounts. To enable 2FA, please follow the instructions found here.

If you have any questions or concerns please reach out to the npm support team.

You’re receiving this email because you recently disabled 2FA on your npm account.
```

第二封邮件是对申请回复邮箱的回复消息,通知已经成功恢复账号,现在可以直接用[账号密码方式登录](https://www.npmjs.com/login)(`Try to log in again or request for a password reset.`)

```
GitHub (GitHub Support)

Aug 7, 2024, 7:22 PM UTC

Hi,
 
Thank you for the follow up.
 
Verification has been completed and 2FA has been disabled.
 
Try to log in again or request for a password reset.
https://www.npmjs.com/login
https://www.npmjs.com/forgot
 
Login verification emails will be sent out for user accounts that do not have 2FA enabled.
 
You can follow the instructions in our documentation below to enroll in 2FA.
https://docs.npmjs.com/configuring-two-factor-authentication.
 
Let us know if there is anything else we can do for you. We’ll be here to help.
Jude
GitHub Support
Supporting the npm registry
```

等待了这么久,终于再一次成功登录了`npm`!

![](https://files.mdnice.com/user/71390/f463095c-bce8-4761-b070-178acde4b9b1.png)

> 下载再要开启双重认证一定要做好备份,云端保存同步!

## 总结

本文主要记录了真实解封`npm`账号的全流程,耗时三五天,等待中的不确定性,终于解决了问题并顺利记录下这次经历.

`npm`的双重认证据说是更加安全的认证方式,如果是本地扫码保存动态验证码,时过境迁就悲剧了.

![](https://files.mdnice.com/user/71390/ab7343d0-5542-4c8d-b23d-00ade4663435.png)

幸运的是,最后的结果是完美的,根据提示一步步操作,慢慢等待终将会见证花开.

![](https://files.mdnice.com/user/71390/14221252-dd7c-4fd7-a2b9-65ee801946a0.png)


