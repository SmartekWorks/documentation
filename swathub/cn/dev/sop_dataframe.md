DataFrame
===

提供针对类似DataFrame、DataTable这样大规模表单类型数据操作的方法。

DataFrame新建
---

此操作可以从二维数组类型的JSON数据，新建一个DataFrame的对象。

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| JSON变量   | JSON变量名，例如， `jsonVar`。
| 包含首行   | （可选）是否读取数组的第一行作为列名。默认值为 `true`。如果设置为`false`，则会自动生成类似`col1`, `col2`这样的列名。

#### 输出结果
DataFrame类型的对象。

DataFrame导出
---

此操作可以从一个DataFrame的对象，导出成二维数组类型的JSON数据。

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| DataFrame变量 | DataFrame变量，例如， `dfVar`。
| 包含首行   | （可选）是否将列名导出，保存到数组的第一行。默认值为 `true`。如果设置为`false`，则不会导出列名，而仅仅导出数据。

#### 输出结果
JSON数组。

DataFrame过滤
---

此操作可以从DataFrame的对象中，按照条件筛选所需的行与列。

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| DataFrame变量 | DataFrame变量，例如， `dfVar`。
| 行过滤表达式   | （可选）JavaScript格式的表达式<sup>1</sup>，返回使得该表达式返回`true`的所有行。默认值为空字符串，表示返回所有行。
| 列过滤表达式   | （可选）JSON数组，表示所有保留的行名称。比如`["col1", "col3"]`表示将从DataFrame中返回这两列。默认值为`[]`，表示返回所有列。

?> 1. `行过滤表达式`是一段JavaScript代码，其中以`row`为表示DataFrame中的行，并返回布尔类型的值。例如，`return row.col1 > 3` 将返回所有`col1`大于3的行。`var total = row.col1 + row.col3; return total > 100` 将返回所有`col1`与`col3`之和大于100的行。

#### 输出结果
DataFrame类型的对象。

DataFrame排序
---

此操作可以从DataFrame的对象中，按照条件进行排序。

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| DataFrame变量 | DataFrame变量，例如， `dfVar`。
| 表达式   | JavaScript格式的表达式，按照返回值进行排序。如`return row.col1`将按照`col1`的值进行排序。
| 顺序   | `asc`或`desc`，缺省为`asc`。

#### 输出结果
DataFrame类型的对象。

DataFrame去重
---

此操作可以从DataFrame的对象中，按照条件去除重复的行。

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| DataFrame变量 | DataFrame变量，例如， `dfVar`。
| 表达式   | JavaScript格式的表达式，按照返回值进行去重。如`return row.col1 + row.col3`将仅仅保留一条`col1`与`col3`之和相同的值。

#### 输出结果
DataFrame类型的对象。

DataFrame连接
---

此操作可以将两个DataFrame按照一定的规则连接起来，类似于SQL中的左连接（LEFT OUTER JOIN）。

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| DataFrame变量 1 | DataFrame变量 1。例如，`df1`。
| DataFrame变量 2 | DataFrame变量 2。例如，`df2`。
| DataFrame 1的连接键表达式 | DataFrame 1用来连接的键值表达式，包含固定参数`df1`。例如，`return df1.col1`。
| DataFrame 2的连接键表达式 | DataFrame 2用来连接的键值表达式，包含固定参数`df2`。例如，`return df2.col1`。
| 结果表达式   | 定义返回结果的表达式，包含固定参数`df1`和`df2`。例如，`return { col1: df1.col1, col2: df1.col2, col3: df2.col3 }`将返回一个包含`col1`、`col2`和`col3`的DataFrame，其中前面两列取值来自`df1`，第三列取值来自`df2`。

#### 输出结果
DataFrame类型的对象。