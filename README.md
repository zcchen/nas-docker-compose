用docker-compose搭建私人NAS及其附属功能
=================================================
作为一个程序猿，单纯的NAS功能并不能完全满足个人的使用需求，再加上数据备份的需要，
因此使用docker-compose技术栈来搭建NAS，是最佳的选择之一。


网络拓扑
-------------------------------------------------
1. Front-End: 前端接入，用于负载均衡部分。
2. Mid-Layout: 业务逻辑，用于放置相应的业务Dockers
3. Back-End: 后端业务，用于放置相应的业务Dockers


项目基本构成
-------------------------------------------------
docker-compose通过`-f <docker-compose.yml>`的方式，支持由多个`docker-compose.yml`组合的服务。
因此，本项目通过对多个不同领域`docker-compose.yml`的组合，以实现多个模块的扩展支持。

### docker-compose.yml
最基础的`docker-compose.yml`文件，定义了该项目的基准：
+ 基本服务services
+ 网络配置networks
+ 基本数据目录volumes，尤其是针对基本服务所需的volumes
+ 基本服务所需的secrets

### docker-compose.test.yml
用于测试`docker-compose.yml`中定义的基本服务services，尤其是相关的后台基础服务：
+ MySQL Service
+ Others

### `<service-name>/`
相关服务的设定目录。

+ `<service-name>/docker-compose.yml`
  - 相关服务的`docker-compose.yml`设定。
  - 如果该服务器是基础服务，则不存在。

+ `<service-name>/config/`
  - 相关服务的配置设定

+ `<service-name>/secrets/`
  - 相关服务的密码设定

+ 其他目录，待定

### data/
本项目中的`data/`目录，只用于项目演示，在使用过程中，建议更改为更合适的项目目录。


服务集成
-------------------------------------------------
本项目，预计集成如下服务：

1. Nginx反向代理入口，
  - 配置于`/docker-compose.yml`
  - 网络: Front-End
  - 数据持久层: 无
  - Ref: 
2. MySQL数据库
  - 配置于`/docker-compose.yml`
  - 网络: Back-End
  - 数据持久层: data/mysql
  - Ref: 

