DataFrame機能
===

SWATHubはDataFrameやDataTableなど大量の表形式データを効率よく処理することができます。

DataFrameインポート
---
JSONの二階層配列からDataFrameタイプのオブジェクトを生成します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| JSON変数   | JSONデータを格納する変数名、例えば`jsonVar`。
| ヘッダー   |（省略可）1行目をヘッダーとして列名で使うかどうか、デフォルトは`true`。<br>`false`の場合に`col1`、`col2`のような列名が生成されます。

#### 出力結果
DataFrameタイプのオブジェクト。

DataFrameエクスポート
---
DataFrameタイプのオブジェクトからJSONの二階層配列を生成します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| DataFrame変数 | DataFrameを格納した変数名、例えば、`dfVar`。
| ヘッダー   | （省略可）列名をヘッダー1行目にするかどうか、デフォルトは`true`。<br>`false`の場合に列名を出力しません。

#### 出力結果
JSON配列。

DataFrameフィルタリング
---
DataFrameタイプのオブジェクトを指定した条件でフィルタリングします。

#### 入力引数
| 引数 | 説明
| ---- | ----
| DataFrame変数 | DataFrameを格納した変数名、例えば、`dfVar`。
| 行フィルター   | （省略可）JavaScriptの評価式<sup>1</sup>、結果`true`の行を残ります。<br>デフォルトは空で、全ての行を残ります。
| 列フィルター   | （省略可）残る列の名前のJSON配列です。<br>例えば、`["col1", "col3"]`はDataFrameのこの2列のみ残ります。<br>デフォルトは`[]`，全ての列を残ります。

?> 1. 行フィルターは下記の例のようなJavaScriptコード、`row`変数を使って、DataFrameの行を示します。また、`Boolean`型結果が`true`の時のみ行を残ります。例えば、`return row.col1 > 3`は`col1`は3より大きい行を残ります。`var total = row.col1 + row.col3; return total > 100`は`col1`と`col3`の和は100より大きい行を残ります。

#### 出力結果
DataFrameタイプのオブジェクト。

DataFrameソート
---
DataFrameタイプのオブジェクトを指定した順でソートします。

#### 入力引数
| 引数 | 説明
| ---- | ----
| DataFrame変数 | DataFrameを格納した変数名、例えば、`dfVar`。
| 評価式   | JavaScriptの評価式，戻り値の数値に対してソーティングします。<br>例えば、`return row.col1`は`col1`の値の順にします。
| 順   | `asc`もしくは`desc`、デフォルトは`asc`。

#### 出力結果
DataFrameタイプのオブジェクト。

DataFrame重複除去
---
DataFrameタイプのオブジェクトを指定した評価式で、重複の行を除去します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| DataFrame変数 | DataFrameを格納した変数名、例えば、`dfVar`。
| 評価式   | JavaScriptの評価式，戻り値の数値が同じ場合に、1行のみ残ります。<br>例えば、`return row.col1 + row.col3`は`col1`と`col3`の和が同じな行を1行残ります。

#### 出力結果
DataFrameタイプのオブジェクト。

DataFrameジョイン
---

SQLのLEFT OUTER JOINのように、二つのDataFrameタイプのオブジェクトを指定したルールでジョインします。

#### 入力引数
| 引数 | 説明
| ---- | ----
| DataFrame変数 1 | 1番目のDataFrame変数、例えば、`df1`。
| DataFrame変数 2 | 2番目のDataFrame変数、例えば、`df2`。
| DataFrame 1ジョインキー | DataFrame 1をジョインするためのキーの評価式。例えば、`return df1.col1`。
| DataFrame 2ジョインキー | DataFrame 1をジョインするためのキーの評価式。、例えば、`return df2.col1`。
| 結果評価式   | 結果を組み込むための評価式、例えば、`return { col1: df1.col1, col2: df1.col2, col3: df2.col3 }`で`col1`、`col2`和`col3`を含むDataFrameを生成します。最初の二列は`df1`から出力、最後の列は`df2`から出力。

#### 出力結果
DataFrameタイプのオブジェクト。
