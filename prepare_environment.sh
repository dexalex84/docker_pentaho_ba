 echo copy from unzipped Penntaho BA distr files to host common folder START...
 echo cp app_pentaho_ba:/opt/pentaho/pentaho-server/data/postgresql ./init/db_repo
 echo 
 docker cp app_pentaho_ba:/opt/pentaho/pentaho-server/data/postgresql ./init/db_repo
 echo END	
 echo
 echo copy these files to db_repo container START...
 echo cp init/db_repo/postgresql db_repo:/tmp
 echo

 docker cp init/db_repo/postgresql db_repo:/tmp
 echo END
 echo
	
 echo run thiese file on db_repo PostgreSQL Server START...
 docker-compose exec db_repo psql -U postgres -f "/tmp/postgresql/create_repository_postgresql.sql"
 docker-compose exec db_repo psql -U postgres -f "/tmp/postgresql/create_quartz_postgresql.sql"
 docker-compose exec db_repo psql -U postgres -f "/tmp/postgresql/create_jcr_postgresql.sql"
 echo END
 echo

 echo copy customized Pentaho BA Server files to app_pentaho_ba container START
 docker cp init/app_pentaho_ba app_pentaho_ba:/tmp
 docker-compose exec app_pentaho_ba cp /tmp/app_pentaho_ba/pentaho-server/ /opt/pentaho/pentaho-server/ -r
 echo END
 echo

 echo now you can start Pentaho BA server by command
 echo docker-compose exec -T app_pentaho_ba /opt/pentaho/pentaho-server/start-pentaho.sh

