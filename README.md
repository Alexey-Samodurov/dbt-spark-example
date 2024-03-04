# How to Run

- Make sure that you have docker in your system
- Run following commands
  - `docker-compose up -d --build`
  - `dbt debug --profiles-dir .`
  - `dbt run --profiles-dir .`
- The Spark UI should be available at http://localhost:4040/sqlserver/
- The endpoint for SQL-based testing is at http://localhost:10000 and can be referenced with the Hive or Spark JDBC drivers using connection string jdbc:hive2://localhost:10000 and default credentials dbt:dbt
- Note that the Hive metastore data is persisted under ./.hive-metastore/, and the Spark-produced data under ./.spark-warehouse/. To completely reset you environment run the following:
```
docker-compose down
rm -rf ./.hive-metastore/
rm -rf ./.spark-warehouse/
```

