数据库
===

系统操作中的数据库组件，可以与第三方数据库服务器<sup>1</sup>进行交互，通过标准SQL检索更新数据，验证数据。在使用组件前需要在数据库配置中`database.json`<sup>2</sup>中定义数据库的信息。

下面是机器人数据库配置文件的示例：
```json
{
  "mysql": {  /* 数据库名称 */
    "driverName":"",  /* JDBC的数据库驱动 */
    "connString":"",  /* 数据库连接字符串 */
    "username":"",  /* 数据库用户名 */
    "password":"" /* 数据库密码 */
  }
}
```

?> 1. 目前支持**MySQL**、**PostgreSQL**、**Oracle**和**DB2**驱动程序。如果您想使用其他DB，请与支持人员联系。

?> 2. Windows系统中，`database.json`的位置在`%appdata%\SWATHubRobot\config`目录下面；macOS系统中，位置在`Users/<username>/Library/Application Support/SWATHubRobot/config`目录下面。

执行数据库SQL
---

此操作可以执行数据库SQL语句，如查询、更新、删除等。

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| 数据库 | 在数据库配置中定义的数据库名称。
| SQL      | SQL语句。

#### 输出结果

操作结果的JSON数组

数据库验证
---

此操作可以根据期望值来验证数据库操作的结果。

#### 输入参数
| 参数       | 解释
| ---------- | -----------
| 数据库 | 在数据库配置中定义的数据库名称。
| 验证规则 | [DB数据匹配规则](rule_db_matching)的JSON数组。默认值为`[]`。

#### 输出结果
布尔类型，用于指示验证是否成功。
