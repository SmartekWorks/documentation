API模型
===

API模型是对所要操作的Web服务的API进行建模，其中所定义的API模型操作在执行中会模拟调用API的HTTP请求并获取响应的过程。这种模型操作在对API进行测试时非常有用，同时在构建业务场景自动化时，API模型操作也可以被用来调用某些外部系统的API，来实现比GUI更高效的自动化。

模型构建
---

在SWATHub中，我们可以通过设置API的参数来轻松创建API模型<sup>1</sup>。具体步骤参见[用户手册](../manual/design_model#api模型)。其中可以定义的属性如下：

### 常规属性
* Method：HTTP请求方法，可以使用`GET`、`POST`、`PUT`、`PATCH`或`DELETE`。
* URL：API的URL。
* Header：用于定义HTTP请求Header的JSON的MAP。例如，下面是一个示例Header，用于提供其他授权信息。
```json
{"Authorization":"APPCODE fbebc457055a480dab89f87fcbd3ef31"}
```

### 数据属性
* Query：用于在URL中定义查询字符串的JSON的MAP。例如，`http://API_URL?searchKey=SWATHub&count=10`这样的URL可以定义如下Query：
```json
{"searchKey":"SWATHub", "count":"10"}
```
* Body类型：请求体的类型，可以使用`JSON`、`FORM`或`XML`。
* Body：请求体的文本。对于不同的Body类型，Body的格式也不同。
  * `JSON`：格式为JSON对象，可用`{}`表示空白对象。
  * `FORM`：格式为JSON数组，可用`[]`表示空白数组。
  * `XML`: 格式为XML文档，可用`<?xml version="1.0"?>`表示空白文档。

下面是一个表示`FORM`请求体的JSON数组：
```json
[
  { "name":"username", "value":"foo" },
  { "name":"password", "value":"bar" },
  { "name":"avatar", "value":"C:/Users/foo/avatar.png", "file":true } /* file upload */
]
```

### 高级属性
* 认证类型：身份验证方法的类型，使用`NONE`、`Basic`或者`OAuth2`。
* 认证信息：用于定义身份验证信息的JSON的MAP。下面是分别是**Basic Authentication**和**OAuth2 Authentication**认证信息的示例：
```json
{
    "username":"foo",
    "password":"bar"
}
```
```json
{
    "token":"xoxp-2920615630-2920726650-501681802055"
}
```
* 超时：HTTP请求超时（以秒为单位）。如果设置为`0`，则将其解释为无限超时。

操作参数
---

API模型操作的输入参数由用户设在属性中的变量构成，输出参数则是该API返回的响应信息中的Body数据。

以下是返回的示例：

```json
{"name":"Selenium","tags":null,"testServer":null,"apiServer":"http://localhost:5555"}
```
