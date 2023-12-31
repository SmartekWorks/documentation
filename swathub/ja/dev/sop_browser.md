ブラウザ機能
===

SWATHubはクロスプラットフォームのWebブラウザを自動化させる機能を提供しています。

URLに遷移
---

現在のブラウザセッションのアクティブなウィンドウで特定のURLに遷移します。ブラウザセッションがない場合は、新しいデフォルトのブラウザセッションとウィンドウを立ち上げます。

#### 入力引数
| 引数 | 説明
| ---- | ----
| URL        | 指定したURLにアクセスします。<br>`http://`、`https://`、`file://`で始まる完全なURLと相対URL<sup>1</sup>を使用します。

#### 出力結果
なし

?> 1. 相対URLを利用する時に、実行環境設定にベースURLの設定が必要です。

ブラウザにアタッチ
---

マッチング条件によって、現在開いたブラウザのセッションを取得します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| マッチングルール  | ターゲットウィンドウのマッチングルール。<br>[マッチングルール](rule_matching)を使用します。指定しない場合に`[]`を使用します。

#### 出力結果
なし

ナビゲーション
---

ブラウザのナビゲーション制御機能をシミュレートします<sup>1</sup>。

#### 入力引数
| 引数 | 説明
| ---- | ----
| アクション | ブラウザのナビゲーション制御機能：`進む`、`戻る`、`再読込み`。

#### 出力結果
なし

?> 1. ドライバの制限で、現在Safariはこの機能をサポートしません。

ウィンドウ制御
---

複数ウィンドウの場合に、ターゲットウィンドウを見つけ、それに切り替えるか、もしくはそれを閉じます。

#### 入力引数
| 引数 | 説明
| ---- | ----
| ウィンドウ名   | （省略可）ターゲットウィンドウの名前。 未記入の場合、この条件を無視<sup>1</sup>。
| マッチングルール  | ターゲットウィンドウのマッチングルール<sup>1</sup>。<br>[マッチングルール](rule_matching)を使用します。指定しない場合に`[]`を使用します。
|アクション       | `切り替え`は、現在のウィンドウをターゲットウィンドウに切り替えます。<br> `閉じる`はターゲットウィンドウを閉じます。

#### 出力結果
なし

?> 1. ウィンドウ名とマッチングルールの両方が指定されたら、両方とも条件を満たします。両方指定しない場合に、現在アクティブのウィンドウはターゲットウィンドウです。

スクリプト実行
---

現在のウィンドウ画面でJavaScriptを実行します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| スクリプト | 実行したいJavaScriptコード
| 変数名 | （省略可）スクリプトの戻り値を結果に格納する変数名。<br>指定しない場合に、結果を保存しません。

#### 出力結果
なし

Webデータ取得
---

アクティブのウィンドウ画面からのシンプルデータ<sup>1</sup>を取得し、変数に設定します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| クエリールール | 取得先を定義するルール。<br>[クエリールール](rule_query)を使用します。
| 変数名 | データを格納する変数名。

#### 出力結果
なし

?> 1. シンプルデータを文字列を指しています。もっと複雑の構造やデータタイプを取得する場合に[Webスクレイピング](sop_webapp#Webスクレイピング)を利用します。

WebDriverコマンド実行
---

構文が古いもしくは誤ったHTMLに対して、直接ブラウザのDOMを操作するためにWebDriverのコマンドを発行します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| WebDriverコマンド | JSONフォーマットのコマンドリスト。デフォルトは`[]`。
| 変数名 | （省略可）コマンドの戻り値を結果に格納する変数名。<br>指定しない場合に、結果を保存しません。

WebDriverのコマンドは下記の属性を含むJSONマップです。
* `command`：操作アクション。現在`click`、`sendKeys`、`selectFrame`のどっちかを使用します。
* `target`: ターゲットノード。下記の属性の一部を含むJSONマップでローケーティングします。
  * `id`ノードのid。
  * `name`：ノードのname。
  * `css`：ノードのCSSセレクター。
  * `text`：ノードのテキスト属性。
  * `index`：複数ノードが条件を満たした場合に、何番目（`1`から）のノードをしています。通过序列号来过滤多个元素。
  * `handle`：`-`を区切った数値を使ってフレームのDOM順番で定義した番号。例えば、`1-3`はルートの配下の1番目の子供フレームの配下の3番目の子供フレームを意味します。
* `value`：コマンド設定値。例えば、`sendKeys`コマンドの場合に、テキストの値です。

下記はユーザー名、パスワードを入力して、ログインするコマンドのサンプルです。

```
[
  {
    "command": "selectFrame",
    "target": {
      "name": "mainFrame"
    }
  },
  {
    "command": "sendKeys",
    "target": { "name": "username" },
    "value": "swathub"
  },
  {
    "command": "sendKeys",
    "target": { "css": "input[type=password]" },
    "value": "password"
  },
  {
    "command": "click",
    "target": { "css": "button.primary", "text": "登录" }
  }
]
```

#### 出力結果
なし
