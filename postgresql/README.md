# Postgresql

```bash
sudo ./pg_dumpall -h rds-mic-traductordb.soe-nonprod.cloud.si.orange.es -p 5432 -U traductor -l traductordb  -f dump.sql
```

```bash
/usr/local/pgsql-11/pg_dump --file "/var/lib/pgadmin/storage/openapi_orange.com/traductordb.sql" --host "rds-mic-traductordb.soe-nonprod.cloud.si.orange.es" --port "5432" --username "traductor" --no-password --verbose --format=p --section=data --encoding "UTF8" "traductordb"
```

psql -h rds-mic-traductordb.soe-nonprod.cloud.si.orange.es -p 5432 -U traductor traductordb

ver tablas del esquema:

* `\dt`
* `SELECT * FROM pg_catalog.pg_tables;`

salir del psql:

* `\q`

traductordb-&gt; \dt List of relations Schema \| Name \| Type \| Owner --------+-----------------------+-------+----------- public \| fun\_siebel\_products \| table \| traductor public \| fun\_siebel\_rates \| table \| traductor public \| fun\_siebel\_relation \| table \| traductor public \| fun\_siebel\_technology \| table \| traductor \(4 rows\)

Para lanzar queries hay que terminarlas con;

psql -h rds-mic-traductordb.soe-nonprod.cloud.si.orange.es -p 5432 -U traductor traductordb

pg\_dumpall -h rds-mic-traductordb.soe-nonprod.cloud.si.orange.es -p 5432 -U traductor -f dump.sql

