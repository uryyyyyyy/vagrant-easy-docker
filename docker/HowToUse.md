
まずVagrantでcoreOSを立ち上げ、
CoreOS上でこのdockerファイルをビルドしタグ付け。
タグに対してrunすれば動きます。

## Vagrant

git clone https://github.com/coreos/coreos-vagrantで取ってきたもの。

ホストOSがUbuntuだったらわざわざ仮想マシン使わなくてもいいんですが、
IP・portや共有フォルダの設定、ホストOS間の差異を統一したかったので、
これで用意しました。

### 必須要件
VirtualBox 4.3.10 or greater.
Vagrant 1.6 or greater.

### 詳細な制御

user-data, config.rbの.sampleを外してrootDirに置けばいいらしい。

## coreOS

Docker専用のOS。

今回は192.168.33.33で立ち上げている。

## コンテナ作成・アクセスの流れ

（centos-httpdを例に取ります。）

### coreOS立ち上げ

vagrant up

→VagrantfileにしたがってゲストOS（coreOS）を立ち上げます。

ここではprivateIPを192.168.33.33にしています。

また、{rootDir}/docker以下をcoreOSの/home/core/shareにマウントしています。

この際に、NFSデーモンか何かを入れるように言われるかもしれません。

### build

docker build -t centos/httpd share/centos-httpd/

→centos/httpdという名前でタグ付けされたイメージを作成します。
AWSで言うAMIみたいなものです。

### run

docker run -d -i -t -p 80:80 -v /home/core/share/centos-httpd/html:/var/www/html/ centos/httpd

→centos/httpdイメージ立ち上げて、ホストOS（coreOS）の80番portをイメージの80につなぎます。
また、centos-httpd/html以下をマウントします。

実行した際にコンテナが作成され、コンテナIDが付与されます。
ログ表示や停止などの制御はこのコンテナIDに対して行います。

### アクセスの流れ

ホストOS（自分のローカルマシン）から192.168.33.33のゲストOS（coreOS）へ繋ぎに行く。

ゲストOS（coreOS） が80でアクセスを受ける

dockerコンテナ（centos/httpdをrunしたもの）が80で受けてhttpレスポンスを返す。


## コンテナ起動中に他の処理をする

docker run に -d オプションを付ける。

docker ps

docker logs {container ID}

docker stop {container ID}
