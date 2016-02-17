## Simple usage

```
docker run -d -v /path/to/my.cnf:/etc/mysql/my.cnf:ro -p 3306:3306 -p 4444:4444 -p 4567:4567 -p 4568:4568 lukaszburylo/galera-mariadb
```
