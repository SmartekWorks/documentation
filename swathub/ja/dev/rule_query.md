クエリールール
===

SWATHubは、**クエリールール**を使用してWebページから値を取得します。Webデータ取得システムオペレーションを使用して、Webページから変数の値を取得することができます。この変数は、他の変数と同様にシナリオの後のステップで使用できます。

シナリオでWebデータ取得システムオペレーションが実行されると、SWATHubはクエリルールによって定義された条件に従ってターゲット値を検索し、変数名に保管します。

構文
---

クエリールールは、クエリー条件付きのJSONマップです。

```json
{"source":"title"}
```

JSONマップには、次のキーが含まれています。：

* `frame`　(省略可): ターゲットフレームの名前またはID。キーが定義されていない場合、メインのHTMLが使用されます。(Webアプリケーションがフレームを使用しない場合、キーは必要ありません)
```json
{"frame":"main", "source":"#orderNo", "css_key":"text"}
```
* `source`: ソース。次の値を使用できます。
 * `url`: ページのURL。クエリ文字列のパラメータの値を取得するには、`query_key`を使う必要があります。`query_key`が定義されていなければ、現在のURLに戻されます。
```json
{"source":"url"}
```
```json
{"source":"url", "query_key":"orderNo"}
```
 * `title`: ページのタイトル。
```json
{"source":"title"}
```
 * `alert`: 最後のアラートのテキストは、前のオペレーションで表示されます。
```json
{"source":"alert"}
```
 * *CSSセレクター*: CSSセレクターによって定義されたページ内の可視ノード（表示されなければならない）`css_key`を使ってノードのテキストや属性を取得する必要があります。
```json
{"source":"#selectGender", "css_key":"value"}
```
 * *XPathセレクター*: XPathセレクターによって定義されたAPPのノード。`attr`を利用して、ノードのテキストや他の属性を取得します。
```json
{"source":"//XCUIElementTypeOther[@name='NotificationShortLookView']","attr":"text"}
```
* `query_key` (省略可): URLクエリ文字列のパラメータキー。このキーは、`source`が`url`タイプの場合に有効です。
```json
{"source":"url", "":"orderNo"}
```
* `css_key` (省略可): ノードの属性名 (`text`はノードのテキストを取得するために使用できます) 。このキーは、`source`が*Selector String*のときに必要です。
```json
{"source":"#selectGender", "css_key":"value"}
```
* `css_index` (省略可): 複数一致したノードのインデックス (`1`から始まる) このキーは、`source`が*Selector String*である場合にのみ使用できます。
```json
{"source":"input[name='gender']", "css_key":"value", "css_index":2}
```
* `attr` (省略可): ノードの属性の名前、（`text`はノードのテキストを指します）。`source`が*XPathセレクター*である場合、このキーは必須です。
```json
{"source":"#XCUIElementTypeTabBar", "attr":"label"}
```
* `comment` (省略可): ルールのコメント。
```json
{"source":"title", "comment":"Use the text of page title."}
```

サンプル
---

* 現在のURLにある`orderNo`のパラメーター値を使用。
```json
{"source":"url", "query_key":"orderNo"}
```
* 画面のnameが`main`、フレームのIDが"`orderNo`の要素のテキスト値を使用。
```json
{"frame":"main", "source":"#orderNo", "css_key":"text"}
```
* IDが`selectGender`のセレクトに選択された項目の`value`
```json
{"source":"#selectGender", "css_key":"value"}
```
* IDが `btnOrder`であるボタンの `name`属性の値を使用。
```json
{"source":"#btnOrder", "css_key":"name"}
```
* nameが`gender`のラジオの二つ目の`value`を使用。
```json
{"source":"input[name='gender']", "css_key":"value", "css_index":2}
```
