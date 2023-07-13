Web建模模版
===

概述
---

SWATHub使用**Web建模模版**来描述网页的用户交互模型。我们可以自定义模板，以适应不同类型的Web前端库。

### 自定义Web建模模版的目的
在某些情况下，默认的Web建模模版无法正确识别页面操作。为了创建用户友好的Web交互模型并使测试场景的构建更加简单，我们需要自定义Web建模模版。以下是可能会遇到的一些情况:

* 添加由非交互HTML标签构成的操作。当使用JavaScript或UI库使非交互式HTML标签（例如div）互动时，自定义通常是必要的。
* 更改默认操作大小。通常，默认Web建模模版将根据一般可用性提取适当大小的操作。但是，有时您可能希望将多个操作合并为一个较大的操作，或者将一个操作拆分为几个较小的操作。
* 更改有关如何定位操作和执行中的节点的策略。由于通常是在动态页面而不是静态页面上执行的，因此您需要一个定位策略以实现可靠的自动化。由于大多数Web应用程序都没有良好的统一定位策略，例如使用`id`和`name`，因此您可能需要为不同节点，知识规则中的操作设置不同的定位策略。
* 更改如何获取操作和节点名称的策略。在提取操作和节点时，SWATHub会尝试从HTML获取对象名称的标签。您可以将默认策略更改为更适合您的Web应用程序的策略。

### 如何自定义Web建模模版
模板定制在SWATHub GUI中完成。请按照以下步骤开始调整:

