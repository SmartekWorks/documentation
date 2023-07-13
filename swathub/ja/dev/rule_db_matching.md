DBマッチングルール
===

DBマッチングルールは下記のキーを持つJSONマップです。

* `table`：テーブルの名前。
* `columns`：列もしくはファンクション，一つのルールにどっちかの一つのみが利用可能です。
  * `columns`：テーブルの列の名前。
  * `functions`：テーブルのファンクション。現在`ROW_COUNT`がのみ対応。
* `filters`：（省略可）行をフィルタする条件。配列で複数条件のJSONマップを組み合わせすることができます。現在対応しているキーワードが下記になります。
  * リレーション：配列の条件の間のリレーションは`AND`です。条件の配下にサブ条件のリレーションが定義できます。
    * `and`：サブ条件のリレーションは`AND`。
    * `or`：サブ条件のリレーションは`OR`。
  * ロジック：条件のロジックを定義できます。
    * `gt`：より大きい。
    * `ge`：より大か等しい。
    * `lt`：より小さい。
    * `le`：より小さいか等しい。
    * `eq`：等しい。
    * `ne`：等しくない。
    * `like`：文字列を含む。
* `orders`：（省略可）フィルタした結果の並び方の配列。並び方ごとに下記のキーを定義します。
  * 列の名前。
  * 並び方、`ASC`と`DESC`のどっちか。
* `top`：（省略可）フィルタした結果の取得件数。
* `expects`：期待値。２階層の配列。

下記はルールのサンプルです。
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
