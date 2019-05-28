# 搞定时区设置的三种姿势

## 科普一下什么是时区

### 格林尼治标准时间（GMT）

> **格林尼治标准时间** (中文: **格林威治平均时间** 或 **格林威治标准时间** , 英语: **GreenwichMeanTime** ,简称 **GMT** ),格林尼治标准时间的正午是指当太阳**横穿**格林尼治子午线时(也就是在格林尼治时)的时间.

格林尼治标准时间与地球自转有关,而自转并不均匀,目前格林尼治时间已经**不再**被作为标准时间使用.

格林尼治是英国伦敦的一个小镇,是地理经度的起点,**本初子午线**所在的经度是**零度经度,**所在的时区是**零时区**.

一天 `24` 小时,全球共分为 `24` 个时区,而地球**自西向东**自转,零时区后分别是东一区到东十一区,然后是东十二区.

接着是西十二区,其中东十二区和西十二区是同一个时区,又被称为**东西十二区**.

西十一区到西一区,最后又回到零时区.

总的来说,时区分为东十二区和西十二区以及零时区,其中东西十二区是同一个时区,因此共有 `24` 个时区.

示例:

由于北京位于东八区,比零时区多个 `8` 个时区,意味着北京时间比格林标准时间晚 `8` 个小时.

所以,北京时间中午 12 点整的时候,格林尼治才清早 4 点钟,估计还在睡觉呢! ( `GMT+8` 就是北京时间)

![php-timezone-method-gmt-geo.jpg](./images/php-timezone-method-gmt-geo.jpg)

> 现在的标准时间是原子钟提供的协调世界时(UTC).

### 协调世界时（UTC）

> **协调世界时** (中文: **称世界统一时间** 或 **世界标准时间** 或 **国际协调时间**, 英语: **Coordinated Universal Time** ,简称 **UTC** ),协调世界时是以**原子时**秒长为基础,在时刻上尽量接近于**格林尼治标准时间**的一种时间计量系统.

在**不需要精确到秒**的情况下,`GMT` 和 `UTC` 基本一致,但是 `UTC` 是以更加精确的原子时为基础,常用于科学计算领域.

示例:

北京时间 `12:00` ,换算成 `GMT` 或 `UTC` 时间是 `04:00` ( `UTC+8` 也是北京时间)

### 时区的表示方法

地球是圆的,同一时刻太阳照射到地球的部分是白天,没有照射到的是黑夜,再者地球那么大,照射面积也不一样,因此不同地方的当地时间不同.

但是一定区域内日出日落基本是固定的,因此从**地理经度**的角度上将地球平分为 `24` 个时区,对应着一天的 `24` 个小时,所以一个时区是 `15` 度.

同一个时区内的时间是相同的,不同时区的时间不一样,因此存在在时间偏移量,正如北京位于东八区就比格林尼治时间快 `8` 个小时!

如果想要和跨时区的人民进行友好交流,首先得弄清楚当地时间几点了,说不定你这边中午在吃饭,人家那边天还没亮呢,岂不是很尴尬?

- 协调世界时的表示法 (`UTC` 或 `Z`)

协调时间时 `12:00:00` 表示: `12:00:00 UTC` 或 `12:00:00Z` 或 `120000Z`

如果当地时间与 `UTC` 存在差异,通常以 `±[hh]:[mm]` ,`±[hh][mm]` 或 `±[hh]` 等格式显示相差的小时和分钟.

> 假设用时间协调时表示北京时间: `UTC+08:00` 或 `UTC+0800` 或 `UTC+08` 

### 时区信息数据库

> 时区信息数据库,又称 Olson数据库,是一个主要应用于电脑程序以及操作系统的可协作编辑世界时区信息的数据库.

时区信息数据库采用按“区域/位置”命名规范,方便应用于计算机编程,其中英文地名中的空格用下划线“_”代替,连词符“-”只在英文地名本身包含时使用.

- `Asia/Hong_Kong` : 亚洲/香港
- `Asia/Macau` : 亚洲/澳门    
- **`Asia/Shanghai`** : 亚洲/上海
- `Asia/Taipei` : 亚洲/台北
- `Asia/Urumqi` : 亚洲/乌鲁木齐

## 日期时间库是什么

日期时间函数库是 `php` **内置函数库**,可以通过日期时间函数获得服务器的日期时间,用于消除不同客户端的时间差异性.

`date` 扩展默认已启用,我们可以输入 `phpinfo` 打印出 `php` 的基本信息,并搜索关键字 `date` 找到关于 `date` 扩展的相关信息以验证日期时间函数库.

![php-timezone-method-date-extra-info.png](./images/php-timezone-method-date-extra-info.png)

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

