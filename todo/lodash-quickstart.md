# lodash快速入门

> 是一个一致性、模块化、高性能的 JavaScript 实用工具库。: [https://www.lodashjs.com/](https://www.lodashjs.com/)

```js
_.defaults({ 'a': 1 }, { 'a': 3, 'b': 2 });
// → { 'a': 1, 'b': 2 }
_.partition([1, 2, 3, 4], n => n % 2);
// → [[1, 3], [2, 4]]
```

## 为什么选择 Lodash

Lodash 通过降低 array、number、objects、string 等等的使用难度从而让 JavaScript 变得更简单。
Lodash 的模块化方法 非常适用于：

- 遍历 array、object 和 string
- 对值进行操作和检测
- 创建符合功能的函数

## 安装

- 浏览器环境

```js
<script src="lodash.js"></script>
```

- nodejs 环境

```js
npm i --save lodash
```

```js
// Load the full build.
var _ = require('lodash');
// Load the core build.
var _ = require('lodash/core');
// Load the FP build for immutable auto-curried iteratee-first data-last methods.
var fp = require('lodash/fp');
 
// Load method categories.
var array = require('lodash/array');
var object = require('lodash/fp/object');
 
// Cherry-pick methods for smaller browserify/rollup/webpack bundles.
var at = require('lodash/at');
var curryN = require('lodash/fp/curryN');
```

## 使用

### 数组 Array

|推荐指数|方法|描述|备注|详情|
|-:-|-:-|-:-|-:-|-:-|
|&#9733;&#9733;&#9733;&#9733;&#9733;|`_.chunk(array, [size=1])`|将数组（array）拆分成多个 size 长度的区块，并将这些区块组成一个新数组。|大数组拆分成多个小数组|[lodash.chunk](https://www.lodashjs.com/docs/lodash.chunk)|
||`_.compact(array)`|创建一个新数组，包含原数组中所有的非假值元素。|非 false 数组|[lodash.compact](https://www.lodashjs.com/docs/lodash.compact)|
||`_.concat(array, [values])`|创建一个新数组，将array与任何数组 或 值连接在一起。|数组连接|[lodash.difference](https://www.lodashjs.com/docs/lodash.difference)|
|&#9733;&#9733;&#9733;&#9733;&#9733;|`_.difference(array, [values])`|创建一个具有唯一array值的数组，每个值不包含在其他给定的数组中。|数组差集,直接比较.|[lodash.difference](https://www.lodashjs.com/docs/lodash.difference)|
|&#9733;&#9733;&#9733;&#9733;&#9733;|`_.differenceBy(array, [values], [iteratee=_.identity])`|创建一个具有唯一array值的数组，每个值不包含在其他给定的数组中。|数组差集,迭代器比较.|[lodash.differenceBy](https://www.lodashjs.com/docs/lodash.differenceBy)|
|&#9733;&#9733;&#9733;&#9733;&#9733;|`_.differenceWith(array, [values], [comparator])`|创建一个具有唯一array值的数组，每个值不包含在其他给定的数组中。|数组差集,迭代器比较.|[lodash.differenceWith](https://www.lodashjs.com/docs/lodash.differenceWith)|
||`_.drop(array, [n=1])`|创建一个切片数组，去除array前面的n个元素。|数组子集.|[lodash.drop](https://www.lodashjs.com/docs/lodash.drop)|
||`_.dropRight(array, [n=1])`|创建一个切片数组，去除array尾部的n个元素。|数组子集.|[lodash.dropRight](https://www.lodashjs.com/docs/lodash.dropRight)|
||`_.dropRightWhile(array, [predicate=_.identity])`|创建一个切片数组，去除array中从 predicate 返回假值开始到尾部的部分。|数组子集.|[lodash.dropRightWhile](https://www.lodashjs.com/docs/lodash.dropRightWhile)|
||`_.dropWhile(array, [predicate=_.identity])`|创建一个切片数组，去除array中从起点开始到 predicate 返回假值结束部分。|数组子集.|[lodash.dropWhile](https://www.lodashjs.com/docs/lodash.dropWhile)|
||`_.fill(array, value, [start=0], [end=array.length])`|使用 value 值来填充（替换） array，从start位置开始, 到end位置结束（但不包含end位置）。|填充数组.|[lodash.fill](https://www.lodashjs.com/docs/lodash.fill)|
|&#9733;&#9733;&#9733;&#9733;&#9733;|`_.findIndex(array, [predicate=_.identity], [fromIndex=0])`|返回第一个通过 predicate 判断为真值的元素的索引值（index），而不是元素本身。|填充数组.|[lodash.findIndex](https://www.lodashjs.com/docs/lodash.findIndex)|

