Windows应用
===

系统操作中的Windows应用组件，可以通过[Microsoft UI Automation](https://docs.microsoft.com/en-us/windows/win32/winauto/entry-uiauto-win32)来高效地自动化操作原生的Windows应用。

### Windows控件的选择器

大多数的Windows应用系统操作都需要指定[Windows控件](https://docs.microsoft.com/en-us/windows/win32/winauto/uiauto-supportinguiautocontroltypes)的选择器来定位。选择器是一个描述目标控件在Windows中的若干个阶层定位信息的JSON列表。该列表的先后顺序是按照Windows控件父子包含的阶层顺序。比如下述例子中，先定位了应用主窗口，再定位了树形控件，最后定位了树上的按钮。

选择器的例子：

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

每个阶层的定位信息是包含以下键值的JSON Map。

* `control`: 控件的Windows控件类型，首字母必须小写，如`window`，`treeItem`，`text`等。
* `name`: 控件的名称，支持正则表达式进行匹配，如`Untitled - Notepad`，`Untitled.*`等。
* `class`: 控件的类名称。
* `automationId`: 控件的自动化ID。
* `index`: 找到多个符合其他条件的控件时，指定第几个控件。从`1`开始。

使用SWATHub机器人的[Windows控件获取工具](../manual/robot_windows_inspect)可以直接获取到选择器，也可以通过各种工具<sup>1</sup>获取用来匹配控件属性的键值。

?> 1. 我们推荐使用微软的[Inspect.exe](https://docs.microsoft.com/en-us/windows/win32/winauto/inspect-objects)来获取控件的属性。

### SAP控件的选择器

SAP客户端（SAP GUI）作为使用非常广泛的Windows应用程序，同样可以使用Windows应用组件来进行自动化操作。特别的，首先需要在SAP GUI进行如下设置，激活客户端自动化特性：

* 客户端登录之后，访问`RZ11`参数设置页面，输入`sapgui/user_scripting`，点击显示按钮，确保其当前值为`TRUE`，如果不是的话需要进行修改。
* 客户端进入`选项 - 脚本录制与回放`，确保`启用脚本`的选项已经被勾选上。

我们同样使用JSON列表来定位SAP GUI中的控件，推荐使用[Tracker](https://tracker.stschnell.de/)工具来获取控件的id信息，如下是一个例子：

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

SAP选择器一般有两个阶层，其中第一个定位了SAP GUI的窗口，第二个定位了控件。

* 第一层中的`control`和`class`属性是不变的，`name`会根据SAP GUI中具体打开的页面窗口名称而变化。
* 第二层中的`id`是通过Tracker工具获取到的控件标识。

### Java控件的选择器

Java GUI的技术主要包含AWT、Swing和SWT三种，其中AWT和SWT通过封装操作系统的图形控件来实现，Swing则通过纯Java来绘制控件。因此，AWT和SWT控件的定位方式和一般Windows控件相同，这里主要介绍一下Swing控件的定位方式。

* 安装[Java Access Bridge](https://docs.oracle.com/javase/accessbridge/2.0.2/setup.htm)。
* 使用JAB中自带的工具如JavaMonkey来获取控件的`name`和`role`信息。

我们同样使用JSON列表来定位Java Swing中的控件，如下是一个例子：

```json
[
  {
    "control": "window",
    "name": "SwingSet3",
    "class": "SunAwtFrame"
  },
  {
    "name": "Name",
    "role": "text"
  }
]
```

Java Swing控件<sup>1</sup>的选择器一般有两个阶层，其中第一个定位了Swing窗口，第二个定位了控件。

* 第一层中的`control`和`class`属性是不变的，`name`会根据Java Swing的窗口名称而变化。
* 第二层中的`name`和`role`是通过自带工具获取到的控件标识。

鼠标点击
---

鼠标点击指定的Windows控件。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 选择器  | [Windows控件的选择器](#Windows控件的选择器)。
| 按钮  | 点击的鼠标按钮，使用`left`或者`right`。
| 类型  | 点击的类型，使用`single`或者`double`。

#### 输出结果

无

鼠标悬停
---

鼠标悬停到指定的Windows控件。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 选择器  | [Windows控件的选择器](#Windows控件的选择器)。

#### 输出结果

无

输入文本
---

对指定的Windows控件输入文本。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 选择器  | [Windows控件的选择器](#Windows控件的选择器)。
| 文本  | 输入的文本，可以使用特殊键值，如`#{TAB}`，`#{UP}`，`#{ENTER}`等。

#### 输出结果

无

获取文本
---

从指定的Windows控件中获取文本。该文本可以是控件的可编辑文本，也可以是控件的显示文本。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 选择器  | [Windows控件的选择器](#Windows控件的选择器)。

#### 输出结果

获取到的文本字符串

激活控件
---

激活指定的Windows控件，并将其切换至前台。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 选择器  | [Windows控件的选择器](#Windows控件的选择器)。

#### 输出结果

无

存在元素
---

对于指定的Windows控件，检查其是否存在。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 选择器 | [Windows控件的选择器](#Windows控件的选择器)。

#### 输出结果

控件是否存在的结果，`true`或`false`。

启动进程
---

启动某个应用程序并设置其初始窗口。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 文件  | 应用程序可执行文件的路径。如`Notepad`，`C:\Program Files (x86)\Microsoft Office\root\Office16\EXCEL.EXE`等。
| 工作目录  | （可选）命令行执行的工作目录，如`C:\RPA\myWorkingDir`。
| 窗口  | （可选）初始窗口大小，取值范围包括：`default`、`maximize`、`minimize`、`hide`。

#### 输出参数

| 参数       | 解释
| ---------- | -----------
| `result`   | 启动进程的`pid`。

关闭进程
---

关闭某个运行中的进程。

#### 输入参数

| 参数 | 说明
| ---- | ----
| 进程  | 进程的`pid`，或名称。如`16328`，`Notepad`等。

#### 输出参数

无