env
#exec mysql -h"$MYSQL_CLIENT_PORT_3306_TCP_ADDR" -P"$MYSQL_CLIENT_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_CLIENT_ENV_MYSQL_ROOT_PASSWORD" < /opt/config/createdb.sql
exec  mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" < /opt/config/createdb.sql
