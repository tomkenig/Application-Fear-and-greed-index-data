----------------------------------------- REVISION ------------------------------------------------------
--  NAME: Application: Application FEar and greed index data - fear_and_greed_data_repair_data_loss.sql
-- CREATED: 2024/11/28
-- VERSION: 0.01

-- 0.01 	2024/11/28 token: First version

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

-- manual repair data loses  fear_and_greed_data_repair_data_loss.sql


selecT * from [schema].fear_and_greed_index_data;




-- data health

select * from [schema].dic_calendar dc 
left join [schema].fear_and_greed_index_data fg on 1
and dc.dateid = date(fg.date_utc_timestamp )
where 1
and dc.dateid >= '2018-02-01'
and dc.dateid <= CURRENT_DATE() 
;




select * from (
select * from [schema].dic_calendar dc 
left join [schema].fear_and_greed_index_data fg on 1
and dc.dateid = date(fg.date_utc_timestamp )
where 1
and dc.dateid >= '2018-02-01'
and dc.dateid <= CURRENT_DATE() 
) aaa where aaa.fagi_id is null;


select * from 
[schema].fear_and_greed_index_data fg
where 1
and date_utc_timestamp in (
'2018-04-13',
'2018-04-14',
'2018-04-15',
'2018-04-16',
'2018-04-17',
'2024-10-25',
'2024-10-26',
'2024-10-27')
order by 
date_utc_timestamp
;

-- '2018-04-14'
INSERT
	INTO
	[schema].fear_and_greed_index_data
(value,value_classification ,`timestamp`,date_utc_timestamp ,source_id,source_sk)
values
(25,'Fear',1523656800,'2018-04-14',1,'MANUAL#REPAIR_DATA_LOSS');

-- '2018-04-15'
INSERT
	INTO
	[schema].fear_and_greed_index_data
(value,value_classification ,`timestamp`,date_utc_timestamp ,source_id,source_sk)
values
(25,'Fear',1523743200,'2018-04-15',1,'MANUAL#REPAIR_DATA_LOSS');

-- '2018-04-16'
INSERT
	INTO
	[schema].fear_and_greed_index_data
(value,value_classification ,`timestamp`,date_utc_timestamp ,source_id,source_sk)
values
(25,'Fear',1523829600,'2018-04-16',1,'MANUAL#REPAIR_DATA_LOSS');

-- '2024-10-26'
INSERT
	INTO
	[schema].fear_and_greed_index_data
(value,value_classification ,`timestamp`,date_utc_timestamp ,source_id,source_sk)
values
(73,'Greed',1729893600,'2024-10-26',1,'MANUAL#REPAIR_DATA_LOSS');


-- test :
selecT * from 	[schema].fear_and_greed_index_data;

selecT * from [schema].dic_source;

/*losses
 * 
'2018-04-14'
'2018-04-15'
'2018-04-16'
'2024-10-26'
 * 
 */






---------------------------------------------------------------------------------------------------------
----------------------------------------- TEST ----------------------------------------------------------
---------------------------------------------------------------------------------------------------------
-- check
select * from [schema].fear_and_greed_index_data;