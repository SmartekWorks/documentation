Webテンプレート
===

概要
---

SWATHubは**Webテンプレート**を使用して、Webページのユーザー操作をモデルを記述します。様々なタイプのWebアプリケーションのフロントエンドライブラリに対応できるようにテンプレートのカスタマイズを行うことができます。このカスタマイズ対応については顧客からの要求があれば当社専門チームによるカスタマイズサービスを提供します。

### Webテンプレートカスタマイズの目的
一部の環境ではデフォルトのWebテンプレートで正しく認識されない場合があります。テストシナリオの構築をより効率的に実現するには、Webテンプレートをカスタマイズする必要があります。ここではよくあるパターンを示します。

* 対話型のHTMLタグなしでオペレーション、例えばJavaScriptやUIライブラリーなどのような`div`インタラクティブの非対話型のHTMLタグを利用する場合があります。
* オペレーションサイズについて、デフォルトのWebテンプレートでは一般的なユーザビリティに応じた適切なサイズでオペレーションを抽出します。但し、いくつかのオペレーションを大きなものにマージしたり、複数に分割したい場合があります。
* 実行時のオペレーションやノードの見つけ方に関するポリシー変更について、 テストケースは通常静的ページではなく動的ページで実行されるため、信頼性の高い自動化を実現するためのロケータポリシーが必要です。ほとんどのWebアプリケーションは `id`と`name`を使うなど、統一されたロケータポリシーを持っていないため、Webテンプレート内のさまざまなノード、オペレーションに対して異なった見つけ方のポリシーを設定する必要があります。
* オペレーションとノードのラベル取得方法に関するポリシー変更では、 SWATHubはオペレーションとノードを抽出するときに、オブジェクト名のHTMLからラベルを取得します。そのポリシーは、Webアプリケーションに適したポリシーに変更することができます。

### Webテンプレートカスタマイズの仕方
テンプレートのカスタマイズはSWATHub GUIで行います。カスタマイズを開始するには以下の手順に従ってください。

