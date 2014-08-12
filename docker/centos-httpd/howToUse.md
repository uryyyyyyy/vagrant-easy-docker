
## build

core@core-01 ~ $ docker build -t hoge share/centos-httpd/

## run
sudo docker run -i -t -p 80:80 -v /home/core/share/docker/centos-httpd/html:/var/www/html/ hoge


## memo

html以下にアクセスできるようになる。
