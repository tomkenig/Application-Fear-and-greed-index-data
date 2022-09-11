# Overview
Downloads and update everyday Fear And greed index data from

https://alternative.me/crypto/fear-and-greed-index/
On first run all archival data will be downloaded.

# Versions

0.01 - current

# Files
global_config.json – general configuration

db_credentials.json – database credentials file

db_works.py – functions for connection with database ( curent MySQL )

fear_and_greed_index.py – application file

# Database objects
TABLE: fear_and_greed_index_data – collect downloaded data

# Quick Install and deployment

Use your credentials and settings in files listed below:

- global_config.json – general configuration

- db_credentials.json – database credentials file

To automate use CRON or Task manager

CRON example:

/usr/bin/env bash -c ‘source /usr/home/[USER]/[VIRTUAL_ENV] && cd /usr/home/[USER]/[APPLICATION_PATH]/ && python /usr/home/[USER]/[APPLICATION_PATH]//fear_and_greed_index.py’