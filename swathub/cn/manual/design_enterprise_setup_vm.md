企业版部署(VM)
===

对于希望在私有云或内网环境中构建SWATHub服务的用户，我们提供SWATHub企业版，同时提供更多的企业功能。企业版可以选择易用的虚拟机方式或Docker方式进行导入和部署。

安装
---

### 系统要求

|         | 设备要求
| ------- | -----------
| CPU     | 2.2 GHz (Single Core) 或以上
| Memory  | 8GB（最小需求) 16GB (推荐)
| OS      | Windows/OS X/Linux
| 软件    | VirtualBox/VMWare<sup>1</sup> <sup>2</sup>

?> 1. 我们建议采用[Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)或者[VMware](https://www.vmware.com/)套件来托管SWATHub企业版。其他能够加载`ovf`镜像文件的虚拟机环境也能够使用。

?> 2. VMware ESXi需要100G的数据存储。

### 安装步骤

#### 使用VirtualBox 4安装

1. 在主机上安装VirtualBox<sup>1</sup>。
1. 解压缩下载的VM版本安装包，并将其移动到合适目录，其中包含`SWATHub.ovf`等镜像文件和`swathub`配置目录。
1. 启动VirtualBox，通过**VirtualBox File -> Import Appliance**导入`SWATHub.ovf`。
1. 导入完成后，在VirtualBox管理器中选择SWATHub的VM，然后完成初始配置。
  * 通过**Settings -> Network -> Advanced**中的**VM端口转发**修改主机（Host）的`http`和`ssh`IP和端口为实际的IP和端口，子系统（Guest）的IP和端口保持不变。
  * 通过**Settings -> Shared Folders**将`swathub`配置目录映射到主机的共享文件夹。
  * 根据需要，通过**Settings -> System**更改VM的其他属性，比如内存量等。
1. 编辑`/swathub/settings/settings.properties`文件，更改默认域和时区。<sup>2</sup>
1. 完成上述配置后重新启动VM。

?> 1. 安装过程基于VirtualBox 4，使用其更高版本或VMware Workstation时可以参考。

?> 2. 如果域名和时区中包含`/`，需要改成`\\/`，进行转义。例如`Asia\\/Tokyo`。

#### 使用vSphere安装

1. 打开vSphere客户端。
1. 解压缩下载的VM版本安装包，并将其移动到合适目录，其中包含`SWATHub.ovf`等镜像文件和`swathub`配置目录。
1. 启动vSphere客户端，通过**File -> Deploy OVF Template**导入`SWATHub-esxi.ovf`。
1. 导入完成后，在vSphere客户端中选择SWATHub的VM，然后完成初始配置。
  * 根据需要，更改VM的其他属性，比如内存量等。
  * 默认情况下，vSphere将通过DHCP为VM分配一个IP地址。如果不允许DHCP，请参阅[Ubuntu Guide](http://www.howtogeek.com/howto/ubuntu/change-ubuntu-server-from-dhcp-to-a-static-ip-address/)来设置静态IP地址。
1. 启动VM并且登陆控制台<sup>1</sup>。
1. 使用[WinSCP](https://winscp.net)或`scp`命令上传`swathub`配置目录中`/swathub/settings/settings.properties`的，到VM上的`/swathub/settings`文件夹
1. 在VM控制台内编辑`/swathub/settings/settings.properties`以更改默认域和时区，请注意端口应为`80`。
1. 完成上述配置后重新启动 VM。

?> 1. 使用用户密码`swathub`/`swathub`登录SWATHub VM的控制台。

#### 服务启动

SWATHub企业版的服务会在VM启动时自动启动。

1. 在VirtualBox管理器中或vSphere客户端中，选择VM并单击"开始"。
1. 一旦SWATHub服务完全启动，登录将页面正常显示。

#### 完成安装

1. 请按照[订阅更新](design_enterprise_management#订阅更新)的步骤来激活SWATHub企业版。
1. 更改初始管理员密码。
1. 请按照[版本升级](#版本升级)步骤更新到最新的SWATHub版本。

#### 服务关闭

SWATHub企业版的服务在VM关闭时自动关闭。

1. 在VirtualBox管理器或vSphere客户端中，选择VM，右键单击它，然后选择**Close -> ACPI Shutdown**，或者**Power -> Shutdown**。
1. VM将关闭SWATHub服务并停止自身。

版本升级
---

1. 对SWATHub进行[备份](#备份和恢复)。
1. 下载升级包并将其解压缩至`/swathub`配置目录。
  * 在VirtualBox/VMware工作站上，只需将解压缩至`/swathub`共享文件夹中，解压后确认生成`update`目录。
  * 在VMware vSphere上部署中，使用[WinSCP](https://winscp.net)或`scp`命令上传后解压缩至VM的`/swathub`，解压后确认生成`update`目录。
1. 重启虚拟机，SWATHub将进行自动升级。
1. 升级完成后，服务启动，请访问登录页面验证版本号。同时检查`/swathub/logs/update/update.log`确认升级过程中没有发生错误。

备份和恢复
---

### 系统备份和恢复

SWATHub企业版(VM)的用户可以使用虚拟机的镜像快照功能来高效地备份或恢复系统。

### 日常数据备份和恢复

SWATHub企业版可以可以通过登录SWATHub VM的控制台<sup>1</sup>，利用`cron job`定期备份数据库<sup>2</sup>。

?> 1. 使用用户密码`swathub`/`swathub`登录SWATHub VM的控制台。

?> 2. 日常数据备份和恢复要求在使用中的SWATHub版本不发生改变。

#### 手动数据备份

1. 登录SWATHub VM，并检查目录`/home/swathub/docker/backup`是否存在。如果没有，请创建目录`/backup`：
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

#### 手动数据恢复

1. 登录SWATHub VM。
2. 运行以下脚本以恢复系统数据和数据库转储。例如，下面的命令将使SWATHub恢复为`2016/06/18 00:00:00`的状态。
```batch
sudo /home/swathub/docker/backup/restore.sh 20160618000000
```