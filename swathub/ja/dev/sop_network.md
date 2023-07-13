ネットワーク機能
===

フローにネットワーク機能を呼び出します。

HTTPダウンロード
---

HTTPプロトコルでファイルをダウンロードします。

#### 入力引数
| 引数 | 説明
| ---- | ----
| URL      | ダウンロードファイルのURL、Basic認証が利用可能です。<br>例えば、`http://username:password@www.data-server.com/files/data.pdf`。
| ファイル | ダウンロードしたファイルを保存するローカルパス、<br>例えば、`C:/RPA/data.pdf`。
| プロキシ    | （省略可）URLにアクセスするためのプロキシ設定のJSONオブジェクト。<br> - `host`: ホスト<br> - `port`: ポート<br> - `username`: ユーザ名<br> - `password`: パスワード

#### 出力結果
操作が成功したかどうかの`Boolean`型結果。

HTTPアップロード
---

HTTPプロトコルで一つもしくは複数ファイルをアップロードします。

#### 入力引数
| 引数 | 説明
| ---- | ----
| URL      | アップロードフォームのURL、Basic認証が利用可能です。<br>例えば、`http://username:password@www.data-server.com/uploadForm`。
| ファイル    | アップロードファイルを定義するJSONオブジェクト。
| プロキシ    | （省略可）URLにアクセスするためのプロキシ設定のJSONオブジェクト。<br> - `host`: ホスト<br> - `port`: ポート<br> - `username`: ユーザ名<br> - `password`: パスワード

下記はファイルのサンプルです。
```json
{
  "document": "C:/RPA/data.pdf", /* upload single file */
  "images": [ /* upload multiple files */
    "C:/RPA/screenshot1.jpg",
    "C:/RPA/screenshot2.jpg"
  ]
}
```

#### 出力結果
操作が成功したかどうかの`Boolean`型結果。

FTPダウンロード
---

FTPプロトコルでファイル或いはフォルダーをダウンロードします。
現在対応しているプロトコルは下記になります：FTP/FTPS/SFTP。
ローカルパスにファイル或いはフォルダーは既に存在する場合、上書き保存とします。

#### 入力引数
| 引数  | 説明
| ---------- | -----------
| サーバー  | FTPサーバーのホスト，例えば`ftp.server.com`。
| ポート  | FTPサーバーのポート，例えば`21`。
| ユーザ名  | FTPサーバーのアカウントのユーザー名，例えば`username`。
| パスワード  | FTPサーバーのアカウントのパスワード，例えば`password`。
| ローカルパス | ローカルファイル或いはフォルダーのパス, 例えば `C:/RPA/data.pdf` 或いは `C:/RPA/data`。
| リモートパス | リモートファイル或いはフォルダーのパス, 例えば `/data/upload/data.pdf` 或いは `/data/upload`。
| プロトコル    | FTPプロトコル，例えば `FTP` / `FTPS` / `SFTP`。
| プロキシ    | (省略可) FTPサーバーにアクセスするためのプロキシ設定のJSONオブジェクト。<br> - `host`: ホスト。<br> - `port`: ポート。<br> - `username`: ユーザ名。<br> - `password`: パスワード。
| TLS  | (省略可) [TLSSocket options](https://nodejs.org/api/tls.html#tls_class_tls_tlssocket) の追加設定です。，<br>例えば、サーバーに自署名の証明書を利用する場合、，`{"rejectUnauthorized": false}`は有効です。デフォルトは`{}`です。

#### 出力結果
操作が成功したかどうかの`Boolean`型結果。

FTPアップロード
---

FTPプロトコルでファイル或いはフォルダーをアップロードます。
現在対応しているプロトコルは下記になります：FTP/FTPS/SFTP。
リモートパスにファイル或いはフォルダーは既に存在する場合、上書き保存とします。

#### 入力引数
| 引数  | 説明
| ---------- | -----------
| サーバー  | FTPサーバーのホスト，例えば`ftp.server.com`。
| ポート  | FTPサーバーのポート，例えば`21`。
| ユーザ名  | FTPサーバーのアカウントのユーザー名，例えば`username`。
| パスワード  | FTPサーバーのアカウントのパスワード，例えば`password`。
| ローカルパス | ローカルファイル或いはフォルダーのパス, 例えば `C:/RPA/data.pdf` 或いは `C:/RPA/data`。
| リモートパス | リモートファイル或いはフォルダーのパス, 例えば `/data/upload/data.pdf` 或いは `/data/upload`。
| プロトコル    | FTPプロトコル，例えば `FTP` / `FTPS` / `SFTP`。
| プロキシ    | (省略可) FTPサーバーにアクセスするためのプロキシ設定のJSONオブジェクト。<br> - `host`: ホスト。<br> - `port`: ポート。<br> - `username`: ユーザ名。<br> - `password`: パスワード。
| TLS  | (省略可) [TLSSocket options](https://nodejs.org/api/tls.html#tls_class_tls_tlssocket) の追加設定です。，<br>例えば、サーバーに自署名の証明書を利用する場合、，`{"rejectUnauthorized": false}`は有効です。デフォルトは`{}`です。

#### 出力結果
操作が成功したかどうかの`Boolean`型結果。

JSON API呼出し
---

サードパーティのHTTPサーバーに対して、標準なJSON APIを呼び出し、JSONフォーマットのレスポンスを取得します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| メソッド        | HTTPのメソッド、`GET` / `POST` / `PUT` / `DELETE`を使用します。
| URL           | APIのURL。
| パラメーター    | （省略可）APIのパラメーター。<br>`Key1=Value1&Key2=Value2`のようなリクエストクエリ文字列フォーマットを使用。
| パラメーター（JSON） | （省略可）APIのパラメーター。<br>`{"Key1":"Value1", "Key2":"Value2"}`のようなJSONマップ文字列フォーマットを使用。
| 変数名 | （省略可）APIの戻り値を格納する変数名。<br>値を設定する必要がない場合は空白のままにしておきます）

#### 出力結果
なし
