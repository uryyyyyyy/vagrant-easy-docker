
## build

## run
docker run -d -p 3306:3306 -v /home/core/tmp:/data -e USER="prm" -e PASS="prm" paintedfox/mariadb


## log

docker logs {container ID}
