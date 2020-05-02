# 快速上手Mermaid流程图

本节主要介绍了如何基于正则表达式构建简单的 `Js` 模板引擎,核心思路在于编写特定的正则表达式识别事先规定语法规则并结合预定义逻辑实现文本替换功能,这也是正则表达式常见的应用场景之一.

通过本节内容你将学习到以下主要内容:

- 模板引擎并没有那么神秘,正则就能搞定;
- 了解正则表达式在项目中扮演怎样的角色;
- 亲自动手造轮子不断优化项目造模板引擎.

## 目录大纲

{% simplemindmap style={'height':'250px','border': '1px solid lightgray;'} %}
```markdown
- 正则表达式其实很强大
    + 什么是JS模板引擎
        - 概念
        - 原理
    + JS模板引擎的实现原理
        - 模板+数据=产品
        - 变静为动+动静结合=灵活可控
        - 正则匹配+数据替换=模板渲染
    + 动手搭建自己的JS模板引擎
        - 需求分析
        - 效果预览
        - 技术选型
        - 模板规则
        - 实现细节
    + 造轮子用到的正则表达式总结
        - 区分普通字符串和模板字符串
        - 基于特定规则匹配模板字符串
```
{% endsimplemindmap %}

## 什么是JS模板引擎

**关键词**

```mardown
- 概念
- 原理
```

---

绘制新的流程图

### 方向

**关键词**

```mardown
- TB
- BT
- LR
- RL
```

> 上下左右的英文首字母大写组合,分别是 `top`, `bottom` ,`left` 和 `right` .
> 例如: `TB` 表示 `top` 和 `bottom` 单词首字母的组合,即从上到下.

```
graph TD
    Start --> Stop
```

`<layout>` 布局方向,其中可选值: `TB` (从上到下),`BT` (从下到上),`LR` (从左往右)和 `RL` (从右往左)四种方向布局.

- TB

> 从上到下: from **T**op to **B**ottom

```
graph TB
    Start --> Stop
```

- BT 

> 从下到上: from **B**ottom to **T**op

```
graph BT
    Start --> Stop
```

- LR

> 从左往右: from **L**eft to **R**ight

```
graph LR
    Start --> Stop
```

- RL

> 从右往左: from **R**ight to **L**eft

```
graph BT
    Start --> Stop
```

### 形状

**关键词**

```mardown
- [矩形]
    + [[暂不支持]]
    + [(圆柱)]
    + [{暂不支持}]
    + [/平行四边形/]
    + [\平行四边形\]
    + [/梯形\]
    + [\梯形/]
- (圆角矩形)
    + ((圆形))
    + ([体育场])
    + ({暂不支持})
- {菱形}
    + {{六边形}}
    + {[暂不支持]}
    + {(暂不支持)}
- >不对称矩形]
```

> 最外层代表主形状,内层辅助修饰,其中 `[]` 表示矩形,`()` 表示圆弧,`{}` 表示尖角(窃以为 `<>` 更适合).

```
graph TD
    id
```

#### 一次性节点

默认属于矩形节点,其内容是 id,适合一次性节点,不存在重复引用的情况.

```
graph TD
    id
```

#### 可重复节点

指定节点形状,其内容是 `<node shape>`,可选值包括: `[]`(矩形) ,`()` (圆角) 和 `{}` (菱形) 等有限组合. 

- 矩形

> `[node description]`

```
graph LR
    id1[This is the text in the box]
```

- 圆角矩形

> `(node description)`

```
graph LR
    id1(This is the text in the box)
```

- 体育场

> `([node description])`

```
graph LR
    id1([This is the text in the box])
```

- 圆柱

> `[(node description)]`

```
graph LR
    id1[(Database)]
```

- 圆形

> `((node description))`

```
graph LR
    id1((This is the text in the circle))
```

- 不对称

- `>node description]`

```
graph LR
    id1>This is the text in the box]
```

- 菱形

> `{node description}`

```
graph LR
    id1{This is the text in the box}
```

- 六角形

> `{{node description}}`

```
graph LR
    id1{{This is the text in the box}}
```

- 平行四边形

> `[/node description/]`

```
graph TD
    id1[/This is the text in the box/]
```

- 另一种平行四边形

> `[\node description\]`

```
graph TD
    id1[\This is the text in the box\]
```

- 梯形

> `[/node description\]`

```
graph TD
    A[/Christmas\]
```

- 另一种梯形

> `[\node description/]`

```
graph TD
    B[\Go shopping/]
```

### 连接线

**关键词**

```mardown
- 实线/虚线(2)
    + --
        - 实线
    + -.
        - 虚线
- 有箭头/无箭头(2)
    + >
        - 有箭头
    + -
        - 无箭头
- 有描述/无描述(4)
    + 实线
        - --描述文字
        - |描述文字|
    + 虚线
        - -.描述文字
        - |描述文字|
- 加粗(1)
    + 实线
        - ==
    + 虚假
        - 不支持
- 组合形式(12+6=18)
    + 无描述实线有箭头(1)
        - -->
    + 无描述实线无箭头(1)
        - ---
    + 无描述虚线有箭头(2)
        - -.->
            + 推荐
        - .->
            + 支持
        - -.>
            + 不支持
    + 无描述虚线无箭头(1)
        - -.-
    + 有描述实线有箭头(2)
        - --描述文字-->
        - -->|描述文字|
    + 有描述实线无箭头(2)
        - --描述文字---
        - ---|描述文字|
    + 有描述虚线有箭头(2)
        - -.描述文字-.->
        - -.->|描述文字|
    + 有描述虚线无箭头(2)
        - -.描述文字-.-
        - -.-|描述文字|
    + 无描述加粗实线有箭头(1)
        - ==>
    + 无描述加粗实线无箭头(1)
        - ===
    + 有描述加粗实线有箭头(2)
        - ==描述文字==>
        - ==>|描述文字|
    + 有描述加粗实线无箭头(2)
        - ==描述文字===
        - ===|描述文字|
```

```
graph LR
    A-->B
```

- 有箭头无描述实线

> `-->`

```
graph LR
    A-->B
```

- 无箭头实线

```
graph LR
    A --- B
```

- 带描述的有箭头实线

> `--connection line description-->`

```
graph LR
    A-- text -->B
```

> `-->|connection line description|`

```
graph LR
    A-->|text|B
```

- 带描述的无箭头实线

> `--connection line description---`

```
graph LR
    A-- This is the text ---B
```

> `---|connection line description|`

```
graph LR
    A---|This is the text|B
```

- 有箭头虚线

> `-.connection line description.->`

```
graph LR
   A-. text .-> B
```

- 有箭头加粗实线

> `==>`

```
graph LR
   A ==> B
```

- 带描述的有箭头加粗实线

> `==connection line description==>`

```
graph LR
   A == text ==> B
```

## 参考资料

- 在线体验编辑器: [Mermaid Live Editor](https://mermaid-js.github.io/mermaid-live-editor/)
- 流程图官方文档: [Flowcharts - Basic Syntax](https://mermaid-js.github.io/mermaid/#/flowchart)
- 本项目托管地址: [/mermaid-js/mermaid](https://github.com/mermaid-js/mermaid)