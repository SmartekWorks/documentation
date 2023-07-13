メール機能
===

SWATHubはメールの送受信をサポートしています。

IMAPでメール受信
---

IMAPメールサーバーからメールを受信します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| サーバー | メールサーバーのホスト。<br>例えば、`imap.gmail.com`。
| ポート | メールサーバーのポート。<br>例えば、`993`。
| ユーザー名 | 送信元アカウントのユーザー名。<br>例えば、`username@swathub.com`。
| パスワード | 送信元アカウントのパスワード。<br>例えば、`password`。
| フォルダー   | （省略可）メールボックス名。<br>例えば、`Inbox`、 `Sent`、`Drafts`。<br>デフォルトは`Inbox`。
| 開封済み | （省略可）メールを取得した後に、メールアイテムを開封済みにするかどうか。<br>デフォルトは`true`です。
| 未開封のみ | （省略可）未開封のメールアイテムのみを取得するかどうか。<br>デフォルトは`true`です。
| 取得件数      | （省略可）取得するメールアイテムの件数。<br>デフォルトは`30`です。
| セキュリティ |（省略可）**TLS**/**SSL**を利用する場合（ポート番号`465`）、`true`にします。<br>**STARTTLS**を利用する場合（ポート番号`587`もしくは`25`）、`false`にしてください。<br>デフォルトは`true`です。
| TLS |（省略可）[TLSSocket options](https://nodejs.org/api/tls.html#tls_class_tls_tlssocket) の追加設定です。<br>例えば、メールサーバーに自署名の証明書を利用する場合、 `{"rejectUnauthorized": false}`は有効です。<br>デフォルトは `{}`です。

#### 出力結果
下記のJSONマップの配列。

* `receivedTime`: 受信時刻
* `from`: 送信先
* `to`: 宛先
* `cc`: CC先.
* `bcc` BCC先
* `subject`: 件名
* `body`: プレーンテキストの本文
* `attachments`: 添付ファイルのリスト

下記は`attachments`のサンプルです。
```json
[
  {
    "name": "slide.ppt",  /* name of attachment file */
    "path": "C:\\swatrobot\\extensions\\addons\\mail\\1547713849\\slide.ppt", /* local absolute path */
    "size": 15386         /* size in bytes */
  },
  {
    "name": "report.pdf",  /* name of attachment file */
    "path": "C:\\swatrobot\\extensions\\addons\\mail\\1547713849\\report.pdf", /* local absolute path */
    "size": 578682        /* size in bytes */
  }
]
```

POP3でメール受信
---

POP3メールサーバーからメールを受信します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| サーバー | メールサーバーのホスト。<br>例えば、`pop.gmail.com`。
| ポート | メールサーバーのポート。<br>例えば、`995`。
| ユーザー名 | 送信元アカウントのユーザー名。<br>例えば、`username@swathub.com`。
| パスワード | 送信元アカウントのパスワード。<br>例えば、`password`。
| 受信後削除 | （省略可）メールを取得した後に、メールアイテムを削除するかどうか。<br>デフォルトは`true`です。
| 取得件数      | （省略可）取得するメールアイテムの件数。<br>デフォルトは`30`です。
| セキュリティ |（省略可）**TLS**/**SSL**を利用する場合（ポート番号`465`）、`true`にします。<br>**STARTTLS**を利用する場合（ポート番号`587`もしくは`25`）、`false`にしてください。<br>デフォルトは`true`です。
| TLS |（省略可）[TLSSocket options](https://nodejs.org/api/tls.html#tls_class_tls_tlssocket) の追加設定です。<br>例えば、メールサーバーに自署名の証明書を利用する場合、 `{"rejectUnauthorized": false}`は有効です。<br>デフォルトは `{}`です。

#### 出力結果
下記のJSONマップの配列。

* `receivedTime`: 受信時刻
* `from`: 送信先
* `to`: 宛先
* `cc`: CC先.
* `bcc` BCC先
* `subject`: 件名
* `body`: プレーンテキストの本文
* `attachments`: 添付ファイルのリスト

下記は`attachments`のサンプルです。
```json
[
  {
    "name": "slide.ppt",  /* name of attachment file */
    "path": "C:\\swatrobot\\extensions\\addons\\mail\\1547713849\\slide.ppt", /* local absolute path */
    "size": 15386         /* size in bytes */
  },
  {
    "name": "report.pdf",  /* name of attachment file */
    "path": "C:\\swatrobot\\extensions\\addons\\mail\\1547713849\\report.pdf", /* local absolute path */
    "size": 578682        /* size in bytes */
  }
]
```

SMTPでメール送信
---

SMTPサーバーを利用してメールを送信します。

#### 入力引数
| 引数 | 説明
| ---- | ----
| サーバー | メールサーバーのホスト。<br>例えば、`smtp.gmail.com`。
| ポート | メールサーバーのポート。<br>例えば、`465`。
| ユーザー名 | 送信元アカウントのユーザー名。<br>例えば、`username@swathub.com`。
| パスワード | 送信元アカウントのパスワード。<br>例えば、`12345678`。
| 送信元 | 送信元のメールアドレス。<br>例えば、`username@swathub.com`。
| 宛先 | 宛先のメールアドレス。複数の場合、`,`で分けます。<br>例えば、`foo@outlook.com, bar@yahoo.com`。
| 件名 | メールの件名。<br>例えば、`My mail subject`。
| 本文 | メールの本文、テキストもしくはHTMLが利用可能です。<br>例えば、`<p>I'm a HTML mail body</p>`。
| CC |（省略可）CC 宛先のメールアドレス。複数の場合、`,`で分けます。
| BCC |（省略可）BCC 宛先のメールアドレス。複数の場合、`,`で分けます。
| 添付ファイル |（省略可）添付ファイルのフルパスの配列。添付がない場合に、`[]`を利用してください。
| セキュリティ |（省略可）**TLS**/**SSL**を利用する場合（ポート番号`465`）、`true`にします。<br>**STARTTLS**を利用する場合（ポート番号`587`もしくは`25`）、`false`にしてください。<br>デフォルトは`true`です。
| TLS |（省略可）[TLSSocket options](https://nodejs.org/api/tls.html#tls_class_tls_tlssocket) の追加設定です。<br>例えば、メールサーバーに自署名の証明書を利用する場合、 `{"rejectUnauthorized": false}`は有効です。<br>デフォルトは `{}`です。

下記は`attachments`のサンプルです。
```json
[
  "C:/RPA/slide.ppt",
  "C:/RPA/report.pdf"
]
```

#### 出力結果
操作が成功したかどうかの`Boolean`型結果。

Outlookでメール受信
---

端末にインストールしたOutlookアプリでメールを受信します。`Windows`システムのみ。

#### 入力引数
| 引数 | 説明
| ---- | ----
| アカウント  | （省略可）Outlookのメールアカウント。<br>例えば、`swathub@outlook.com`。<br>デフォルトはOutlookのデフォルトアカウントです。
| フォルダー   | （省略可）Inboxフォルダーのパス。<br>例えば、`Inbox\myFolder`。<br>デフォルトはOutlookのデフォルトInboxフォルダーです。
| フィルター   | （省略可）[メールアイテム](https://docs.microsoft.com/en-us/office/vba/api/outlook.mailitem)の[フィルター](https://docs.microsoft.com/en-us/office/vba/api/outlook.items.restrict)。<br>例えば、`[ReceivedTime] > '2019/01/01 00:00'`は2019年以降のメールを取得します。<br>デフォルトはフィルターなし。
| 開封済み | （省略可）メールを取得した後に、メールアイテムを開封済みにするかどうか。<br>デフォルトは`true`です。
| 未開封のみ | （省略可）未開封のメールアイテムのみを取得するかどうか。<br>デフォルトは`true`です。
| 取得件数      | （省略可）取得するメールアイテムの件数。<br>デフォルトは`30`です。

#### 出力結果
下記のJSONマップの配列。

* `receivedTime`: 受信時刻
* `from`: 送信先
* `to`: 宛先
* `cc`: CC先.
* `bcc` BCC先
* `subject`: 件名
* `body`: プレーンテキストの本文
* `attachments`: 添付ファイルのリスト

下記は`attachments`のサンプルです。
```json
[
  {
    "name": "slide.ppt",  /* name of attachment file */
    "path": "C:\\swatrobot\\extensions\\addons\\mail\\1547713849\\slide.ppt", /* local absolute path */
    "size": 15386         /* size in bytes */
  },
  {
    "name": "report.pdf",  /* name of attachment file */
    "path": "C:\\swatrobot\\extensions\\addons\\mail\\1547713849\\report.pdf", /* local absolute path */
    "size": 578682        /* size in bytes */
  }
]
```

Outlookレポート取得
---

端末にインストールしたOutlookアプリからレポートを取得します。`Windows`システムのみ。

#### 入力引数
| 引数 | 説明
| ---- | ----
| アカウント  | （省略可）Outlookのメールアカウント。<br>例えば、`swathub@outlook.com`。<br>デフォルトはOutlookのデフォルトアカウントです。
| フォルダー   | （省略可）Inboxフォルダーのパス。<br>例えば、`Inbox\myFolder`。<br>デフォルトはOutlookのデフォルトInboxフォルダーです。
| フィルター   | （省略可）[レポートアイテム](https://docs.microsoft.com/en-us/office/vba/api/outlook.reportitem)の[フィルター](https://docs.microsoft.com/en-us/office/vba/api/outlook.items.restrict)。<br>例えば、`[ReceivedTime] > '2019/01/01 00:00'`は2019年以降のレポートを取得します。<br>デフォルトはフィルターなし。
| 開封済み | （省略可）レポートを取得した後に、レポートアイテムを開封済みにするかどうか。<br>デフォルトは`true`です。
| 未開封のみ | （省略可）未開封のレポートアイテムのみを取得するかどうか。<br>デフォルトは`true`です。
| 取得件数      | （省略可）取得するレポートアイテムの件数。<br>デフォルトは`30`です。

#### 出力結果
下記のJSONマップの配列。
* `creationTime`: レポート作成時刻
* `subject`: レポートの件名
* `body`: プレーンテキストの本文
* `attachments`: 添付ファイルのリスト、通常関連するメールが添付されます。

Outlookでメール送信
---

端末にインストールしたOutlookアプリでメールを送信します。`Windows`システムのみ。

#### 入力引数
| 引数 | 説明
| ---- | ----
| 宛先 | 宛先のメールアドレス。複数の場合、`,`で分けます。<br>例えば、`foo@outlook.com, bar@yahoo.com`。
| 件名 | メールの件名。<br>例えば、`My mail subject`。
| 本文 | メールの本文、テキストもしくはHTMLが利用可能です。<br>例えば、`<p>I'm a HTML mail body</p>`。
| CC |（省略可）CC 宛先のメールアドレス。複数の場合、`,`で分けます。
| BCC |（省略可）BCC 宛先のメールアドレス。複数の場合、`,`で分けます。
| 添付ファイル |（省略可）添付ファイルのフルパスの配列。添付がない場合に、`[]`を利用してください。

下記は`attachments`のサンプルです。
```json
[
  "C:/RPA/slide.ppt",
  "C:/RPA/report.pdf"
]
```

#### 出力結果
操作が成功したかどうかの`Boolean`型結果。
