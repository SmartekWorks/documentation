Windowsアプリ
===

Windowsアプリのシステムオペレーション[Microsoft UI Automation](https://docs.microsoft.com/en-us/windows/win32/winauto/entry-uiauto-win32)を使って、Windowsアプリを効率よく自動操作します。

### Windowsコントロールのセレクター

Windowsアプリを操作するために、[Windowsコントロール](https://docs.microsoft.com/en-us/windows/win32/winauto/uiauto-supportinguiautocontroltypes)のセレクターでローケーティングが必要です。セレクターはターゲットUIコントロールはWindowsシステムに存在階層情報を示すJSON配列です。この配列親コントロールからこコントロールまでの順番です。例えば、下記の例で、アプリのメインウィンドウを選択して、ツリーコントロールを選択して、最後にツリー上のボタンを選択します。

セレクターの例です。
```json
[
  {
    "control": "window",
    "name": "PuTTY.*",
    "class": "PuTTYConfigBox"
  },
  {
    "control": "tree",
    "name": "Category:",
    "class": "SysTreeView32"
  },
  {
    "control": "button",
    "name": "Open"
  }
]
```

各階層のローケーティング情報は下記のキーを持つJSONのMAPです。

* `control`: コントロールのタイプ。例えば`window`，`treeItem`，`text`など。
* `name`: コントロールの名前、正規表現が利用可能です。例えば、`Untitled - Notepad`，`Untitled.*`など。
* `class`: コントロールのクラス名。
* `automationId`: コントロールの自動化ID。
* `index`: 複数条件を満たすコントロールの何番目を指定、`1`からの整数です。

ロボットにある[WINインスペクター](../manual/robot_windows_inspect)から直接セレクターが取得できるほか、各種ツール<sup>1</sup>からも各ローケーティング情報をそれぞれ取得できます。

?> 1. マイクロソフト社の[Inspect.exe](https://docs.microsoft.com/en-us/windows/win32/winauto/inspect-objects)の利用を推奨します。

### SAPコントロールのセレクター

SAPクライアント（SAP GUI）は自動化でよく使われるWindowsアプリケーションです。同じく、Windowsオペレーションで対応することができますが、特別な準備とセレクターの取得方法が必要です。まず、SAP GUIに下記を設定し、クライアントの自動化オプションを有効化してください。

* クライアントをログインした後に、`RZ11`のパラメータ設定画面に入り、`sapgui/user_scripting`を記入、表示ボタンををクリックして、その値を`TRUE`にしてください。
* クライアントから`オプション - スクリプト録画と再生`にアクセスし、`スクリプトを有効化`のオプションをオンにしてください。

SAPコントロールのセレクターは通常二階層になります。一階層目はSAP GUIのウィンドウで、二階層目はその中のコントロールです。

* 一階層目の`control`と`class`属性は変わりません。`name`はSAP GUIで表示されているウィンドウの名前によって、変わります。
* 二階層目の`id`はツールで取得したコントロールのIDです。この情報を取得するために、[Tracker](https://tracker.stschnell.de/)の利用をおすすめです。

セレクターの例です。
```json
[
  {
    "control": "window",
    "name": "SAP Easy Access",
    "class": "SAPGUI"
  },
  {
    "id": "tbar[0]/okcd"
  }
]
```

クリック
---

Windowsコントロールをマウスクリックします。

#### 入力引数

| 引数 | 説明
| ---- | ----
| セレクター  | [Windowsコントロールのセレクター](#Windowsコントロールのセレクター)。
| ボタン  | クリックのボタン。<br>`left`、`right`を使用します。
| タイプ  | クリックのタイプ。`single`、`double`を使用します。

#### 出力結果

なし

ホーバー
---

Windowsコントロールをマウスホーバーします。

#### 入力引数

| 引数 | 説明
| ---- | ----
| セレクター  | [Windowsコントロールのセレクター](#Windowsコントロールのセレクター)。

#### 出力結果

なし

タイプ
---

Windowsコントロールにテキストを記入します。

#### 入力引数

| 引数 | 説明
| ---- | ----
| セレクター  | [Windowsコントロールのセレクター](#Windowsコントロールのセレクター)。
| テキスト  | 記入するテキスト。<br>`#{TAB}`、`#{UP}`、`#{ENTER}`などの特殊キーが利用可能です。

#### 出力結果

なし

テキスト取得
---

Windowsコントロールからテキストを取得します。このテキストは記入した内容もしくは表示のラベルです。

#### 入力引数

| 引数 | 説明
| ---- | ----
| セレクター  | [Windowsコントロールのセレクター](#Windowsコントロールのセレクター)。

#### 出力結果

取得したテキスト文字列

フォーカス
---

Windowsコントロールをアクティブします。

#### 入力引数

| 引数 | 説明
| ---- | ----
| セレクター  | [Windowsコントロールのセレクター](#Windowsコントロールのセレクター)。

#### 出力結果

なし

要素チェック
---

Windowsアプリに指定した要素が存在するかどうかをチェックします。

#### 入力引数
| 引数 | 説明
| ---- | ----
| セレクター  | [Windowsコントロールのセレクター](#Windowsコントロールのセレクター)。

#### 出力結果
チェック結果（`true`もしく`false`）

プロセスを開始
---

アプリケーションを起動し、その初期ウィンドウを設定します。

#### 入力引数

| 引数 | 説明
| ---- | ----
| ファイル |アプリケーション実行可能ファイルへのパス。<br>例えば、`Notepad`，`C:\Program Files (x86)\Microsoft Office\root\Office16\EXCEL.EXE`等。
| ワーキングディレクトリ | （省略可）実行のワーキングディレクトリ。<br>例えば、`C:\RPA\myWorkingDir`。
| ウィンドウ |（省略可）初期ウィンドウサイズ。値の範囲には、 `default`、` maximize`、 `minimize`、` hide`が含まれます。

#### 出力結果

プロセスの`pid`。

プロセスを閉じる
---

実行中のプロセスを閉じます。

#### 入力引数

| 引数 | 説明
| ---- | ----
| プロセス  | プロセスの`pid`、または名前。<br>例えば、`16328`，`Notepad`。

#### 出力結果

なし