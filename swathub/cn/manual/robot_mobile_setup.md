移动端平台
===

概要
---

SWATHub机器人可以通过[Appium](http://appium.io)驱动模拟器或实机来运行移动Web应用程序或者移动端App。当完成SWATHub机器人的安装设置后，需要额外搭建移动端平台。

### 支持范围

| 操作系统 | 支持版本
| ------- | -----------
| iOS | iOS 9.3以上<sup>1</sup>
| Android | Android 5以上

?> 1. 由于iOS的XCTest UI框架的限制，需要iOS 11以上才能支持包含有WebView的移动端App。

### 移动端行为设置

移动端模拟器和真机设备的部分行为可以通过在流程的步骤选项中中设置`browserCapabilities`来更改。有关详细信息，请参阅 [Appium Desired Capabilities](http://appium.io/docs/en/writing-running-appium/caps/)。

下面是一个示例，用于将iOS和Android上的模拟器的屏幕方向设置为横向模式。
```json
  "capabilities": {
    "orientation": "LANDSCAPE"
  }
```

Android平台
---

### 桌面端环境

驱动Android平台的桌面端需要安装如下支持软件：

* [Node.js 12+](https://nodejs.org/)
* [Appium最新版](http://appium.io/docs/en/about-appium/getting-started/)
```batch
npm install -g appium@beta
```
* [Android Studio](https://developer.android.com/studio)
* [JDK8](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html)
* [Chromedriver](http://chromedriver.chromium.org/downloads)<sup>1</sup>

?> 1. 需要根据手机的WebView版本或Chrome版本来下载相对应的版本

### 设置流程

1. Android手机使用数据线连接PC，并且开启开发者选项，允许USB调试。
1. 使用adb命令测试手机是否已连接：
```batch
adb devices
```
1. 设置环境变量
  * `ANDROID_HOME`：设置到SDK Tools的安装目录
  * `JAVA_HOME`：设置到jdk8的安装目录。

### APP模型获取器设置

SWATHub机器人的模型获取器中设置如下capabilities：
```json
{
  "automationName": "UiAutomator2",
  "platformName": "Android",
  "app": "C:/mobile/ionic-debug.apk",
  "deviceName": "Android Emulator",
  "newCommandTimeout": 0,
  "noReset": true,
  "ensureWebviewsHavePages": true,
  "chromedriverExecutableDir": "C:/chromedrivers"
}
```
* `app`：apk文件所在的本地路径，注意是正斜杠
* `chromedriverExecutableDir`：chromedriver.exe的本地目录

APP在手机上正常启动之后，在工具上点击刷新按钮，获取到截图和Source文件，然后点击下载按钮，保存为本地文件

* NATIVE_APP：保存为 sview 文件，代表了原生代码，作为APP模型导入
* WebView_1：保存为 shtml 文件，代表了WebView的HTML代码，作为Web模型导入

### APP扩展平台设置

SWATHub机器人的高级设置中的平台信息如下：
```json
 {
  "remoteURL": "http://localhost:4723/wd/hub",
  "code": "Redmi Note8",
  "definition": {
    "os": "Android",
    "osVer": "9",
    "browser": "Chrome",
    "browserVer": "79"
  },
  "capabilities": {
    "automationName": "UiAutomator2",
    "platformName": "Android",
    "deviceName": "Android Emulator",
    "skipServerInstallation": false,
    "ensureWebviewsHavePages": true,
    "noReset": true,
    "chromedriverExecutableDir": "C:/chromedrivers"
  }
}
```
* `code`：手机型号
* `chromedriverExecutableDir`：chromedriver.exe的本地目录

iOS平台
---

### 桌面端环境

驱动iOS平台需要macOS的桌面端，并安装如下支持软件：

* XCode最新版
* [Homebrew](https://brew.sh/)
```batch
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
* [Node.js 12+](https://nodejs.org/)
```batch
brew install node
```
* [Appium最新版](http://appium.io/docs/en/about-appium/getting-started/)
```batch
npm install -g appium@beta
```
* [ios-webkit-debug-proxy最新版](https://github.com/google/ios-webkit-debug-proxy)
```batch
brew install --HEAD usbmuxd
brew install --HEAD libimobiledevice
brew install --HEAD ios-webkit-debug-proxy
brew install carthage
```

### 设置流程

1. 设置如下环境变量
```batch
export ANDROID_HOME=/Users/<username>/Library/Android/sdk
export PATH=/Users/<username>/Library/Android/sdk/platform-tools:$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`   
```
1. 打开XCode，使用数据线连接手机，获取手机的UDID
1. iPhone手机上设置了如下
  * 设置 -> 开发者 Enable UI Automation (需连接到手机，并且在XCode中登录开发者账号之后出现本设置)
  * 设置 -> Safari -> 高级 Web Inspector
1. 参考[在线教程的Full manual configuration](http://appium.io/docs/en/drivers/ios-xcuitest-real-devices/)编译IWDP，确认配置无误

### APP模型获取器设置

SWATHub机器人的模型获取器中设置如下capabilities：
```json
{
  "platformName": "iOS",
  "platformVersion": "13.3",
  "deviceName": "iPhone",
  "udid": "UDID",
  "automationName": "XCUITest",
  "app": "/path/to/ionic-debug.app",
  "startIWDP": true,
  "newCommandTimeout": 0,
  "noReset": true
}
```

* `udid`：手机的唯一代码UDID


### APP扩展平台设置

SWATHub机器人的高级设置中的平台信息如下：
```json
{
  "remoteURL": "http://localhost:4723/wd/hub",
  "code": "iPhone XR",
  "definition": {
    "os": "iOS",
    "osVer": "13.3",
    "browser": "Safari",
    "browserVer": "13"
  },
  "capabilities": {
      "platformName": "iOS",
      "platformVersion": "13.3",
      "deviceName": "iPhone",
      "udid": "UDID",
      "automationName": "XCUITest",
      "startIWDP": true,
      "noReset": true
  }
}
```

* `code`：手机型号
* `udid`：手机的唯一代码UDID
