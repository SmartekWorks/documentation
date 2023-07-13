SWATHub API
===

执行项目
---

该API旨在在指定的项目下执行所有用例。结合[查询任务组状态](#查询任务组状态)，可以为持续集成<sup>1</sup>等实现用例自动执行机制。

?> 1. 如果您使用Jenkins来进行持续集成，可以使用服务集成中的[Jenkins插件](../manual/design_workspace#Jenkins)。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/run`
 * `username`：用户名
 * `apiKey`：用户的APIKey
 * `workspaceOwnername`：项目所有者的用户名（可以从您的项目的URL中找到）
 * `workspaceName`：项目的名称（可以从您的项目的URL中找到）
* **方法**：`POST`
* **内容类型**：`application/x-www-form-urlencoded`
* **参数**:
 * `browser` （可选）：执行的浏览器代码。默认浏览器使用空白。可选浏览器包括：`IE`、`Chrome`、`Firefox`、`Edge`、`Edge Legacy`、`Safari`。默认为空。
 * `robot` （可选）：执行的机器人名称。使用空白进行自动选择。默认为空。
 * `setID` （可选）：场景组的ID（可以从场景组的URL中找到）。使用空白在所有场景组中执行用例。默认为空。
 * `isSequential` （可选）：是否允许用例按顺序执行。使用`true` 或 `false`。默认为`true`。
 * `tags` （可选）：用于过滤要执行的场景的标签，以逗号分隔。默认为空。
 * `caseFilter` （可选）：用于过滤要执行的用例，仅执行名称中包含该文本的用例。默认为空。
 * `testServer` （可选）：场景服务器的URL。使用空白继承场景组中的设置。默认为空。
 * `apiServer` （可选）：API服务器的URL。使用空白继承场景组中的设置。默认为空。
 * `stepOptions` （可选）：执行的步骤选项。使用JSON格式的字符串，默认为`{}`。
 * `envVariables`（可选）：执行的环境变量。使用JSON格式的字符串，默认为`{}`。
 * `execSettings` （可选）：旧版执行设置，用于向下兼容。使用空白继承场景组中的设置。默认为空。
 * `lang` （可选）：多语言设置，以下值之一
	* `en`：英文（默认）
	* `ja`：日文
	* `zh_CN`：简体中文
* **主体**：无

```batch
curl --user <username>:<apiKey> \
	-d setID=<setID> -d browser=<browserCode> -d robot=<robotName> \
	-d tags=<tags> -d testServer=<testServer> -d apiServer=<apiServer> -d isSequential=false \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/run
```

### 响应（成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `jobID`：执行任务组的ID。该值可以在[查询任务组状态](#查询任务组状态)中使用。

###  响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `code`：调用错误代码。
 * `message`：调用错误信息。

API调用中可能会发生以下错误。

* API验证错误
* 找不到目标场景组
* 找不到要执行的机器人或平台

执行用例
---

该API设计用于执行指定的用例。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/cases/run`
 * `username`：用户名
 * `apiKey`：用户的APIKey
 * `workspaceOwnername`：项目所有者的用户名（可以从您的项目的URL中找到）
 * `workspaceName`：项目的名称（可以从您的项目的URL中找到）
* **方法**：`POST`
* **内容类型**：`application/x-www-form-urlencoded`
* **参数**:
 * `caseIDs` ：用例的ID（可以从 [获取场景](#获取场景)中获得）。
 * `browser` （可选）：执行的浏览器代码。默认浏览器使用空白。可选浏览器包括：`IE`、`Chrome`、`Firefox`、`Edge`、`Edge Legacy`、`Safari`。默认为空。
 * `robot` （可选）：执行的机器人名称。使用空白进行自动选择。默认为空。
 * `isSequential` （可选）：是否允许用例按顺序执行。默认为`true`。
 * `testServer` （可选）：测试服务器的URL。使用空白继承场景组中的设置。默认为空。
 * `apiServer` （可选）：API服务器的URL。使用空白继承场景组中的设置。默认为空。
 * `stepOptions` （可选）：执行的步骤选项。使用JSON格式的字符串，默认为`{}`。
 * `envVariables`（可选）：执行的环境变量。使用JSON格式的字符串，默认为`{}`。
 * `execSettings` （可选）：旧版执行设置，用于向下兼容。使用空白继承场景组中的设置。默认为空。
 * `lang` （可选）：多语言设置，以下值之一
	* `en`：英文（默认）
	* `ja`：日文
	* `zh_CN`：简体中文
* **主体**：无

```batch
curl --user <username>:<apiKey> \
	-d caseIDs=<caseID_1> -d caseIDs=<caseID_2> -d browser=<browserCode>  -d robot=<robotName>  \
	-d testServer=<testServer> -d apiServer=<apiServer> -d isSequential=false \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/cases/run
```

### 响应（成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `jobID`：执行任务组的ID。该值可以在[查询任务组状态](#查询任务组状态)中使用。


### 响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `code`：调用错误代码。
 * `message`：调用错误信息。

API调用中可能会发生以下错误。

* API验证错误
* 找不到目标场景组
* 找不到要执行的机器人或平台

查询任务组状态
---

此API旨在获取工作状态，例如，执行任务组的进度。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/jobs/<jobID>/query`
 * `username`：用户名
 * `apiKey`：用户的APIKey
 * `workspaceOwnername`：项目所有者的用户名（可以从您的项目的URL中找到）
 * `workspaceName`：项目的名称（可以从您的项目的URL中找到）
 * `jobID`：执行任务组ID（可以从API中获取，例如[执行用例](#执行用例)。）
* **方法**：`GET`
* **参数**:
 * `lang` （可选）：多语言设置，以下值之一
	* `en`：英文（默认）
	* `ja`：日文
	* `zh_CN`：简体中文
* **主体**：无

```batch
curl --user <username>:<apiKey> \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/jobs/<jobID>/query
```

### 响应（成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `name`：项目名称
 * `status`：`queued`, `started`, `stopped`, `finished` 或 `failed`
 * `tasks`：任务对象的JSON数组（具有以下关键字的JSON对象）
	* `taskID`：任务的ID
	* `description`：任务描述
	* `status`：`queued` 或 `dispatched` 或 `started` 或 `stopped` 或 `finished` 或 `failed`
	* `endTime`：任务的结束时间，格式为`yyyy-MM-dd HH:mm:ss`
	* `resultID`：结果的ID（仅适用于完成的任务）
	* `duration`：用例执行的持续时间（仅适用于完成的任务）
	* `error`：任务的错误消息（仅适用于有错误的已完成任务）

### 响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `code`：调用错误代码。
 * `message`：调用错误信息。

API调用中可能会发生以下错误。

* API验证错误
* 找不到目标项目

获取场景组
---

该API设计用于获取指定场景组的信息。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/sets/<setID>`
 * `username`：用户名
 * `apiKey`：用户的APIKey
 * `workspaceOwnername`：项目所有者的用户名（可以从您的项目的URL中找到）
 * `workspaceName`：项目的名称（可以从您的项目的URL中找到）
 * `setID`：场景组的ID（可以从场景组的URL中找到。）
* **方法**：`GET`
* **参数**：无
* **主体**：无

```batch
curl --user <username>:<apiKey> \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/sets/<setID>
```

### 响应（成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `code`：场景组代码
 * `name`：场景组名称
 * `tags`：场景组的标签
 * `testServer`：场景组的测试服务器设置
 * `apiServer`：场景组的API服务器设置
 * `stepOptions`：默认步骤选项的JSON对象
 * `envVariables`: 默认环境变量的JSON对象
 * `execSettings`：旧版执行设置的JSON对象，用于向下兼容
 * `beforeInterceptor`：前置拦截器流程的代码。
 * `afterInterceptor`：后置拦截器流程的代码。

###  响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：具有以下快捷键的JSON对象
 * `code`：调用错误代码。
 * `message`：调用错误信息。

API调用中可能会发生以下错误。

* API验证错误
* 找不到目标场景组

获取场景
---

此API旨在获取指定场景组中的所有场景和用例信息。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/sets/<setID>/scenarios`
 * `username`：用户名
 * `apiKey`：用户的APIKey
 * `workspaceOwnername`：项目所有者的用户名（可以从您的项目的URL中找到）
 * `workspaceName`：项目的名称（可以从您的项目的URL中找到）
 * `setID`：场景组的ID（可以从场景组的URL中找到。）
* **方法**：`GET`
* **参数**:无
 * `lang` （可选）：多语言设置，以下值之一
	* `en`：英文（默认）
	* `ja`：日文
	* `zh_CN`：简体中文
 * `tags` （可选）：用于过滤要导出的场景的标签，以逗号分隔。默认为空。
* **主体**：无

```batch
curl --user <username>:<apiKey> \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/sets/<setID>/scenarios?tags=demo
```

### 响应 （成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：场景对象的JSON数组，每个场景为带有以下关键字的JSON对象。
 * `code`：场景代码
 * `name`：场景名称
 * `tags`：场景的标签
 * `params`：场景参数的JSON数组（带有以下关键字的JSON对象）
	* `code`：参数代号
	* `direction`：`input` 或 `output`
	* `name`：参数名称
	* `type`：参数的类型，仅`text`
	* `source`: 参数的来源，`system` 表示系统生成，`user` 表示用户定义
 * `testcases`：测试用例对象的JSON数组（具有以下关键字的JSON对象）
	* `id`：用例代码
	* `seqNo`：用例序列号
	* `name`：用例名称
	* `data`：用例的用例数据（带有以下关键字的JSON对象的JSON数组）
		* `code`：参数代码
		* `name`：参数名称
		* `value`：参数值
		* `enabled`： `true` 或 `false`。
	* `results`：执行结果的JSON数组（具有以下关键字的JSON对象）
		* `id`：结果编号
		* `status`：结果状态
		* `robot`：执行节点名称
		* `browser`: 执行浏览器
		* `execPlatform`：执行平台
		* `testServer`：测试服务器域（如果存在）
		* `apiServer`：API服务器域（如果存在）
		* `duration`：执行时间
		* `timeStart`：执行开始时间
		* `timeEnd`：执行结束时间
		* `error`：执行错误信息
		* `errorRaw`: 执行错误的原始信息
			* `code`：错误代码
			* `msgArgs`：错误信息列表
		* `initBy`：执行创建者的名字
		* `initTime`：执行创建时间
		* `verifyBy`：结果验证者名称
		* `verifyTime`：结果验证时间
		* `baseURL`：凭证的存储位置URL

### 响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：带有以下关键字的JSON对象。
 * `code`：调用错误代码。
 * `message`：调用错误信息。

API调用中可能会发生以下错误。

* API 验证错误
* 找不到目标场景组

添加场景/流程
---

该API设计用于在指定场景组中添加一个场景，或者项目中的一个流程。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/flows`
	* `username`：用户名
	* `apiKey`：用户的APIKey
	* `workspaceOwnername`：项目所有者的用户名（可以从您的项目的URL中找到）
	* `workspaceName`：项目的名称（可以从您的项目的URL中找到）
* **方法**：`POST`
* **内容类型**：`application/json`
* **参数**：无
* **主体**：
	* `name`：场景/流程的名称。
	* `groupCode`（可选）：场景组的代码，如果不设置则添加一个流程。
	* `tags`（可选）：场景/流程标签，如果不设置则为空。
	* `steps`：包含所有流程步骤的JSON数组，每一个步骤都是一个JSON对象，格式如下：
		* `title`：流程步骤的标题
 		* `component`：流程步骤的组件
			* `code`：组件代码
			* `name`：组件名称
			* `type`：组件类型，为以下值之一
				* `sop`：系统操作
				* `pop`：网页操作
				* `flow`：流程
				* `apiop`：API操作
				* `guiop`：GUI操作
				* `mobileop`：APP操作
				* `ctrl`：控制操作
				* `extension`：扩展操作
		* `inputs`：表示步骤输入数据的JSON数组，每一个数据是一个JSON对象，格式如下：
			* `code`：参数代码
			* `name`：参数名称
			* `value`：数据值
			* `enabled`：数据是否有效，`true` 或 `false`
			* `queryMode`（可选）：网页操作中元素的匹配模式，支持 `text`、`index` 或 `select`
		* `outputs`：表示步骤输出数据的JSON数组，每一个数据是一个JSON对象，格式如下：
			* `code`：参数代码
			* `name`：参数名称
			* `value`：数据值
			* `enabled`：数据是否有效，`true` 或 `false`
		* `options`：表示步骤选项的JSON对象的字符串。
		* `enabled`：步骤是否有效，`true` 或 `false`
	* `arguments`：包含场景/流程的自定义输入输出参数的JSON数组，每一个数据是一个JSON对象，格式如下：
		* `code`：参数代码
		* `name`：参数名称
		* `direction`：`input` 或 `output`

```batch
curl --user <username>:<apiKey> \
	-H "Content-Type: application/json" \
	-d '{"name":"myFlow","steps":[{"component":{"type":"sop","code":"goto","name":"Goto URL"},"inputs":[{"code":"url","name":"URL","value":"http://www.swathub.com","enabled":true}],"outputs":[],"title":"Goto URL","options":"{}","enabled":true}]}' \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/flows
```

### 响应（成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `id`：流程的ID
 * `code`：流程的代码

###  响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `code`：调用错误代码
 * `message`：调用错误信息

API调用中可能会发生以下错误。

* API验证错误
* 流程名称为空
* 流程数据不合法

添加用例
---

该API设计用于将用例添加到指定的场景。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/flows/<flowCode>/cases`
 * `username`：用户名
 * `apiKey`：用户的APIKey
 * `workspaceOwnername`：项目所有者的用户名（可以从您的项目的URL中找到）
 * `workspaceName`：项目的名称（可以从您的项目的URL中找到）
 * `flowCode`：流程代码
* **方法**：`POST`
* **内容类型**：`application/json`
* **参数**: 无
* **主体**：
 * `name`：用例的名称。
 * `values`：包含用例数据的JSON对象的字符串。

```batch
curl --user <username>:<apiKey> \
	-H "Content-Type: application/json" \
	-d '{"name":"myCase","values":{"param1":"value1","param2":"value2"}}' \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/flows/<flowCode>/cases
```

### 响应（成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `id`：用例的ID。
 * `code`：用例的代码。

###  响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `code`：调用错误代码。
 * `message`：调用错误信息。

API调用中可能会发生以下错误。

* API验证错误
* 找不到目标场景
* 用例名称为空白
* 测试值不是JSON字符串

获取流程数据
---

该API旨在获取指定场景或流程的详细信息。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/flows/<flowCode>`
 * `username`：用户名
 * `apiKey`：用户的APIKey
 * `workspaceOwnername`：项目所有者的用户名（可以从您的项目的URL中找到）
 * `workspaceName`：项目的名称（可以从您的项目的URL中找到）
 * `flowCode`：流程代码
* **方法**：`GET`
* **参数**:
 * `lang` （可选）：多语言设置，以下值之一
	* `en`：英文（默认）
	* `ja`：日文
	* `zh_CN`：简体中文
* **主体**：无

```batch
curl --user <username>:<apiKey> \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/flows/<flowCode>?lang=ja
```

### 响应（成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：流程的JSON对象
 * `code`：流程代码
 * `name`：流程名称
 * `tags`：流程标签
 * `group`: 场景组的JSON对象（流程的场景组为`null`）
	* `id`: 场景组的ID
	* `code`：场景组代码
	* `name`：场景组名称
 * `params`：流程参数（带有以下关键字的JSON对象的JSON数组）
	* `code`：参数代码
	* `direction`： `input` 或 `output`
	* `name`：参数名称
	* `type`：参数类型，仅为`text`
	* `source`: 参数的来源，`system` 表示系统生成，`user` 表示用户定义
 * `steps`：流程步骤的JSON数组（具有以下关键字的JSON对象）
	* `title`：显示组件标题
	* `component`：流程步骤的组成部分
		* `code`：组件代码
		* `name`：组件名称
		* `type`：组件类型，以下值之一
			* `sop`：系统操作
			* `pop`：网页操作
			* `flow`：流程操作
			* `apiop`：API操作
			* `guiop`：GUI操作
			* `mobileop`：APP操作
			* `ctrl`：控制操作
			* `extension`：扩展操作
	* `inputs`：输入参数的流程步骤
		* `code`：参数代码
		* `name`：参数名称
		* `value`：参数值
		* `enabled`：`true` 或 `false`
	* `outputs`：输出参数的流程步骤
		* `code`：参数代码
		* `name`：参数名称
		* `value`：参数值
		* `enabled`：`true` 或 `false`
	* `options`：步骤选项的字符串
	* `enabled`：`true` 或 `false`
	* `blocks`：子步骤块（仅用于控制操作）（具有以下关键字的JSON对象）
		* `if`：流程步骤的JSON数组，表示系统操作 `IF/ELSE` 中判定结果为 `true` 的分支
		* `else`：流程步骤的JSON数组，表示系统操作 `IF/ELSE` 中判定结果为 `false` 的分支
		* `loop`：流程步骤的JSON数组，表示系统操作 `WHILE` 中的循环体
		* `try`：流程步骤的JSON数组，表示系统操作 `TRY/CATCH` 中的尝试执行步骤
		* `catch`：流程步骤的JSON数组，表示系统操作 `TRY/CATCH` 中的错误处理步骤

###  响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `code`：调用错误代码。
 * `message`：调用错误信息。

API调用中可能会发生以下错误。

* API验证错误
* 找不到目标流程

获取操作数据
---

该API旨在获取指定模型操作的详细信息。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/operations/<opType>/<opCode>`
 * `username`：用户名
 * `apiKey`：用户的APIKey
 * `workspaceOwnername`：项目所有者的用户名（可以从您的项目的URL中找到）
 * `workspaceName`：项目的名称（可以从您的项目的URL中找到）
 * `opType`：操作类型，可以是`pop`、`guiop`、`mobileop`或`apiop`
 * `opCode`：操作代码
* **方法**：`GET`
* **参数**: 无
* **主体**：无

```batch
curl --user <username>:<apiKey> \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/operations/<opType>/<opCode>
```

### 响应（成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：操作的JSON对象
 * `code`：操作代码
 * `name`：操作名称
 * `type`：操作类型
   * `pop`：网页操作
   * `guiop`：GUI操作
   * `mobileop`：APP操作
   * `apiop`：API操作
 * `model`: 模型的JSON对象（API操作的模型为`null`）
   * `code`：模型代码
   * `name`：模型名称
 * `params`：操作参数（带有以下关键字的JSON对象的JSON数组）
   * `code`：参数代码
   * `direction`：`input` 或 `output`
   * `name`：参数名称
   * `type`：参数类型
   * `source`: 参数的来源，`system` 表示系统生成，`user` 表示用户定义

###  响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `code`：调用错误代码。
 * `message`：调用错误信息。

API调用中可能会发生以下错误。

* API验证错误
* 找不到目标操作

获取执行结果
---

该API旨在获取执行结果的详细信息。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/results/<resultID>`
 * `username`：用户名
 * `apiKey`：用户的APIKey
 * `workspaceOwnername`：项目所有者的用户名（可以从您的项目的URL中找到）
 * `workspaceName`：项目的名称（可以从您的项目的URL中找到）
 * `resultID`：结果的ID
* **方法**：`GET`
* **参数**:
 * `lang` （可选）：多语言设置，以下值之一
	* `en`：英文（默认）
	* `ja`：日文
	* `zh_CN`：简体中文
* **主体**：无

```batch
curl --user <username>:<apiKey> \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/results/<resultID>?lang=ja
```

### 响应（成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：结果的JSON对象
 * `summary`：执行结果摘要（带有以下关键字的JSON对象）
	* `scenarioName`：场景名称
	* `caseName`：用例名称
	* `caseID`：用例ID
	* `status`：结果状态
	* `robot`：执行节点名称
	* `browser`: 执行浏览器
	* `execPlatform`：执行平台
	* `testServer`：测试服务器域（如果存在）
	* `apiServer`：API服务器域（如果存在）
	* `stepOptions`：步骤选项的JSON对象
	* `envVariables`: 环境变量的JSON对象
	* `execSettings`：旧版执行设置的JSON对象，用于向下兼容
	* `duration`：执行时间
	* `timeStart`：开始执行时间
	* `timeEnd`：结束执行时间
	* `error`：执行错误信息
	* `errorRaw`: 执行错误的原始信息
		* `code`：错误代码
		* `msgArgs`：错误信息列表
	* `initBy`：执行创建者的名字
	* `initTime`：执行创建时间
	* `verifyBy`：结果验证者名称
	* `verifyTime`：结果验证时间
	* `baseURL`：凭证的存储位置URL
 * `result`：步骤的结果（带有以下关键字的JSON对象的JSON数组）
	* `stepTitle`：步骤标题
	* `options`：步骤选项的JSON对象
	* `seqNo`：步骤序号
	* `code`：步骤组件代码
	* `type`：步骤组件类型
	* `typeName`：具有给定语言的步骤组件的类型名称
	* `pageCode`：步骤组件的页面代码（如果类型为`pop`）
	* `error`：指定语言的详细错误消息
	* `errorRaw`: 执行错误的原始信息
		* `code`：错误代码
		* `msgArgs`：错误信息列表
	* `paramData`：组件参数或步骤选项的数据（带有以下关键字的JSON对象的JSON数组）
		* `code`：参数代码
		* `name`：参数名称
		* `direction`：`input` 或 `output`
		* `value`：数据值
		* `variable`：变量名称，如果没有变量，则返回 `-`
		* `queryMode`：选择类型时的参数模式，多或仅查询，`select` 或 `text` 或 `index`
		* `runtimeEnabled`：`true` 或 `false`指示是否在执行时启用
	* `evidences`：步骤的证据（带有以下关键字的JSON对象）
		* `console`：控制台日志文件的路径
		* `files`：执行期间生成的文件的路径，例如下载的文件或API调用结果文件（字符串的JSON数组）
		* `html`：原始HTML文件的路径
		* `log`：日志文件的路径
		* `screenshots`：屏幕截图文件的路径（字符串的JSON数组）
		* `url`：当前网页的网址
	* `steps`：如果组件类型为`flow`或`ctrl`（具有与上述相同关键字的JSON对象的JSON数组），则子级执行步骤。

###  响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `code`：调用错误代码。
 * `message`：调用错误信息。

API调用中可能会发生以下错误。

* API验证错误
* 找不到目标结果


添加结果注释
---

该API旨在为执行结果添加注释。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/results/<resultID>/comments`
 * `username`：用户名
 * `apiKey`：用户的APIKey
 * `workspaceOwnername`：项目所有者的用户名（可以从您的项目的URL中找到）
 * `workspaceName`：项目的名称（可以从您的项目的URL中找到）
 * `resultID`：结果的ID
* **方法**：`POST`
* **内容类型**：`application/x-www-form-urlencoded`
* **参数**:无
 * `content`：注释内容。
 * `type`：注释类型。
	* `question`：问题
	* `idea`：想法
	* `issue`：发布
 * `lang` （可选）：多语言设置，以下值之一
	* `en`：英文（默认）
	* `ja`：日文
	* `zh_CN`：简体中文
* **主体**： 无

```batch
curl --user <username>:<apiKey> \
	--data-urlencode "content=This is an issue" \
	-d type=issue \
	-d lang=ja \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/results/<resultID>/comments
```

### 响应（成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `id`：已添加注释的ID。

### 响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `code`：调用错误代码。
 * `message`：调用错误信息。

API调用中可能会发生以下错误。

* API验证错误
* 找不到目标结果

获取用户参与的项目
---

该API旨在获取用户参与的所有项目信息。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/workspaces`
 * `username`：用户名
 * `apiKey`：用户的APIKey
* **方法**：`GET`
* **参数**: 无
* **主体**：无

```batch
curl --user <username>:<apiKey> http://swathub.com/api/workspaces
```

### 响应（成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：项目的JSON数组。每个项目为具有以下关键字的JSON对象。
 * `id`：项目ID
 * `name`：项目名称
 * `description`：项目描述
 * `isPublic`: 是否公开项目
 * `maxResult`：每个Case允许保留的最大结果数
 * `type`：项目类型，`0`：普通设计项目，`1`：控制中心项目
 * `owner`：项目所有者的用户名

### 响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `code`：调用错误代码。
 * `message`：调用错误信息。

API调用中可能会发生以下错误。

* API验证错误

获取项目的场景组
---

该API旨在获取指定项目下面的所有场景组信息。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/sets`
 * `username`：用户名
 * `apiKey`：用户的APIKey
 * `workspaceOwnername`：项目所有者的用户名（可以从您的项目的URL中找到）
 * `workspaceName`：项目的名称（可以从您的项目的URL中找到）
* **方法**：`GET`
* **参数**: 无
* **主体**：无

```batch
curl --user <username>:<apiKey> http://swathub.com/api/<workspaceOwnername>/<workspaceName>/sets
```

### 响应（成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：场景组的JSON数组。每个场景组为具有以下关键字的JSON对象。
 * `id`：场景组ID
 * `code`：场景组代码
 * `name`：场景组名称
 * `tags`：场景组的标签
 * `testServer`：场景组的测试服务器设置
 * `apiServer`：场景组的API服务器设置
 * `stepOptions`：默认步骤选项的JSON对象
 * `envVariables`: 默认环境变量的JSON对象
 * `beforeInterceptor`：前置拦截器流程的代码。
 * `afterInterceptor`：后置拦截器流程的代码。

### 响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `code`：调用错误代码。
 * `message`：调用错误信息。

API调用中可能会发生以下错误。

* API验证错误

获取项目的机器人
---

该API旨在获取指定项目下面所有连接的机器人。

### 请求
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/robots`
 * `username`：用户名
 * `apiKey`：用户的APIKey
 * `workspaceOwnername`：项目所有者的用户名（可以从您的项目的URL中找到）
 * `workspaceName`：项目的名称（可以从您的项目的URL中找到）
* **方法**：`GET`
* **参数**: 无
* **主体**：无

```batch
curl --user <username>:<apiKey> http://swathub.com/api/<workspaceOwnername>/<workspaceName>/robots
```

### 响应（成功）
* **HTTP代码**：`200`
* **内容类型**：`application/json`
* **主体**：场景组的JSON数组。每个场景组为具有以下关键字的JSON对象。
 * `id`：机器人ID
 * `name`：机器人名称
 * `version`：机器人版本
 * `type`：机器人连接的类型，`public`或`private`
 * `offline`：机器人是否在线，`true`或`false`
 * `spec`：机器人的平台信息

### 响应（错误）
* **HTTP代码**：`404`
* **内容类型**：`application/json`
* **主体**：具有以下关键字的JSON对象
 * `code`：调用错误代码。
 * `message`：调用错误信息。

API调用中可能会发生以下错误。

* API验证错误