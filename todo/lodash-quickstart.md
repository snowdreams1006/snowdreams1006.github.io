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

|方法|描述|备注|
|-:-|-:-|-:-|
|`_.chunk(array, [size=1])`|将数组（array）拆分成多个 size 长度的区块，并将这些区块组成一个新数组。|大数组拆分成多个小数组|
|`_.compact(array)`|创建一个新数组，包含原数组中所有的非假值元素。|非 false 数组|
|`_.concat(array, [values])`|创建一个新数组，将array与任何数组 或 值连接在一起。|数组连接|
|`_.difference(array, [values])`|创建一个具有唯一array值的数组，每个值不包含在其他给定的数组中。|数组差集,直接比较.|
|`_.differenceBy(array, [values], [iteratee=_.identity])`|创建一个具有唯一array值的数组，每个值不包含在其他给定的数组中。|数组差集,迭代器比较.|

