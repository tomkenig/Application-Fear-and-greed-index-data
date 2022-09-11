CREATE TABLE `fear_and_greed_index_data` (
  `fagi_id` bigint NOT NULL AUTO_INCREMENT,
  `value` int DEFAULT NULL,
  `value_classification` varchar(50) DEFAULT NULL,
  `timestamp` bigint DEFAULT NULL,
  `date_utc_timestamp` timestamp NULL DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fagi_id`)
) ;
