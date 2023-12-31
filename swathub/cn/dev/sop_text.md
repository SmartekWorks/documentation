文本
===

系统操作中的文本组件，可以读取和写入纯文本、JSON和csv文件，并支持以下操作：

读取文本文件
---

此操作可以从文本文件中读取文本。

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| 文件     | 文本文件的完整路径，例如，`C:/RPA/data.txt`。
| 编码 | （可选）文本文件的编码，例如，`gbk`，`shift-jis`。默认值为 `utf8`。

#### 输出结果
文本文件的内容。

写入文本文件
---

此操作可以将文本写入文本文件。

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| 文件     | 文本文件的完整路径，例如，`C:/RPA/data.txt`。
| 内容  | 要写的内容，例如，`Hello World!`。
| 编码 | （可选）文本文件的编码，例如，`gbk`，`shift-jis`。默认值为 `utf8`。
| 模式 | （可选）覆盖写入，还是追加写入。默认值为 `覆盖`。

#### 输出结果
布尔类型，用于指示操作是否成功。

读取JSON文件
---

此操作可以从`utf8`编码中的文本文件中读取JSON。 

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| 文件     |JSON文件的完整路径，例如，`C:/RPA/data.json`。

#### 输出结果
JSON文件的内容。

写入JSON文件
---

此操作可以将JSON写入 `utf8` 编码的文本文件中。 

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| 文件     |JSON文件的完整路径，例如，`C:/RPA/data.json`。
| 内容  | 要写入的内容，例如，`{"key":"HelloWorld!"}`。

#### 输出结果
布尔类型，用于指示操作是否成功。

读取CSV
---

此操作可以读取CSV文件<sup>1</sup>，并返回二维JSON数组。

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| 文件     | CSV文件的完整路径，例如 `C:/RPA/data.csv`
| 分隔符   | （可选）每行中值的分隔符。默认值为 `,`。
| 包含首行   | （可选）是否读取CSV文件的第一行。默认值为 `true`。
| 编码 | （可选）CSV文件的编码，例如，`gbk`，`shift-jis`。默认值为 `utf8`。

#### 输出结果
字符串的2维数组。

?> 1. CSV文件中的空白行也将作为一个带空字符串 `[""]`的数组进行读取和返回。

写入CSV
---

此操作可以将字符串的二维数组写入CSV文件。 

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| 文件    | CSV文件的完整路径，例如 `C:/RPA/data.csv`
| 数据    | 要写入数据的数组，例如来自内部变量 `@{dataTable}`。
| 分隔符  |（可选）每行中值的分隔符。默认值为 `,`。
| 包含首行   |（可选）是否将数据的第一行写入CSV。默认值为 `true`。
| 编码    |（可选）CSV文件的编码，例如，`gbk`，`shift-jis`。默认值为 `utf8`。
| 模式 | （可选）覆盖写入，还是追加写入。默认值为 `覆盖`。

`dataTable`是一个二维数组，如下所示：
```json
[
  ["Header A", "Header B", "Header C"],
  ["A1 Value", "B1 Value", "C1 Value"],
  ["A2 Value", "B2 Value", "C2 Value"],
]
```

#### 输出结果
布尔类型，用于指示操作是否成功。
