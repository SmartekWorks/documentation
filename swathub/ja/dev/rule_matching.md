マッチングルール
===

SWATHubは、Webページ上の条件を使って、操作したいウィンドウを探すこと、待ち時間を決めること、画面のアサーションを行うことをします。その条件を記述するために、**マッチングルール**を使用します。

構文
---

マッチングルールは一致する条件で順番にJSONの配列で記述します。例えば、

```json
[
	{"target":"url", "have_text":"contract"},
	{"target":"title", "equal_text":"Search Results"}
]
```

マッチング条件は、以下のキーを含むJSONマップです。

* `window` (省略可): マッチングを行うウィンドウのスコープ。デフォルト値は`current`です。
 * `current`: 現在アクティブなウィンドウのみ。
 * `all`: 全てのウィンドウ。
```json
{"window":"all", "have_text":"SWATHub"}
```
* `frame` (省略可): マッチングを行うフレームのスコープ。ターゲットフレーム名かIDを利用します。キーが定義されていないもしくは値が空白の場合、全てのフレームになります。(Webアプリケーションは、フレームを使用しない場合キーは必要としません。)
```json
{"frame":"main", "have_text":"Success"}
```
* `target` (省略可): ターゲットの対象。以下の値を使用することができます。デフォルト値は `body`です。
 * `url`: ウィンドウのURL。（フレームスコープを指定してもウィンドウのURLになります。）
```json
{"target":"url", "have_text":"contract"}
```
 * `title`: ウィンドウのタイトル（フレームスコープを指定してもウィンドウのタイトルになります。）
```json
{"target":"title", "have_text":"SWATHub"}
```
 * `alert`: 前のオペレーションで出た最後のアラートのテキスト
```json
{"target":"alert", "have_text":"Error"}
```
 * `@param`: 実行時の変数@{param}の値
```json
{"target":"@param", "have_text":"success!"}
```
 * *CSSセレクター*: CSSセレクターによって定義された画面内の領域。一つの物理ページに複数の論理ページがない限り、デフォルト値の`body`を使用することをお勧めします。
```json
{"target":"#tab1", "have_text":"Logical Page 1"}
```
 * *XPathセレクター*: XPathセレクターによって定義されたAPPのノード。デフォルト値は`//*`。
```json
{"target":"//XCUIElementTypeTabBar", "have_text":"Home"}
```
* *評価式*: 評価のいくつかのタイプの条件を定義することができます。
 * `equal_text`: ターゲットテキストは、キーの文字列値に等しくなければなりません。
```json
{"target":"title", "equal_text":"Search Results"}
```
 * `not_equal_text`: ターゲットテキストは、キーの文字列値に等しくなるべきではありません。
```json
{"target":"title", "not_equal_text":"Page not Found"}
```
 * `have_text`: ターゲットテキストは、空でないキーの文字列値を含める必要があります。
```json
{"target":"title", "have_text":"Success"}
```
 * `not_have_text`: ターゲットテキストは、空でないキーの文字列値を含むべきではありません。
```json
{"target":"title", "not_have_text":"Error"}
```
 * `have_css`: ターゲット領域は、キーの値で定義されたDOMノードが含まれている必要があります。それは`target`は、CSSセレクターである場合のみ有効です。
```json
{"have_css":{"css":"button#btnOK", "with_text":"Go"}}
```
 * `not_have_css`: ターゲット領域は、キーの値で定義されたDOMノードを含めることはできません。それは`target`はCSSセレクターである場合のみ有効です。
```json
{"not_have_css":{"css":"button#btnNG", "with_text":"NG"}}
```
* `comment` (省略可): 該当ルールのコメント。
```json
{"target":"alert", "have_text":"Error", "comment":"エラーアラートが表示されることを確認します。"}
```

#### DOMノードの定義
`have_css` や `not_have_css` の値は、以下のキーを含むJSONマップです。