* モデルライブラリでカスタマイズするページを選択し、ドロップダウンメニューで **<i class="fa fa-gears"></i>設定** をクリックすると、現在のWebテンプレートがポップアップダイアログに表示されます。
* **カスタマイズテンプレート**をクリックすると、テンプレートエディタに入ります。このエディタでは、[Webテンプレートの構文](#Webテンプレートの構文)に従ってテンプレート<sup>1</sup>を修正し、1つ以上のページでプレビューしてその効果を確認してから最後に複数ページに適用します。

?> 1. カスタマイズ作業を簡単にするために、当社オンラインテクニカルサポートの支援により、最適なテンプレートの作成方法をご案内します。**<i class="fa fa-support"></i>** アイコンをクリックしてカスタマイズサービスへリクエストしてください。

### Webテンプレートの構文
Webテンプレートは、以下のコンポーネントを定義するためのいくつかのキーを使用したJSONマップ文字列です。各コンポーネントの構文に関する詳細は後述します。

```json
{
	"imports":[],
	"operations":[],
	"collectionNodes":{},
	"singleNodes":{},
	"labelPolicies":{},
	"locatorPolicies":{},
	"settings":{}
}
```

* `"imports"`: SWATHubは、インポートや再利用できるテンプレートを用意してます。
* `"operations"`: オペレーションは、最終的にページモデルのオペレーションとして抽出される特別なコレクションノードです。
* `"collectionNodes"`: コレクションノードは特定の関係でシングルノードや他のコレクションノードの集まりです。例えば、順番的に操作する一つのフォーム配下のすべての入力、どちらかを選択してクリックするリストの中のリンクなどです。
* `"singleNodes"`: シングルノードは、ページを操作するアトミックノードです。例えばテキストボックス、ボタンなどです。
* `"labelPolicies"`: ラベルポリシーは、ページモデルを生成する際に、シングルノードやコレクションノードのラベルを取得する方法を定義します。
* `"locatorPolicies"`:ロケーターポリシーは、実行中にシングルノードやコレクションノードの場所を特定する方法を定義します。
* `"settings"`:全体的な設定がテンプレート内のすべてのオペレーションに影響を及ぼす。

上記すべてのコンポーネントは、ほかのコンポーネントから利用されない限り必須ではありません。例えば、コレクションノードで利用したすべてのシングルノードがいずれかのテンプレート、またはインポートテンプレートに存在する必要があります。ラベルポリシーやロケーターポリシーも同じです。

コアコンポーネント
---

### インポートの定義
インポートは、Webテンプレートに含まれるテンプレートライブラリを定義します。インポートしたライブラリで定義されたすべてのコンポーネントを再利用することができます。

```json
{
	"imports":[
		{"name":"html5", "version":"1.0.0"}
	]
}
```

各テンプレートは、その名前とバージョン<sup>1</sup>で定義されます。

* `"name"`: テンプレートの固有の名前。
* `"version"`: テンプレートのバージョン。

?> 1. 現在SWATHubは、この資料の最後に参照することができるHTML5 v1.0.0デベロッパーのテンプレートが用意されています。

### シングルノードの定義
シングルノードは、JSONマップで定義します。キーはコード（コレクションノードの定義から参照するコード）で値はノードの定義です。下記サンプルを参照ください。

```json
{
	"singleNodes":{
		"link":{"selectors":["a[href]", "area[href]"], "decisive":true, "action":"click", "label":"link", "locator":"link"},
		"radio":{"selectors":["input[type=radio]"], "decisive":false, "action":"click", "label":"fieldRight", "locator":"field", "group":{"by":"name", "label":"group", "locator":"group"}},
	}
}
```

シングルノードの定義は、以下キーの値を含むJSONマップです。:

* `"selectors"`: HTMLのDOM内のノードを定義するCSSセレクタのJSONリスト。
* `"decisive"`: 該当ノードがオペレーションを完結するか、しないかどうかを`true`か`false`かで示します。たとえば、通常のボタンには`true`を使用し、テキストボックスには`false`を使用します。
* `"action"`: ノードに対して可能なアクションタイプを示すアクションコードです。下記のアクションコード表を参照してください。
* `"label"` (省略可): ラベルポリシーコードでlabelPoliciesに定義されたラベルの取得方法を使用します。
* `"locator"` (省略可): ロケーターポリシーコードでlocatorPoliciesに定義されたノードの場所を特定する方法を使用します。
* `"group"` (省略可): ラジオやチェックボックスのようなノードをグループ化する方法を定義します。JSONマップ定義には以下のキーが含まれます。
 * `"by"` (省略可): ノードをグループ化するために使用する属性名です。 `"name"`がデフォルトで使用されます。
 * `"label"` (省略可): グループ全体のラベルポリシーコードです。
 * `"locator"` (省略可): グループ全体のロケーターポリシーコードです。

アクションコードテーブル:

| アクションコード   | 説明
| --------------- | -----------
| `"type"`        | テキスト入力などのノードにテキストを入力
| `"upload"`      | ファイル入力などのノードにファイルパスを設定
| `"select"`      | セレクトのオプションなどのノードを選択
| `"check"`       | チェックボックスなどのノードをチェック
| `"click"`       | ボタンなどのノードをクリック
| `"moveTo"`      | ホバーボタンとしてノードにマウスカーソルを移動
| `"rightClick"`  | コンテキストメニューのリンクなどのノードを右クリック
| `"doubleClick"` | ダブルクリック可能な領域などのノードをダブルクリック
| `"scriptClick"` | JSで実現したクリック

### コレクションノードの定義
コレクションノードは、JSONマップで定義します。キーはコード（コレクションノードかオペレーションの定義から参照するコード）で値はノードの定義です。下記サンプルを参照ください。

```json
{
	"collectionNodes":{
		"form":{"selectors":["*"],"children":["text", "textarea", "upload", "checkbox", "radio", "select", "multiSelect", "buttonGroup"], "action":"and", "label":"block", "locator":"block"},
		"buttonGroup":{"selectors":["*"], "children":["button", "link"], "action":"or", "label":"block", "locator":"block"},
	}
}
```

コレクションノードの定義は、以下キーの値を含むJSONマップです。

* `"selectors"`: HTMLのDOM内のノードを定義するCSSセレクタのJSONリストです。親ノードまたはオペレーションと同じ領域を示すために`"*"`使用することができます。
* `"children"`: コレクションノードに含まれるシングルノードまたはコレクションノードのJSONリストです。
* `"action"`: ノードに対して可能なアクションタイプを示すアクションコードです。下記のアクションコード表を参照ください。
* `"label"` (省略可): ラベルポリシーコードでlabelPoliciesに定義されたラベルの取得方法を使用します。
* `"locator"` (省略可): ロケーターポリシーコードでlocatorPoliciesに定義されたノードの場所を特定する方法を使用します。
*
アクションコードテーブル:

| アクションコード    | 説明
| --------- | -----------
| `"and"`   | すべての子ノードを順番に操作
| `"or"`    | 子ノードのどちらかを選択して操作
| `"multi"` | 複数の子ノードを選択（このアクションは、`multi-select`のみで使用）

### コレクションノードの定義（繰り返し）
コレクションノードで、異なるデータ行や検索結果の一覧など動的子ノードの繰り返しを含むような、特別な種類を定義することができます。 以下はサンプルです。

```json
{
	"collectionNodes":{
		"list":{"selectors":["ul", "ol"], "children":["list-unit"], "action":"or", "repetitive":true, "similarity":0.90, "combination":2, "percentage":0.5},
		"list-unit":{"selectors":["li"], "children":["buttonGroup"], "action":"and"},
	}
}
```

普通のコレクションノードの定義にいくつかの違いがあります。まず、親コレクションノードと子コレクションノード両方をを定義する必要があります。`"label"` or `"locator"`は定義する必要はありません。繰返しコレクターノードを処理するメカニズムが全く異なるためです。最後に、親コレクションノードに以下の新しいキーを定義する必要があります。

* `"repetitive"`: 繰り返しタイプのコレクションノードでは`true`にする必要があります。
* `"similarity"`: 子ノードのどこまで繰り返しと判断するかを示す値です。`0` から`1`の小数で、大きいほど、より厳格です。
* `"combination"`: 繰り返しの判断でどのぐらい隣接する子ノードをグループとしてみるかを示す値です。`1`から`9`までの整数です。例えば、テーブルに論理行を作る`row-span=2` で `tr`を2つ使うなら、`2`以上の値を設定する必要があります。
* `"percentage"`: 親ノードに繰り返しと見られない子ノードが存在する場合、繰り返しタイプのコレクションノードと判断するかを示す値です。`0`から`1`の小数で、繰り返し子ノードの割合がこのパーセンテージを超える必要があります。

?> 繰返しノードの定義は非常に複雑です。まずはデフォルトのテンプレートで始め、変更する場合はいくつか試してから行うことをお勧めします。

### オペレーションの定義
オペレーションは、JSON形式のリストとして定義されます。ナレッジエンジンは順番に解析を行うため、定義の順番に注意する必要があります。以下がサンプルです。

```json
{
	"operations":[
		{"selectors":["form", "table"], "collectionNode":"form", "nesting":"outer"},
		{"selectors":["map", "ul", "ol", "dl", "nav", "div", "a", "button"], "collectionNode":"buttonGroup", "nesting":"inner"},
	]
}
```

オペレーションの定義は、以下キーの値を含むJSONマップです。

* `"selectors"`: HTMLのDOM内のノードを定義するCSSセレクタのJSONリストです。
* `"collectionNode"`: 上記の領域にオペレーションとして抽出するコレクションノードです。
* `"nesting"`: `outer`か`inner`かで、エリア内の検索順序を示します。`inner`はDOMツリーのボトムからのオペレーションを検索することを意味し、`outer` は、DOMツリーのトップから検索することを意味します。例えば、`"selectors"`にネストした`"div"`が含まれているなら、抽出結果は値により影響を受けます。
* `"collectionNodes"` (省略可): コレクションノードはオペレーションの範囲で定義されます。
* `"singleNodes"` (省略可): シングルノードはオペレーションの範囲で定義されます。
* `"labelPolicies"` (省略可): ラベルポリシーはオペレーションの範囲で定義されます。
* `"locatorPolicies"` (省略可): ロケーターポリシーはオペレーションの範囲で定義されます。
* `"settings"` (省略可): 設定はオペレーションの範囲で定義されます。

### オペレーションの3つの範囲
テンプレート内部のオペレーションはコンポーネントの可視性を定義するための範囲に3つのレベルがあります。

* インポートスコープ: インポートされたテンプレートで定義したコンポーネントは、テンプレートすべてのオペレーションを参照することができます。`html5.text`や`html5.form`など、**{template name}.{component code}**の形。
* テンプレートスコープ: テンプレートで定義されコンポーネントは、**{component code}**で、すべてのオペレーションを参照することができます。
* オペレーションスコープ: 一つの特定のオペレーションで定義されたコンポーネントは、**{component code}**でのみ単独で使用することができます。重複コードがテンプレートに存在する場合、テンプレートの適用範囲は、操作範囲によって上書きされます。

3つ全てのレベル範囲のサンプルテンプレートを参照。

```json
{
	"imports":[
		{"name":"html5", "version":"1.0.0"}
	],
	"operations":[
		{"selectors":["div.template-form"], "collectionNode":"html5.form", "nesting":"outer"},
		{"selectors":["div.rule-form"], "collectionNode":"rule-form", "nesting":"outer"},
		{
			"selectors":["div.operation-form"],
			"collectionNode":"operation-form",
			"nesting":"outer",
			"collectionNodes":{
				"operation-form":{"selectors":["*"], "children":["html5.text", "my-button"], "action":"and", "label":"html5.block", "locator":"html5.block"}
			},
			"singleNodes":{
				"my-button":{"selectors":["span[onclick]"], "decisive":"true", "action":"click", "label":"html5.button", "locator":"html5.button"}
			}
		}
	],
	"collectionNodes":{
		"rule-form":{"selectors":["*"], "children":["html5.text", "my-button"], "action":"and", "label":"html5.block", "locator":"html5.block"}
	},
	"singleNodes":{
		"my-button":{"selectors":["td[onclick]"], "decisive":"true", "action":"click", "label":"html5.button", "locator":"html5.button"}
	}
}

```

上記のテンプレートで定義された3つのオペレーションがあります。各オペレーションは特定の範囲を意味します。

* `"div.template-form"`: WebページからHTML5のテンプレートによって定義された`"html5.form"` コレクションノードを認識します。
* `"div.rule-form"`: 現在のテンプレートで以下にコレクションノードで定義された`"rule-form"`を認識します。中にテンプレートから`"html5.text"`、テンプレートで定義されたシングルノードから`"my-button"`は利用されています。
* `"div.operation-form"`: このオペレーションクロージャーの中で定義された`"operation-form"`で認識します。中に`"html5.text"`や`"my-button"`は利用されています。`"my-button"`は明らかに`"span[onclick]"`を意味します。

補助コンポーネント
---

### ラベルのポリシーの定義
ラベルポリシーは、JSONマップとして定義されています。各エントリは、ノード定義で参照できるポリシーコードとキーを持つシングルラベルポリシーを意味します。ここでのサンプルは、次のとおりです。

```json
{
	"labelPolicies":{
		"fieldLeft":["label", "prevSibling", "parentPrevSibling", "parentTdPrevSibling", "alt", "title", "id", "name", "placeholder", "value"],
		"fieldRight":["label", "nextSibling", "parentNextSibling", "alt", "title", "id", "name", "placeholder", "value"],
		"button":["label", "alt", "title", "value", "text", "id", "name"],
	}
}
```

各ラベルポリシーは、取得方法を順番に構成します。一つは、空でない文字列を返すまですべてこれらのメカニズムが順に処理されます。詳細な説明は、以下参照します。

| メカニズム    				| 説明
| --------- 				| -----------
| `"label"` 				|  `<label>`ノードのテキストがターゲットノードに対応します。ターゲットノードの`id`が`<label>`ノードの`for`値と同じでなければなりません。　
| `"text"` 					| ターゲットノードが所有するテキストを取得し、コレクションノードの場合はすべての子供の合計テキストを取得
| `"prevSibling"`   		| DOMツリー内の直前の兄弟関係ノードのテキスト
| `"nextSibling"`   		| DOMツリー内の直後の兄弟関係ノードのテキスト
| `"parentPrevSibling"`   	| DOMツリー内のターゲット親ノードに対して直前の兄弟関係ノードのテキスト
| `"parentNextSibling"`  	| DOMツリー内のターゲット親ノードに対して直後の兄弟関係ノードのテキスト
| `"parentTdPrevSibling"`   | DOMツリー内のターゲットの最寄り`<td>`親ノードに対して直前の兄弟関係`<td>`ノードのテキスト
| `"imgChild"` 				| `<img>`ノード の`alt`、`title`、`id`の値
| `"firstChild"`   			| 最初の子ノードのテキスト
| `"alt"`   				| ターゲットノード属性の値 `alt`
| `"title"`   				| ターゲットノード属性の値 `title`
| `"id"`	   				| ターゲットノード属性の値 `id`
| `"name"`   				| ターゲットノード属性の値 `name`
| `"placeholder"`  			| ターゲットノード属性の値 `placeholder`
| `"value"`   				| ターゲットノード属性の値 `value`

### ロケータポリシーの定義
ロケーターポリシーはJSONマップで定義します。キーはコード（ノード定義で参照するコード）で値はロケーターポリシーの定義です。下記サンプルを参照ください。

```json
{
	"locatorPolicies":{
		"field":["name", "id", "label", "xpath"],
		"button":["id", "name", "value", "label", "xpath"],
		"link":["id", "label", "xpath"],
	}
}
```

各ロケーターポリシーは、取得方法を順番に構成します。すべてこれらのローケーティング方式は順番に処理されます。詳細な説明は、以下を参照ください。

| メカニズム     	| 説明
| --------- 	| -----------
| `"name"` 		| ターゲットノードと同じ`name`でノードを取得
| `"id"` 		| ターゲットノードと同じ`id`でノードを取得
| `"value"`		| ターゲットノードと同じ`value`でノードを取得
| `"class"`		| ターゲットノードと同じ`class`でノードを取得
| `"xpath"`		| ターゲットノードと同じ`xpath`でノードを取得（ここで`xpath`はオペレーションナレッジツリー内の親に対する相対`xpath`です）
| `"label"`		| ターゲットノードと同じ`label`でノードを取得（ここで`label`はラベルポリシーによって生成されたものです）


### 設定の定義
テンプレート内のすべてのオペレーションの振舞に影響を与えるには、いくつかのグローバル設定があります。

* `locatorRelation` (省略可): `or`や`and`は、ロケータポリシーのすべてのロケーティング機構の関係を表します。`or`の場合は、ノードが利用したメカニズムのいずれかによってロケーティングできるまで探し続け、`and`の場合、順番に１つのメカニズムでこのノードが存在しないことがわかるとロケーティング停止します。例えば、次のこの入力ノードについて
```html
<input id='foo' name='bar' type='text'>
```
```json
{
	"locatorPolicies":{
		"input":["id", "name"]
	}
}
```
`or`の場合、`id=foo`か`name=bar`のいずれからのWebページのこのノードのロケーターです。しかし、`and`の場合、`foo`のIDの入力がない場合、このノードが欠落していることを決定します。デフォルトの関係は高精度なロケーターを保証するために`and`になっています。
* `matchAllFrames` (省略可): `true` もしくは `false`。ページがアップグレード際に全てのFrameにオペレーションをマッチングするかどうかを設定します。デフォルトは`false`で、同じ ID、nameもしくは位置のFrameのみでオペレーションをマッチングします。Frameの変化がある場合、`true`を設定してアップグレードします。
* `extAttributes` (省略可): 補助コンポーネントに使えるカスタマイズした拡張HTML属性。拡張属性の名前がキーで、その定義がバリューでのマップになります。（デフォルト：`{}`）
  * `attr`:元の属性名、例えば：`ng-model`、`id`、`text`。
  * `axis`：（可选）锚操作，以当前节点为基准选择关联节点。例如 `parent/preceding-sibling[2]`，`child[3]`。目前支持 `parent`, `following-sibling`, `preceding-sibling` 和 `child` 4种操作及其组合。
  * `pattern` (省略可): 元の属性値から拡張属性値を取得する正規表現式。例えば、`^[a-z]{16}(.+?)$`は最初の16桁を無視した後の残りの値を利用する意味です。

```json
{
	"extAttributes": {
		"realId": {
			"attr":"id",
			"pattern":"^field[a-z]{16}(.+?)$"
		}
	}
}
```
上記の設定では、`id`を元に`readId`という拡張属性が定義されます。
* `extLabelPolicies` (省略可): ラベルのポリシーに使えるカスタマイズした拡張ラベルポリシー。拡張ラベルポリシーの名前がキーで、その定義がバリューでのマップになります。（デフォルト：`{}`）
  * `selector`: ラベルをローケティングするためのCSSセレクター、`@{属性名}`で変数が使える正規表現式です。例えば、`div[id~=^[a-z]{16}@{id}$]`は対象ノードの`id`で終了した`id`を持つ一番目の`div`。
  * `attr` (省略可): ラベルとして利用するセレクターで見つけたノードの属性。設定しないときに、ノードのテキストを利用します。

```json
{
	"extLabelPolicies": {
		"divLabel": {
			"selector":"div[id~=^label[a-z]{16}@{realId}$]"
		}
	}
}
```
上記の設定では、対象ノードと同じ`realId`を持つ一番目の`div`のテキストを利用するラベルポリシーが定義されます。

ケーススタディ
---

### jQuery UIダイアログ
デフォルトのWebテンプレートは、標準のHTML仕様に作られたページをうまく解析できますが、UIライブラリやJSで作られたページの操作要素を利用するWebページの場合、このテンプレートを拡張して解析することができます。

![jQuery UI dialog](../assets/img/dev-template-sample-1.png 'jQuery UI dialog')

```html
<div class="ui-dialog ui-widget">
	<div class="ui-dialog-titlebar"><span id="ui-id-1" class="ui-dialog-title">Create new user</span></div>
	<div id="dialog-form" class="ui-dialog-content ui-widget-content">
		<form>
			<fieldset>
				<label for="name">Name</label><input type="text" id="name" name="name">
				<label for="email">Email</label><input type="text" id="email" name="email">
				<label for="password">Password</label><input type="password" id="password" name="password">
			</fieldset>
		</form>
	</div>
	<div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
		<div class="ui-dialog-buttonset">
			<button type="button"><span class="ui-button-text">Create an account</span></button>
			<button type="button"><span class="ui-button-text">Cancel</span></button>
		</div>
	</div>
</div>
```

上記のHTMLに関して、デフォルトテンプレートは１つのオペレーションとして`<form>`ブロックを抽出し、他のオペレーションとして`<div class="ui-dialog-buttonset">`ブロックします。しかし、１つのフォームにダイアログ内のすべての要素を組み合わせたい場合、以下のように既存テンプレートに１つだけ小さな修正を加えます。

```json
{
	"operations":[
		{"selectors":["div.ui-dialog", "form", "table"], "collectionNode":"html5.form", "nesting":"outer"}
	]
}
```

?> すべての子ノードを一緒にすることができるように、**"div.ui-dialog"**は**"form"**以前に置かなければならない点に注意ください。

上記ケースの更なるステップとして新テンプレートを作成します。 今ダイアログは`form`として扱います。しかし、これはそのようなダイアログに対してより多くの適切なラベル取得や、ローケーティングをしたい場合に十分ではありません。そこで、それぞれオペレーションテンプレート、コレクションノードテンプレートとラベルポリシーを作成する必要があります。

```json
{
	"operations":[
		{
			"selectors":["div.ui-dialog"], "collectionNode":"ui-dialog", "nesting":"outer",
			"collectionNodes":{
				"ui-dialog":{"selectors":["*"],"children":["html5.text", "html5.buttonGroup"], "action":"and", "label":"firstChild", "locator":"html5.block"}
			},
			"labelPolicies":{
				"firstChild":["firstChild"],
			}
		}
	]
}
```

これによって、`UI-dialog`コレクションノードから構成されている新しいタイプのオペレーションを作成します。このコレクションノードは、最初の子供テキストがラベルになるため、タイトルは`"Create new user"`となります。

### Kendo UI ドロップダウンリスト
Kendo UIなどの最近のフロントエンドフレームワークがよくセレクトタグの代わりに、タグをカスタマイズしてもっとスタイリッシュなページ要素を実現しています。一般的な実現方法は、いつくかのクリック可能なテキストフィールドと選択肢を含むコンテナーを組み合わることです。例として、 [Kendo UI ドロップダウンリスト](http://demos.telerik.com/kendo-ui/dropdownlist/index)のスクリーンショットとHTMLコードが下記になります。

![Kendo UI dropdown list](../assets/img/dev-template-sample-2.png 'Kendo UI dropdown list')

クリック可能なテキストフィールドのHTMLコード。

```html
<form>
	<h4>Cap Color</h4>
	<span title="" style="width: 100%;" class="k-widget k-dropdown k-header" unselectable="on" role="listbox">
		<span unselectable="on" class="k-dropdown-wrap k-state-default">
			<span unselectable="on" class="k-input">Black</span>
			<span unselectable="on" class="k-select">
				<span unselectable="on" class="k-icon k-i-arrow-s">select</span>
			</span>
		</span>
		<input id="color" value="1" style="width: 100%; display: none;" data-role="dropdownlist">
	</span>
</form>
```

選択肢を含むコンテナーのHTMLコード。

```html
<div class="k-list-container k-popup k-group k-reset" id="color-list" data-role="popup">
	<div class="k-group-header" style="display:none"></div>
	<div class="k-list-scroller" style="height: auto;">
		<ul class="k-list k-reset" tabindex="-1" id="color_listbox" data-role="staticlist" role="listbox">
			<li tabindex="-1" role="option" class="k-item k-state-selected k-state-focused" id="black">Black</li>
			<li tabindex="-1" role="option" class="k-item" data-offset-index="1">Orange</li>
			<li tabindex="-1" role="option" class="k-item" data-offset-index="2">Grey</li>
		</ul>
	</div>
</div>
```

デフォルトテンプレートでは上記両方が解析されません。なぜなら、両方とも標準の操作可能タグではありません。そのため、新しいシングルノードをまず定義する必要があります。それからコレクションノードとオペレーションを定義します。

下記がクリック可能なテキストフィールドを解析するためのテンプレートです。**"k-dropdown"**クラスの要素をボタンとして認識します。同時に**"Cap Color"**をラベルとして利用するように定義します。シングルノードを定義してから、**"myButtonGroup"**のコレクションに追加します。

```json
{
	"operations":[
		{
			"selectors":["form"], "collectionNode":"myForm", "nesting":"outer",
			"collectionNodes":{
				"myForm":{"selectors":["*"],"children":["html5.text", "html5.radio", "html5.checkbox", "myButtonGroup"], "action":"and"},
				"myButtonGroup":{"selectors":["*"], "children":["html5.button", "html5.link", "dropdownButton"], "action":"or"}
			},
			"singleNodes":{
				"dropdownButton":{"selectors":[".k-dropdown"], "decisive":true, "action":"click", "label":"html5.fieldLeft", "locator":"html5.button"}
			}
		}
	]
}
```

コンテナーリストのテンプレートが下記になります。すべての**"li[role=option]"**をクリック可能なオプションとして定義します。また、**"k-list-container"**を偽のセレクトとして定義すれば良いです。

```json
{
	"operations":[
		{
			"selectors":[".k-list-container"], "collectionNode":"optionGroup", "nesting":"outer",
			"collectionNodes":{
				"optionGroup":{"selectors":["*"],"children":["optionButton"],"action":"or"}
			},
			"singleNodes":{
				"optionButton":{"selectors":["[role=option]"],"action":"click","decisive":true}
			}
		}
	]
}
```

### jqGrid
グリッドが業務アプリで一番厄介なところだと言えます。人気のある[jqGrid](http://www.trirand.com/blog/jqgrid/jqgrid.html)をサンプルとしてSWATHubでどうやってグリッドを複数行のフォームで解析するかを説明します。まず、jqGridのスクリーンショットとHTMLコードを確認してみましょう。

![jqGrid](../assets/img/dev-template-sample-3.png 'jqGrid')

```html
<div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_list4" dir="ltr" style="width: 700px;">
    <div class="ui-jqgrid-view" id="gview_list4" style="width: 700px;">
        <div class="ui-jqgrid-titlebar">
    		<span class="ui-jqgrid-title">Manipulating Array Data</span>
		</div>
        <div class="ui-jqgrid-hdiv" style="width: 700px;">
            <div class="ui-jqgrid-hbox">
                <table class="ui-jqgrid-htable" style="width:682px" role="grid" aria-labelledby="gbox_list4" cellspacing="0" cellpadding="0" border="0">
                </table>
            </div>
        </div>
        <div class="ui-jqgrid-bdiv" style="height: 250px; width: 700px;">
            <div style="position:relative;">
                <table id="list4" class="ui-jqgrid-btable" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid">
                    <tbody>
                        <tr role="row" id="1" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                            <td role="gridcell" style="text-align:center;"
                                <input role="checkbox" type="checkbox" id="jqg_list4_1" class="cbox">
                            </td>
                            <td role="gridcell" title="1">1</td>
                            <td role="gridcell" title="2007-10-01">2007-10-01</td>
                            <td role="gridcell" title="test">test</td>
                            <td role="gridcell" title="200.00">200.00</td>
                            <td role="gridcell" title="10.00">10.00</td>
                            <td role="gridcell" title="210.00">210.00</td>
                            <td role="gridcell" title="note">note</td>
                        </tr>
                        <tr role="row" id="2" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                            <td role="gridcell" style="text-align:center;"
                                <input role="checkbox" type="checkbox" id="jqg_list4_2" class="cbox">
                            </td>
                            <td role="gridcell" title="2">2</td>
                            <td role="gridcell" title="2007-10-02">2007-10-02</td>
                            <td role="gridcell" title="test2">test2</td>
                            <td role="gridcell" title="300.00">300.00</td>
                            <td role="gridcell" title="20.00">20.00</td>
                            <td role="gridcell" title="320.00">320.00</td>
                            <td role="gridcell" title="note2">note2</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="ui-jqgrid-resize-mark" id="rs_mlist4">&nbsp;</div>
</div>
```

通常、グリッドがヘッダーとボディーを含めますので、我々が二つのオペレーションで、それぞれヘッダーをフォームとして、ボディーをテーブルとして解析します。ボディー部の実行の場合、まずテキストもしくはインデックスクエリーで行をローケーティングして、次にこの行をフォームとして利用できます。

```json
{
	"operations":[
		{"selectors": ["div.ui-jqgrid-hdiv"], "collectionNode":"html5.form", "nesting":"outer"},
		{"selectors": ["div.ui-jqgrid-bdiv"], "collectionNode":"html5.table", "nesting":"outer"},
	]
}
```

HTML5テンプレート
---

HTML5のテンプレートは、標準のHTML仕様を活用し、SWATHubプラクティスによるWebページのほとんどに適用されます。

```json
{
	"name":"html5",
	"version":"1.0.0",

	"operations":[
		{"selectors":["form", "table"], "collectionNode":"form", "nesting":"outer"},
		{"selectors":["map", "ul", "ol", "dl", "nav", "div", "a", "button"], "collectionNode":"buttonGroup", "nesting":"inner"}
	],

	"collectionNodes":{
		"form":{"selectors":["*"],"children":["text", "textarea", "upload", "checkbox", "radio", "select", "multiSelect", "buttonGroup"], "action":"and", "label":"block", "locator":"block"},
		"buttonGroup":{"selectors":["*"], "children":["button", "link"], "action":"or", "label":"block", "locator":"block"},
		"select":{"selectors":["select:not([multiple])"], "children":["option"], "action":"or", "label":"fieldLeft", "locator":"field"},
		"multiSelect":{"selectors":["select[multiple]"], "children":["option"], "action":"multi", "label":"fieldLeft", "locator":"field"},

		"list":{"selectors":["ul", "ol"], "children":["list-unit"], "action":"or", "repetitive":true, "similarity":0.90, "combination":2, "percentage":0.5, "label":"block", "locator":"block"},
		"list-unit":{"selectors":["li"], "children":["buttonGroup"], "action":"and", "label":"block", "locator":"block"},
		"table":{"selectors":["tbody"], "children":["table-unit"], "action":"or", "repetitive":true, "similarity":0.90, "combination":2, "percentage":0.5, "label":"block", "locator":"block"},
		"table-unit":{"selectors":["tr"], "children":["form"], "action":"and", "label":"block", "locator":"block"}
	},

	"singleNodes":{
		"text":{"selectors":["input:not([type])", "input[type=text]", "input[type=password]", "input[type=email]", "input[type=url]", "input[type=search]", "input[type=number]", "input[type=tel]"], "decisive":false, "action":"type", "label":"fieldLeft", "locator":"field"},
		"textarea":{"selectors":["textarea"], "decisive":false, "action":"type", "label":"fieldLeft", "locator":"field"},
		"upload":{"selectors":["input[type=file]"], "decisive":false, "action":"upload", "label":"fieldLeft", "locator":"field"},
		"checkbox":{"selectors":["input[type=checkbox]"], "decisive":false, "action":"check", "label":"fieldRight", "locator":"field", "group":{"by":"name", "label":"group", "locator":"group"}},
		"radio":{"selectors":["input[type=radio]"], "decisive":false, "action":"click", "label":"fieldRight", "locator":"field", "group":{"by":"name", "label":"group", "locator":"group"}},
		"option":{"selectors":["option"], "decisive":false, "action":"select", "label":"text", "locator":"text"},
		"link":{"selectors":["a", "area"], "decisive":true, "action":"click", "label":"link", "locator":"link"},
		"button":{"selectors":["input[type=submit]", "input[type=button]", "input[type=image]", "input[type=reset]", "button"], "decisive":true, "action":"click", "label":"button", "locator":"button"}
	},

	"labelPolicies":{
		"fieldLeft":["label", "prevSibling", "parentPrevSibling", "parentTdPrevSibling", "alt", "title", "id", "name", "placeholder", "value"],
		"fieldRight":["label", "nextSibling", "parentNextSibling", "alt", "title", "id", "name", "placeholder", "value"],
		"button":["label", "alt", "title", "value", "text", "id", "name"],
		"link":["alt", "title", "text", "id", "name", "imgChild"],
		"text":["alt", "title", "text", "id", "name"],
		"block":["id", "name"],
		"group":["prevSibling", "parentPrevSibling", "parentTdPrevSibling"]
	},

	"locatorPolicies":{
		"field":["name", "id", "label", "xpath"],
		"button":["id", "name", "value", "label", "xpath"],
		"link":["id", "label", "xpath"],
		"text":["label", "value", "xpath"],
		"block":["id", "name", "xpath"],
		"group":["name"]
	},

	"settings":{
		"locatorRelation":"or",
		"matchAllFrames":false,
		"extAttributes":{},
		"extLabelPolicies":{}
	}
}

```

プレビュー設定
---

ページキャプチャーツールはWebページのソースのみキャプチャーするので、リソースファイルをSWATHubにアップロードしません。プレビューは、リソースファイルにアクセスするために、正しいリモートURLを必要とします。例えば、 CSSファイルや画像ファイル。ほとんどの場合、SWATHubは、HTMLキャプチャの設定に従って自動的にプレビュー設定を決定します。しかし、時にはリソースファイルが利用できない場合に手動で行う必要があります。

プレビューの設定を変更するには、2つの方法があります。それらのいずれかまたは両方を使用することができます。

### プレビュー用URL
全ての相対URLは、入力されたベースURLに基づき計算されます。

### プレビュー用置換ルール
文字列が置換ルールに従ってプレビューHTMLで置き換えることができます。

* **プレビュー用の置換ルール**: **置換ルール**の配列。ルールは定義された順序で実行されます。
* **置換ルール**: 以下のキーを含むJSONマップです。
  * **キー**: ソース文字列。正規表現を使用することができます。
  * **値**: 置換後の文字列