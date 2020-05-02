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

## 参考资料

- 在线体验编辑器: [Mermaid Live Editor](https://mermaid-js.github.io/mermaid-live-editor/)
- 流程图官方文档: [Flowcharts - Basic Syntax](https://mermaid-js.github.io/mermaid/#/flowchart)
- `Github` 开源项目地址: [/mermaid-js/mermaid](https://github.com/mermaid-js/mermaid)