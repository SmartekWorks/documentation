移动端平台
===

概要
---

SWATHub机器人可以通过[Appium](http://appium.io)驱动模拟器或实机来运行移动Web应用程序或者移动端App。当完成SWATHub机器人的安装设置后，可以自动识别已经连接的所有设备。

### 支持范围

| 操作系统 | 支持版本
| ------- | -----------
| iOS | iOS 9.3以上<sup>1</sup>
| Android | Android 5以上

?> 1. 由于iOS的XCTest UI框架的限制，需要iOS 11以上才能支持包含有WebView的移动端App。

Android平台
---

### 设置流程

1. Android手机使用数据线连接PC，并且开启开发者选项，允许USB调试。
  * 允许「USB调试」和「USB调试（安全设置）」。
  * （可选）对于个别型号的手机，如OnePlus的ColorOS系统，需要允许「禁止权限监控」。
  * （可选）对于个别型号的手机，如Huawai Nova5 Pro（HarmonyOS 3.0），需要禁止「仅充电模式下允许ADB调试」。

iOS平台
---

### 桌面端环境

### 设置流程

1. 驱动iOS平台需要macOS的桌面端，并确保安装最新版本XCode。
1. 打开XCode，使用数据线连接手机，获取手机的UDID
1. iPhone手机上设置了如下
  * 设置 -> 开发者 Enable UI Automation (需连接到手机，并且在XCode中登录开发者账号之后出现本设置)
  * 设置 -> Safari -> 高级 Web Inspector
  * （可选）对于iOS 15及以上系统，建议禁止输入框的扫描文本功能，以避免输入文本时可能导致的漏输现象，设置方式：设置 -> 语言与地区 -> 关闭实况文本
  * （可选）对于iOS 16及以上系统，需要激活开发者模式，设置方式：设置 -> 隐私和安全性 -> 开发者模式
1. 进入SWATHub机器人自带的`Appium`安装目录，在XCode中配置`appium-webdriveragent`，打开target的所有tab，在 「Signing & Capabilities」中将 Team 都改成 Apple 开发者账号
```bash
cd $HOME/Library/Application Support/swathub-robot/engine/<version>/node_modules/appium-xcuitest-driver/node_modules/appium-webdriveragent/
open ./WebDriverAgent.xcodeproj
```
1.（可选）如果只有 Apple 普通账号<sup>1</sup>，那么还需要修改「WebDriverAgentLib」「WebDriverAgentRunner」和「IntegrationApp」的 Bundle ID，将缺省的 com.facebook 替换成任意其他前缀，如 com.swathub。
1. 在上述目录执行以下的命令，使得自动生成provision profile.
```bash
xcodebuild -project WebDriverAgent.xcodeproj -scheme WebDriverAgentRunner -destination 'id=<udid>' -allowProvisioningUpdates test
```

?> 1. 普通账号最多只能支持三台手机。

