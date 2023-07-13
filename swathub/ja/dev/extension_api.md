SWATHub API
===

ワークスペース実行
---

このAPIは、指定されたワークスペースですべてのケースを実行するように設計されています。[実行状況取得API](#実行状況取得)と組み合わせると、CIやその他プロセスのケースを自動実行するメカニズムが実装できます。

### リクエスト
* **URL**: `http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/run`
 * `username`: ユーザー名
 * `apiKey`: APIキー
 * `workspaceOwnername`: ワークスペースオーナーのユーザ名 (ワークスペースのURLから見つけることができます。)
 * `workspaceName`: ワークスペース名 (ワークスペースのURLから見つけることができます。)
* **メソッド**: `POST`
* **Content-Type**: `application/x-www-form-urlencoded`
* **パラメーター**:
 * `browser` (省略可): 実行のためのブラウザコード。サポートされているブラウザコードは、`IE`、`Chrome`、`Firefox`、`Edge`、`Edge Legacy`、`Safari`です。
 * `robot` (省略可): 実行のためのロボット名。自動選択の場合空白を使用してください。デフォルトは空白です。
 * `setID` (省略可): シナリオグループID (シナリオグループのURLから見つけることができます。) 空白を使用すると、すべてのシナリオグループにわたってケースを実行できます。デフォルトは空白です。
 * `isSequential` (省略可): ケース実行の順番を指定。`true`または`false`を使います。デフォルトは`true`です。
 * `tags` (省略可): 実行するテストケースをフィルタリングして実行するコンマで区切ったタグ。デフォルトは空白です。
 * `caseFilter` (省略可): ケースタイトルをフィルタリングテキスト。該当テキストを含むケースのみ実行します。デフォルトは空白です。
 * `testServer` (省略可): テストサーバーのURL。デフォルトはシナリオグループの設定です。
 * `apiServer` (省略可): APIサーバーのURL。デフォルトはシナリオグループの設定です。
 * `stepOptions` (省略可): この実行のためのステップオプション。JSON文字列を使用します。デフォルトはシナリオグループの設定です。
 * `envVariables` (省略可): この実行のための環境変数。JSON文字列を使用します。デフォルトはシナリオグループの設定です。
 * `lang` (省略可): 多言語設定、以下のいずれかの値
	* `en`: 英語 (デフォルト)
	* `ja`: 日本語
	* `zh_CN`: 簡体字中国語
* **ボディ**: なし

```batch
curl --user <username>:<apiKey> \
	-d setID=<setID> --data-urlencode "platform=Windows + Firefox" \
	-d nodeName=<nodeName> -d nodeType=<nodeType> -d tags=<tags> -d testServer=<testServer> -d apiServer=<apiServer> -d isSequential=false \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/run
```

### レスポンス (成功)
* **HTTPコード**: `200`
* **Content-Type**: `application/json`
* **ボディ**: 以下のキーのJSONオブジェクト
 * `jobID`: 実行ジョブのID。この値は、[実行状況取得API](#実行状況取得)で使用できます。

### レスポンス (エラー)
* **HTTPコード**: `404`
* **Content-Type**: `application/json`
* **ボディ**: 以下のキーのJSONオブジェクト
 * `code`: コールのエラーコード
 * `message`: コールのエラーメッセージ

APIコールで次のエラーが発生することがあります。

* API認証エラー。
* 対象のシナリオグループが見つかりません。
* ロボットまたは実行プラットフォームが見つかりません。

ケース実行
---

このAPIは、指定されたテストケースを実行するために設計されています。

### リクエスト
* **URL**: `http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/cases/run`
 * `username`: ユーザー名
 * `apiKey`: APIキー
 * `workspaceOwnername`: ワークスペースオーナーのユーザ名 (ワークスペースのURLから見つけることができます。)
 * `workspaceName`:ワークスペース名 (ワークスペースのURLから見つけることができます。)
* **メソッド**: `POST`
* **Content-Type**: `application/x-www-form-urlencoded`
* **パラメーター**:
 * `caseIDs`: テストケースID ([シナリオ取得API](#シナリオ取得)から取得できます。)
 * `browser` (省略可): 実行のためのブラウザコード。サポートされているブラウザコードは、`IE`、`Chrome`、`Firefox`、`Edge`、`Edge Legacy`、`Safari`です。
 * `robot` (省略可): 実行のためのロボット名。自動選択の場合空白を使用してください。デフォルトは空白です。
 * `isSequential` (省略可): ケース実行の順番を指定。`true`または`false`を使います。デフォルトは`true`です。
 * `testServer` (省略可): テストサーバーのURL。デフォルトはシナリオグループの設定です。
 * `apiServer` (省略可): APIサーバーのURL。デフォルトはシナリオグループの設定です。
 * `stepOptions` (省略可): この実行のためのステップオプション。JSON文字列を使用します。デフォルトはシナリオグループの設定です。
 * `envVariables` (省略可): この実行のための環境変数。JSON文字列を使用します。デフォルトはシナリオグループの設定です。
 * `lang` (省略可): 多言語設定、以下のいずれかの値
	* `en`: 英語 (デフォルト)
	* `ja`: 日本語
	* `zh_CN`: 簡体字中国語
* **ボディ**: なし

```batch
curl --user <username>:<apiKey> \
	-d caseIDs=<caseID_1> -d caseIDs=<caseID_2> --data-urlencode "platform=Windows + Firefox" \
	-d nodeName=<nodeName> -d nodeType=<nodeType> -d testServer=<testServer> -d apiServer=<apiServer> -d isSequential=false \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/cases/run
```

### レスポンス (成功)
* **HTTPコード**: `200`
* **Content-Type**: `application/json`
* **ボディ**: 以下のキーのJSONオブジェクト
 * `jobID`: 実行ジョブのID。この値は、[実行状況取得API](#実行状況取得)で使用できます。
### レスポンス (エラー)
* **HTTPコード**: `404`
* **Content-Type**: `application/json`
* **ボディ**: 以下のキーのJSONオブジェクト
 * `code`: コールのエラーコード
 * `message`: コールのエラーメッセージ

APIコールで次のエラーが発生することがあります。

* API認証エラー。
* ターゲットテストケースが見つかりません。
* ロボットまたは実行プラットフォームが見つかりません。

実行状況取得
---

ジョブのステータスを取得するために設計されています。実行ジョブの進行状況が確認できます。

### リクエスト
* **URL**: `http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/jobs/<jobID>/query`
 * `username`: ユーザー名
 * `apiKey`: APIキー
 * `workspaceOwnername`: ワークスペースオーナーのユーザ名 (ワークスペースのURLから見つけることができます。)
 * `workspaceName`:ワークスペース名 (ワークスペースのURLから見つけることができます。)
* `jobID`: ジョブのID。(APIから取得できます。例えば、[ケース実行API](#ケース実行))
* **メソッド**: `GET`
* **パラメーター**:
 * `lang` (省略可):多言語設定、以下のいずれかの値
	* `en`: 英語 (デフォルト)
	* `ja`: 日本語
	* `zh_CN`: 簡体字中国語
* **ボディ**: なし

```batch
curl --user <username>:<apiKey> \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/jobs/<jobID>/query
```

### レスポンス (成功)
* **HTTPコード**: `200`
* **Content-Typ**: `application/json`
* **ボディ**: 以下のキーのJSONオブジェクト
 * `name`: ジョブの名前
 * `status`: `queued` か `started` か `stopped` か `finished`
 * `tasks`: タスクオブジェクトのJSON配列 (以下のキーを持つJSONオブジェクト)
	* `taskID`: タスクのID
	* `description`: タスクの説明
	* `status`: `queued` か `dispatched` か `started` か `stopped` か `finished` か `failed`
	* `duration`: ケース実行の継続時間 (完了したケース実行タイプのタスクのみ)
	* `error`: タスクのエラーメッセージ (エラーしたケース実行タイプのタスクのみ)

### レスポンス (エラー)
* **HTTPコード**: `404`
* **Content-Type**: `application/json`
* **ボディ**:  以下のキーのJSONオブジェクト
 * `code`: コールのエラーコード
 * `message`: コールのエラーメッセージ

APIコールで次のエラーが発生することがあります

* API認証エラー。
* 対象のジョブが見つかりません。

シナリオグループ取得
---

このAPIは、指定されたシナリオグループの情報を取得するために設計されています。

### リクエスト
* **URL**: `http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/sets/<setID>`
 * `username`: ユーザー名
 * `apiKey`: APIキー
 * `workspaceOwnername`: ワークスペースオーナーのユーザ名 (ワークスペースのURLから見つけることができます。)
 * `workspaceName`:ワークスペース名 (ワークスペースのURLから見つけることができます。)
 * `setID`: シナリオグループのID (シナリオグループのURLから見つけることができます。)
* **メソッド**: `GET`
* **パラメーター**: なし
 * `lang` (省略可): 多言語設定、以下のいずれかの値
	* `en`: 英語 (デフォルト)
	* `ja`: 日本語
	* `zh_CN`: 簡体字中国語
* **ボディ**: なし

```batch
curl --user <username>:<apiKey> \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/sets/<setID>
```

### レスポンス (成功)
* **HTTPコード**: `200`
* **Content-Type**: `application/json`
* **ボディ**: 以下のキーのJSONオブジェクト
 * `code`: シナリオグループコード
 * `name`: シナリオグループ名
 * `tags`: シナリオグループのタグ
 * `testServer`: シナリオグループのテストサーバー設定
 * `apiServer`: シナリオグループのAPIサーバー設定
 * `stepOptions`: ステップオプションのJSONオブジェクト
 * `envVariables`: 環境変数のJSONオブジェクト
 * `beforeInterceptor`: 前のインターセプタフローのコード
 * `afterInterceptor`: 後のインターセプターのコード。

### レスポンス (エラー)
* **HTTPコード**: `404`
* **Content-Type**: `application/json`
* **ボディ**: 以下のキーのJSONオブジェクト
 * `code`: コールのエラーコード
 * `message`: コールのエラーメッセージ

APIコールで次のエラーが発生することがあります。

* API認証エラー。
* 対象のシナリオグループが見つかりません。

シナリオ取得
---

このAPIは、指定されたシナリオグループ内のすべてのシナリオおよびケースの情報を取得するように設計されています。

### リクエスト
* **URL**: `http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/sets/<setID>/scenarios`
 * `username`: ユーザー名
 * `apiKey`: APIキー
 * `workspaceOwnername`: ワークスペースオーナーのユーザ名 (ワークスペースのURLから見つけることができます。)
 * `workspaceName`:ワークスペース名 (ワークスペースのURLから見つけることができます。)
 * `setID`: シナリオグループのID (シナリオグループのURLから見つけることができます。)
* **メソッド**: `GET`
* **パラメーター**:
 * `lang` (省略可): 多言語設定、以下のいずれかの値
	* `en`: 英語 (デフォルト)
	* `ja`: 日本語
	* `zh_CN`: 簡体字中国語
 * `tags` (省略可): カンマで区切られた、取得するシナリオをフィルタリングするタグ。デフォルトは空白です。
* **ボディ**: なし

```batch
curl --user <username>:<apiKey> \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/sets/<setID>/scenarios&tags=demo
```

### レスポンス (成功)
* **HTTPコード**: `200`
* **Content-Type**: `application/json`
* **ボディ**: JSONシナリオオブジェクトの配列 (以下のキーを持つJSONオブジェクト)
 * `code`: シナリオコード
 * `name`: シナリオ名
 * `tags`: シナリオのタグ
 * `params`: シナリオのパラメーター (シーケンス番号)
	* `code`: パラメーターコード
	* `direction`: `input`もしくは`output`
	* `name`: パラメーター名
	* `type`: パラメータータイプ (`text`のみ利用されています。)
	* `source`: パラメーター定義の種類，`system`はシステム自動生成したパラメーター、`user`はユーザ定義したパラメーター
 * `testcases`: テストケースオブジェクトのJSON配列 (以下のキーを持つJSONオブジェクト)
	* `id`: テストケースID
	* `seqNo`: テストケースのシーケンス番号
	* `name`: テストケース名
	* `data`: テストケースのテストケースのテストケースコード (以下のキーを持つJSONオブジェクト)
		* `code`: パラメーターコード
		* `name`: パラメーター名
		* `value`: パラメーター値
		* `enabled`: データが有効かどうか、`true`か`false`を使用します。
	* `result`: 最近の実行結果のJSONオブジェクト
		* `id`: 結果ID
		* `status`: 実行結果の状態
		* `robot`: ロボット名
		* `browser`: ブラウザコード
		* `execPlatform`: 実行プラットフォーム
		* `testServer`: テストサーバーURL
		* `apiServer`: APIサーバーURL
		* `duration`: 実行時間
		* `timeStart`: 実行開始時刻
		* `timeEnd`: 実行完了時刻
		* `error`: 実行エラーメッセージ
		* `errorRaw`: 実行エラーの未加工データ
			* `code`：エラーコード
			* `msgArgs`：エラー情報リスト（関連ステップのタイプ、エラー元の情報など）
		* `initBy`: 実行者
		* `initTime`: 実行時刻
		* `verifyBy`: 最終確認者
		* `verifyTime`: 確認時刻
		* `baseURL`: エビデンスのベースURL

### レスポンス(エラー)
* **HTTPコード**: `404`
* **Content-Type**: `application/json`
* **ボディ**: 以下のキーのJSONオブジェクト
 * `code`: コールのエラーコード
 * `message`: コールのエラーメッセージ

APIコールで次のエラーが発生することがあります

* API認証エラー。
* 対象のシナリオグループが見つかりません。

シナリオ・フロー追加
---

このAPIは、指定されたシナリオグループにシナリオを追加するもしくはワークスペースのフローを追加するように設計されています。

### リクエスト
* **URL**: `http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/flows`
 * `username`: ユーザー名
 * `apiKey`: APIキー
 * `workspaceOwnername`: ワークスペースオーナーのユーザ名 (ワークスペースのURLから見つけることができます。)
 * `workspaceName`:ワークスペース名 (ワークスペースのURLから見つけることができます。)
* **メソッド**: `POST`
* **Content-Type**: `application/json`
* **パラメーター**: なし
* **ボディ**:
	* `name`: シナリオ名もしくはフロー名
	* `groupCode` (省略可): 新規したシナリオが所属するシナリオグループのコード、空白の場合に、フローの追加になります。
	* `tags` (省略可): シナリオもしくはフローのタグ
	* `steps`: フローステップ (次のキーを持つJSONオブジェクトのJSON配列)
		* `title`: フローステップのタイトル
		* `component`: フローステップのコンポーネント
			* `code`: コンポーネントコード
			* `name`: コンポーネント名
			* `type`: コンポーネントのタイプ。以下のいずれかの値
				* `sop`: システムオペレーション
				* `pop`: ページオペレーション
				* `flow`: フロー
				* `apiop`: APIオペレーション
				* `guiop`: GUIオペレーション
				* `mobileop`: APPオペレーション
				* `ctrl`: フロー制御オペレーション
				* `extension`: 拡張機能オペレーション
		* `inputs`: ステープの入力データ (以下のキーを含むJSONオブジェクトのJSON配列)
			* `code`: パラメーターコード
			* `name`: パラメーター名
			* `value`: データ値
			* `enabled`: 入力が有効かどうか、`true`または`false`
			* `queryMode` (省略可): ページオペレーションのマッチングモードです。`select`または`text`または`index`ののいずれかの値
		* `outputs`: ステップの出力データ(以下のキーを含むJSONオブジェクトのJSON配列)
			* `code`: パラメーターコード
			* `name`: パラメーター名
			* `value`: データ値
			* `enabled`: 出力が有効かどうか、`true`または`false`
		* `options`: ステップオプションの文字列。
		* `enabled`: ステップが有効かどうか、`true`または`false`
	* `arguments`: シナリオもしくはフローに定義した入力と出力引数(以下のキーを含むJSONオブジェクトのJSON配列)
		* `code`: 引数コード
		* `name`: 引数名
		* `direction`: 入力か出力か、`input`または`output`

```batch
curl --user <username>:<apiKey> \
	-H "Content-Type: application/json" \
	-d '{"name":"myFlow","steps":[{"component":{"type":"sop","code":"goto","name":"Goto URL"},"inputs":[{"code":"url","name":"URL","value":"http://www.swathub.com","enabled":true}],"outputs":[],"title":"Goto URL","options":"{}","enabled":true}]}' \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/flows
```

### レスポンス (成功)
* **HTTPコード**: `200`
* **Content-Type**: `application/json`
* **ボディ**: 次のキーを持つJSONオブジェクト
	* `id`: シナリオもしくはフローのID
	* `code`: シナリオもしくはフローのコード

### レスポンス (エラー)
* **HTTPコード**: `404`
* **Content-Type**: `application/json`
* **ボディ**: 次のキーを持つJSONオブジェクト
	* `code`: コールのエラーコード
	* `message`で: コールのエラーメッセージ

APIコールで次のエラーが発生することがあります

* API認証エラー。
* シナリオもしくはフロー名は空白
* フローデータは正しくありません。

ケース追加
---

このAPIは、指定したシナリオにケースを追加するために設計されています。

### リクエスト
* **URL**: `http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/flows/<flowCode>/cases`
 * `username`: ユーザー名
 * `apiKey`: APIキー
 * `workspaceOwnername`: ワークスペースオーナーのユーザ名 (ワークスペースのURLから見つけることができます。)
 * `workspaceName`:ワークスペース名 (ワークスペースのURLから見つけることができます。)
 * `setID`: シナリオグループのID (シナリオグループのURLから見つけることができます。)
 * `flowCode`: シナリオ/フローのコード (シナリオ/フロービルダーのURLから見つけることができます。)
* **メソッド**: `POST`
* **Content-Type**: `application/json`
* **パラメーター**: なし
* **ボディ**:
 * `name`: テストケースの名前
 * `values`: テストケースデータを含むJSONオブジェクトの文字列

```batch
curl --user <username>:<apiKey> \
	-H "Content-Type: application/json" \
	-d '{"name":"myCase","values":{"param1":"value1","param2":"value2"}}' \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/flows/<flowCode>/cases
```

### レスポンス (成功)
* **HTTPコード**: `200`
* **Content-Type**: `application/json`
* **ボディ**: 次のキーを持つJSONオブジェクト
	* `id`: テストケースのID
	* `code`: テストケースのコード

### レスポンス (エラー)
* **HTTPコード**: `404`
* **Content-Type**: `application/json`
* **ボディ**: 次のキーを持つJSONオブジェクト
	* `code`: コールのエラーコード
	* `message`で: コールのエラーメッセージ

APIコールで次のエラーが発生することがあります

* API認証エラー。
* 対象シナリオが見つかりません。
* テストケース名が空白です。
* テスト値はJSON文字列ではありません。

フロー取得
---

このAPIは、指定されたシナリオまたはフローの詳細ステップ情報を取得するために設計されています。

### リクエスト
* **URL**: `http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/flows/<flowCode>`
 * `username`: ユーザー名
 * `apiKey`: APIキー
 * `workspaceOwnername`: ワークスペースオーナー名 (ワークスペースのURLから見つけることができます。)
 * `workspaceName`: ワークスペースの名前 (ワークスペースのURLから見つけることができます。)
 * `flowCode`: シナリオ/フローのコード (シナリオ/フロービルダーのURLから見つけることができます。)
* **メソッド**: `GET`
* **パラメーター**:
 * `lang` (省略可): 多言語設定、以下のいずれかの値
	* `en`: 英語 (デフォルト)
	* `ja`: 日本語
	* `zh_CN`: 簡体字中国語
* **ボディ**: なし

```batch
curl --user <username>:<apiKey> \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/flows/<flowCode>?lang=ja
```

### レスポンス (成功)
* **HTTPコード**: `200`
* **Content-Type**: `application/json`
* **ボディ**: フローのJSONオブジェクト
 * `code`: フローコード
 * `name`: フロー名
 * `tags`: フローのタグ
 * `group`: シナリオグループのJSONオブジェクト（フローの場合は`null`）
    * `id`: シナリオグループID
    * `code`：シナリオグループコード
    * `name`：シナリオグループ表示名
 * `params`: フローのパラメーター (次のキーを持つJSONオブジェクトのJSON配列)
	* `code`: パラメーターコード
	* `direction`: `input`もしくは`output`
	* `name`: パラメーター名
	* `type`: パラメータータイプ (`text`のみ利用されています。)
	* `source`: パラメーター定義の種類，`system`はシステム自動生成したパラメーター、`user`はユーザ定義したパラメーター
 * `steps`: フローステップ (次のキーを持つJSONオブジェクトのJSON配列)
	* `title`: ステップのタイトル
	* `component`: フローステップのコンポーネント
		* `code`: コンポーネントコード
		* `name`: コンポーネント名
		* `type`: コンポーネントのタイプ。以下のいずれかの値
			* `sop`: システムオペレーション
			* `pop`: ページオペレーション
			* `flow`: フロー
			* `apiop`: APIオペレーション
			* `guiop`: GUIオペレーション
			* `mobileop`: APPオペレーション
			* `ctrl`: フロー制御オペレーション
			* `extension`: 拡張機能オペレーション
	* `inputs`: ステップの入力データ
		* `code`: パラメーターコード
		* `name`: パラメーター名
		* `value`: パラメーター値
		* `enabled`: 有効か、無効か、`true`もしくは`false`
	* `outputs`: ステップの出力データ
		* `code`: パラメーターコード
		* `name`: パラメーター名
		* `value`: パラメーター値
		* `enabled`: 有効か、無効か、`true`もしくは`false`
	* `options`: ステップオプション
	* `enabled`: 有効か、無効か、`true`もしくは`false`
	* `blocks`: コードブロック(次のキーを持つJSONオブジェクトのJSONマップ)
		* `if`: フロー制御オペレーションの`IF/ELSE`で判定は`true`のコードブロックのステップJSON配列
		* `else`: フロー制御オペレーションの`IF/ELSE`で判定は`false`のコードブロックのステップJSON配列
		* `loop`: フロー制御オペレーションの`WHILE`で繰り返し実行のコードブロックのステップJSON配列
		* `try`: フロー制御オペレーションの`TRY/CATCH`で実行するコードブロックのステップJSON配列
		* `catch`: フロー制御オペレーションの`TRY/CATCH`でエラー処理のコードブロックのステップJSON配列

### レスポンス (エラー)
* **HTTPコード**: `404`
* **Content-Type**: `application/json`
* **ボディ**: 次のキーを持つJSONオブジェクト
* `code`: コールのエラーコード。
* `message`: コールのエラーメッセージ。

APIコールで次のエラーが発生することがあります。

* API認証エラー。
* ターゲットフローが見つかりません。

オペレーション情報取得
---

このAPIは、指定されたオペレーションの詳細情報を取得するために設計されています。

### リクエスト
* **URL**：`http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/operations/<opType>/<opCode>`
 * `username`: ユーザー名
 * `apiKey`: APIキー
 * `workspaceOwnername`: ワークスペースオーナー名 (ワークスペースのURLから見つけることができます。)
 * `workspaceName`: ワークスペースの名前 (ワークスペースのURLから見つけることができます。)
 * `opType`：オペレーションタイプ`pop`、`guiop`、`mobileop`もしくは`apiop`
 * `opCode`：オペレーションコード
* **メソッド**: `GET`
* **パラメーター**: なし
* **ボディ**: なし

```batch
curl --user <username>:<apiKey> \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/operations/<opType>/<opCode>
```

### レスポンス (成功)
* **HTTPコード**: `200`
* **Content-Type**: `application/json`
* **ボディ**: オペレーションのJSONオブジェクト
  * `code`：オペレーションコード
  * `name`：オペレーション名
  * `type`：オペレーションタイプ
    * `pop`: ページオペレーション
    * `guiop`：GUIオペレーション
    * `mobileop`：APPオペレーション
    * `apiop`：APIオペレーション
  * `model`: 所属するモデルのJSONオブジェクト（APIオペレーションの場合は`null`）
    * `code`：モデルコード
    * `name`：モデル名
  * `params`：オペレーションの引数
    * `code`：引数コード
    * `direction`：`input`もしくは`output`
    * `name`：引数名
    * `type`：引数タイプ
    * `source`: 引数の定義元、`system`はシステム生成、`user`はユーザー定義

### レスポンス (エラー)
* **HTTPコード**: `404`
* **Content-Type**: `application/json`
* **ボディ**: 次のキーを持つJSONオブジェクト
  * `code`: コールのエラーコード
  * `message`: コールのエラーメッセージ

APIコールで次のエラーが発生することがあります。

* API認証エラー。
* 対象結果が見つかりません。

実行結果取得
---

このAPIは、実行結果の詳細情報を取得するために設計されています。

### リクエスト
* **URL**: `http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/results/<resultID>`
 * `username`: ユーザー名
 * `apiKey`: ユーザのapiKey
 * `workspaceOwnername`: ワークスペースオーナー名 (ワークスペースのURLから見つけることができます。)
 * `workspaceName`: ワークスペースの名前 (ワークスペースのURLから見つけることができます。)
 * `resultID`: テスト結果のID
* **メソッド**: `GET`
* **パラメーター**:
 * `lang` (省略可): 多言語設定、以下のいずれかの値
	* `en`: 英語 (デフォルト)
	* `ja`: 日本語
	* `zh_CN`: 簡体字中国語
* **ボディ**: なし

```batch
curl --user <username>:<apiKey> \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/results/<resultID>?lang=ja
```

### レスポンス (成功)
* **HTTPコード**: `200`
* **Content-Type**: `application/json`
* **ボディ**: 結果のJSONオブジェクト
 * `summary`: テスト結果サマリー (以下のキーを持つJSONオブジェクト)
	* `scenarioName`: テストシナリオ名
	* `caseName`: テストケース名
	* `caseID`: テストケースID
	* `status`: 結果のステータス
	* `robot`: ロボット名
	* `browser`: ブラウザコード
	* `execPlatform`: 実行のプラットフォーム
	* `testServer`: テストサーバーURL
	* `apiServer`: APIサーバーURL
	* `stepOptions`: ステップオプションのJSONオブジェクト
	* `envVariables`: 環境変数のJSONオブジェクト
	* `duration`: 実行時間
	* `timeStart`: 実行開始時刻
	* `timeEnd`: 実行終了時刻
	* `error`: 実行エラーメッセージ
	* `errorRaw`: 実行エラーの未加工データ
		* `code`：エラーコード
		* `msgArgs`：エラー情報リスト（関連ステップのタイプ、エラー元の情報など）
	* `initBy`: 実行者
	* `initTime`: 実行時刻
	* `verifyBy`: 最終確認者
	* `verifyTime`: 確認時刻
	* `baseURL`: エビデンスのベースURL
 * `result`: ステップの結果 (以下のキーを持つJSONオブジェクトのJSON配列)
	* `stepTitle`: ステップのタイトル
	* `options`: ステップのステップオプションのJSONオブジェクト
	* `seqNo`: ステップのシーケンス番号
	* `code`: ステップコンポーネントのコード
	* `type`: ステップコンポーネントのタイプ、以下の値のいずれか
		* `sop`: システムオペレーション
		* `pop`: ページオペレーション
		* `flow`: フロー
		* `apiop`: APIオペレーション
		* `guiop`: GUIオペレーション
		* `mobileop`: APPオペレーション
		* `ctrl`: フロー制御オペレーション
	* `typeName`: 指定された言語のステップコンポーネントの型名
	* `pageCode`: typeが`pop`の場合のステップコンポーネントのページコード
	* `executed`: ステップが実行された場合は`true`を返します。
	* `error`: 指定された言語での詳細エラーメッセージ
	* `errorRaw`: 実行エラーの未加工データ
		* `code`：エラーコード
		* `msgArgs`：エラー情報リスト（関連ステップのタイプ、エラー元の情報など）
	* `paramData`: コンポーネントパラメータまたはステップオプションのデータ (以下のキーを持つJSONオブジェクトのJSON配列)
		* `code`: パラメーターコード
		* `name`: パラメーター名
		* `value`: データ値
		* `variable`: 変数名、変数がない場合は`-`を返します。
		* `queryMode`: `type`が`select`、`select-s`または`query-only`の場合のクエリモード、`select`または`text`または`index`ののいずれかの値
		* `runtimeEnabled`: 実行時に有効になっているかどうかを示す`true`または`false`
	* `evidences`: ステップのエビデンス (以下のキーを持つJSONオブジェクト)
		* `console`: コンソールログファイルへのパス
		* `files`: ダウンロードされたファイルやAPI呼び出し結果ファイル (JSON配列の文字列)など、実行中に生成されるファイルのパス
		* `html`: 元のHTMLファイルへのパス
		* `log`: ログファイルへのパス
		* `screenshots`: スクリーンショットファイルへのパス (文字列のJSON配列)
		* `url`: 現在のWebページのURL
	* `steps`: コンポーネントのタイプが`flow`の場合の子ステップ (上記と同じキーを持つJSONオブジェクトのJSON配列)

### レスポンス (エラー)
* **HTTPコード**: `404`
* **Content-Type**: `application/json`
* **ボディ**: 次のキーを持つJSONオブジェクト
  * `code`: コールのエラーコード
  * `message`: コールのエラーメッセージ

APIコールで次のエラーが発生することがあります。

* API認証エラー。
* 対象結果が見つかりません。

結果にコメントを追加
---

このAPIは、実行結果に新しいコメントを追加するために設計されています。

### リクエスト
* **URL**: `http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/results/<resultID>/comments`
 * `username`: ユーザー名
 * `apiKey`: ユーザのapiKey
 * `workspaceOwnername`: ワークスペースオーナー名 (ワークスペースのURLから見つけることができます。)
 * `workspaceName`: ワークスペースの名前 (ワークスペースのURLから見つけることができます。)
 * `resultID`: テスト結果のID
* **メソッド**: `POST`
* **Content-Type**: `application/x-www-form-urlencoded`
* **パラメーター**:
 * `content`: コメントの内容
 * `type`: コメントのタイプ、以下のいずれかの値
	* `question`: 質問
	* `idea`: アイディア
	* `issue`: 課題
 * `lang` (省略可): 多言語設定、以下のいずれかの値
	* `en`: 英語 (デフォルト)
	* `ja`: 日本語
	* `zh_CN`: 簡体字中国語
* **ボディ**: なし

```batch
curl --user <username>:<apiKey> \
	--data-urlencode "content=This is an issue" \
	-d type=issue \
	-d lang=ja \
	http://swathub.com/api/<workspaceOwnername>/<workspaceName>/results/<resultID>/comments
```

### レスポンス (成功)
* **HTTPコード**: `200`
* **Content-Type**: `application/json`
* **ボディ**: 以下のキーのJSONオブジェクト
 * `id`: 追加したコメントのID

### レスポンス (エラー)
* **HTTPコード**: `404`
* **Content-Type**: `application/json`
* **ボディ**: 次のキーを持つJSONオブジェクト
  * `code`: コールのエラーコード
  * `message`: コールのエラーメッセージ

APIコールで次のエラーが発生することがあります。

* API認証エラー。
* 対象結果が見つかりません。

ワークスペース取得
---

このAPIは、ユーザーが参加した全てのワークスペースの情報を取得するために設計されています。

### リクエスト
* **URL**: `http://<username>:<apiKey>@swathub.com/api/workspaces`
 * `username`: ユーザー名
 * `apiKey`: ユーザのapiKey
* **メソッド**: `GET`
* **パラメーター**: なし
* **ボディ**: なし

```batch
curl --user <username>:<apiKey> http://swathub.com/api/workspaces
```

### レスポンス (成功)
* **HTTPコード**: `200`
* **Content-Type**: `application/json`
* **ボディ**: JSONワークスペースオブジェクトの配列 (以下のキーを持つJSONオブジェクト)
 * `id`: ワークスペースID
 * `name`: ワークスペース名
 * `description`: ワークスペース説明
 * `isPublic`: パブリックワークスペースかどうか
 * `maxResult`: クリーンアップオプションで指定したケースごとに保存する実行結果数上限
 * `type`: ワークスペースタイプ，`0`: 設計用，`1`: コントロールセンター用
 * `owner`: ワークスペースオナーのユーザー名

### 响应（错误）
* **HTTPコード**: `404`
* **Content-Type**: `application/json`
* **ボディ**: 次のキーを持つJSONオブジェクト
* `code`: コールのエラーコード
* `message`: コールのエラーメッセージ

APIコールで次のエラーが発生することがあります。

* API認証エラー。

シナリオグループ取得
---

このAPIは、指定したワークスペースの配下に全てのシナリオグループの情報を取得するために設計されています。

### リクエスト
* **URL**: `http://<username>:<apiKey>@swathub.com/api/<workspaceOwnername>/<workspaceName>/sets`
 * `username`: ユーザー名
 * `apiKey`: ユーザのapiKey
 * `workspaceOwnername`: ワークスペースオーナーのユーザ名 (ワークスペースのURLから見つけることができます。)
 * `workspaceName`: ワークスペース名 (ワークスペースのURLから見つけることができます。)
* **メソッド**: `GET`
* **パラメーター**: なし
* **ボディ**: なし

```batch
curl --user <username>:<apiKey> http://swathub.com/api/<workspaceOwnername>/<workspaceName>/sets
```

### レスポンス (成功)
* **HTTPコード**: `200`
* **Content-Type**: `application/json`
* **ボディ**: 以下のキーのJSONオブジェクト
 * `id`: シナリオグループID
 * `code`: シナリオグループコード
 * `name`: シナリオグループ名
 * `tags`: シナリオグループのタグ
 * `testServer`: シナリオグループのWebベースURL
 * `apiServer`: シナリオグループのAPIベースURL
 * `stepOptions`: デフォルトステップオプションのJSONオブジェクト
 * `envVariables`: デフォルト環境変数のJSONオブジェクト
 * `beforeInterceptor`: 前インターセプターのコード。
 * `afterInterceptor`: 後インターセプターのコード。

### 响应（错误）
* **HTTPコード**: `404`
* **Content-Type**: `application/json`
* **ボディ**: 次のキーを持つJSONオブジェクト
* `code`: コールのエラーコード
* `message`: コールのエラーメッセージ

APIコールで次のエラーが発生することがあります。

* API認証エラー。
