モバイル環境設定
===

概要
---

SWATHubロボットは[Appium](http://appium.io)を通じてエミュレータまたは実機を駆動し、モバイルWebアプリケーションまたはモバイルAppを実行することができます。SWATHubロボットのインストールと設定が完了すると、接続されているすべてのデバイスを自動的に認識します。

### サポート範囲

| OS | サポートバージョン
| ------- | -----------
| iOS | iOS 9.3以上<sup>1</sup>
| Android | Android 5以上

?> 1. iOSのXCTest UIフレームワークの制限により、WebViewを含むモバイルAppをサポートするにはiOS 11以上が必要です。

Androidプラットフォーム
---

### 設定手順

1. AndroidスマートフォンをPCにデータケーブルで接続し、開発者オプションを有効にし、USBデバッグを許可します。
  * 「USBデバッグ」および「USBデバッグ（セキュリティ設定）」を許可します。
  * （オプション）一部の携帯電話モデル、例えばOnePlusのColorOSシステムでは、「権限監視を禁止」を許可する必要があります。
  * （オプション）一部の携帯電話モデル、例えばHuawai Nova5 Pro（HarmonyOS 3.0）では、「充電モードのみでADBデバッグを許可」を無効にする必要があります。

iOSプラットフォーム
---

### デスクトップ環境

### 設定手順

1. iOSプラットフォームを駆動するにはmacOSのデスクトップが必要であり、最新バージョンのXCodeがインストールされていることを確認します。
1. XCodeを開き、データケーブルで携帯電話を接続し、携帯電話のUDIDを取得します。
1. iPhoneの設定は以下の通りです。
  * 設定 -> 開発者 Enable UI Automation (携帯電話を接続し、XCodeで開発者アカウントにログインした後にこの設定が表示されます)
  * 設定 -> Safari -> 高度な Web Inspector
  * （オプション）iOS 15以上のシステムでは、テキスト入力時の欠落を避けるために、テキストスキャン機能を無効にすることを推奨します。設定方法：設定 -> 言語と地域 -> リアルタイムテキストをオフ
  * （オプション）iOS 16以上のシステムでは、開発者モードを有効にする必要があります。設定方法：設定 -> プライバシーとセキュリティ -> 開発者モード
1. SWATHubロボット付属の`Appium`インストールディレクトリに進み、XCodeで`appium-webdriveragent`を設定します。全てのターゲットのタブを開き、「Signing & Capabilities」でTeamを全てApple開発者アカウントに変更します。
```bash
cd $HOME/Library/Application Support/swathub-robot/engine/<version>/node_modules/appium-xcuitest-driver/node_modules/appium-webdriveragent/
open ./WebDriverAgent.xcodeproj
```
1.（オプション）もし一般的なAppleアカウント<sup>1</sup>しか持っていない場合は、「WebDriverAgentLib」、「WebDriverAgentRunner」、「IntegrationApp」のBundle IDを変更する必要があります。デフォルトのcom.facebookを任意の他のプレフィックス、例えばcom.swathubに置き換えます。
1. 上記のディレクトリで以下のコマンドを実行し、自動的にプロビジョニングプロファイルを生成します。
```bash
xcodebuild -project WebDriverAgent.xcodeproj -scheme WebDriverAgentRunner -destination 'id=<udid>' -allowProvisioningUpdates test
```

?> 1. 一般的なアカウントでは、最大3台の携帯電話のみをサポートできます。