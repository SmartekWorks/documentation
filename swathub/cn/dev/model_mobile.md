APP模型
===

对于移动APP而言，目前最为流行的开发方式主要有如下三种：
* 原生开发模式（Native APP）
* 混合开发模式（Hybrid APP）
* Web开发模式，或者也称为 H5 APP

H5 APP本质上就是一个Web应用，运行在手机端浏览器上，因此一般由Web模型来进行建模。

Native APP由于平台不同，iOS和Android分别使用不同格式的界面UI架构的XML，来定义各自不同的交互模式，SWATHub可以通过识别这些XML来定位启动的交互组件构建模型。

Hybrid APP则是上述两者的混合模式，在Native APP中嵌入了一个WebView组件，用来展示HTML格式的网页内容。SWATHub可以对这两者分别按照NativeAPP方式和Web方式进行建模，无缝的在Native和WebView两种模式<sup>1</sup>中进行切换，通过各自不同的模型来驱动APP的自动化执行。

?> 1. 本质上WebView的模型属于Web模型，但是从使用角度，我们将其划分为APP模型。

模型构建
---

在SWATHub中，我们通过模型获取器来获取APP的模型源文件，其中包括了Native部分模型和WebView部分模型。对于Native部分模型，定义一系列相关的动作命令来构建Native的APP模型；对于WebView部分模型则由建模引擎来自动构建WebView的APP模型。

更具体的步骤参见[用户手册](../manual/design_model#app模型)。关于WebView部分的建模可以参考[Web模型](model_web)。

### APP动作命令

Native模型操作由一系列APP动作命令组成。在运行时，操作中的命令将逐个执行。下面是当前支持的APP动作命令。

#### 点击
此命令将尝试查找和定位APP的元素，然后点击它。

##### 输入参数
| 参数      | 解释
| ---------- | -----------
| 目标  | 字符串，用于设置定位元素的XPath。再元素选择器上选择元素后自动生成。

##### 输出结果
无

#### 输入文本
此命令将尝试查找和定位APP的元素，然后输入文本。再元素选择器上选择元素后自动生成。

##### 输入参数
| 参数      | 解释
| ---------- | -----------
| 目标  | 字符串，用于设置定位元素的XPath。
| 文本  | 字符串，要写入的文本。

##### 输出结果
无

#### 滑动
此命令将尝试在APP中滑动一段轨迹。

##### 输入参数
| 参数      | 解释
| ---------- | -----------
| 路径  | 二维JSON数组 `[[x1,y1], [x2,y2], ...[xn,yn]]` ，用于指定屏幕上滑动轨迹的各个端点。

##### 输出结果
无

#### 查找图像
此命令将尝试在当前APP屏幕中查找和定位图像。

##### 输入参数
| 参数      | 解释
| ---------- | -----------
| 图像  | JSON数组`[x,y,width,height]`，用于指定屏幕上导入的矩形区域的图像。
| 变量  | （可选）定义一个变量来标识找到的图像。变量的值是运行时APP屏幕上的JSON数组`[x,y,width,height]`。

##### 输出结果
无

#### 获取图像
此命令将尝试在当前APP屏幕中查找和定位图像，然后以**Base64**格式返回。

##### 输入参数
| 参数      | 解释
| ---------- | -----------
| 图像  | JSON数组`[x,y,width,height]` 用于指定屏幕上导入的矩形区域的图像。
| 偏移值 | （可选）JSON数组`[x,y,width,height]`，用于指定相对于上图的偏移图像。<br>如果未设置，将返回上述图像。
| 变量  | （可选）定义一个变量来标识找到的图像。变量的值是从图像二进制数据转换的Base64字符串。

##### 输出结果
无

#### 点击图像
此命令将尝试在当前APP屏幕中查找和定位图像，然后点击它。

##### 输入参数
| 参数      | 解释
| ---------- | -----------
| 图像  | JSON数组`[x,y,width,height]`，用于指定屏幕上导入的矩形区域的图像。
| 偏移值 | （可选）JSON数组`[x,y,width,height]`，用于指定相对于上图的偏移图像。<br>如果未设置，将点击上述图像。

##### 输出结果
无

#### 存在图像
此命令将尝试检查当前APP屏幕中是否存在图像，并返回检查结果。

##### 输入参数
| 参数      | 解释
| ---------- | -----------
| 图像  | JSON数组`[x,y,width,height]` 用于指定屏幕上导入的矩形区域的图像。
| 变量  | （可选）定义一个变量来保存检查结果的变量名，结果为`true`或`false`。

##### 输出结果
无

操作参数
---

APP模型操作的输入参数由用户设在动作命令的输入参数中的变量构成；输出参数目前暂不支持。