* `css`: CSSセレクターによって定義されたノード。
```json
{"have_css":{"css":"button.btn-primary"}}
```
* `with_text` (省略可): ノードの`text`は、キーの文字列値に等しくすべきことを定義する`css`への追加条件。
```json
{"have_css":{"css":"button.btn-primary", "with_text":"Save Changes"}}
```
* `with_part_text` (省略可): ノードの`text`は、空でないキーの文字列値が含まれていることを定義する`css`への追加条件。
```json
{"have_css":{"css":"button.btn-primary", "with_part_text":"Save"}}
```
* `with_value` (省略可): ノードの`value`は、キーの文字列値に等しくすべきことを定義する`css`に追加条件。
```json
{"have_css":{"css":"select", "with_value":"1"}}
```
* `with_part_value` (省略可): ノードの`value`は、空でないキーの文字列値が含まれていることを定義する`css`への追加条件。
```json
{"have_css":{"css":"input[name='username']", "with_part_value":"Foo"}}
```
* `with_href` (省略可): ノードの`href`は、キーの文字列値に等しくすべきことを定義する`css`への追加条件。 HREFが実際のDOMからのものであるとして、HTMLで定義されている相対URLの代わりに完全なURLです。（HTML定義の属性と比較する場合CSSのセレクターを使用。）
```json
{"have_css":{"css":"#backLink", "with_href":"http://www.sample.com/"}}
```
* `with_part_href` (省略可): ノードの`href`は、空でないキーの文字列値が含まれていることを定義する`css`への追加条件。
```json
{"have_css":{"css":"#backLink", "with_part_href":"sample.com"}}
```
* `with_index` (省略可): 一致したノードの（'1'から始まる）インデックスは、キーの数値に等しくすべきことを定義する`css`への追加条件。
```json
{"have_css":{"css":"input[name='gender']", "with_index":2, "with_text":"Male"}}
```
* `enabled` (省略可): ノードが有効かどうか(true/false)定義する`css`への追加条件。
```json
{"have_css":{"css":"#btnBack", "enabled":false}}
```
* `selected` (省略可): ノードを選択するかどうか(true/false)を定義する`css`への追加条件。
```json
{"have_css":{"css":"input[name='gender']", "with_index":2, "selected":true}}
```
* `displayed` (省略可): ノードが表示されるかどうか(true/false)を定義する`css`への追加条件。デフォルト値は`true`のです。
```json
{"have_css":{"css":"button.btn-primary", "displayed":false}}
```

サンプル
---

* 画面のURLは、テキスト`contract`を含める必要があります。
```json
{"target":"url", "have_text":"contract"}
```
* 画面のタイトルは、テキスト`Search Results`と同じでなければなりません。
```json
{"target":"title", "equal_text":"Search Results"}
```
* 実行時の変数@{JavascriptResult}の値は、テキスト`success`を含める必要があります。
```json
{"target":"@JavascriptResult", "have_text":"success"}
```
* 画面が`main`のフレーム名は、テキスト`Success`を含める必要があります。
```json
{"frame":"main", "have_text":"Success"}
```
* 画面には、ID`btnOK`とテキスト`Go`のボタンを含める必要があります。
```json
{"have_css":{"css":"button#btnOK", "with_text":"Go"}}
```
* 画面で、ID`link1`のリンクは、`http://www.sample.com/`にリンクする必要があります。
```json
{"have_css":{"css":"#link1", "with_href":"http://www.sample.com/"}}
```
* 画面で、ID`btnBack`のボタンを無効にする必要があります。
```json
{"have_css":{"css":"#btnBack", "enabled":false}}
```
* 画面で、ID`tblPersonel`を持つテーブルの2行目は、テキスト`John`を含める必要があります。
```json
{"have_css":{"css":"#tblPersonel tbody tr:nth-child(2)", "with_part_text":"John"}}
```
* 画面で、名前`gender`とラジオの二つ目を選択する必要があります。
```json
{"have_css":{"css":"input[name='gender']", "with_index":2, "selected":true}}
```
* 画面で、リストの２番目の項目に`iPhone 6s`を含める必要があります。`elementWaitTimeout`が定義されている場合、リストが表示されるまで、検証が待つことが可能です。
```json
{"target":"ul#search_results", "have_css":{"css":"li", "with_index":2, "with_part_text":"iPhone 6s"}}
```