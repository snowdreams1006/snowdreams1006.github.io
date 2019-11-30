# docker + email


```bash
docker pull lejmr/iredmai:mysql-lastest
```

```bash
docker run -d --privileged -p 90:80 -p 8443:443 \
           -e "DOMAIN=snowdreams1006.cn" -e "HOSTNAME=mail" \
           -e "MYSQL_ROOT_PASSWORD=123456" \
           -e "SOGO_WORKERS=1" \
           -e "TIMEZONE=Europe/Prague" \
           -e "POSTMASTER_PASSWORD=123456" \
           -e "IREDAPD_PLUGINS=['reject_null_sender', 'reject_sender_login_mismatch', 'greylisting', 'throttle', 'amavisd_wblist', 'sql_alias_access_policy']" \
           -v `pwd`/mysql:/var/lib/mysql \
           -v `pwd`/vmail:/var/vmail \
           -v `pwd`/clamav:/var/lib/clamav \
           --name=mail lejmr/iredmail:mysql-latest
```

scp /Users/snowdreams1006/Downloads/docker-compose.yml root@snowdreams1006.cn:/root/mail

docker-compose -f docker-compose.iredmail.yml up -d

docker-compose.iredmail.yml

mail.snowdreams1006.cn/iredadmin/dashboard/checknew

hostnamectl set-hostname snowdreams1006.cn
snowdreams1006.cn:90/iredadmin/dashboard/checknew


## 最佳实践