* 选择要自定义的页面，在下拉菜单上单击**<i class="fa fa-gears"></i> 设置**，然后在弹出对话框中找到当前Web建模模版。
* 单击**自定义模板**，您将进入模板编辑器。在此编辑器中，可以根据[Web建模模版语法](#语法)修改模板<sup>1</sup>，在一个或多个页面上预览以检查其效果，最后将其应用于多个页面。

?> 1. 我们还提供在线技术支持，以指导您如何编写更好的模板。请单击**<i class="fa fa-support"></i>**图标以请求我们的定制服务，我们将帮助您在此模板编辑器内完成工作。

### 语法
Web建模模版是一个JSON的MAP，其中包含几个用于定义以下组件的键。每个组件的语法细节将在后面说明。

```json
{
	"imports":[],
	"operations":[],
	"collectionNodes":{},
	"singleNodes":{},
	"labelPolicies":{},
	"locatorPolicies":{},
	"settings":{}
}
```

* `"imports"`：SWATHub提供可以导入和重用的模板库。
* `"operations"`：操作是一个特殊的collectionNode，它将最终作为页面知识的操作提取出来。
* `"collectionNodes"`：集合节点是一组具有一定关系的单节点或其他集合节点，例如，您需要一个一个地交互的形式的几个输入，一个链接列表中的几个链接，您需要从列表中选择一个。
* `"singleNodes"`：单节点是我们在操作中需要交互的原子交互节点，例如输入框，按钮等。
* `"labelPolicies"`：命名策略定义了在生成页面知识时如何为单个节点和集合节点检索标签。
* `"locatorPolicies"`：定位策略定义如何在执行中定位单个节点和集合节点。
* `"settings"`：总体设置影响模板中的所有操作。

只要没有被模板中被引用到，以上所有组件都是可选的。例如，由`collectionNodes`聚合的所有`singleNodes`应该存在于模板本身或导入的库中。这也适用于任何节点中使用的`labelPolicies`或`locatorPolicies`。

核心组件
---

### 导入
导入定义Web建模模版中包含的模板库。导入的库中定义的所有组件都可以重复使用。

```json
{
	"imports":[
		{"name":"html5", "version":"1.0.0"}
	]
}
```

每个模板均由其名称和版本定义<sup>1</sup>。

* `"name"`: 模板库的唯一名称。
* `"version"`: 模板库的版本。

?> 1. 在本文结尾处可以引用标准的html5 v1.0.0模板库。

### 单节点
单个节点定义为JSON的MAP，其中包含用于节点的节点代码的键和用于定义的值。可以从集合节点的定义中引用该节点代码。下面是示例。

```json
{
	"singleNodes":{
		"link":{"selectors":["a[href]", "area[href]"], "decisive":true, "action":"click", "label":"link", "locator":"link"},
		"radio":{"selectors":["input[type=radio]"], "decisive":false, "action":"click", "label":"fieldRight", "locator":"field", "group":{"by":"name", "label":"group", "locator":"group"}},
	}
}
```

单个节点的定义是一个JSON的MAP，其中包含以下键的值:

* `"selectors"`：在HTML DOM中定义节点的CSS选择器的JSON列表。
* `"decisive"`：`true`或`false`指示节点是否将完成操作。例如，通常将`true`用于按钮，将`false`用于文本框。
* `"action"`：指示节点交互类型的操作代码。请参考下面的操作代码表。
* `"label"`（可选）：命名策略代码，指示应该对节点使用哪种命名策略。
* `"locator"`（可选）：定位策略代码，指示该节点应使用哪种定位策略。
* `"group"`（可选）：一个JSON Map，定义如何对单个节点（例如一组单选按钮和复选框）进行分组。该定义包含以下键的值。
 * `"by"`（可选）：用于对节点进行分组的属性名称。默认情况下使用`"name"`。
 * `"label"`（可选）：标记整个组的策略代码。
 * `"locator"`（可选）：整个组的定位策略代码。

动作代码表:

| 动作            |  说明
| --------------- | -----------
| `"type"`        | 在节点中输入一些文本，例如文本输入。
| `"upload"`      | 在节点中设置文件路径，例如文件输入。
| `"select"`      | 选择节点，例如选择的选项。
| `"check"`       | 检查节点，例如复选框。
| `"click"`       | 单击节点，例如按钮。
| `"moveTo"`      | 将鼠标光标移动到节点（例如悬停按钮）。
| `"rightClick"`  | 右键单击该节点，例如带有上下文菜单的链接。
| `"doubleClick"` | 双击节点，例如具有双击交互作用的区域。
| `"scriptClick"` | 单击由JavaScript实现。


### 集合节点
集合节点定义为JSON的MAP，其中包含用于节点的节点代码的键和用于定义的值。可以从操作或集合节点的定义中引用节点代码。下面是示例：

```json
{
	"collectionNodes":{
		"form":{"selectors":["*"],"children":["text", "textarea", "upload", "checkbox", "radio", "select", "multiSelect", "buttonGroup"], "action":"and", "label":"block", "locator":"block"},
		"buttonGroup":{"selectors":["*"], "children":["button", "link"], "action":"or", "label":"block", "locator":"block"},
	}
}
```

集合节点的定义是一个JSON的MAP，其中包含以下键的值：

* `"selectors"`：在HTML DOM中定义节点的CSS选择器的JSON列表。您可以使用 `"*"`来表示与父节点或操作相同。
* `"children"`：包含在集合节点中的单个节点或集合节点的JSON列表。
* `"action"`：指示交互类型的操作代码。请参考下面的操作代码表。
* `"label"`（可选）：命名策略代码，指示应该对节点使用哪种命名策略。
* `"locator"`（可选）：定位策略代码，指示该节点应使用哪种定位策略。

以下是动作代码表:

| 动作       |  说明
| --------- | -----------
| `"and"`   | 与每个子节点进行互动。
| `"or"`    | 从子节点中选择一个子节点并与其进行交互。
| `"multi"` | 从子节点中选择几个子节点并与之交互。该动作仅在`multi-select`（多选）中使用。


### 集合节点（重复）
在集合节点中，您可以定义一种特殊的集合节点，其中包含重复的通常是动态的节点，例如带有不同数据行的表或搜索结果列表。下面是示例：

```json
{
	"collectionNodes":{
		"list":{"selectors":["ul", "ol"], "children":["list-unit"], "action":"or", "repetitive":true, "similarity":0.90, "combination":2, "percentage":0.5},
		"list-unit":{"selectors":["li"], "children":["buttonGroup"], "action":"and"},
	}
}
```

重复集合节点定义中存在一些差异。首先，您必须在集合中定义父集合节点和子集合节点。其次，您不需要定义`"label"`或`"locator"`，因为处理重复集合节点的机制完全不同<sup>1</sup>。最后，您需要定义值以跟随父节点中的新键。

* `"repetitive"`：在父级重复集合节点中，该值应始终为`true`。
* `"similarity"`：从`0`到`1`的浮点数，表示是否认为相似的子节点是重复的。越大越严格。
* `"combination"`：从`1`到`9`的整数，表示可以将几个相邻子节点组合为一个重复单元。例如，如果您将两个`tr`与`row-span = 2`一起使用来在表中创建逻辑行，则可能需要将组合设置为`2`。
* `"percentage"`：从`0`到`1`的浮点数，指示是否认为父节点是重复的集合节点。重复子节点/所有子节点必须大于值，以使父节点成为有效的重复节点。

?> 1. 重复节点的定义非常复杂。我们建议您从默认模板开始，并在修改之前进行一些实验。

### 操作
操作定义为操作定义的JSON列表。由于知识引擎将按顺序分析操作，因此您也应该注意顺序。下面是示例：

```json
{
	"operations":[
		{"selectors":["form", "table"], "collectionNode":"form", "nesting":"outer"},
		{"selectors":["map", "ul", "ol", "dl", "nav", "div", "a", "button"], "collectionNode":"buttonGroup", "nesting":"inner"},
	]
}
```

操作的定义是JSON的MAP，其中包含以下关键字的值:

* `"selectors"`：CSS选择器的JSON列表，用于定义HTML DOM中的操作搜索区域。
* `"collectionNode"`：要在操作搜索区域中作为操作提取的Collection节点。
* `"nesting"`：`inner`表示从DOM树的底部搜索操作，而`outer`表示从DOM树的顶部搜索。例如，如果`"selectors"`包含嵌套的`"div"`，则结果将受到该值的影响。
* `"collectionNodes"`（可选）：操作范围中定义的集合节点。
* `"singleNodes"`（可选）：操作范围中定义的单个节点。
* `"labelPolicies"`（可选）：在操作范围中定义命名策略。
* `"locatorPolicies"`（可选）：在操作范围中定义的定位策略。
* `"settings"`（可选）：操作范围中定义的设置。

### 模板作用范围
模板内部有三级作用范围，用于定义组件对操作的可见性。

* 模版范围：导入的模板库中定义的组件可由模板中的所有操作引用，格式为**{模板名称}.{组件代码}**，例如`html5.text`或`html5.form`。
* 规则范围：模板中定义的组件可以由所有操作及其**{组件代码}**引用。
* 操作范围：在一个特定操作中定义的组件只能由该操作的**{组件代码}**单独使用。如果模板中存在重复的代码，则操作范围将覆盖模板范围。

这是具有所有三个级别范围的示例模板。

```json
{
	"imports":[
		{"name":"html5", "version":"1.0.0"}
	],
	"operations":[
		{"selectors":["div.template-form"], "collectionNode":"html5.form", "nesting":"outer"},
		{"selectors":["div.rule-form"], "collectionNode":"rule-form", "nesting":"outer"},
		{
			"selectors":["div.operation-form"],
			"collectionNode":"operation-form",
			"nesting":"outer",
			"collectionNodes":{
				"operation-form":{"selectors":["*"], "children":["html5.text", "my-button"], "action":"and", "label":"html5.block", "locator":"html5.block"}
			},
			"singleNodes":{
				"my-button":{"selectors":["span[onclick]"], "decisive":"true", "action":"click", "label":"html5.button", "locator":"html5.button"}
			}
		}
	],
	"collectionNodes":{
		"rule-form":{"selectors":["*"], "children":["html5.text", "my-button"], "action":"and", "label":"html5.block", "locator":"html5.block"}
	},
	"singleNodes":{
		"my-button":{"selectors":["td[onclick]"], "decisive":"true", "action":"click", "label":"html5.button", "locator":"html5.button"}
	}
}

```

在上面的模板中，定义了三个操作。每个操作代表一个特定的范围。

* `"div.template-form"`：它将从网页中识别HTML5模板规则定义的`"html5.form"`集合节点。
* `"div.rule-form"`：它将识别当前规则中以下集合节点定义的`"rule-form"`。它的子项包括来自模板的`"html5.text"` 和来自规则中单个节点定义的`"my-button"`。
* `"div.operation-form"`：它将识别在此操作闭包中定义的`"operation-form"`，并将其`"html5.text"`和`"my-button"`作为其子级。显然，`"my-button"`代表`"span[onclick]"`。


辅助组件
---

### 命名策略
每个条目代表一个带有命名策略的策略代码，该策略代码可以在节点定义中引用。这是示例:

```json
{
	"labelPolicies":{
		"fieldLeft":["label", "prevSibling", "parentPrevSibling", "parentTdPrevSibling", "alt", "title", "id", "name", "placeholder", "value"],
		"fieldRight":["label", "nextSibling", "parentNextSibling", "alt", "title", "id", "name", "placeholder", "value"],
		"button":["label", "alt", "title", "value", "text", "id", "name"],
	}
}
```

每个命名策略依次包含一系列标签机制。所有这些机制将按顺序进行处理，直到返回非空字符串为止。详细说明可参考以下内容:

|           机制			|  说明
| --------- 				| -----------
| `"label"` 				| 与目标节点相对应的`<label>`节点的文本。目标节点的`id`值应与`<label>`节点的`for`值相同。
| `"text"` 					| 仅获取目标节点拥有的文本，否则获取所有子级的合并文本。
| `"prevSibling"`   		| DOM树中前一个兄弟节点的文本。
| `"nextSibling"`   		| DOM树中前一个兄弟节点的文本。
| `"parentPrevSibling"`   	| 目标父节点在DOM树中的前一个同级节点的文本。
| `"parentNextSibling"`  	| DOM树中目标父节点的下一个同级节点的文本。
| `"parentTdPrevSibling"`   | 上一个`<td>`节点的文本，该文本对应于DOM树中包含目标父节点的最近的`<td>`。
| `"imgChild"` 				| `<img>` 子节点的`alt`或`title`或`id`值。
| `"firstChild"`   			| 第一个子节点的文本。
| `"alt"`   				| 目标节点的属性`alt`的值。
| `"title"`   				| 目标节点的属性`title`的值。
| `"id"`	   				| 目标节点的属性`id`的值。
| `"name"`   				| 目标节点的属性`name`的值。
| `"placeholder"`  			| 目标节点的属性`placeholder`的值。
| `"value"`   				| 目标节点的属性`value`的值。

### 定位策略
定位策略定义为JSON的MAP。每个条目代表一个单独的定位策略，其关键字为策略代码，可在节点定义中引用。这是样本:

```json
{
	"locatorPolicies":{
		"field":["name", "id", "label", "xpath"],
		"button":["id", "name", "value", "label", "xpath"],
		"link":["id", "label", "xpath"],
	}
}
```

每个定位策略依次包含一系列原子定位机制。所有这些机制将按顺序进行处理，直到可以唯一定位该节点为止。前一个机制的输出节点将充当下一个机制的输入。详细说明可参考以下内容:

|           机制|  说明
| --------- 	| -----------
| `"name"` 		| 获取与目标节点`name`相同的节点。
| `"id"` 		| 获取与目标节点具有相同`id`的节点。
| `"value"`		| 获取与目标节点具有相同`value` 的节点。
| `"class"`		| 获取与目标节点具有相同`class`的节点。
| `"xpath"`		| 获取与目标节点具有相同`xpath`的节点。这里的`xpath`是相对于其父级操作知识树的一个。
| `"label"`		| 获取与目标节点具有相同`label`的节点。这里的`label`是其标签政策生成的标签。


### 模版设置
有几种全局设置可以影响模板中所有操作的行为。

* `locatorRelation`（可选）：`or`或`and`表示定位策略中所有原子定位机制的关系。在这里，`or`表示一直定位，直到通过任何原子机制找到该节点为止，而`and`表示如果一种定位机制告诉该节点不存在，则停止定位。例如，关于下面的此输入节点：
```html
<input id='foo' name='bar' type='text'>
```
```json
{
	"locatorPolicies":{
		"input":["id", "name"],
	}
}
```
`or`将通过`id=foo`或`name=bar`在网页中定位此节点，但如果没有输入ID为`foo`的输入节点，则`and`将确定此节点丢失。默认关系是`and`，以确保定位器精度。
* `matchAllFrames`（可选）：`true` 或`false`表示在页面升级期间是否匹配所有帧中的操作。默认值为`false`，这要求匹配的操作必须具有相同的帧层次。
* `extAttributes`（可选）：节点的扩展HTML属性，例如基于Angular的网页中的`ng-*`属性。它是一个映射，其键是扩展属性的名称，其值是具有以下键的映射。默认值为`{}`。
  * `attr`：属性名称。例如 `ng-model`, `id`，以及 `text`。
  * `axis`：（可选）锚操作，以当前节点为基准选择关联节点。例如 `parent/preceding-sibling[2]`，`child[3]`。目前支持 `parent`, `following-sibling`, `preceding-sibling` 和 `child` 4种操作及其组合。
  * `pattern`（可选）：正则表达式以获得有效值，例如，`^[a-z]{16}(.+?)$` 将忽略前16个字符，并获得其余的值。

```json
{
	"extAttributes":{
		"realId":{
			"attr":"id",
			"pattern":"^field[a-z]{16}(.+?)$"
		}
	}
}
```
上面的设置将基于节点ID生成扩展属性`readId`。
* `extLabelPolicies`（可选）：扩展命名策略。它是一个映射，其键是扩展命名策略的名称，其值是带有以下键的映射。默认值为`{}`。
  * `selector`：CSS选择器以查找带有标签的节点。它内部可以有变量，形式为`@{attr}`。例如，`div[id~=^[a-z]{16}@{id}$]`将找到第一个div节点，其ID以目标节点的ID结尾。
  * `attr`（可选）：获取找到的节点的属性作为标签。如果未设置，将使用节点的文本。

```json
{
	"extLabelPolicies":{
		"divLabel":{
			"selector":"div[id~=^label[a-z]{16}@{realId}$]"
		}
	}
}
```
上面的设置将找到与目标节点具有相同 `realId`的第一个div节点，并将其文本作为标签。

实例探究
---

### 查询对话框
默认Web建模模版利用标准HTML规范，有时需要扩展，尤其是在将某些UI库引入网站时。这是一个流行的[jQuery UI dialog](http://jqueryui.com/dialog/#modal-form) 的屏幕截图以及该对话框的HTML代码段：

![jQuery UI dialog](../assets/img/dev-template-sample-1.png 'jQuery UI dialog')

```html
<div class="ui-dialog ui-widget">
	<div class="ui-dialog-titlebar"><span id="ui-id-1" class="ui-dialog-title">Create new user</span></div>
	<div id="dialog-form" class="ui-dialog-content ui-widget-content">
		<form>
			<fieldset>
				<label for="name">Name</label><input type="text" id="name" name="name">
				<label for="email">Email</label><input type="text" id="email" name="email">
				<label for="password">Password</label><input type="password" id="password" name="password">
			</fieldset>
		</form>
	</div>
	<div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
		<div class="ui-dialog-buttonset">
			<button type="button"><span class="ui-button-text">Create an account</span></button>
			<button type="button"><span class="ui-button-text">Cancel</span></button>
		</div>
	</div>
</div>
```

 对于上述HTML，默认模板将提取`<form>`块作为一项操作，提取`<div class="ui-dialog-buttonset">`块作为另一项操作。但是，我们倾向于将对话框中的所有元素组合，只需对现有模板进行如下微小修改即可实现此魔术。

```json
{
	"operations":[
		{"selectors":["div.ui-dialog", "form", "table"], "collectionNode":"html5.form", "nesting":"outer"}
	]
}
```

?> 请注意，`"div.ui-dialog"`必须位`"form"`之前，以便所有子元素都可以被吸收。

作为上述情况的进一步步骤，现在将对话框视为`form`，但这还不够，因为我们想针对此类对话框创建更加个性化的模板。因此，我们需要分别创建操作规则，集合节点规则和命名策略。

```json
{
	"operations":[
		{
			"selectors":["div.ui-dialog"], "collectionNode":"ui-dialog", "nesting":"outer",
			"collectionNodes":{
				"ui-dialog":{"selectors":["*"],"children":["html5.text", "html5.buttonGroup"], "action":"and", "label":"firstChild", "locator":"html5.block"}
			},
			"labelPolicies":{
				"firstChild":["firstChild"],
			}
		}
	]
}
```

因此，我们创建了一种新型的操作，它由一个`ui-dialog`集合节点组成。该集合节点具有多个文本字段和一组按钮，其第一个子文本为标签：在这种情况下，相应地为`"Create new user"`。

### Kendo UI下拉列表

Kendo UI等现代前端框架将使用自定义控件来模拟标准`select`的行为，从而增强其外观。通常的方法是将`select`分为可点击的文本字段和带有所有选项的列表容器。这是[Kendo UI dropdown list](http://demos.telerik.com/kendo-ui/dropdownlist/index)的屏幕截图和HTML代码段。

![Kendo UI dropdown list](../assets/img/dev-template-sample-2.png 'Kendo UI dropdown list')

可点击文本字段的代码段。

```html
<form>
	<h4>Cap Color</h4>
	<span title="" style="width: 100%;" class="k-widget k-dropdown k-header" unselectable="on" role="listbox">
		<span unselectable="on" class="k-dropdown-wrap k-state-default">
			<span unselectable="on" class="k-input">Black</span>
			<span unselectable="on" class="k-select">
				<span unselectable="on" class="k-icon k-i-arrow-s">select</span>
			</span>
		</span>
		<input id="color" value="1" style="width: 100%; display: none;" data-role="dropdownlist">
	</span>
</form>
```

可选列表容器的代码段。

```html
<div class="k-list-container k-popup k-group k-reset" id="color-list" data-role="popup">
	<div class="k-group-header" style="display:none"></div>
	<div class="k-list-scroller" style="height: auto;">
		<ul class="k-list k-reset" tabindex="-1" id="color_listbox" data-role="staticlist" role="listbox">
			<li tabindex="-1" role="option" class="k-item k-state-selected k-state-focused" id="black">Black</li>
			<li tabindex="-1" role="option" class="k-item" data-offset-index="1">Orange</li>
			<li tabindex="-1" role="option" class="k-item" data-offset-index="2">Grey</li>
		</ul>
	</div>
</div>
```

默认Web建模模版既不会捕获可点击的文件，也不会捕获可选择的列表，因为没有标准的交互元素，例如`input`，`a` 或`button`。因此，我们首先需要创建新的元素或单个节点，然后创建新的集合节点和操作。

这是表单内可点击文本字段的Web建模模版。它将把`"k-dropdown"`小部件当作一个按钮，将`"Cap Color"` 指定为其标签，然后将其集成到定制的集合节点`"myButtonGroup"`中。

```json
{
	"operations":[
		{
			"selectors":["form"], "collectionNode":"myForm", "nesting":"outer",
			"collectionNodes":{
				"myForm":{"selectors":["*"],"children":["html5.text", "html5.radio", "html5.checkbox", "myButtonGroup"], "action":"and"},
				"myButtonGroup":{"selectors":["*"], "children":["html5.button", "html5.link", "dropdownButton"], "action":"or"}
			},
			"singleNodes":{
				"dropdownButton":{"selectors":[".k-dropdown"], "decisive":true, "action":"click", "label":"html5.fieldLeft", "locator":"html5.button"}
			}
		}
	]
}
```

这是可选列表的Web建模模版。它将`"li[role=option]"`视为可单击选项，将`"k-list-container"`视为选择器。

```json
{
	"operations":[
		{
			"selectors":[".k-list-container"], "collectionNode":"optionGroup", "nesting":"outer",
			"collectionNodes":{
				"optionGroup":{"selectors":["*"],"children":["optionButton"],"action":"or"}
			},
			"singleNodes":{
				"optionButton":{"selectors":["[role=option]"],"action":"click","decisive":true}
			}
		}
	]
}
```

### jqGrid

Grid是用于业务系统的常见复杂控件。在此，我们提出一个流行的框架[jqGrid](http://www.trirand.com/blog/jqgrid/jqgrid.html)作为示例，以说明SWATHub如何将网格识别为重复行的列表，并将每一行识别为表单。首先，让我们看一下jqGrid的屏幕截图和代码片段。

![jqGrid](../assets/img/dev-template-sample-3.png 'jqGrid')

```html
<div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_list4" dir="ltr" style="width: 700px;">
    <div class="ui-jqgrid-view" id="gview_list4" style="width: 700px;">
        <div class="ui-jqgrid-titlebar">
    		<span class="ui-jqgrid-title">Manipulating Array Data</span>
		</div>
        <div class="ui-jqgrid-hdiv" style="width: 700px;">
            <div class="ui-jqgrid-hbox">
                <table class="ui-jqgrid-htable" style="width:682px" role="grid" aria-labelledby="gbox_list4" cellspacing="0" cellpadding="0" border="0">
                </table>
            </div>
        </div>
        <div class="ui-jqgrid-bdiv" style="height: 250px; width: 700px;">
            <div style="position:relative;">
                <table id="list4" class="ui-jqgrid-btable" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid">
                    <tbody>
                        <tr role="row" id="1" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                            <td role="gridcell" style="text-align:center;"
                                <input role="checkbox" type="checkbox" id="jqg_list4_1" class="cbox">
                            </td>
                            <td role="gridcell" title="1">1</td>
                            <td role="gridcell" title="2007-10-01">2007-10-01</td>
                            <td role="gridcell" title="test">test</td>
                            <td role="gridcell" title="200.00">200.00</td>
                            <td role="gridcell" title="10.00">10.00</td>
                            <td role="gridcell" title="210.00">210.00</td>
                            <td role="gridcell" title="note">note</td>
                        </tr>
                        <tr role="row" id="2" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                            <td role="gridcell" style="text-align:center;"
                                <input role="checkbox" type="checkbox" id="jqg_list4_2" class="cbox">
                            </td>
                            <td role="gridcell" title="2">2</td>
                            <td role="gridcell" title="2007-10-02">2007-10-02</td>
                            <td role="gridcell" title="test2">test2</td>
                            <td role="gridcell" title="300.00">300.00</td>
                            <td role="gridcell" title="20.00">20.00</td>
                            <td role="gridcell" title="320.00">320.00</td>
                            <td role="gridcell" title="note2">note2</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="ui-jqgrid-resize-mark" id="rs_mlist4">&nbsp;</div>
</div>
```

通常，网格具有标题和主体，因此我们将创建两个操作以将标题识别为表单，将主体识别为具有重复行的表。关于使用网格主体自动化，我们需要首先使用文本或索引来定位该行，然后操作将与表单完全相同。

```json
{
	"operations":[
		{"selectors": ["div.ui-jqgrid-hdiv"], "collectionNode":"html5.form", "nesting":"outer"},
		{"selectors": ["div.ui-jqgrid-bdiv"], "collectionNode":"html5.table", "nesting":"outer"},
	]
}
```

HTML5模板
---

系统自带的HTML5的Web建模模版利用了标准HTML规范，并根据SWATHub惯例适用于大多数网页。

```json
{
	"name":"html5",
	"version":"1.0.0",

	"operations":[
		{"selectors":["form", "table"], "collectionNode":"form", "nesting":"outer"},
		{"selectors":["map", "ul", "ol", "dl", "nav", "div", "a", "button"], "collectionNode":"buttonGroup", "nesting":"inner"}
	],

	"collectionNodes":{
		"form":{"selectors":["*"],"children":["text", "textarea", "upload", "checkbox", "radio", "select", "multiSelect", "buttonGroup"], "action":"and", "label":"block", "locator":"block"},
		"buttonGroup":{"selectors":["*"], "children":["button", "link"], "action":"or", "label":"block", "locator":"block"},
		"select":{"selectors":["select:not([multiple])"], "children":["option"], "action":"or", "label":"fieldLeft", "locator":"field"},
		"multiSelect":{"selectors":["select[multiple]"], "children":["option"], "action":"multi", "label":"fieldLeft", "locator":"field"},

		"list":{"selectors":["ul", "ol"], "children":["list-unit"], "action":"or", "repetitive":true, "similarity":0.90, "combination":2, "percentage":0.5, "label":"block", "locator":"block"},
		"list-unit":{"selectors":["li"], "children":["buttonGroup"], "action":"and", "label":"block", "locator":"block"},
		"table":{"selectors":["tbody"], "children":["table-unit"], "action":"or", "repetitive":true, "similarity":0.90, "combination":2, "percentage":0.5, "label":"block", "locator":"block"},
		"table-unit":{"selectors":["tr"], "children":["form"], "action":"and", "label":"block", "locator":"block"}
	},

	"singleNodes":{
		"text":{"selectors":["input:not([type])", "input[type=text]", "input[type=password]", "input[type=email]", "input[type=url]", "input[type=search]", "input[type=number]", "input[type=tel]"], "decisive":false, "action":"type", "label":"fieldLeft", "locator":"field"},
		"textarea":{"selectors":["textarea"], "decisive":false, "action":"type", "label":"fieldLeft", "locator":"field"},
		"upload":{"selectors":["input[type=file]"], "decisive":false, "action":"upload", "label":"fieldLeft", "locator":"field"},
		"checkbox":{"selectors":["input[type=checkbox]"], "decisive":false, "action":"check", "label":"fieldRight", "locator":"field", "group":{"by":"name", "label":"group", "locator":"group"}},
		"radio":{"selectors":["input[type=radio]"], "decisive":false, "action":"click", "label":"fieldRight", "locator":"field", "group":{"by":"name", "label":"group", "locator":"group"}},
		"option":{"selectors":["option"], "decisive":false, "action":"select", "label":"text", "locator":"text"},
		"link":{"selectors":["a", "area"], "decisive":true, "action":"click", "label":"link", "locator":"link"},
		"button":{"selectors":["input[type=submit]", "input[type=button]", "input[type=image]", "input[type=reset]", "button"], "decisive":true, "action":"click", "label":"button", "locator":"button"}
	},

	"labelPolicies":{
		"fieldLeft":["label", "prevSibling", "parentPrevSibling", "parentTdPrevSibling", "alt", "title", "id", "name", "placeholder", "value"],
		"fieldRight":["label", "nextSibling", "parentNextSibling", "alt", "title", "id", "name", "placeholder", "value"],
		"button":["label", "alt", "title", "value", "text", "id", "name"],
		"link":["alt", "title", "text", "id", "name", "imgChild"],
		"text":["alt", "title", "text", "id", "name"],
		"block":["id", "name"],
		"group":["prevSibling", "parentPrevSibling", "parentTdPrevSibling"]
	},

	"locatorPolicies":{
		"field":["name", "id", "label", "xpath"],
		"button":["id", "name", "value", "label", "xpath"],
		"link":["id", "label", "xpath"],
		"text":["label", "value", "xpath"],
		"block":["id", "name", "xpath"],
		"group":["name"]
	},

	"settings":{
		"locatorRelation":"or",
		"matchAllFrames":false,
		"extAttributes":{},
		"extLabelPolicies":{}
	}
}

```

模型预览规则
---

模板页面导入SWATHub时，只包含了HTML源代码，而并不包含显示所需的CSS、图片、Javascript等资源文件，从而可能导致在SWATHub中的预览和实际页面不一致。通常情况下，SWATHub会根据模板抓取时的状态， 自动获取资源文件的基础URL，但是考虑到测试环境的变化以及环境防火墙的限制等因素，有时候需要人为的调整**模型预览规则**，修改HTML源代码中的内容，使得在SWATHub中的预览效果和实际相一致。

### 预览基础URL

所有相对URL都将根据预览基础URL进行计算。

### 预览替换规则

预览替换规则是一个JSON格式的数组，数组中每一条记录代表一条替换规则，SWATHub会按照数组内记录的先后次序，顺序执行每一个替换规则。每一个规则都是一个JSON对象，包含一个`key-value`的键值对，如下所示：
* `key`：源字符串，可以用正则表达式，指代HTML中被替换的字符串。
* `value`：目标字符串。
