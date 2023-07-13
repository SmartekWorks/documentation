浏览器
===

系统操作中的浏览器组件，可以提供跨平台的浏览器相关功能。

访问URL
---

在当前浏览器的Session和窗口中访问指定URL。如果无浏览器Session或窗口时，将会生成一个新的Session或窗口。

#### 输入参数

| 参数 | 说明
| ---- | ----
| URL  | 需要访问的URL，<br>可以使用以`http://`，`https://`，`file://`开头的绝对URL，也可以使用相对URL<sup>1</sup>。

#### 输出结果

无

?> 1. 使用相对URL时需要在外部设置浏览器基准URL。

浏览器获取
---

根据条件获取一个当前已经打开的浏览器Session。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 匹配规则 | 用来寻找满足条件窗口的规则，<br>使用[匹配规则](rule_matching)。如果不指定时使用`[]`。

#### 输出结果

无


浏览器动作
---

使用浏览器的导航功能<sup>1</sup>。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 动作 | 浏览器导航的动作，使用`前一页`，`后一页`或`刷新当前页`。

#### 输出结果

无

?> 1. 由于驱动的限制Safari浏览器尚不支持此功能。

窗口控制
---

浏览器存在多窗口时，寻找目标窗口，并切换目标窗口到当前，或者关闭目标窗口。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 窗口名称 | （可选）目标窗口的名称，使用空白来忽略这个匹配条件<sup>1</sup>。
| 匹配规则 | 用来寻找满足条件窗口的规则，<br>使用[匹配规则](rule_matching)。如果不指定时使用`[]`<sup>1</sup>。
| 动作类型 | 使用`激活`把目标窗口切换到当前，`关闭`来关闭窗口。

#### 输出结果

无

?> 1. 当窗口名称和匹配规则同时指定的话，目标窗口需要同时满足这两个条件。若都没有指定，则使用当前窗口为目标窗口。

执行Javascript
---

在浏览器的当前窗口中执行Javascript脚本。

#### 输入参数

| 参数 | 说明
| ---- | ----
| Javascript | 所要执行的Javascript脚本。
| 变量名 | （可选）保存Javascript脚本返回值的变量名。使用空白表示不保存。

#### 输出结果

无

保存页面变量
---

在浏览器的当前窗口寻找到所需简单数据<sup>1</sup>并保存到变量中。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 查询规则 | 寻找所需数据的规则，使用[查询规则](rule_query)。
| 变量名 | 保存数据的变量名。

#### 输出参数

无

?> 1. 简单数据是指单条字符串，如果需要复杂数据，可以使用[网页数据抓取](sop_webapp#网页数据抓取)。

执行WebDriver命令
---

针对某些不符合HTML5规范的古早网站，Web模板可能无法很好的匹配其中的交互元素。此时可以通过执行WebDriver命令的方式，来直接控制这些元素。

#### 输入参数

| 参数 | 说明
| ---- | ----
| WebDriver命令 | JSON数组格式的命令集合。缺省为`[]`。
| 变量名 | （可省略）命令执行之后的返回值，可以传递给这个变量名。

每一个WebDriver命令是一个JSON对象，其中包含了以下的属性：
* `command`：操作命令，目前支持`click`, `sendKeys`和`selectFrame`。
* `target`: 目标元素。使用JSON对象方式来描述，其中可能包含以下的属性：
  * `id`：元素的id。
  * `name`：元素的name。
  * `css`：元素的CSS选择器。
  * `text`：通过文本来过滤多个元素。
  * `index`：通过序列号来过滤多个元素。从`1`开始。
  * `handle`：自定义的frame序列号，通过`-`分割的数字组合来定义。比如`1-3`，代表首先定位到根网页下的第一个子frame，然后定位到该frame下的第三个子frame。
* `value`：设定值。如`sendKeys`命令中输入的文本值。

如下所示，这是一个输入用户名，密码，然后点击登录按钮的命令集合的例子：

```
[
  {
    "command": "selectFrame",
    "target": {
      "name": "mainFrame"
    }
  },
  {
    "command": "sendKeys",
    "target": { "name": "username" },
    "value": "swathub"
  },
  {
    "command": "sendKeys",
    "target": { "css": "input[type=password]" },
    "value": "password"
  },
  {
    "command": "click",
    "target": { "css": "button.primary", "text": "登录" }
  }
]
```

#### 输出结果

无