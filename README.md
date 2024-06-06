# How to Run

- Make sure that Docker is installed on your system. If not, you can download and install it from the official Docker website. Use this link to download Docker Desktop for your operating system.
Remember to restart your system after installing Docker.
- Run following commands:
  - `cd docker`
  - `docker-compose up -d`
  - `cd ..`
  - `pip install -r requirements.txt`
  - `dbt run --exclude union.hudi_union_sources --profiles-dir .` It will be created spark and hudi parquet files with simple and increment data
  - `dbt run --select union.hudi_union_sources --profiles-dir .` It will be created hudi tables from sources on prev step
- Check S3 bucket on `http://127.0.0.1:9001/browser`. You can connect to HM with PyCharm [BigDataTool](https://www.jetbrains.com/help/pycharm/big-data-tools-support.html) for example.
- Check your hive metastore on `thrift://localhost:9083`. You can connect to HM with PyCharm [BigDataTool](https://www.jetbrains.com/help/pycharm/big-data-tools-support.html) for example.
- Clean `docker-compose down --rmi all`

