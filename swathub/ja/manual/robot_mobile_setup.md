モバイル環境設定
===

概要
---

ロボットをモバイルデバイスで利用する場合、オープンソースのテスト自動化フレームワークである[Appium](http://appium.io)を介して、モバイルエミュレータと実機の両方でモバイルWebアプリケーションとネイティブAPPを実行させることができます。

ロボットのセットアップが完了した後に、モバイルの実行環境を構築する必要があります。

### サポート範囲

|   OS    |バージョン
| ------- | -----------
| iOS     | iOS 9.3以上<sup>1</sup>
| Android | Android 5以上

?> 1. iOSのXCTest UIフレームワークの制限により、WebViewを含むモバイルアプリをサポートするにはiOS 11以降が必要です。

### モバイルデバイスの挙動設定

ステップオプションの`browserCapabilities`を利用して、モバイルデバイスの
挙動を変更することが可能です。そのうちiOSとAndroid両方に有効する項目もありますし、どっちかに有効するものもあります。また実機とエミュレーター両方に有効する項目もありますし、どっちかに有効するものもあります。利用する際に[Appium Desired Capabilities](http://appium.io/docs/en/writing-running-appium/caps/)を詳しく調べることをお勧めです。

下記の例はスクリーンを縦向き、横向きを制御する設定です。エミュレーターのiOSとAndroidに有効です。

```json
  "capabilities": {
    "orientation": "LANDSCAPE"
  }
```

Androidプラットフォーム
---

### デスクトップ環境

Androidプラットフォームのデスクトップを操作するには、次のサポートソフトウェアをインストールする必要があります。

* [Node.js 12+](https://nodejs.org/)
* [Appium最新版](http://appium.io/docs/en/about-appium/getting-started/)
```batch
npm install -g appium@beta
```
* [Android Studio](https://developer.android.com/studio)
* [JDK8](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html)
* [Chromedriver](http://chromedriver.chromium.org/downloads)<sup>1</sup>

?> 1. スマートフォンのWebViewバージョンまたはChromeバージョンに応じて、対応するバージョンをダウンロードする必要があります。

### セットアップ手順

1. データケーブルを使用してAndroid機器をPCに接続し、開発者向けオプションを有効にしてUSBデバッグを許可します。
1. adbコマンドを使用して、スマートフォンが接続されているかどうかをテストします。
```batch
adb devices
```
1. 環境変数を設定する
   * `ANDROID_HOME`：SDKツールのインストールディレクトリに設定します。
   * `JAVA_HOME`：jdk8インストールディレクトリに設定します。

### APPモデルキャプチャーの設定

SWATHubロボットのAPPモデルキャプチャーでは、次の機能が設定されています。
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
* `app`：apkファイルが置かれているローカルパス。スラッシュに注意してください。
* `chromedriverExecutableDir`：chromedriver.exeのローカルディレクトリ。

APPが正常に起動したら、ツールの更新ボタンをクリックしてスクリーンショットとソースファイルを取得し、ダウンロードボタンをクリックしてローカルファイルとして保存します。

* NATIVE_APP：ネイティブコードを表すsviewファイルとして保存し、APPモデルとしてインポートします
* WebView_1：WebViewのHTMLコードを表すshtmlファイルとして保存し、Webモデルとしてインポートします

### APP拡張プラットフォームの設定

SWATHubロボットの詳細設定は次のとおりです。
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
* `code`：スマートフォンモデル
* `chromedriverExecutableDir`：chromedriver.exeのローカルディレクトリ

iOSプラットフォーム
---

### デスクトップ環境

iOSプラットフォームを駆動するには、MacOSのデスクトップが必要で、以下のサポートソフトウェアをインストールします：

* xCode最新版
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

### セットアップ手順

1. 次の環境変数を設定します
```batch
export ANDROID_HOME=/Users/<username>/Library/Android/sdk
export PATH=/Users/<username>/Library/Android/sdk/platform-tools:$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`   
```
1. XCodeを開き、スマートフォンをデータケーブルで接続し、スマートフォンのUDIDを取得します
1. iPhoneの設定は以下の通りです
   * 設定->開発者がUIオートメーションを有効にする（スマートフォンに接続する必要があり、この設定はXCodeで開発者アカウントにログインすると表示されます）
   * 設定-> Safari-> Advanced Web Inspector
1. [オンラインチュートリアルの完全な手動構成](http://appium.io/docs/en/drivers/ios-xcuitest-real-devices/)を参照してIWDPをコンパイルし、構成が正しいことを確認します。

### APPモデルキャプチャーの設定

SWATHubロボットのAPPモデルキャプチャーでは、次の機能が設定されています。
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

* `udid`：スマートフォンのユニークコードUDID


### APP拡張プラットフォームの設定

SWATHubロボットの詳細設定のプラットフォーム情報は次のとおりです：
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
      "newCommandTimeout": 0,
      "noReset": true
  }
}
```

* `code`：スマートフォンモデル
* `udid`：スマートフォンの一意のコードUDID

