
## build

docker build -t tutum/mysql share/mysql/

## run

docker run -d -p 3306:3306 -e MYSQL_PASS="sample" -e MYSQL_USER="sample" tutum/mysql

## 使い方

※未完成

coreOSのホームディレクトリにmysqlフォルダを作成し、データをそこに入れる

しかし、
core@core-01 ~ $ docker logs 5b6
=> Using an existing volume of MySQL
140812 16:45:15 mysqld_safe Can't log to error log and syslog at the same time.  Remove all --log-error configuration options for --syslog to take effect.
140812 16:45:15 mysqld_safe Logging to '/var/log/mysql/error.log'.
140812 16:45:15 mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql

こんな感じのエラーが出てくる。。。
ログ吐く設定を弄りたいけど色々やっても上手く行かない。。。

### TODO

・dump取る
・dumpを流し込む
・上記のエラーを解決する。
