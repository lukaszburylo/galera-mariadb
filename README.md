# INFO !
Image works only with Docker >= 1.10.1  !

## Simple usage

```
docker run -d -v /path/to/my.cnf:/etc/mysql/my.cnf:ro -p 3306:3306 -p 4444:4444 -p 4567:4567 -p 4568:4568 lukaszburylo/galera-mariadb
```

## Running with external datadir

```
docker run -d -v /path/to/datadir:/var/lib/mysql -v /path/to/my.cnf:/etc/mysql/my.cnf:ro -p 3306:3306 -p 4444:4444 -p 4567:4567 -p 4568:4568 lukaszburylo/galera-mariadb
```

## First node in cluster should be running like that:
```
docker run -d -v /path/to/my.cnf:/etc/mysql/my.cnf:ro -p 3306:3306 -p 4444:4444 -p 4567:4567 -p 4568:4568 lukaszburylo/galera-mariadb mysqld --wsrep-new-cluster
```

## Example my.cnf file

```
[mysqld]
datadir=/var/lib/mysql
socket=/var/run/mysqld/mysqld.sock
user=mysql
binlog_format=ROW
bind-address=0.0.0.0
default_storage_engine=innodb
innodb_autoinc_lock_mode=2
innodb_flush_log_at_trx_commit=0
innodb_buffer_pool_size=122M
wsrep_provider=/usr/lib/libgalera_smm.so
wsrep_provider_options="gcache.size=300M; gcache.page_size=300M"
wsrep_cluster_name="example_cluster"                            //change this line
wsrep_cluster_address="gcomm://IP.node1,IP.node2,IP.node3"      //change this line  
wsrep_node_address="IP"                                         //change this line
wsrep_sst_method=rsync

[mysql_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
```


