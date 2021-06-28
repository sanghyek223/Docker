# MariaDB-specific config file.
# Read by /etc/mysql/my.cnf

[client]
# Default is Latin1, if you need UTF-8 set this (also in server section)
#default-character-set = utf8
default-character-set = utf8mb4

[mysql]
default-character-set = utf8mb4

[mysqld]
#
# * Character sets
#
# Default is Latin1, if you need UTF-8 set all this (also in client section)
#
#character-set-server  = utf8
#collation-server      = utf8_general_ci
#character_set_server   = utf8
#collation_server       = utf8_general_ci
# Import all .cnf files from configuration directory
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci

!includedir /etc/mysql/mariadb.conf.d/