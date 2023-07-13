エンタープライズ版導入(Docker)
===

オンプレミスやプライベートクラウドでSWATHubサービスを構築したいエンタープライズ顧客向けに、エンタープライズ機能を含むSWATHubエンタープライズ版を提供しています。VM (仮想マシン) のイメージとして簡単にインポートおよびデプロイできるほかに、Dockerパッケージとして導入することも可能です。

インストール
---

### 動作環境

|         | 環境
| ------- | -----------
| CPU     | 2.2 GHz (Single Core) 以上
| Memory  | 4GB (最小) 8GB (推奨)
| OS      | Linux<sup>1</sup>
| ソフト| Docker環境

?> 1. Linux以外のDocker環境を現在対応しておりません。

### インストール手順

#### 準備作業
1. ホームディレクトリを `/home/swathub`としてユーザー`swathub`を作成します。
1. Docker Groupに`swathub`を追加してください。 (詳細について、[公式サイト](https://docs.docker.com/engine/installation/linux/linux-postinstall/)を参照してください。)
1. `swathub`としてログインし、**swathub.zip**をアップロードします。
1. **swathub.zip**を解凍します。
1. `docker`フォルダを`/home/swathub`にコピーします。
1. シェルスクリプトを実行可能に変更します。
```batch
chmod +x /home/swathub/docker/*.sh
```
1. フォルダーを作成します。
```batch
sudo mkdir /swathub
```
1. `settings`フォルダを`/swathub`にコピーします。
1. `logs`フォルダを`/swathub`にコピーします。
1. `/swathub/settings/settings.properties`を編集して、デフォルトのIP、ポートとタイムゾーンを変更してください。<sup>2</sup>

?> 1. Docker環境を事前に構築する必要があります。(詳細について、[公式サイト](https://docs.docker.com/engine/installation/linux/docker-ce/centos/)を参照してください。)

?> 2. 設定の文字列に`/`を含む場合に、代わりに`\\/`を利用する必要があります。

#### Postgreセットアップ
1. `~/docker/image`から下記のコマンドを実行して、Postgreを起動させます。
```batch
 docker load -i postgres.tar
 docker run --name postgres-server -e POSTGRES_PASSWORD=rootpass -v /home/swathub/docker/scripts:/scripts -v /home/swathub/docker/postgresql:/var/lib/postgresql/data -d postgres
```
1. Postgreへ接続します。
```batch
docker exec -it postgres-server psql -U postgres
```
1. ユーザー`swathub`を作成します。
```batch
CREATE USER swathub WITH PASSWORD '4LDoT9KedPXComYF';
```
1. データベースの作成します。
```batch
CREATE DATABASE swathub OWNER swathub;
```
1. Postgredoを終了します。
```batch
\q
```

#### SWATHubサービスのセットアップ
1. `~/docker/image`から下記のコマンドを実行して、SWATHubのDockerイメージをロードします。
```batch
 docker load -i ubuntu.tar
 docker load -i swathub.tar
```
1. インストール設定を準備します。
```batch
 cd ~/docker
 sudo ./settings.sh
```
1. SWATHubサーバーを起動させます。
```batch
 docker run --name web_server -v /swathub/logs/swathub:/opt/tomcat/logs -v /home/swathub/docker/data:/opt/tomcat/data -v /home/swathub/docker/config_local:/opt/tomcat/config --link postgres-server:postgres-server -d swathub/webserver
```
1. サーバー起動完了後、Postgreに接続します。
```batch
 docker exec -it postgres-server psql -U postgres
```
1. データベース接続します。
```batch
 \c swathub
```
1. 初期データのインポートします。
```sql
 INSERT INTO swathub_user (id, version, about, api_key, avatar, date_created, email, enabletfa, fullname, github, is_enabled, is_verified, language, last_updated, password, reset_pass_key, secret_key, subscription, subscriptionid, timezone, tutorial, username, type) VALUES (0, 0, NULL, 'E9680B42A5754715BAC', NULL, now(), 'support@swathub.com', false, 'Admin', NULL, true, true, 'en', now(), 'xERYI52KWedvb1MCZP9noVCD+zE=', NULL, 'PYP4S7ZGKB6TCARC', '', '', 'Asia/Tokyo', NULL, 'admin', 0);
 INSERT INTO workspace (id, version, date_created, description, is_deleted, is_public, last_updated, max_result, name, owner_id, type) VALUES (1, 0, now(), 'For cloud execution node', false, false, now(), 3, 'cloud', 0, 0);
 INSERT INTO membership (id, version, date_created, email, last_accessed, last_updated, role, status, user_id, workspace_id) VALUES (1, 0, now(), '', null, now(), 'owner', 'joined', 0, 1);
```
1. Postgreqを終了します。
```batch
 \q
```
1. SWATHubサーバーを再起動します。
```batch
 docker restart web_server
```
1. `~/docker/image`から下記のコマンドを実行して、Nginxサーバーを起動させます。
```batch
 docker load -i nginx.tar
 docker run --name nginx -d -p 80:80 -v /home/swathub/docker/docs:/www/docs -v /home/swathub/docker/data:/www/data -v /home/swathub/docker/downloads:/www/downloads -v /home/swathub/docker/nginx_local:/etc/nginx/conf.d:ro --link web_server:web nginx
```

#### サービス起動
1. `sudo`権限を持つユーザーでサーバーにログインします。
2. 下記のスクリプト<sup>1</sup>を実行して、SWATHubサービスは開始されます。
```batch
/home/swathub/docker/startup.sh
```

?> 1. `boot-postgre.sh`を使ってSWATHubサービスを自動開始として設定することを推奨します。

#### インストール後作業
1. SWATHubエンタープライズ版を有効にするために、[サブスクリプション更新](design_enterprise_management#サブスクリプション更新)を実施してください。
1. システム管理者の初期パスワードを変更してください。
1. SWATHub最新版にするために、[アップグレード](#アップグレード)を実施してください。

#### サービス終了
1. `sudo`権限を持つユーザーでサーバーにログインします。
2. 下記のコマンドラインを実行して、SWATHubサービスは停止されます。
```batch
/home/swathub/docker/shutdown.sh
```

アップグレード
---

1. [バックアップ](#バックアップと復旧)を実施します。
1. 下記のコマンドでアップグレードパッケージをダウンロードして`/swathub`に解凍するか、SCPを使用してアップグレードパッケージをサーバ上の`/swathub`フォルダにアップロードします (Windowsでは[WinSCP](https://winscp.net)が推奨され、Linux/Macでは直接`scp`コマンドを使用できます) 。
```batch
wget http://www.smartekworks.com/swathub/v1.x.x/update/update-1.x.x.zip
unzip update-1.x.x.zip
su - admin
sudo mv /home/swathub/update /swathub/
```
1. SWATHubサービスが自動開始を設定した場合、サーバーを再起動して、自動的にアップグレードされます。
```batch
su - admin
sudo reboot
```
1. SWATHubサービスが自動開始が設定されていないもしくはサーバーが再起動できない場合、代わりに下記のコマンドを実施ます。
```batch
docker stop nginx
docker stop web_server
docker stop postgres-server
su - admin
cd /swathub
sudo ./boot-postgre.sh
```
1. サービスが起動したら、`/swathub/update`は自動的に削除され、ログインページにアクセスしてバージョン番号を確認してください。(問題がある場合に `/swathub/logs/update/update.log`もチェックしてください。)

バックアップと復旧
---

### 関連対象

SWATHub環境にバックアップ対象となるファイルやフォルダーは下記になります。それぞれ異なるシーンに実施する必要があります。

#### SWATHubサーバー

* SWATHubバージョンアップの前に実施することを推奨します。
* バックアップと復旧の手順について、[SWATHubサーバーのバックアップ](#SWATHubサーバーのバックアップ)と[SWATHubサーバーの復旧](#SWATHubサーバーの復旧)を参照してください。

#### SWATHubロボット

* SWATHubバージョンアップの前に実施することを推奨します。
* ロボットのインストールフォルダーと`%appdata%\SWATHubRobot`をコピーでバックアップと復旧します。

#### JenkinsプラグインとJenkins Job

* Jenkinsプラグインのバージョンアップの前に実施することを推奨します。
* 旧プラグインファイルのコピーとJenkinsのJobエクポート、インポート機能を利用して、バックアップと復旧します。

#### API呼び出しスクリプト

* SWATHub APIの変更のあるバージョンアップの前に実施することを推奨します。
* スクリプトファイルのコピーでバックアップと復旧します。

### SWATHubサーバーのバックアップ

1. SWATHubは起動中かつ未使用状態でバックアップを実施ます。
1. `bak`フォルダーを作成します。
```
su - swathub
cd /home/swathub
mkdir bak
```
1. `bak`フォルダーにSWATHubのデータとアプリをエクスポートします。
```
docker exec postgres-server sh -c 'exec pg_dump -U postgres -Fc swathub > /scripts/db.dump'
mv /home/swathub/docker/scripts/db.dump /home/swathub/bak
docker save -o /home/swathub/bak/swathub-1.x.x.tar swathub/webserver
```
1. `bak`フォルダーに`db.dump`と`swathub-1.x.x.tar`が存在することを確認します。
1. SWATHub設定ファイルを`bak`フォルダにコピーします。
```batch
cp /home/swathub/docker/config/SwatConfig.groovy /home/swathub/bak
cp /home/swathub/docker/config_local/SwatConfig.groovy /home/swathub/bak
```

### SWATHubサーバーの復旧

1. SWATHubは起動中かつ未使用状態で復旧を実施ます。
1. 下記のコマンドで旧バージョンのアップグレードパッケージをダウンロードして`/swathub`に解凍するか、SCPを使用してアップグレードパッケージをサーバ上の`/swathub`フォルダにアップロードします (Windowsでは[WinSCP](https://winscp.net)が推奨され、Linux/Macでは直接`scp`コマンドを使用できます) 。
```batch
wget http://www.smartekworks.com/swathub/v1.x.x/update/update-1.x.x.zip
unzip update-1.x.x.zip
rm -rf update/image/
su - admin
sudo mv /home/swathub/update /swathub/
```
1. `nginx`とSWATHubサービスを終了させます。
```batch
docker stop nginx
docker stop web_server
```
1. データベースをクリアします。
```batch
docker exec -it postgres-server psql -U postgres
DROP DATABASE swathub;
CREATE DATABASE swathub OWNER swathub;
\q
```
1. アプリを復旧します。
```batch
docker tag swathub/webserver:1.4.3 swathub/webserver:latest
```
1. SWATHubサービスが自動開始を設定した場合、サーバーを再起動して、自動的にアップグレードされます。
```batch
su - admin
sudo reboot
```
1. SWATHubサービスが自動開始が設定されていないもしくはサーバーが再起動できない場合、代わりに下記のコマンドを実施ます。
```batch
docker stop nginx
docker stop web_server
docker stop postgres-server
su - admin
cd /swathub
sudo ./boot-postgre.sh
```
1. サービスが起動したら、`/swathub/update`は自動的に削除され、ログインページにアクセスしてバージョン番号を確認してください。(問題がある場合に `/swathub/logs/update/update.log`もチェックしてください。)
1. データを復旧します。
```batch
cp /home/swathub/bak/db.dump /home/swathub/docker/scripts/
docker exec postgres-server sh -c 'exec pg_restore -U postgres -n public -c -1 -d swathub /scripts/db.dump'
```
1. SWATHubサービスを再起動します。
```batch
docker restart web_server
docker restart nginx
```

### 日常データバックアップ運用

SWATHubエンタープライズ版は、日常の利用にSWATHubのデータを定期的にバックアップすることができます<sup>1</sup>。これはシェルスクリプトによって手動で復旧できます。

?> 1. データバックアップの運用中にSWATHubのバージョンが変更されないことを想定しています。

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
1. SWATHubサーバーにログインし、フォルダ`/home/swathub/docker/backup`が存在するかどうかを確認します。
2. スクリプトを実行して、システムデータとデータベースダンプを復旧します。たとえば、以下のコマンドはSWATHubを`2016/06/18 00:00:00`のステータスに戻します。
```batch
sudo /home/swathub/docker/backup/restore.sh 20160618000000
```