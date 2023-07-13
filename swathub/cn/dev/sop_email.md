邮件
===

系统操作中的邮件组件，可以在流程中进行收发邮件的操作。

接收IMAP邮件
---

从IMAP邮件服务器接收邮件。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 服务器  | 邮件服务器的地址，如`imap.gmail.com`。
| 端口  | 邮件服务器的端口，如`993`。
| 用户名  | 邮件服务器的账号的用户名，如`username@swathub.com`。
| 密码  | 邮件服务器的账号的密码，如`password`。
| 文件夹  | （可省略）文件夹的名称，如`Inbox`，`Sent`，`Drafts`等。缺省为`Inbox`。
| 标记为已读  | （可省略）收取后是否标志邮件已读。缺省是`true`。
| 仅获取未读  | （可省略）是否只收取未读邮件。缺省是`true`。
| 记录个数  | （可省略）收取的邮件条数，缺省是`30`。
| 安全选项  | （可省略）当使用**TLS**/**SSL**进行连接设置为`true`。缺省为`true`。
| TLS选项  | （可省略）定义附加的[TLSSocket options](https://nodejs.org/api/tls.html#tls_class_tls_tlssocket) ，<br>如连接自签名服务器时，使用`{"rejectUnauthorized": false}`。缺省为`{}`。

#### 输出结果

包含以下键值的JSON Map的列表。

* `receivedTime`: 邮件的接收时间。
* `from`: 发信人。
* `to`: 收信人。
* `cc`: 抄送人。
* `bcc`: 密送人。
* `subject`: 邮件主题。
* `body`: 邮件正文。
* `attachments`: 附件列表。

其中附件列表是如下例的JSON列表。

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

接收POP3邮件
---

从POP3邮件服务器接收邮件。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 服务器  | 邮件服务器的地址，如`pop.gmail.com`。
| 端口  | 邮件服务器的端口，如`995`。
| 用户名  | 邮件服务器的账号的用户名，如`username@swathub.com`。
| 密码  | 邮件服务器的账号的密码，如`password`。
| 文件夹  | （可省略）文件夹的名称，如`Inbox`，`Sent`，`Drafts`等。缺省为`Inbox`。
| 删除已读  | （可省略）收取后是否在服务器上删除邮件。缺省是`true`。
| 记录个数  | （可省略）收取的邮件条数，缺省是`30`。
| 安全选项  | （可省略）当使用**TLS**/**SSL**进行连接设置为`true`。缺省为`true`。
| TLS选项  | （可省略）定义附加的[TLSSocket options](https://nodejs.org/api/tls.html#tls_class_tls_tlssocket) ，<br>如连接自签名服务器时，使用`{"rejectUnauthorized": false}`。缺省为`{}`。

#### 输出结果

包含以下键值的JSON Map的列表。

* `receivedTime`: 邮件的接收时间。
* `from`: 发信人。
* `to`: 收信人。
* `cc`: 抄送人。
* `bcc`: 密送人。
* `subject`: 邮件主题。
* `body`: 邮件正文。
* `attachments`: 附件列表。

其中附件列表是如下例的JSON列表。

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

发送SMTP邮件
---

使用SMTP邮件服务器发送邮件。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 服务器  | 邮件服务器的地址，如`smtp.gmail.com`。
| 端口  | 邮件服务器的端口，如`465`。
| 用户名  | 邮件服务器的账号的用户名，如`username@swathub.com`。
| 密码  | 邮件服务器的账号的密码，如`password`。
| 发件人  | 发件人的邮件地址，如`username@swathub.com`。
| 收件人  | 收件人的邮件地址，使用`,`来分隔多个收件人，如`foo@outlook.com, bar@yahoo.com`。
| 主题  | 邮件的主题，如`My mail subject`。
| 正文  | 邮件的正文，支持普通文本和HTML文本，如`<p>I'm a HTML mail body</p>`。
| 抄送  | （可省略）抄送收件人，使用`,`来分隔多个收件人。
| 密送  | （可省略）密送收件人，使用`,`来分隔多个收件人。
| 附件  | （可省略）附件全路径的JSON列表，可以使用`[]`表示没有附件。缺省是没有附件。
| 安全选项  | （可省略）当使用**TLS**/**SSL**进行连接设置为`true`。缺省为`true`。
| TLS选项  | （可省略）定义附加的[TLSSocket options](https://nodejs.org/api/tls.html#tls_class_tls_tlssocket) ，<br>如连接自签名服务器时，使用`{"rejectUnauthorized": false}`。缺省为`{}`。

以下是附件的例子。

```json
[
  "C:/RPA/slide.ppt",
  "C:/RPA/report.pdf"
]
```

#### 输出结果

`true`或`false`用来提示操作成功与否。


接收Outlook邮件
---

使用本地的Outlook应用接收邮件。仅支持`Windows`操作系统。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 账户  | （可省略）Outlook的邮件账户，如`swathub@outlook.com`。<br>缺省使用Outlook的缺省邮件账户。
| 文件夹  | （可省略）文件夹的路径，如`Inbox\myFolder`。<br>缺省使用Outlook的缺省文件夹。
| 过滤条件  | （可省略）[Mail Items](https://docs.microsoft.com/en-us/office/vba/api/outlook.mailitem)的[filter](https://docs.microsoft.com/en-us/office/vba/api/outlook.items.restrict)，<br>如`[ReceivedTime] > '2019/01/01 00:00'`将会收取所有2019年之后的邮件。<br>缺省不使用过滤条件。
| 标记为已读  | （可省略）收取后是否标志邮件已读。缺省是`true`。
| 仅获取未读  | （可省略）是否只收取未读邮件。缺省是`true`。
| 记录个数  | （可省略）收取的邮件条数，缺省是`30`。

#### 输出参数

包含以下键值的JSON Map的列表。

* `receivedTime`: 邮件的接收时间。
* `from`: 发信人。
* `to`: 收信人。
* `cc`: 抄送人。
* `bcc`: 密送人。
* `subject`: 邮件主题。
* `body`: 邮件正文。
* `attachments`: 附件列表。

其中附件列表是如下例的JSON列表。

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

接收Outlook通知
---

使用本地的Outlook应用接收Outlook邮件通知。仅支持`Windows`操作系统。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 账户  | （可省略）Outlook的邮件账户，如`swathub@outlook.com`。<br>缺省使用Outlook的缺省邮件账户。
| 文件夹  | （可省略）文件夹的路径，如`Inbox\myFolder`。<br>缺省使用Outlook的缺省文件夹。
| 过滤条件  | （可省略）[Report Items](https://docs.microsoft.com/en-us/office/vba/api/outlook.reportitem)的[filter](https://docs.microsoft.com/en-us/office/vba/api/outlook.items.restrict)，<br>如`[CreationTime] > '2019/01/01 00:00'`将会收取所有2019年之后的生成的通知。<br>缺省不使用过滤条件。
| 标记为已读  | （可省略）收取后是否标志通知已读。缺省是`true`。
| 仅获取未读  | （可省略）是否只收取未读通知。缺省是`true`。
| 记录个数  | （可省略）收取的通知条数，缺省是`30`。

#### 输出参数

包含以下键值的JSON Map的列表。

* `creationTime`: 通知的生成时间。
* `subject`: 通知主题。
* `body`: 通知内容。
* `attachments`: 附件列表，包含原始邮件，格式同(接收Outlook邮件)[#接收Outlook邮件]的输出参数。

发送Outlook邮件
---

使用本地的Outlook应用的缺省账号发送邮件。仅支持`Windows`操作系统。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 收件人  | 收件人的邮件地址，使用`,`来分隔多个收件人，如`foo@outlook.com, bar@yahoo.com`。
| 主题  | 邮件的主题，如`My mail subject`。
| 正文  | 邮件的正文，支持普通文本和HTML文本，如`<p>I'm a HTML mail body</p>`。
| 抄送  | （可省略）抄送收件人，使用`,`来分隔多个收件人。
| 密送  | （可省略）密送收件人，使用`,`来分隔多个收件人。
| 附件  | （可省略）附件全路径的JSON列表，可以使用`[]`表示没有附件。缺省是没有附件。

以下是附件的例子。

```json
[
  "C:/RPA/slide.ppt",
  "C:/RPA/report.pdf"
]
```

#### 输出参数

`true`或`false`用来提示操作成功与否。
