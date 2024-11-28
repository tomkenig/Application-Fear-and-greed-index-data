----------------------------------------- REVISION ------------------------------------------------------
------------------------- NAME: Application: Application FEar and greed index data - fear_and_greed_data.sql
------------------------- CREATED: 2024/11/28
------------------------- VERSION: 0.02

-- 0.01 	????/??/?? token: First version
-- 0.02 	2024/11/28 token: Add 2 columns - source_id and source_sk

----------------------------------------- install/deploy ------------------------------------------------

-- tip: run all separately, non as a single script

----------------------------------------- variables -----------------------------------------------------
-- database:
-- [schema]: 
-- table name:
-- proc name:

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------



CREATE TABLE [schema].`fear_and_greed_index_data` (
  `fagi_id` bigint NOT NULL AUTO_INCREMENT,
  `value` int DEFAULT NULL,
  `value_classification` varchar(50) DEFAULT NULL,
  `timestamp` bigint DEFAULT NULL,
  `date_utc_timestamp` timestamp NULL DEFAULT NULL,
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fagi_id`)
) ;

-- 2 new columns v0.02
ALTER TABLE [schema].fear_and_greed_index_data ADD COLUMN source_id int;
ALTER TABLE [schema].fear_and_greed_index_data ADD COLUMN source_sk varchar(50);



---------------------------------------------------------------------------------------------------------
----------------------------------------- TEST ----------------------------------------------------------
---------------------------------------------------------------------------------------------------------
-- check
select * from [schema]..fear_and_greed_index_data;