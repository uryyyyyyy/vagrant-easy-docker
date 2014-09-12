
## build

docker build -t tutum/mariadb-5.5 share/mariadb-5.5/

## run
docker run -d -p 3306:3306 -e MARIADB_PASS="admin" tutum/mariadb-5.5


