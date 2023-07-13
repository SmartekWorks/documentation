企业版部署(Docker)
===

对于希望在私有云或内网环境中构建SWATHub服务的用户，我们提供SWATHub企业版，同时提供更多的企业功能。企业版可以选择易用的虚拟机方式或Docker方式进行导入和部署。

安装
---

### 系统要求

|         | 设备要求
| ------- | -----------
| CPU     | 2.2 GHz (Single Core) 或以上
| Memory  | 8GB（最小需求) 16GB (推荐)
| OS      | Linux<sup>1</sup>
| 软件    | Docker环境

?> 1. 当前暂不支持非Linux上的Docker环境。

### 安装步骤

#### 安装准备
1. 创建用户`swathub`，主目录为`/home/swathub`。
1. 将`swathub`添加到docker组<sup>1</sup>，请参阅 [官方文档](https://docs.docker.com/engine/installation/linux/linux-postinstall/)。
1. 以`swathub`用户登录并上传**swathub.zip**。
1. 解压缩**swathub.zip**。
1. 将`docker`目录复制到`/home/swathub`。
1. 将shell脚本更改为可执行脚本：
```batch
chmod +x /home/swathub/docker/*.sh
```
1. 创建文件夹：
```batch
sudo mkdir /swathub
```
1. 将`settings`目录复制到`/swathub`。
1. 将`logs`目录复制到`/swathub`。
1. 修改`/swathub/settings/settings.properties`以更改默认域和时区。<sup>2</sup>

?> 1. 如果没有Docker环境，则需要事先安装，请参阅[官方文档](https://docs.docker.com/engine/installation/linux/docker-ce/centos/)。

?> 2. 如果域名和时区中包含`/`，需要改成`\\/`，进行转义。例如`Asia\\/Tokyo`。

#### 安装Postgre
1. 在`~/docker/image`下运行以下命令，加载并启动Postgre：
```batch
 docker load -i postgres.tar
 docker run --name postgres-server -e POSTGRES_PASSWORD=rootpass -v /home/swathub/docker/scripts:/scripts -v /home/swathub/docker/postgresql:/var/lib/postgresql/data -d postgres
```
1. 连接Postgre:
```batch
docker exec -it postgres-server psql -U postgres
```
1. 创建用户`swathub`:
```batch
CREATE USER swathub WITH PASSWORD '4LDoT9KedPXComYF';
```
1. 创建数据库：
```batch
CREATE DATABASE swathub OWNER swathub;
```
1. 退出Postgre:
```batch
\q
```

#### 安装SWATHub服务
1. 在`~/docker/image`下运行以下命令，加载SWATHub的Docker镜像：
```batch
 docker load -i ubuntu.tar
 docker load -i swathub.tar
```
1. 进行安装设置：
```batch
 cd ~/docker
 sudo ./settings.sh
```
1. 启动SWATHub服务：
```batch
 docker run --name web_server -v /swathub/logs/swathub:/opt/tomcat/logs -v /home/swathub/docker/data:/opt/tomcat/data -v /home/swathub/docker/config_local:/opt/tomcat/config --link postgres-server:postgres-server -d swathub/webserver
```
1. 等待SWATHub服务启动完成后，连接Postgre：
```batch
 docker exec -it postgres-server psql -U postgres
```
1. 连接数据库：
```batch
 \c swathub
```
1. 导入初始数据：
```sql
 INSERT INTO swathub_user (id, version, about, api_key, avatar, date_created, email, enabletfa, fullname, github, is_enabled, is_verified, language, last_updated, password, reset_pass_key, secret_key, subscription, subscriptionid, timezone, tutorial, username, type) VALUES (0, 0, NULL, 'E9680B42A5754715BAC', NULL, now(), 'support@swathub.com', false, 'Admin', NULL, true, true, 'en', now(), 'xERYI52KWedvb1MCZP9noVCD+zE=', NULL, 'PYP4S7ZGKB6TCARC', '', '', 'Asia/Tokyo', NULL, 'admin', 0);
 INSERT INTO workspace (id, version, date_created, description, is_deleted, is_public, last_updated, max_result, name, owner_id, type) VALUES (1, 0, now(), 'For cloud execution node', false, false, now(), 3, 'cloud', 0, 0);
 INSERT INTO membership (id, version, date_created, email, last_accessed, last_updated, role, status, user_id, workspace_id) VALUES (1, 0, now(), '', null, now(), 'owner', 'joined', 0, 1);
```
1. 退出Postgre:
```batch
 \q
```
1. 重新启动 SWATHub 服务器：
```batch
 docker restart web_server
```
1. 在`~/docker/image`下运行以下命令，加载并运行Nginx服务器：
```batch
 docker load -i nginx.tar
 docker run --name nginx -d -p 80:80 -v /home/swathub/docker/docs:/www/docs -v /home/swathub/docker/data:/www/data -v /home/swathub/docker/downloads:/www/downloads -v /home/swathub/docker/nginx_local:/etc/nginx/conf.d:ro --link web_server:web nginx
```

#### 服务启动

1. 以具有`sudo`权限的用户身份登录服务器。
2. 执行以下脚本<sup>1</sup>以启动SWATHub服务：
```batch
/home/swathub/docker/startup.sh
```

?> 1. 我们建议您使用`boot-postgre.sh`来设置服务自动启动。

#### 完成安装

1. 请按照[订阅更新](design_enterprise_management#订阅更新)的步骤来激活SWATHub企业版。
1. 更改初始管理员密码。
1. 请按照[版本升级](#版本升级)步骤更新到最新的SWATHub版本。

#### 服务关闭

1. 以具有`sudo`权限的用户身份登录服务器。
2. 执行以下脚本以关闭SWATHub服务：
```batch
/home/swathub/docker/shutdown.sh
```

版本升级
---

1. 对SWATHub进行[备份](#备份和恢复)。
1. 下载升级包并将其解压缩至`/swathub`配置目录，或者使用SCP将升级包上传并解压到服务器上的`/swathub`配置目录（Windows中推荐使用[WinSCP](https://winscp.net)，Linux/Mac则推荐使用`scp`命令）。
```batch
wget http://www.smartekworks.com/swathub/v1.x.x/update/update-1.x.x.zip
unzip update-1.x.x.zip
su - admin
sudo mv /home/swathub/update /swathub/
```
1. 已经设置SWATHub服务自启动时重启服务器，SWATHub将进行自动升级。
```batch
su - admin
sudo reboot
```
1. 如果SWATHub服务未设置自启动，或者服务器无法重启时，执行以下命令来重启服务。
```batch
docker stop nginx
docker stop web_server
docker stop postgres-server
su - admin
cd /swathub
sudo ./boot-postgre.sh
```
1. 服务重新启动后，`/swathub/update`会被自动删除，请访问登录页面验证版本号。同时检查`/swathub/logs/update/update.log`确认升级过程中没有发生错误。

备份和恢复
---

### 日常数据备份和恢复

SWATHub企业版可以通过登录服务器使用shell脚本手动备份还原<sup>1</sup>或利用`cron job`定期备份数据库。

?> 1. 日常数据备份和恢复要求在使用中的SWATHub版本不发生改变。

#### 手动数据备份

1. 登录SWATHub VM或服务器，并检查目录`/home/swathub/docker/backup`是否存在。如果没有，请创建目录`/backup`：
```batch
sudo mkdir /backup
```
1. 运行以下脚本<sup>1</sup>将系统数据和数据库转储到目录，如`/backup/20160618000000`（默认值为当前日期）。**3 天前的所有备份将被清除**。
```batch
sudo /home/swathub/docker/backup/backup.sh
```

?> 1. 编辑`backup.sh`脚本，以实现您自己的备份要求。

#### 自动数据备份

1. 确保手动数据备份工作正常，然后打开系统crontab文件：
```batch
sudo crontab -e
```
1. 将以下行追加到文件末尾：
`0 0 * * * /home/swathub/docker/backup/backup.sh`
1. 保存并退出将应用新crontab配置的编辑器。
1. cron job将在每天的 `00:00` 调用以触发数据备份过程。

### 手动数据还原

1. 登录SWATHub VM或服务器<sup>1</sup>。
2. 运行以下脚本以还原系统数据和数据库转储。例如，下面的命令将使SWATHub恢复为`2016/06/18 00:00:00`的状态。
```batch
sudo /home/swathub/docker/backup/restore.sh 20160618000000
```