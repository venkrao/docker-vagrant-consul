
#docker run --name mysql_server -p <privat_ip_of_this_host>:3306:3306  -e MYSQL_ROOT_PASSWORD=Gnleln_2 -d mysql:latest 
#docker run -it -v /opt/config:/opt/config -v /opt/scripts:/opt/scripts --link mysql_server:mysql --rm mysql sh -c '/opt/scripts/startdb.sh' 
