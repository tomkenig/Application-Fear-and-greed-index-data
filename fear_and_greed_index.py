"""
# API examples: https://alternative.me/crypto/fear-and-greed-index/
# Example URL: https://api.alternative.me/fng/
# Example URL: https://api.alternative.me/fng/?limit=10
# Example URL: https://api.alternative.me/fng/?limit=10&format=csv
# Example URL: https://api.alternative.me/fng/?limit=10&format=csv&date_format=us
 """
## Version: 0.1
# Libs
import json
import requests
from datetime import datetime
from db_works import db_connect, db_tables

# todo: get only new periods
# get settings from config json
def get_fagi_settings_json():
    with open("global_config.json") as json_conf:
        fagi_conf = (json.load(json_conf))
    print("conf file opened")
    periods_to_overwrite = fagi_conf["periods_to_overwrite"]
    db_fagi_schema_name = fagi_conf["db_fagi_schema_name"]
    db_fagi_table_name = fagi_conf["db_fagi_table_name"]
    return periods_to_overwrite, db_fagi_schema_name, db_fagi_table_name


def check_is_first_run():
    cursor.execute("SELECT max(timestamp), count(1) FROM " + db_fagi_schema_name + "." + db_fagi_table_name + " ")
    query_result = cursor.fetchall()
    max_timestamp = query_result[0][0]
    rec_cnt = query_result[0][1]
    if rec_cnt != 0:
        print("next run with overwrite")
        return max_timestamp
    else:
        print("first run ever")
        return 0


def get_periods_to_overwrite():
    if max_timestamp !=0:
        final_periods_to_overwrite = periods_to_overwrite
    else:
        final_periods_to_overwrite = 10000  # for example 10 000. Number wont be reach.
    return final_periods_to_overwrite


def get_fagi_data():
    url = "https://api.alternative.me/fng/?limit=10000"
    data = requests.get(url).json()
    return data


def get_min_timestamp_to_overwrite(in_data):
    min_timestamp_to_overwrite = (data["data"][0:final_periods_to_overwrite])[-1]["timestamp"]
    return min_timestamp_to_overwrite


def insert_overwrite_data_fagi_current(in_min_timestamp_to_overwrite):
    # delete
    cursor.execute("DELETE FROM " + db_fagi_schema_name + "." + db_fagi_table_name + " where timestamp >= " + str(in_min_timestamp_to_overwrite )+ "")
    print("old rows deleted")
    # insert
    if data["metadata"]["error"] == None:
        print(" metadata ok")
        for i in data["data"][0:final_periods_to_overwrite]:
            print("go")
            cursor.execute(
                "INSERT INTO " + db_fagi_schema_name + "." + db_fagi_table_name +
                "(value, value_classification, timestamp, date_utc_timestamp) values "
                "(%s, %s, %s, %s)", (i["value"], i["value_classification"], i["timestamp"],
                                     datetime.utcfromtimestamp(int(i["timestamp"]))))
            print(i["value"])
            print(i["value_classification"])
            print(i["timestamp"])
            print(datetime.utcfromtimestamp(int(i["timestamp"])))

    cnxn.commit()
    print("new rows inserted")
    return print("insert_overwrite_data_fagi_current done")



if __name__ == "__main__":
    cursor, cnxn = db_connect()

    periods_to_overwrite, db_fagi_schema_name, db_fagi_table_name = get_fagi_settings_json()
    print(periods_to_overwrite, db_fagi_schema_name, db_fagi_table_name)

    max_timestamp = check_is_first_run()
    print(check_is_first_run())

    final_periods_to_overwrite = get_periods_to_overwrite()

    data = get_fagi_data()
    min_timestamp_to_overwrite = get_min_timestamp_to_overwrite(data)

    insert_overwrite_data_fagi_current(min_timestamp_to_overwrite)
