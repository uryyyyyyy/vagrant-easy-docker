
## build

docker build -t="paintedfox/mariadb" share/mariadb/ 

## run
docker run -d -p 3306:3306 -v /home/core/mariadb:/data -e USER="sample" -e PASS="sample" paintedfox/mariadb


## 使い方

coreOSのホームディレクトリにmariadbフォルダを作成し、データをそこに入れる

（shareの中身を設定して、ホストOSでdataを管理したかったけど権限周りがダメみたい。
たしかMariaDBの処理はユーザーが違ったような。）
