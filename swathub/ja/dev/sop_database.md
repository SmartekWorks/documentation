Database機能
===

SWATHubは様々のDBサーバー<sup>1</sup>に対し、SQLで操作したり、検証したりすることができます。これらの機能を利用するために、`database.json`<sup>2</sup>のDB設定を事前に定義する必要があります。

下記はDB設定のサンプルです。
```json
{
  "mysql": {  /* database name */
    "driverName":"",  /* database driver name in JDBC */
    "connString":"",  /* database connection string */
    "username":"",  /* database username */
    "password":"" /*database password */
  }
}
```

?> 1. 現在ロボットにバンドルされたドライバーは**MySQL**、**PostgreSQL**、**Oracle**と**DB2**に対応しています。他のDBタイプを利用する場合に、サポートにお問い合わせしてください。

?> 2. Windowsの場合に、`database.json`は`%appdata%\SWATHubRobot\config`の配下で、macOSの場合に`Users/<username>/Library/Application Support/SWATHubRobot/config`の配下です。

SQL実行
---

この操作はDBに対して`SELECT`、`UPDATE`、`DELETE`などのSQLクエリーを発行します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| データベース | DB設定に定義されたデータベース名。
| SQL      | SQLクエリー。

#### 出力結果
クエリー結果を保存するJSON配列。

アサーション
---

この操作は定義した期待値を使ってDBの内容を検証します。

#### 入力引数
| 引数 | 説明
| ---------- | -----------
| データベース | DB設定に定義されたデータベース名。
| アサーションルール | [DBマッチングルール](rule_db_matching)のJSON配列。デフォルトは`[]`。

#### 出力結果
操作成功かどうかの`Boolean`型結果。
