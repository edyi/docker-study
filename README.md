# docker-study

### Docker fileのある場所でビルドする
- docker build -t server:001 .

### できたイメージからdocker-compose.yamlから起動できる
- CMD ["/sbin/init"] を書いておかないと、exit 0で起動できないので注意。
- そのときは、一度docker run ～ /sbin/init で起動してからcommitすればよい。

### imageから起動する
- docker run --hostname="master" --privileged -d -it -p 8080:80 -p 2222:22 --name master server:001 /sbin/init

### いろいろいじったあとはimageを保存する
- docker stop master    
- docker commit master master:002    
- docker rm master    

### 複数イメージができたらそれぞれを起動する docker-composeを書いて起動する
- docker-compose up -d

### docker-composeをちゃんと書けばコンテナも起動後は名前で起動する
```
PS C:\Users\edyi\dev\docker-study> docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                                        NAMES
5b9c989cff0d        client:0.005        "/sbin/init"        10 minutes ago      Up 10 minutes       0.0.0.0:2223->22/tcp, 0.0.0.0:8081->80/tcp   client
94aa28c6fa98        server:0.005        "/sbin/init"        10 minutes ago      Up 10 minutes       0.0.0.0:2222->22/tcp, 0.0.0.0:8080->80/tcp   server
PS C:\Users\edyi\dev\docker-study>
PS C:\Users\edyi\dev\docker-study>
PS C:\Users\edyi\dev\docker-study> docker exec -it master /bin/bash
Error: No such container: master
PS C:\Users\edyi\dev\docker-study>
PS C:\Users\edyi\dev\docker-study> docker exec -it server /bin/bash
[root@server /]#
[root@server /]# ssh client
Warning: Permanently added 'client,172.18.0.3' (ECDSA) to the list of known hosts.
Last login: Thu Jan 10 00:53:51 2019 from server.docker-study_default
[root@client ~]#
[root@client ~]#
```

# sshノンパス設定
- master <-> client は鍵でノンパス設定してある
- ~/.ssh/config設定も両方いじってある
```
[root@server /]# cat ~/.ssh/config
Host client
   StrictHostKeyChecking no
   UserKnownHostsFile=/dev/null
```
```
[root@client ~]# cat ~/.ssh/config
Host server
   StrictHostKeyChecking no
   UserKnownHostsFile=/dev/null
```
