# docker-study

# Docker fileのある場所でビルドする
docker build -t server:0.001 .

# imageから起動する
docker run --hostname="master" --privileged -d -it -p 8080:80 -p 2222:22 --name master master:0.001 /sbin/init

# いろいろいじったあとはimageを保存する
docker stop master
docker commit master master:0.002
docker rm master

# 複数イメージができたらそれぞれを起動する docker-composeを書いて起動する
docker-compose up -d