> EwoMail 开源企业邮件系统 的docker镜像 [bestwu/ewomail](https://hub.docker.com/r/bestwu/ewomail)

### 启动容器

```bash
docker run  -d -h mail.snowdreams1006.cn --restart=always \
  	-p 25:25 \
	-p 587:587 \
	-p 465:465 \
	-p 143:143 \
	-p 993:993 \
	-p 110:110 \
	-p 995:995  \
	-p 109:109 \
	-p 90:80 \
	-p 9090:8080 \
	-v `pwd`/mysql/:/ewomail/mysql/data/ \
	-v `pwd`/vmail/:/ewomail/mail/ \
	-v `pwd`/rainloop:/ewomail/www/rainloop/data \
	-v `pwd`/ssl/certs/:/etc/ssl/certs/ \
	-v `pwd`/ssl/private/:/etc/ssl/private/ \
	-v `pwd`/ssl/dkim/:/ewomail/dkim/ \
  --name mail bestwu/ewomailserver  
```

### 访问

- 邮箱管理后台 http://localhost:8080

> ewomail.snowdreams1006.cn

默认用户: admin

默认密码: ewomail123

- Rainloop 管理端 http://localhost/?admin

默认用户: admin

默认密码: 12345

> mail.snowdreams1006.cn

- Rainloop 用户端 http://localhost

### 设置 DNS

将 `mail.snowdreams1006.cn` 改成你的域名

spf记录: `v=spf1 include:snowdreams1006.cn -all`

### DKIM 设置

```bash
docker exec mail amavisd showkeys
```

```bash
; key#1, domain snowdreams1006.cn, /ewomail/dkim/mail.pem
dkim._domainkey.snowdreams1006.cn.	3600 TXT (
  "v=DKIM1; p="
  "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDyk2JYMeTjn55AVU7OlZF++6ed"
  "Eu4tGtB35/6+sbQ3ugm0QflplbIWE2vu/gFsuatSn4xKUYIsrp0njaMMbC00qwkT"
  "dWjfI/lmFP/23i/ejKNFNxA4O/zWrtIfCbQ3dxlgkvtKE0oGcNHX+Q3le3LxCRua"
  "FIq1QRT7GOzHS7R67QIDAQAB")
```

`dkim._domainkey`

`v=DKIM1;p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDyk2JYMeTjn55AVU7OlZF++6edEu4tGtB35/6+sbQ3ugm0QflplbIWE2vu/gFsuatSn4xKUYIsrp0njaMMbC00qwkTdWjfI/lmFP/23i/ejKNFNxA4O/zWrtIfCbQ3dxlgkvtKE0oGcNHX+Q3le3LxCRuaFIq1QRT7GOzHS7R67QIDAQAB`

### 测试生效

```bash
docker exec mail amavisd testkeys
```

```bash
yum install xinetd telnet telnet-server -y
```

```bash
telnet smtp.qq.com 25
```

### 参考资料

- [利用Docker自建多功能加密邮件服务器](https://www.itmanbu.com/docker-mail-server.html)


```yaml
version: '2.3'

services:
  portainer:
    image: "ewomail/ewomail"
    container_name: "mail"
    hostname: "mail.snowdreams1006.cn"
    restart: always 
    ports:
      - "0.0.0.0:2210:22"
      - "0.0.0.0:25:25"
      - "0.0.0.0:109:109"
      - "0.0.0.0:110:110"
      - "0.0.0.0:143:143"
      - "0.0.0.0:465:465"
      - "0.0.0.0:587:587"
      - "0.0.0.0:993:993"
      - "0.0.0.0:995:995"
      - "172.16.166.99:8010:8000"
      - "172.16.166.99:8011:8010"
      - "172.16.166.99:8012:8020"
    volumes:
      - "./cgroup:/sys/fs/cgroup:ro"
    privileged: true
    tty: true
    stdin_open: true
```

```yaml
  mail:
    image: bestwu/ewomailserver
    hostname: mail.ewomail.com
    container_name: ewomail
    restart: always
    ports:
      - "25:25"
      - "143:143"
      - "587:587"
      - "993:993"
      - "109:109"
      - "110:110"
      - "465:465"
      - "995:995"
      - "80:80"
      - "8080:8080"
    volumes:
      - ./mysql:/ewomail/mysql/data
      - ./vmail:/ewomail/mail
      - ./rainloop:/ewomail/www/rainloop/data
      - ./ssl/certs/:/etc/ssl/certs/
      - ./ssl/private/:/etc/ssl/private/
      - ./ssl/dkim/:/ewomail/dkim/
```





## 认证官方镜像

```bash
docker pull ewomail/ewomail
```

## 下载配置文件

```bash
curl -o docker-compose.yml https://raw.githubusercontent.com/EwoMail/ewomail-docker/master/docker-compose.yml
```

## 修改配置文件

```yaml
version: '2.3'

services:
  portainer:
    image: "ewomail/ewomail"
    container_name: "mail"
    hostname: "mail.snowdreams1006.cn"
    restart: always 
    ports:
      - "0.0.0.0:25:25"
      - "0.0.0.0:587:587"
      - "0.0.0.0:465:465"
      - "0.0.0.0:143:143"
      - "0.0.0.0:993:993"
      - "0.0.0.0:110:110"
      - "0.0.0.0:995:995"
	  - "0.0.0.0:109:109"
      - "0.0.0.0:2210:22"
      - "127.0.0.1:8000:8000"
      - "127.0.0.1:8010:8010"
      - "127.0.0.1:8020:8020"
    volumes:
      - "/root/mail/cgroup:/sys/fs/cgroup:ro"
    privileged: true
    tty: true
    stdin_open: true
```

## 启动容器

```bash
docker-compose up -d
```

## 拉取镜像

```bash
docker pull bestwu/ewomail
```

## 体验测试

邮箱管理后台：http://IP:8010 （默认账号admin，密码ewomail123）

> ewomail.snowdreams1006.cn

web邮件系统：http://IP:8000

> mail.snowdreams1006.cn

## 开放端口

8000，8010，8020，25，143，993，995，587，110，109，22，80，465

## 启动容器

```bash
docker run  -d -h mail.snowdreams1006.cn --restart=always \
  	-p 25:25 \
	-p 587:587 \
	-p 465:465 \
	-p 143:143 \
	-p 993:993 \
	-p 110:110 \
	-p 995:995  \
	-p 109:109 \
	-p 90:80 \
	-p 9090:8080 \
	-v `pwd`/mysql/:/ewomail/mysql/data/ \
	-v `pwd`/vmail/:/ewomail/mail/ \
	-v `pwd`/ssl/certs/:/etc/ssl/certs/ \
	-v `pwd`/ssl/private/:/etc/ssl/private/ \
	-v `pwd`/rainloop:/ewomail/www/rainloop/data \
	-v `pwd`/ssl/dkim/:/ewomail/dkim/ \
  --name ewomail bestwu/ewomailserver  
```

#进入虚拟机
docker exec -it ewomail /bin/bash
 
#在/etc/hosts中已有域名指向
172.17.0.2      mail.snowdreams1006.cn mail



- sendmail：用于发邮件。资格最老的邮局，所有Linux发行版基本都带。但是配置麻烦。
- postfix：Wietse Venema觉得sendmail配置太麻烦了，就开发了一个“简化配置版sendmail”，即postfix。支持smtp协议。
- dovecot：用于收邮件，支持imap/pop3。
- spamassasin：垃圾邮件过滤器。可以自订规则。
- clamav：邮件杀毒工具。
- opendkim：生成dkim签名。有什么用？详见下面的“反垃圾邮件技术”。
- fail2ban：防止别人暴力破解用户名密码的工具。

## 配置

运行成功后访问

- 邮箱管理后台 http://localhost:8080

默认用户: admin

默认密码: ewomail123

> ewomail.snowdreams1006.cn

- Rainloop 管理端 http://localhost/?admin

> rainloop.snowdreams1006.cn/?admin

默认用户: admin

默认密码: 12345

- Rainloop 用户端 http://localhost

> rainloop.snowdreams1006.cn

## 设置域名DNS

将mail.ewomail.cn 改成你的域名

v=spf1 include:snowdreams1006.cn -all

## dkim 设置

```bash
docker exec ewomail amavisd showkeys
```

```bash
docker exec ewomail amavisd testkeys
```


```bash
docker pull tvial/docker-mailserver:latest
```

```bash
curl -o setup.sh https://raw.githubusercontent.com/tomav/docker-mailserver/master/setup.sh; chmod a+x ./setup.sh

curl -o docker-compose.yml https://raw.githubusercontent.com/tomav/docker-mailserver/master/docker-compose.yml.dist

curl -o .env https://raw.githubusercontent.com/tomav/docker-mailserver/master/.env.dist

curl -o env-mailserver https://raw.githubusercontent.com/tomav/docker-mailserver/master/env-mailserver.dist
```

```bash
docker-compose up -d mail
```

```bash
./setup.sh email add <user@domain> [<password>]

./setup.sh email add test@snowdreams1006.cn 123456
```

```bash
./setup.sh config dkim
```

```bash
cat config/opendkim/keys/domain.tld/mail.txt

cat config/opendkim/keys/snowdreams1006.cn/mail.txt 
```

```bash
mail._domainkey	IN	TXT	( "v=DKIM1; h=sha256; k=rsa; "
	  "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsmu8hYaaFpFDlSbJPRupiHwhhdsicOYrYDJpJXUMtf8Rh5rXbOpi4vJ59ml9EUyjB62LaHlK65a2rB4GUuwq2YZJvd2gCdqJv8wsidlavU/LLNI9/gIzqG/2JqsENGz6tClMpDVqFFEN7ShOAApMjn3Yq80Qy4F+vNhDTjaoBl1odQYwDW5fy3Oorh8ipf50J1H+7ehiUG30yC"
	  "S537m6A35HoFpCx2g/ThuwWHK1P7HiSJ20bvoPZn/FKwAoQt+DM3R4H2Na+NudVWadmXmGezz+KWToe/dDUTfN66qMvMuzPbhbJy3MUfFvqcscZsD7PrJdOTuLeYG5ESgSccse0QIDAQAB" )  ; ----- DKIM key mail for snowdreams1006.cn
```

> mail._domainkey v=DKIM1; h=sha256; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsmu8hYaaFpFDlSbJPRupiHwhhdsicOYrYDJpJXUMtf8Rh5rXbOpi4vJ59ml9EUyjB62LaHlK65a2rB4GUuwq2YZJvd2gCdqJv8wsidlavU/LLNI9/gIzqG/2JqsENGz6tClMpDVqFFEN7ShOAApMjn3Yq80Qy4F+vNhDTjaoBl1odQYwDW5fy3Oorh8ipf50J1H+7ehiUG30yCS537m6A35HoFpCx2g/ThuwWHK1P7HiSJ20bvoPZn/FKwAoQt+DM3R4H2Na+NudVWadmXmGezz+KWToe/dDUTfN66qMvMuzPbhbJy3MUfFvqcscZsD7PrJdOTuLeYG5ESgSccse0QIDAQAB


```bash
docker exec mail openssl s_client -connect 0.0.0.0:587 -starttls smtp -CApath /etc/letsencrypt/
```

```bash
docker exec mail openssl s_client -connect 0.0.0.0:993 -starttls imap -CApath /etc/letsencrypt/
```


```bash
docker-compose up -d mail
```

- [教你搭建自己的邮件服务器-Ubuntu 18.04下通过Docker使用EwoMail实现](http://www.meilongkui.com/archives/966)
- [使用docker搭建一个功能完善但非常简单的邮件服务器](http://aifei8.net/docker-23usv)
