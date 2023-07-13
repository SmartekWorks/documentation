エンタープライズ版導入(VM)
===

オンプレミスやプライベートクラウドでSWATHubサービスを構築したいエンタープライズ顧客向けに、エンタープライズ機能を含むSWATHubエンタープライズ版を提供しています。VM (仮想マシン) のイメージとして簡単にインポートおよびデプロイできるほかに、Dockerパッケージとして導入することも可能です。

インストール
---

### 動作環境

|         | 環境
| ------- | -----------
| CPU     | 2.2 GHz (Single Core) 以上
| Memory  | 8GB (最小) 16GB (推奨)
| OS      | Windows/OS X/Linux
| ソフト| VirtualBox/VMWare<sup>1</sup> <sup>2</sup>


?> 1. SWATHubエンタープライズ版のホストには、[Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)または[VMware](https://www.vmware.com/) パッケージの使用をお勧めします。`ovf`イメージファイルをロードできる他の仮想マシン環境も使用できます。

?> 2. ESXiの場合datastoreを100G以上に定義することが必要。

### インストール手順

#### VirtualBox 4の場合

1. ホストサーバーにVirtualBox<sup>1</sup>をインストールします。
2. ダウンロードしたパッケージを解凍し、VirtualBox **File > Import Appliance**で``SWATHub.ovf``をインポートします。
  * 設定後にVMの場所を変えるのが難しいため、次のダイアログでVMの場所を再確認してください。
3. インポートが完了したら、VirtualBox ManagerでVMのSWATHubを選択し、初期設定を完了します。
  * (**必須**) **Settings > Network > Advanced**で、実際のIPとポートに従ってVMポートの転送を設定します。
  * (**必須**) VMの`swathub`フォルダを、**Settings > Shared**を介してホストフォルダにマップします。
  * (省略可) **Settings > System**でVM仕様を変更します。 (上記のシステム要求を参照してください。)
4. `/swathub/settings/settings.properties`を編集して、デフォルトのIP、ポートとタイムゾーンを変更します。<sup>2</sup>
5. 上記の設定が完了したら、VMを再起動します。

?> 1. VirtualBox 4をベースに手順を記述しましたが、同様にVMware Workstationでも参照することができます。

?> 2. 設定の文字列に`/`を含む場合に、代わりに`\\/`を利用する必要があります。

#### vSphereの場合

1. vSphere Clientを開きます。
2. ダウンロードしたパッケージを解凍し、**File > Deploy OVF Template**で`SWATHub-esxi.ovf`をインポートします。
3. インポートが完了したら、vSphere ClientでVMのSWATHubを選択し、初期設定を完了します。
  * (省略可) CPUやメモリなどのVM仕様を変更します。 (上記のシステム要求を参照してください。)
  * (省略可) デフォルトでVMにはDHCP経由でIPアドレスが割り当てられます。DHCPが許可されていない場合は、[Ubuntu Guide](http://www.howtogeek.com/howto/ubuntu/change-ubuntu-server-from-dhcp-to-a-static-ip-address/)を参照してください。静的IPを割り当てます。
4. VMを起動してコンソールにログインします<sup>1</sup>。
5. `/swathub/settings/settings.properties`を編集して、デフォルトのドメインとタイムゾーンを変更します。ポートは`80`である必要があります。これがVMコンソール内で直接実行される場合、次のステップは無視されます。
6. それ以外の場合は、クライアント上で変更してから、SCPを使用してsettings.propertiesをVM上の`/swathub/settings`フォルダにアップロードします (Windowsでは[WinSCP](https://winscp.net)が推奨され、Linux/Macでは直接`scp`コマンドを使用できます) 。
7. 上記の設定が完了したら、VMを再起動します。

?> 1. SWATHub VMにログインするには、認証情報 `swathub`/`swathub`を使用してください。

#### サービス起動
SWATHubエンタープライズサービスは、VMの起動時に自動的に開始されます。

1. VirtualBoxマネージャーもしくはvSphere Clientで、VMを選択して**Start**をクリックします。
2. ログインページが正常に表示されると、SWATHubサービスは完全に開始されます。

#### インストール後作業
1. SWATHubエンタープライズ版を有効にするために、[サブスクリプション更新](design_enterprise_management#サブスクリプション更新)を実施してください。
1. システム管理者の初期パスワードを変更してください。
1. SWATHub最新版にするために、[アップグレード](#アップグレード)を実施してください。

#### サービス停止
SWATHubエンタープライズサービスは、VMで自動的にシャットダウンされます。

1. VirtualBoxマネージャーもしくはvSphere Clientで、VMを選択し、右クリックしてから**Power > Shutdown**を選択します。
2. VMはSWATHubサービスを停止し、VM自身を停止します。

アップグレード
---

1. 必要なバックアップを作成するために、VMのスナップショットを作成します。
1. アップグレードパッケージをダウンロードし、`/swathub`フォルダに解凍します。
  * VirtualBox/VMware Workstationでは、共有フォルダに配置して解凍するだけで、`update`フォルダが表示されます。
  * VMware vSphereでは、[WinSCP](https://winscp.net)もしくは`scp`コマンドでVMの`/swathub`にアップロードして、解凍します。
1. SWATHub VMを再起動すると、自動的にアップグレードされます。
1. アップグレードが完了し、サービスが起動したら、ログインページにアクセスしてバージョン番号を確認してください。(アップグレードプロセスを確認するには `/swathub/logs/update/update.log`もチェックしてください)

バックアップと復旧
---

### システムバックアップと復旧

SWATHubエンタープライズのVM版は、VMソフトウェアのスナップショット機能を活用してシステムのバックアップと復元を行います。

### 日常データバックアップ運用

SWATHubエンタープライズのVM版は、VMソフトウェア経由でVMにログイン<sup>1</sup>し、日常の利用にSWATHubのデータを定期的にバックアップすることができます<sup>2</sup>。これはシェルスクリプトによって手動で復旧できます。

?> 1. SWATHub VMにログインするには、認証情報 `swathub`/`swathub`を使用してください。

?> 2. データバックアップの運用中にSWATHubのバージョンが変更されないことを想定しています。

#### 手動バックアップ
1. SWATHubサーバーにログインし、フォルダ`/home/swathub/docker/backup`が存在するかどうかを確認します。存在しない場合は`/backup`フォルダを作成します。
```batch
sudo mkdir /backup
```
1. 下記のスクリプト<sup>1</sup>を実行して、システムデータとデータベースダンプを`/backup/20160618000000` (現在のタイムスタンプ) のようなフォルダにバックアップします。**3日前**のすべてのバックアップが削除されます。
```batch
sudo /home/swathub/docker/backup/backup.sh
```

?> 1. `backup.sh`スクリプトを編集して独自のバックアップ要件を満たしてください。

#### 自動バックアップ
1. 手動のデータバックアップが正常に動作していることを確認してから、システムのクローンタブファイルを開きます。
```batch
sudo crontab -e
```
2. 次の行をファイルの最後に追加します。
`0 0 * * * /home/swathub/docker/backup/backup.sh`
3. 新しいクローンタブ設定を適用するエディタを保存して終了します。
4. 毎日`00:00`にクローンジョブが呼び出され、データのバックアップがトリガーされます。

#### データ復旧
1. SWATHubサーバーのVMにログインし、フォルダ`/home/swathub/docker/backup`が存在するかどうかを確認します。
2. スクリプトを実行して、システムデータとデータベースダンプを復旧します。たとえば、以下のコマンドはSWATHubを`2016/06/18 00:00:00`のステータスに戻します。
```batch
sudo /home/swathub/docker/backup/restore.sh 20160618000000
```