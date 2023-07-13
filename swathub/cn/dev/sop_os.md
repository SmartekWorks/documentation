操作系统
===

系统操作中的操作系统组件，可以在流程中调用操作系统功能。

系统等待
---

等待一段时间。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 等待时间（秒） | 需要等待的秒数。

#### 输出结果

无

执行批处理文件
---

执行操作系统的批处理文件。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 命令  | 所需执行的命令行<sup>1</sup>，如`"my script.bat" arg1 arg2`。
| 工作目录  | （可省略）命令行执行的工作目录，如`C:\RPA\myWorkingDir`。
| 后台执行  | （可省略）是否在后台执行，无需等待批处理执行完毕，缺省为`false`。

#### 输出结果

命令行输出的`stdout`的字符串。当后台执行时，则返回后台进程的`pid`。

?> 1. 命令行中的路径不能包含空格。

显示消息对话框
---

显示消息框<sup>1</sup>来提示用户。仅支持`Windows`操作系统。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 内容  | 消息框的内容，如`I'm a message box!`。
| 标题  | （可省略）消息框的标题，缺省为`Message Box`。

#### 输出结果

无

?> 1. 用户在关闭此消息框之前，流程执行将始终保持暂停状态，不执行后续步骤。

发送系统通知
---

显示系统通知。不同操作系统上通知的展现形式可能不同，个别系统可能需要额外的设置<sup>1</sup>。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 标题  | （可省略）通知的标题，缺省为 `Notification`。
| 消息  | 通知消息的内容。

#### 输出结果

无

?> 1. Windows 10 以上的操作系统中，通知来源默认显示的是应用程序的绝对路径。如需改成显示应用程序的图标，需要创建 `SWATHubRobot.exe` 的快捷方式，然后移动到 `%ProgramData%\Microsoft\Windows\Start Menu\Programs` 目录下。

记录日志消息
---

机器人的`logs`目录下的机器人日志中输出日志消息。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 级别  | 日志的级别，可以使用`信息`、`警告`、`错误`。
| 消息  | 日志消息的内容。

#### 输出结果

无

输入热键
---

对当前激活的桌面元素输入热键。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 文本  | 输入键<sup>1</sup>的序列。包含多个键时顺序输入。
| 修饰键 | （可省略）用来组合的修饰键<sup>2</sup>，如`SHIFT`, `ALT+CTRL`等。
| 类型 | （可省略）输入模式，使用`键盘事件`，抑或是`设备驱动`<sup>3</sup>。


?> 1. 当前支持的特殊键包括：`#{BACK}`, `#{DELETE}`, `#{ENTER}`, `#{TAB}`, `#{ESCAPE}`, `#{UP}`, `#{DOWN}`, `#{RIGHT}`, `#{LEFT}`, `#{HOME}`, `#{END}`, `#{PAGEUP}`, `#{PAGEDOWN}`, `#{F1}`, `#{F2}`, `#{F3}`, `#{F4}`, `#{F5}`, `#{F6}`, `#{F7}`, `#{F8}`, `#{F9}`, `#{F10}`, `#{F11}`, `#{F12}`

?> 2. 当前支持的修饰键包括：`ALT`, `CTRL`, `SHIFT`, `WIN`（Windows）, `CMD`（macOS）。

?> 3. 设备驱动有如下的注意事项：仅适用于安装Windows操作系统的实体计算机，需配置PS/2键盘；计算机BIOS中的安全启动模式需要被禁止； 需使用管理员权限启动Robot；需安装[.Net Framework 3.5](https://www.microsoft.com/en-us/download/details.aspx?id=21)。

#### 输出参数

无

获取剪贴板文本
---

获取操作系统剪贴板的字符串文本。

#### 输入参数

无

#### 输出结果

剪贴板内容的字符串。

设置剪贴板文本
---

设置操作系统剪贴板的字符串文本。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 文本 | 字符串文本。

#### 输出结果

无

获取凭据
---

获取凭据管理器中的加密口令。仅支持`Windows`操作系统。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 目标地址  | 对象凭据<sup>1</sup>的网络地址。

#### 输出结果

包含以下键值的JSON Map。

* `username`: 凭据的用户名。
* `password`: 凭据的加密口令<sup>2</sup>。

?> 1. 仅支持`Generic`类型的数据。

?> 2. 当使用加密口令时，会自动进行解密，明文口令将不会出现在日志中。

录制屏幕
---

对系统桌面进行全屏录制，并保存为`mp4`格式。仅支持`Windows`操作系统。需事先安装[Screen Capture Recorder](https://github.com/rdp/screen-capture-recorder-to-video-windows-free/releases)。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 文件  | 录屏文件的本地保存路径，文件名后缀为`mp4`。
| 时长  | （可省略）录屏所需的时间长度，单位为秒，缺省为`10`。
| 帧率  | （可省略）录屏所使用的帧率，缺省为`10`。
| 实时缓存  | （可省略）录屏所使用的实施缓存，缺省为`128MB`。

#### 输出结果

录屏进程的进程ID。

执行扩展功能
---

执行第三方开发的扩展功能<sup>1</sup>，或者为项目定制化的扩展功能。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 扩展名  | 扩展功能的名称<sup>2</sup>，如`baidu.ocr`。
| 输入数据  | JSON格式的输入数据，执行时被传递给扩展功能。缺省为`{}`。
| 变量名  | （可省略）扩展功能执行之后的返回值，可以传递给这个变量名。

?> 1. 扩展功能通过Javascript实现，实现逻辑被打包成一个独立的文件。例如在Windows系统中，在`%appdata%\SWATHubRobot\plugins`目录下需要部署一个名为`baidu.ocr.js`的文件。

?> 2. 扩展功能的名称是JS文件的文件名。比如`baidu.ocr.js`的扩展功能名为`baidu.ocr`。

#### 输出结果

无