
## build

docker build -t hoge share/centos-httpd/

## run

docker run -d -i -t -p 80:80 -v /home/core/share/centos-httpd/html:/var/www/html/ centos/httpd

## memo

{root}/centos-httpd/html以下にアクセスできるようになる。
