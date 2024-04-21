# How to Run

- Make sure that you have docker in your system and S3-like bucket
- Add environment variables to your system:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_KEY`
  - `AWS_ENDPOINT`
- Complete the `.env` in `docker` directory
- Run following commands:
  - `cd docker`
  - `docker-compose up -d`
  - `cd ..`
  - `pip install -r requirements.txt`
  - `dbt run --profiles-dir .`
- Check your S3 bucket
- Check your hive metastore on `thrift://localhost:9083`. You can connect to HM with PyCharm [BigDataTool](https://www.jetbrains.com/help/pycharm/big-data-tools-support.html) for example. 
- At first `dbr run` we have 1 failed model, it's ok because hive metastore don't have information about models with dbt sources
- At second `dbt run` we have all models with completed status
- Clean `docker-compose down --rmi all`

