匹配规则
===

SWATHub通过在网页上声明条件，来寻找所需操作的窗口，决定等待的时间，进行页面的验证。我们使用**匹配规则**来描述网页上的条件。

语法
---

匹配规则是有匹配条件构成包含顺序的JSON数组，例如

```json
[
	{"target":"url", "have_text":"contract"},
	{"target":"title", "equal_text":"Search Results"}
]
```

其中匹配条件是具有以下设置的JSON映射：

* `window`（可选）：符合条件的窗口范围。如果未定义或使用`current`，则使用当前窗口。使用`all`，则表示在所有窗口之内进行匹配。
```json
{"window":"all", "have_text":"SWATHub"}
```
* `frame`（可选）：符合条件的窗体范围。如果未定义或为使用空字符串，则搜索所有窗体。窗体名称或ID设置为与指定值匹配。 （当Web应用程序不使用窗体时，无需定义。）
```json
{"frame":"main", "have_text":"Success"}
```
* `target`（可选）：目标的表达式。可以使用以下值。默认值为`body`。
 * `url`: 页面的URL。（无法匹配窗体网址。建议匹配窗体父级中的*Seletor*目标。）
```json
{"target":"url", "have_text":"contract"}
```
 * `title`: 页面标题。（无法匹配窗体网址。建议匹配窗体父级中的*Seletor*目标。）
```json
{"target":"title", "have_text":"SWATHub"}
```
 * `alert`: 在先前的操作中最后出现的警告的文本。
```json
{"target":"alert", "have_text":"Error"}
```
 * `@variable`: 执行运行时变量@{variable}的文本。
```json
{"target":"@variable", "have_text":"success!"}
```
 * *CSS选择器*:  CSS选择器定义的页面区域。建议使用`body`的默认值，除非在物理页面中实现了多个逻辑页面。
```json
{"target":"#tab1", "have_text":"Logical Page 1"}
```
 * *XPath选择器*: XPath选择器定义的App节点。如果未设置，则缺省使用 `//*`。
```json
{"target":"//XCUIElementTypeTabBar", "have_text":"Home"}
```
* *表达式*: 可以为条件定义几种类型的表达式。
 * `equal_text`: 目标文本应等于指定字符串值。
```json
{"target":"title", "equal_text":"Search Results"}
```
 * `not_equal_text`: 目标文本不应等于指定字符串值。
```json
{"target":"title", "not_equal_text":"Page not Found"}
```
 * `have_text`: 目标文本应包含指定字符串值。 值不能为空。
```json
{"target":"title", "have_text":"Success"}
```
 * `not_have_text`: 目标文本不应包含指定字符串值。值不能为空。
```json
{"target":"title", "not_have_text":"Error"}
```
 * `have_css`: 目标区域应包含在指定值中定义的DOM节点。仅当`target`是CSS选择器时才有效。
```json
{"have_css":{"css":"button#btnOK", "with_text":"Go"}}
```
 * `not_have_css`: 目标区域不应包含在指定值中定义的DOM节点。仅当`target`是CSS选择器时才有效。
```json
{"not_have_css":{"css":"button#btnNG", "with_text":"NG"}}
```
* `comment`（可选）：规则的注释。
```json
{"target":"alert", "have_text":"Error", "comment":"Assert that the error alert appeared."}
```

### DOM节点的定义

`have_css`和`not_have_css`的值是带有以下关键字的JSON的MAP：

* `css`：CSS选择器定义的节点。
```json
{"have_css":{"css":"button.btn-primary"}}
```
* `with_text`（可选）：通过定义节点的`text`应等于字符串值来为`css`提供附加条件。
```json
{"have_css":{"css":"button.btn-primary", "with_text":"Save Changes"}}
```
* `with_part_text`（可选）：通过定义节点的`text`应包含字符串值来为`css`提供附加条件。值不能为空。
```json
{"have_css":{"css":"button.btn-primary", "with_part_text":"Save"}}
```
* `with_value`（可选）：通过定义节点的值应等于字符串值来为`css`提供附加条件。
```json
{"have_css":{"css":"select", "with_value":"1"}}
```
* `with_part_value`（可选）：通过定义节点的值应包含字符串值来为`css`提供附加条件。值不能为空。
```json
{"have_css":{"css":"input[name='username']", "with_part_value":"Foo"}}
```
* `with_href`（可选）：通过定义节点的`href`应等于字符串值来为`css`提供附加条件。由于href来自实际的DOM，因此它是完整的URL，而不是您可能在HTML中定义的相对URL（在这种情况下，请使用具有属性匹配的CSS选择器）。
```json
{"have_css":{"css":"#backLink", "with_href":"http://www.sample.com/"}}
```
* `with_part_href`（可选）：通过定义节点的`href`应包含密钥的字符串值来为`css`提供附加条件。值不能为空。
```json
{"have_css":{"css":"#backLink", "with_part_href":"sample.com"}}
```
* `with_index`（可选）：通过定义匹配节点的索引（从`1`开始）应等于数字值，为`css`提供附加条件。
```json
{"have_css":{"css":"input[name='gender']", "with_index":2, "with_value":"Male"}}
```
* `enabled`（可选）：通过定义是否应启用节点(true/false)来为`css`提供附加条件。
```json
{"have_css":{"css":"#btnBack", "enabled":false}}
```
* `selected`（可选）：通过定义是否应该选择节点来确定`css`的附加条件(true/false)。
```json
{"have_css":{"css":"input[name='gender']", "with_index":2, "selected":true}}
```
* `displayed`（可选）：通过定义是否显示节点(true/false)，为`css`提供附加条件。 默认值为 `true`。
```json
{"have_css":{"css":"button.btn-primary", "displayed":false}}
```

示例
---

* 页面的URL应包含文本 `contract`。
```json
{"target":"url", "have_text":"contract"}
```
* 页面标题应等于文本 `Search Results`。
```json
{"target":"title", "equal_text":"Search Results"}
```
* 运行时，变量@{JavascriptResult}应等于文本`success`
```json
{"target":"@JavascriptResult", "equal_text":"success"}
```
* 页面名称为`main`的窗体应包含文本`Success`
```json
{"frame":"main", "have_text":"Success"}
```
* 该页面应包含ID为`btnOK`的按钮和文本为`Go`的按钮。
```json
{"have_css":{"css":"button#btnOK", "with_text":"Go"}}
```
* 在页面上，ID为`link1`的链接应链接到`http://www.sample.com/`。
```json
{"have_css":{"css":"#link1", "with_href":"http://www.sample.com/"}}
```
* 在页面上，ID为`btnBack`，并处于禁止状态的按钮。
```json
{"have_css":{"css":"#btnBack", "enabled":false}}
```
* 在页面上，ID为`tblPersonel`的表的第二行应包含文本`John`。
```json
{"have_css":{"css":"#tblPersonel tbody tr:nth-child(2)", "with_part_text":"John"}}
```
* 在页面上，应选择名称为`gender`的第二个收音机。
```json
{"have_css":{"css":"input[name='gender']", "with_index":2, "selected":true}}
```
* 在页面上，搜索结果列表中的第二项应包含文本`iPhone 6s`。 如果定义了`elementWaitTimeout`，我们将等到列表可见后再检查其第二项。
```json
{"target":"ul#search_results", "have_css":{"css":"li", "with_index":2, "with_part_text":"iPhone 6s"}}
```
