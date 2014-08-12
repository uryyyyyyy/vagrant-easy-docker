httpアクセス用のdocker設定ファイルです。

まずVagrantでcoreOSを立ち上げ、
CoreOS上でこのdockerファイルをビルドしタグ付け。
タグに対してrunをかませば動きます。


## Vagrant

git clone https://github.com/coreos/coreos-vagrant

※必須要件
VirtualBox 4.3.10 or greater.
Vagrant 1.6 or greater.

user-data, config.rbの.sampleを外す。

config.vm.synced_folder ".", のコメントアウトを外すと、フォルダの共有ができる

config.vm.network :forwarded_port, guest: 80, host: 8080 でport設定

vagrant up

vagrant ssh

## coreOS

 docker build -t hoge share/docker-2/

-t でタグを指定する。今ならhoge

docker run -i -t -p 80:80 hoge

portを開けておいて、hogeを実行する。

-dをつけるとrun中に他の作業ができる。

## アクセスの流れ

ホストOS（自分のローカルマシン） 8080に繋ぎに行く

ゲストOS（vagrantで立ち上げたcoreOS） 8080を80で受ける

dockerコンテナ（今回はcentOS） 80で受けてhttpレスポンスを返す。


## コンテナ起動中に他の処理をする

docker run に -d オプションを付ける。

docker logs {container ID}

docker stop {container ID}
