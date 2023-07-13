DB数据匹配规则
===

DB数据匹配规则是由下属设定值组成的JSON的MAP。

* `table`：表名称。
* `columns`：数据库列名或函数名（数组），二者之中需要且只能定义一种。
  * `columns`：数据库列名。
  * `functions`：数据库函数名。目前仅支持`ROW_COUNT`。
* `filters`：（可选）用于选择行的筛选器（数组）。多条筛选规则的组合，其中每一条筛选规则支持如下的操作符：
  * 关系操作符：数组中每一条规则之间的关系是`AND`，同时针对每条规则，支持使用关系操作符来组合子规则，包括：
    * `and`：子规则之间的关系是`AND`。
    * `or`：子规则之间的关系是`OR`。
  * 逻辑操作符：定义数据库列满足特定条件的逻辑操作符，包括：
    * `gt`：大于。
    * `ge`：大于等于。
    * `lt`：小于。
    * `le`：小于等于。
    * `eq`：等于。
    * `ne`：不等于。
    * `like`：包含字符串。
* `orders`：（可选）筛选出来的结果的排序（数组）。排序规则的组合，其中每一条排序规则包含：
  * 列名。
  * 排序方式，支持`ASC`或`DESC`。
* `top`：（可选）筛选出来结果的获取件数（整数）。
* `expects`：期望值（二维数组）。

下面是数据库验证规则的示例：
```json
{
    "table": "ACCOUNT",
    "columns": {
        "columns": [ "USERNAME", "LOGIN_COUNTS" ]
    },
    "filters": [
        {
            "like": [ "USERNAME", "%a%" ]
        },
        {
            "and": [
                {
                    "eq": [ "LOGIN_COUNTS", 1 ]
                },
                {
                    "gt": [ "DATE_MODIFIED", "2012/03/22 09:12:26" ]
                }
            ]
        }
    ],
    "orders": [
        [ "USERNAME", "ASC" ],
        [ "DATE_MODIFIED", "DESC" ]
    ],
    "top": 10,
    "expects": [
        {
            "USERNAME": "Gamma",
            "LOGIN_COUNTS": 2
        },
        {
            "USERNAME": "Alpha",
            "LOGIN_COUNTS": 3
        }
    ]
}
```
