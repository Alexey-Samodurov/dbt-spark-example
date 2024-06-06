# How to Run

- Make sure that Docker is installed on your system. If not, you can download and install it from the official Docker website. Use this [link](https://docs.docker.com/engine/install/) to download Docker Desktop for your operating system.
Remember to restart your system after installing Docker.
- Run following commands:
  - `cd docker`
  - `docker-compose up -d`
  - `cd ..`
  - `pip install -r requirements.txt`
  - `dbt run --exclude union.hudi_union_sources --profiles-dir .` It will be created spark and hudi parquet files with simple and increment data
  - `dbt run --select union.hudi_union_sources --profiles-dir .` It will be created hudi tables from sources on prev step
- Check S3 bucket on `http://127.0.0.1:9001/browser`. You can connect to MinIO with PyCharm [BigDataTool](https://www.jetbrains.com/help/pycharm/big-data-tools-support.html) for example.
  - user - `minio`
  - password - `minio-minio`
- Check your hive metastore on `thrift://localhost:9083`. You can connect to HMS with PyCharm [BigDataTool](https://www.jetbrains.com/help/pycharm/big-data-tools-support.html) for example.
- Clean `docker-compose down --rmi all`

# Note for windows users
- When running Spark applications on Windows, you might encounter issues related to Hadoop DLLs and the Hadoop execution script. These issues can typically be resolved by installing winutils.exe.
winutils.exe is a utility that is part of the Apache Hadoop project, needed for running Hadoop jobs, which also includes Spark jobs as the latter is built on top of Hadoop.
- To install winutils.exe:
  1. Download the winutils.exe binary from the repository matching your Hadoop version. You can find binaries [here](https://github.com/steveloughran/winutils). Download the one that matches your Hadoop version.
  2. Create a directory such as C:\hadoop\bin and place the winutils.exe in the bin directory.
  3. Set HADOOP_HOME to the parent directory, e.g., C:\hadoop.
  4. Add %HADOOP_HOME%\bin to your PATH environment variable.

  After following these steps, your Spark job should work correctly on Windows.
