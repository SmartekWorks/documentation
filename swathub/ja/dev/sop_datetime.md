Datetime機能
===

SWATHubは日付と時間の計算やフォーマットの処理などができます。

日付フォーマット
---

日付オブジェクトを指定したフォーマットの文字列に変換します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| 日期変数   | （省略可）日付オブジェクトの変数、例えば`dateObj`。デフォルトは現時点の日付オブジェクト。<br>JavaScriptのDateタイプのオブジェクトもしくは[Day.jsを準じた日付オブジェクト](https://github.com/iamkun/dayjs/)を使用します。
| フォーマット | （省略可）指定した日付フォーマット。デフォルトは`YYYY-MM-DD HH:mm:ss`。<br>[日付フォーマット](https://day.js.org/docs/en/display/format)を参照。

#### 出力結果
日付の文字列

日付解析
---

テキストを指定したフォーマットで日付オブジェクトに変換します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| テキスト　| （省略可）日付文字列、例えば`2020-10-12 12:00:00`。デフォルトは現時点の日付文字列。
| フォーマット | （省略可）指定した日付フォーマット。デフォルトは`YYYY-MM-DD HH:mm:ss`。<br>[日付フォーマット](https://day.js.org/docs/en/display/format)を参照。

#### 出力結果
[Day.jsを準じた日付オブジェクト](https://github.com/iamkun/dayjs/)。

Day.jsを準じた日付オブジェクトは各種の日付と時間の計算が対応しております。下記は`dateObj`の例です。

```javascript
  dateObj.add(1, 'day') // 一日後
  dateObj.subtract(1, 'week') // 一週間前
  dateObj.startOf('month') // 本月の一日目
  dateObj1.diff(dateObj2, 'day') // 二つの日付の日数の差
```