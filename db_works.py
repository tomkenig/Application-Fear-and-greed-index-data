# libs
import mysql.connector  # https://dev.mysql.com/doc/connector-python/en/
import json

# get database connection credentials from JSON file
def get_conn_settings_from_json():
    with open("db_credentials.json") as json_conf:
        sql_db_conn = (json.load(json_conf))
    print("get_conn_settings_from_json done")
    return sql_db_conn

# connection to db
def db_connect():
    sql_db_conn = get_conn_settings_from_json()
    cnxn = mysql.connector.connect(user=sql_db_conn["user"],
                                   password=sql_db_conn["password"],
                                   host=sql_db_conn["host"],
                                   database=sql_db_conn["database"])
    cursor = cnxn.cursor()
    print("db_connect done")
    return cursor, cnxn

# get table names
def db_tables():
    sql_db_conn = get_conn_settings_from_json()
    db_schema_name = sql_db_conn["db_schema_name"]  # schema_name
    db_table_name = sql_db_conn["db_table_name"]  # table_name
    db_settings_table_name = sql_db_conn["db_settings_table_name"]  # settings table name
    print("db_tables done")
    return db_schema_name, db_table_name, db_settings_table_name

db_schema_name, db_table_name, db_settings_table_name = db_tables()

