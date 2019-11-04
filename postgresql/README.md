# Postgresql

```bash
sudo ./pg_dumpall -h rds-mic-cloud.es -p 5432 -U <username> -l mydb  -f dump.sql
```

```bash
/usr/local/pgsql-11/pg_dump --file "/var/lib/pgadmin/storage/folder/traductordb.sql" --host "rds-mic-cloud.es" --port "5432" --username "user" --no-password --verbose --format=p --section=data --encoding "UTF8" "mydb"
```

psql -h rds-mic-cloud.es -p 5432 -U &lt;user&gt; mydb

ver tablas del esquema:

* `\dt`
* `SELECT * FROM pg_catalog.pg_tables;`

salir del psql:

* `\q`

traductordb-&gt; \dt List of relations Schema \| Name \| Type \| Owner --------+-----------------------+-------+----------- public \| fun\_siebel\_products \| table \| traductor public \| fun\_siebel\_rates \| table \| traductor public \| fun\_siebel\_relation \| table \| traductor public \| fun\_siebel\_technology \| table \| traductor \(4 rows\)

Para lanzar queries hay que terminarlas con;

psql -h rds-mic.cloud.es -p 5432 -U &lt;user&gt; &lt;db\_name&gt;

pg\_dumpall -h rds-mic.cloud.es -p 5432 -U &lt;user&gt; -f dump.sql

