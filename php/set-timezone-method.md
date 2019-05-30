# 搞定时区设置的三种姿势(php)

## 科普一下什么是时区

众所周知,地球绕着太阳转的同时也会自转,因此同一时刻不同地区所接收到太阳照射的情况不同,所以有的地区是日出,有的地区是日落,还有的地区可能是黑夜.

既然地球上的不同地区时间不同,那总要有统一的时间刻度才能方便文化科技交流吧,不然大家说的都是当地时间,这样岂不是乱套了?

有问题就要解决问题,不同地区时间不同就要统一时间标准,而统一时间标准的前提就是要弄清楚全球的时间差异到底在哪以及各地的当地时间如何互相转换.

原来的时间标准是**格林尼治标准时间**,随着精确计时的发展需要,已被新的时间标准所取代,目前的时间标准是**世界协调时**.

现在有了统一的时间标准,不同地区的时间就可以统一换算成世界协调时再转换成当地时间了,再也不会出现同一时刻不同时间了!

示例:

- 北京时间(`UTC+8`) : `2019-05-30 13:30:00`
- 世界时间(`UTC`) : `2019-05-30 05:30:00`
- 东部时间(`UTC-5`) : `2019-05-30 00:30:00`

### 格林尼治标准时间

> **格林尼治标准时间**(又称**格林威治平均时间**或**格林威治标准时间**,英文是**GreenwichMeanTime**,简称**GMT** ),格林尼治标准时间的正午是指当太阳横穿**格林尼治子午线**时(也就是在格林尼治时)的时间.

**格林尼治**是英国伦敦的一个小镇,是**地理经度**的起点,**本初子午线**所在的经度是**零度经度,**所在的时区是**零时区**.

我们知道一天共有 `24` 小时,对应着全球 `24` 个时区,而地球**自西向东**自转,零时区后依次是东一区到东十一区,然后是东十二区.紧接着是西十二区,西十一区到西一区,最后又回到零时区.

> 其中东十二区和西十二区是**同一个时区**,又被称为**东西十二区**.

总的来说,时区分为东十二区和西十二区以及零时区,其中东西十二区是同一个时区,因此共有 `24` 个时区.

![php-timezone-method-gmt-geo.jpg](./images/php-timezone-method-gmt-geo.jpg)

示例:

由于北京位于东八区,比零时区多个 `8` 个时区,意味着北京时间比格林标准时间**快** `8` 个小时.

所以,北京时间中午 12 点整的时候,格林尼治才清早 4 点钟,估计还在睡觉呢! ( `GMT+8` 就是北京时间)

> 格林尼治标准时间与**地球自转**有关,不能满足精确计时的需求,因此不再作为**标准时间**,取而代之的是协调世界时.

### 协调世界时

> **协调世界时**(又称**世界统一时间**或**世界标准时间**或**国际协调时间**,英文是**Coordinated Universal Time**,简称**UTC** ),协调世界时是以**原子时**秒长为基础,在时刻上尽量接近于**格林尼治标准时间**的一种时间计量系统.

在**不需要精确到秒**的情况下, `GMT` 和 `UTC` 基本一致,但 `UTC` 是以更加精确的原子时为基础,因此常用于科学计算领域,也是目前时间计量的统一标准.

示例:

北京时间 `12:00` ,换算成 `GMT` 或 `UTC` 时间都是 `04:00` ( `UTC+8` 也是北京时间)

### 北京时间

> **北京时间**(又称**中国标准时间**),是首都北京所在的时区作为中国的标准时间,比**格林尼治标准时间**快8小时.

我国幅员辽阔,从西到东横跨东五,东六,东七,东八和东九等**五个**时区.所以全国统一采用**首都北京**所在的**东八时区**的区时作为标准时间,也就是北京时间.

### 时区信息数据库

> 时区信息数据库,又称 Olson数据库,是一个主要应用于电脑程序以及操作系统的可**协作编辑世界时区信息**的数据库.

时区信息数据库采用按“区域/位置”命名规范,方便应用于计算机世界,其中英文地名中的空格用下划线“_”代替,连词符“-”只在英文地名本身包含时使用.

示例:

- `Asia/Hong_Kong` : 亚洲/香港
- `Asia/Macau` : 亚洲/澳门    
- `Asia/Shanghai` : 亚洲/上海
- `Asia/Taipei` : 亚洲/台北
- `Asia/Urumqi` : 亚洲/乌鲁木齐

> 上述时区主要是 `php` 中所支持的中国时区,参考 [亚洲所支持的时区列表](https://www.php.net/manual/zh/timezones.asia.php) 

## 日期时间库是什么

日期时间函数库是 `php` **内置函数库**,可以通过日期时间函数获得服务器的日期时间,用于消除不同客户端的时间差异性.

`date` 扩展默认已启用,我们可以输入 `phpinfo` 打印出 `php` 的基本信息,并搜索关键字 `date` 找到关于 `date` 扩展的相关信息以验证日期时间函数库.

|选项|值|
|-|-|
|date/time support(日期时间支持情况)|enabled(已启用)|
|timelib version(时间库版本)|2016.05(`2016.05`)|
|"Olson" Timezone Database Version(`Olson` 时区数据库版本)|2018.5(`2018.5`)|
|Timezone Database(时区数据库)|internal(内部的)|
|Default timezone(默认时区)|UTC(世界协调时)|

## 时区设置的三种姿势

查看目前[所有支持](https://www.php.net/manual/en/timezones.php)的时区,下面整理出中国的几个时区.

- `Asia/Hong_Kong` : 亚洲/香港
- `Asia/Macau` : 亚洲/澳门    
- **`Asia/Shanghai`** : 亚洲/上海
- `Asia/Taipei` : 亚洲/台北
- `Asia/Urumqi` : 亚洲/乌鲁木齐

> 中国常用时区是上海,并没有北京时区!

### 永久性修改 `php` 配置文件

> 修改 `php` 配置文件中 `date.timezone` 选项

适用于所有脚本,需要重启服务器方可生效.

`PRC` : 中华人民共和国

> /private/etc/php.ini.default

```
[Date]
; Defines the default timezone used by the date functions
; http://php.net/date.timezone
;date.timezone =

; http://php.net/date.default-latitude
;date.default_latitude = 31.7667

; http://php.net/date.default-longitude
;date.default_longitude = 35.2333

; http://php.net/date.sunrise-zenith
;date.sunrise_zenith = 90.583333

; http://php.net/date.sunset-zenith
;date.sunset_zenith = 90.583333
```

```
date.timezone = PRC
```


|选项|值|
|-|-|
|date/time support(日期时间支持情况)|enabled(已启用)|
|timelib version(时间库版本)|2016.05(`2016.05`)|
|"Olson" Timezone Database Version(`Olson` 时区数据库版本)|2018.5(`2018.5`)|
|Timezone Database(时区数据库)|internal(内部的)|
|Default timezone(默认时区)|PRC(中华人民共和国)|

### 运行时设置 `php` 时区方法

```php
<?php
header("content-type:text/html;chartset=utf-8");

// 获取当前时区
echo "当前时区: ".date_default_timezone_get()."<br/>";

var_dump(date_default_timezone_set("Asia/Shanghai"));

echo "<br/>";

echo "当前时区: ".date_default_timezone_get()."<br/>";

?>
```
### 运行时设置 `php` 配置选项


## 参考资料

- [时区相关知识扫盲](https://blog.csdn.net/nextyu/article/details/78480371)
- [时区时差时间换算](http://www.beijing-time.org/shiqu/)
