网络
===

系统操作中的网络组件，可以在流程中调用网络相关的功能。

HTTP下载文件
---

通过HTTP下载文件。

#### 输入参数
| 参数  | 说明
| ---------- | -----------
| URL      | 下载文件的URL, 支持Basic认证, <br>例如, `http://username:password@www.data-server.com/files/data.pdf`.
| 文件     | 本地保存的路径, 例如, `C:/RPA/data.pdf`.
| 代理    | (可选) 访问URL所需的代理信息的JSON对象。<br> - `host`: 主机。<br> - `port`: 端口。<br> - `username`: 用户名。<br> - `password`: 密码.

#### 输出结果
布尔类型，用于指示操作是否成功。

HTTP上传文件
---

通过HTTP上传一个或多个文件。

#### 输入参数
| 参数  | 说明
| ---------- | -----------
| URL      | 上传文件的URL, 支持Basic认证, <br>例如, `http://username:password@www.data-server.com/uploadForm`.
| 文件    | 定义了上传文件路径的JSON对象.
| 代理    | (可选) 访问URL所需的代理信息的JSON对象。<br> - `host`: 主机。<br> - `port`: 端口。<br> - `username`: 用户名。<br> - `password`: 密码.

以下是 `文件` 参数的例子:
```json
{
  "document": "C:/RPA/data.pdf", /* 单个文件 */
  "images": [ /* 多个文件 */
    "C:/RPA/screenshot1.jpg",
    "C:/RPA/screenshot2.jpg"
  ]
}
```

#### 输出参数
布尔类型，用于指示操作是否成功。

FTP下载
---

通过FTP下载文件或者目录，支持FTP/FTPS/SFTP协议。如果本地文件或目录已经存在，则会被覆盖。

#### 输入参数
| 参数  | 说明
| ---------- | -----------
| 服务器  | FTP服务器的地址，如`ftp.server.com`。
| 端口  | FTP服务器的端口，如`21`。
| 用户名  | FTP服务器的账号的用户名，如`username`。
| 密码  | FTP服务器的账号的密码，如`password`。
| 本地路径 | 本地文件或目录的路径, 例如, `C:/RPA/data.pdf` 或 `C:/RPA/data`。
| 远程路径 | 远程文件或目录的路径, 例如, `/data/upload/data.pdf` 或 `/data/upload`。
| 协议    | FTP传输协议，支持 `FTP` / `FTPS` / `SFTP`。
| 代理    | (可选) 访问FTP所需的代理信息的JSON对象。<br> - `host`: 主机。<br> - `port`: 端口。<br> - `username`: 用户名。<br> - `password`: 密码.
| TLS选项  | (可选) 定义附加的[TLSSocket options](https://nodejs.org/api/tls.html#tls_class_tls_tlssocket) ，<br>如连接自签名服务器时，使用`{"rejectUnauthorized": false}`。缺省为`{}`。

#### 输出结果
布尔类型，用于指示操作是否成功。

FTP上传
---

通过FTP上传文件或者目录，支持FTP/FTPS/SFTP协议。如果远程文件或目录已经存在，则会被覆盖。

#### 输入参数
| 参数  | 说明
| ---------- | -----------
| 服务器  | FTP服务器的地址，如`ftp.server.com`。
| 端口  | FTP服务器的端口，如`21`。
| 用户名  | FTP服务器的账号的用户名，如`username`。
| 密码  | FTP服务器的账号的密码，如`password`。
| 本地路径 | 本地文件或目录的路径, 例如, `C:/RPA/data.pdf` 或 `C:/RPA/data`。
| 远程路径 | 远程文件或目录的路径, 例如, `/data/upload/data.pdf` 或 `/data/upload`。
| 协议    | FTP传输协议，支持 `FTP` / `FTPS` / `SFTP`。
| 代理    | (可选) 访问FTP所需的代理信息的JSON对象。<br> - `host`: 主机。<br> - `port`: 端口。<br> - `username`: 用户名。<br> - `password`: 密码。
| TLS选项  | (可选) 定义附加的[TLSSocket options](https://nodejs.org/api/tls.html#tls_class_tls_tlssocket) ，<br>如连接自签名服务器时，使用`{"rejectUnauthorized": false}`。缺省为`{}`。

#### 输出参数
布尔类型，用于指示操作是否成功。

调用JSON API
---

调用第三方HTTP服务器的标准JSON接口，并获得JSON格式的响应

#### 输入参数
| 参数     | 说明
| ------------- | -----------
| Method        | HTTP调用的Method，支持 `GET` / `POST` / `PUT` / `DELETE`。
| URL           | 第三方API的地址
| 参数    | (可选) API的参数。使用字符串格式，例如 `Key1=Value1&Key2=Value2`.
| 参数 (JSON) | (可选) API的JSON参数, 使用JSON格式，例如 `{"Key1":"Value1", "Key2":"Value2"}`.
| 变量名 | (可选) 用来存放返回的JSON值的变量名. 如无需获得返回值，则设置为空值.

#### 输出参数
无
