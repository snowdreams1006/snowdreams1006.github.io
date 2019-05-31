# 日期时间操作一箩筐

![php-datetime-overview-doc.png](./images/php-datetime-overview-doc.png)

## 格式化日期时间

> [date](https://www.php.net/manual/zh/function.date.php) : 格式化日期时间

- 场景

将当前日期时间或者特定日期时间**格式化**输出为特定格式的字符串,常用于人性化展示信息.

- 说明

返回给定时间戳格式化后所产生的日期时间字符串,如果没有给出时间戳则默认使用本地当前时间.

- 备注

|格式|说明|返回值示例|
|-|-|-|
|`Y`|`4` 位数字完整表示的年份|`2019`|
|`y`|`2` 位数字表示的年份|`19`|
|`M`|三个字母缩写表示的月份|`Jan 到 Dec`|
|`m`|数字表示的月份,有前导零|`01 到 12`|
|`D`|星期中的第几天,文本表示,`3`个字母|`Mon 到 Sun`|
|`d`|月份中的第几天,有前导零的 `2` 位数字|`01 到 31`|
|`H`|小时,`24` 小时格式,有前导零|`00 到 23`|
|`h`|小时,`12` 小时格式,有前导零|`01 到 12`|
|`I`|是否为夏令时|如果是夏令时为`1` ,否则为 `0`|
|`i`|有前导零的分钟数|`00 到 59`|
|`S`|每月天数后面的英文后缀,`2` 个字符|`st,nd,rd` 或者 `th` ,可以和 `j` 一起用|
|`s`|秒数,有前导零 |`00 到 59`|

- 常用格式

```php
// 形如 2019-05-31 12:00:00
echo date("Y-m-d H:i:s");

// 形如 2019/05/31 12:00:00
echo date("Y/m/d H:i:s");

// 形如 2019年05月31日 12时00分00秒
echo date("Y年m月d日 H时i分s秒");
```

- 示例

```php
<?php
// 设置当前时区为上海时区
date_default_timezone_set("Asia/Shanghai");

// 获取当前时区 : Asia/Shanghai
echo "当前时区 : ".date_default_timezone_get()."<br/>";

// `Y年m月d日 H时i分s秒` 格式化当前时间 : 2019年05月30日 22时32分46秒
echo "当前时间 : ".date("Y年m月d日 H时i分s秒")."<br/>";

// `Y-m-d H:i:s` 格式化当前时间 : 2019-05-30 22:32:46
echo "当前时间 : ".date("Y-m-d H:i:s")."<br/>";

// `w` 星期中的第几天,数字表示: 0（表示星期天）到 6（表示星期六）
switch (date("w")) {
    case '0':
        $dayStr = "日";
        break;
    case '1':
        $dayStr = "一";
        break;
    case '2':
        $dayStr = "二";
        break;
    case '3':
        $dayStr = "三";
        break;
    case '4':
        $dayStr = "四";
        break;
    case '5':
        $dayStr = "五";
        break;
    case '6':
        $dayStr = "六";
        break;
    default:
        $dayStr = "未知";
        break;
} 
// 2019年05月30日 星期四
echo "当前时间 : ".date("Y年m月d日")." 星期".$dayStr."<br/>";

echo "<hr/>";

// `z` 年份中的第几天 : 今天是全年的第149天
echo "今天是全年的第".date("z")."天<br/>";

// `W` ISO-8601 格式年份中的第几周,每周从星期一开始 : 本周是全年的第22周
echo "本周是全年的第".date("W")."周<br/>";

// `t` 指定的月份有几天 : 本月共有31天
echo "本月共有".date("t")."天<br/>";

?>
```

## 日期转化时间戳

> [time](https://www.php.net/manual/zh/function.time.php) : 返回当前的 Unix 时间戳

- 场景

获取当前日期时间或特定日期时间的时间戳,常用于日期时间之间的相互转换.

- 说明

返回自从 `Unix` 纪元(格林威治时间 `1970年1月1日 00:00:00`)到当前时间的**秒数**.

- 示例

```php
<?php
// 设置当前时区为上海时区
date_default_timezone_set("Asia/Shanghai");

// 获取当前时区
echo "当前时区 : ".date_default_timezone_get()."<br/>";

// 一周前的日期时间: 7 days; 24 hours; 60 mins; 60 secs
$preWeek = time() - (7 * 24 * 60 * 60);
echo "现在是".date("Y-m-d H:i:s").",上周是".date("Y-m-d H:i:s",$preWeek)."<br/>";

// 一周后的日期时间: 7 days; 24 hours; 60 mins; 60 secs
$nextWeek = time() + (7 * 24 * 60 * 60);
echo "现在是".date("Y-m-d H:i:s").",下周是".date("Y-m-d H:i:s",$nextWeek)."<br/>";

?>
```

> [microtime](https://www.php.net/manual/zh/function.microtime.php) : 返回当前 `Unix` 时间戳和微秒数

- 场景

获取当前日期时间或特定日期时间的时间戳,常用于程序运行过程打点分析,也可以用于日期时间之间的互相转换.

- 说明

当前 `Unix` 时间戳以及微秒数,本函数仅在支持 `gettimeofday()`` 系统调用的操作系统下可用.

- 示例

```php
<?php
// 设置当前时区为上海时区
date_default_timezone_set("Asia/Shanghai");

// 获取当前时区
echo "当前时区 : ".date_default_timezone_get()."<br/>";

// 当前日期时间戳
echo "当前日期时间戳: ".time()." <--> ".microtime()." <--> ".microtime(TRUE)."<br/>";
?>
```

> [mktime](https://www.php.net/manual/zh/function.mktime.php) : 取得一个日期的 `Unix` 时间戳

- 场景

获取给定日期的时间戳,按照`"时分秒 月日年"`格式依次解析,返回时间戳.

- 说明

根据给出的参数返回 `Unix` 时间戳.

- 备注

|格式|说明|参数示例|
|-|-|-|
|`H`|`hour` 小时数|`00 到 23`|
|`i`|`minute` 分钟数|`00 到 59`|
|`s`|`second` 秒数|`00 到 59`|
|`n`|`month` 月份数|`01 到 12`|
|`j`|`day` 天数|`01 到 31` |
|`Y`|`year` 年份数,可以是两位或四位数字|`0-69` 对应于 `2000-2069` ,`70-100` 对应于 `1970-2000`|

> 格式: **时分秒 月日年**,支持从右往左依次省略,被省略的值取当前时间的对应值.

- 示例

```php
<?php
// 设置当前时区为上海时区
date_default_timezone_set("Asia/Shanghai");

// 获取当前时区
echo "当前时区 : ".date_default_timezone_get()."<br/>";

// 指定日期时间戳: 时分秒 月日年 : 1559275200 <--> 2019-05-31 12:00:00
echo "2019年05月31日 12:00:00 的时间戳: ".mktime(12,0,0,5,31,2019)." <--> ".date("Y-m-d H:i:s", mktime(12,0,0,5,31,2019))."<br/>";

// 距离国庆节还有多少天,单位秒 : 今天是2019-05-31,距离国庆节还剩122天
$nationalDay = mktime(0,0,0,10,1,2019);
$currentDay = time();
$remainingDay = floor(abs($nationalDay - $currentDay)/(24*3600));
echo "今天是".date("Y-m-d").",距离国庆节还剩".$remainingDay."天<br/>";
?>
```

> [strtotime](https://www.php.net/manual/zh/function.strtotime.php) : 将任何字符串的日期时间描述解析为 `Unix` 时间戳

- 场景

将英文日期解析成时间戳,比直接解析日期方便,采用自然语义而不是编程语言进行转换日期.

- 说明

本函数预期接受一个包含**美国英语日期格式**的字符串并尝试将其解析为 `Unix` 时间戳（自 `January 1 1970 00:00:00 GMT` 起的秒数,其值相对于 `now` 参数给出的时间,如果没有提供此参数则用系统当前时间.

- 常用格式

```php
// 2019-06-02
echo date("Y-m-d", strtotime("2019-05-31 +2 days"));

// 2019-07-01
echo date("Y-m-d", strtotime("2019-05-31 +1 month"));

// 2019-06-09
echo date("Y-m-d", strtotime("2019-05-31 +1 week 2 days 4 hours 2 seconds"));
```

- 示例

```php
<?php
// 设置当前时区为上海时区
date_default_timezone_set("Asia/Shanghai");

// 获取当前时区
echo "当前时区 : ".date_default_timezone_get()."<br/>";

// 当前日期时间戳
echo "当前日期时间戳: ".time()." <--> ".strtotime("now")." <--> ".date("Y-m-d H:i:s", strtotime("now"))."<br/>";

// 一周后的日期时间: 7 days; 24 hours; 60 mins; 60 secs
$nextWeek = time() + (7 * 24 * 60 * 60);
echo "现在是".date("Y-m-d H:i:s").",下周是".date("Y-m-d H:i:s",$nextWeek)." <--> ".date("Y-m-d H:i:s",strtotime("+1 week"))."<br/>";

echo "现在是".date("Y-m-d H:i:s").",1周2天4小时2秒是".date("Y-m-d H:i:s",strtotime("+1 week 2 days 4 hours 2 seconds"))."<br/>";

echo "现在是".date("Y-m-d H:i:s").",下周三是".date("Y-m-d H:i:s",strtotime("next Thursday"))."<br/>";
?>
```

## 日期时间函总结

日期时间函数库是 `php` 内置的函数库,默认情况下已启用,值得注意的是,日期时间和时区有关,建议首先设置下时区.

纵观日期时间的操作方法,总的来说,可以大致分为两类,一类是给计算机用的,另一类是给人看的.

- 给人看的
    * `date_default_timezone_set("Asia/Shanghai")` : 设置当前脚本使用的时区
    * `date("Y-m-d H:i:s")` : 格式化日期时间
    * `date("Y-m-d", strtotime("2019-05-31 +2 days"))` : 格式化英文描述的日期时间

- 给计算机用的
    * `time()` : 当前时间的秒数
    * `microtime()` : 当前时间的秒数和微秒数
    * `strtotime()` : 将字符串形式的日期时间转换成时间戳

最后,[文档](https://www.php.net/manual/zh/ref.datetime.php)那么齐全,不懂就去多看看,忘记有啥方法全靠 `ide` 智能提示就好,多用用就会慢慢熟练.