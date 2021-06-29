# MariaDB 설치
docker-compose up -d

# Master mariadb 접속
mysql -uroot -p


# 접속시 Warning
Warning: World-writable config file '/etc/mysql/conf.d/server.cnf' is ignored 
메세지 마주 할 경우 권한을 부여해 주어야 한다
chmod 0444 /etc/mysql/conf.d/server.cnf 


# master status 상태 확인
show master status;

+------------------+----------+--------------+------------------+

| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB |

+------------------+----------+--------------+------------------+

| mysql-bin.xxxxxx |      xxx |              |                  |

+------------------+----------+--------------+------------------+

###############################################

만약 결과가
 
Empty set (0.00 sec) 일경우

mysqladmin -uroot -p shutdown 후 컨테이너 재실행 후

mysql -uroot -p
PW = mariadb_secret 안에 지정한 PW

show master status;
  
###############################################


# 2일만 binlog 는 보관
SHOW VARIABLES LIKE '%expire_logs_days%';
set global expire_logs_days=2;


# Slave ON
GRANT REPLICATION SLAVE ON *.* TO repl_user@'%';
FLUSH PRIVILEGES;




# Slave mariadb 접속
mysql -uroot -p


# Slave replication 걸기
Grant replication slave, replication client on *.* to {userID}@'%' identified by '{PW}';

# masterDB 정보 변경
change master to master_host='{host정보 (여기선 마스터 도커DB 컨테이너이름)}',
master_port={포트},
master_user='{마스터DB에 설정한 user}',
master_password='{PW}',
master_log_file='(show master status 로 확인한 file명)',
master_log_pos={master position 값};

###################################################################
ex)
change master to master_host='master_db',
master_port=3306,
master_user='repl_user',
master_password='123123',
master_log_file='mariadb-bin.000003',
master_log_pos=344;
###################################################################


# Slave Start & 상태 확인
start slave;
show slave status\G;




