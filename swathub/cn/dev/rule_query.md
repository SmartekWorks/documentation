查询规则
===

SWATHub使用**查询规则**从页面中检索值。您可以使用保存页面变量的系统操作从网页中检索变量的值，并在后续步骤中使用。

语法
---

查询规则是具有查询条件的JSON的MAP。

```json
{"source":"title"}
```

JSON的MAP包含以下关键字：

* `frame`（可选）：目标窗体的名称或ID。如果未定义关键词，则使用主HTML。当Web程序不使用窗体时，不需要该关键词。
```json
{"frame":"main", "source":"#orderNo", "css_key":"text"}
```
* `source`：元素值的来源。您可以使用下面的值。
 * `url`：网页的URL。您需要使用`query_key`来检索查询字符串的参数值。如果未定义`query_key`，则将返回当前URL。
```json
{"source":"url"}
```
```json
{"source":"url", "query_key":"orderNo"}
```
 * `title`：页面标题。
```json
{"source":"title"}
```
 * `alert`：最后的警告文本出现在先前的操作中。
```json
{"source":"alert"}
```
 * *CSS选择器*：CSS选择器定义页面中的可见节点（必须显示）。您需要使用`css_key`来检索节点的文本或属性。
```json
{"source":"#selectGender", "css_key":"value"}
```
 * *XPath选择器*: XPath选择器定义移动App中的节点。您需要使用`attr`来检索节点的文本或属性。
```json
{"source":"//XCUIElementTypeOther[@name='NotificationShortLookView']","attr":"text"}
```
* `query_key`（可选）：URL查询字符串的参数关键字。仅当`source`为`url`类型时，此关键字有效。
```json
{"source":"url", "query_key":"orderNo"}
```
* `css_key`（可选）：节点的属性名称（`text`可用于检索节点的文本。）。当`source`是一个*CSS选择器字符串*时，此关键字是必需的。
```json
{"source":"#selectGender", "css_key":"value"}
```
* `css_index`（可选）：多个匹配节点中节点索引（从`1`开始）。仅当`source`是一个*CSS选择器字符串*时，才能使用此关键字。
```json
{"source":"input[name='gender']", "css_key":"value", "css_index":2}
```
* `attr` (可选): 节点的属性名称（`text`可用于检索节点的文本。）。当`source`是一个*XPath选择器*时，此关键字是必需的。
```json
{"source":"#XCUIElementTypeTabBar", "attr":"label"}
```
* `comment`（可选）：规则注释。
```json
{"source":"title", "comment":"Use the text of page title.使用页面标题的文本。"}
```

示例
---

* 当前网址中参数`orderNo`的值。
```json
{"source":"url", "query_key":"orderNo"}
```
* 页面名称为`main`的窗体中ID为 `orderNo`的节点文本的值。
```json
{"frame":"main", "source":"#orderNo", "css_key":"text"}
```
* ID为`selectGender`的选择的`value`属性的值。
```json
{"source":"#selectGender", "css_key":"value"}
```
* ID为`btnOrder`的按钮的 `name`属性的值。
```json
{"source":"#btnOrder", "css_key":"name"}
```
* 名称为`gender`的第二个点选框的 `value`属性的值。
```json
{"source":"input[name='gender']", "css_key":"value", "css_index":2}
```
