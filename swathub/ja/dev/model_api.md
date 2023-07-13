APIモデル
===

APIモデルはWebサービスのAPIをモデル化したものです。それによって、APIオペレーションはAPIに対してHTTPリクエストを発行し、レスポンスを取得することをシミュレートするオペレーションです。複雑なAPIを呼び出すことはAPIテストに非常に有効な手段です。

モデル構築
---

SWATHubでAPIのパラメーターを定義することでAPIオペレーション<sup>1</sup>を簡単に作成できます。詳細な手順は[マニュアル](../manual/design_model#apiモデル)を参照してください。定義する際に設定可能な属性は下記になります。


### 基本属性
* メソッド：HTTPリクエストのメソッド：`GET`、`POST`、`PUT`、`PATCH`、`DELETE`。
* URL：APIのURL。
* ヘッダー：HTTPリクエストのヘッダーを定義するJSONマップです。下記は認証データを定義するヘッダーのサンプルです。
```json
{"Authorization":"APPCODE fbebc457055a480dab89f87fcbd3ef31"}
```

### データ属性
* クエリー：URLクエリーを定義するJSONマップです。例えば、`http://API_URL?searchKey=SWATHub&count=10`のURLは下記に定義します。
```json
{"searchKey":"SWATHub", "count":"10"}
```
* ボディタイプ：HTTPリクエストのボディのタイプ：`JSON`、`FORM`、`XML`。
* ボディ：HTTPリクエストのボディ内容。
  * `JSON`：JSONオブジェクトで定義、空白の場合に`{}`を使用します。
  * `FORM`：JSON配列で定義、空白の場合に`[]`を使用します。
  * `XML`: XMLドキュメントで定義、空白の場合に`<?xml version="1.0"?>`を使用します。

下記は`FORM`ボディの定義例です。
```json
[
  { "name":"username", "value":"foo" },
  { "name":"password", "value":"bar" },
  { "name":"avatar", "value":"C:/Users/foo/avatar.png", "file":true } /* file upload */
]
```

### 高度な設定
* 認証メソッド：API認証メソッド：`NONE`、`Basic`、`OAuth2`。
* 認証情報：認証メソッドに必要な認証情報を定義するJSONマップです。下記は**Basic認証**と**OAuth2認証**の認証情報のサンプルです。
```json
{
    "username":"foo",
    "password":"bar"
}
```
```json
{
    "token":"xoxp-2920615630-2920726650-501681802055"
}
```
* タイムアウト：HTTPリクエストのタイムアウト時間（秒）。タイムアウトをしない場合、`0`をセットしてください。

オペレーション引数
---

APIオペレーションの入力引数はユーザがオペレーション定義に使った変数になります。出力引数のデータは該当APIのレスポンスのボディ部です。

下記は出力データのサンプルです。

```json
{"name":"Selenium","tags":null,"testServer":null,"apiServer":"http://localhost:5555"}
```


