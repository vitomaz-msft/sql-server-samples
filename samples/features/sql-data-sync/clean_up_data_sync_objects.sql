declare @TableName nvarchar(max)
set @TableName = 'yourTableName'
--In case you wish to delete objects related to all the tables you can uncomment the following:
set @TableName = ''


-- list Data Sync user tables
select * from sys.tables as st join sys.schemas as ss on ss.schema_id = st.schema_id 
where ss.name = 'DataSync' and st.name like '%' + @TableName + '_dss_%'

-- generate the script to drop Data Sync tables
select 'drop table [DataSync].['+ st.name+ '];' from sys.tables as st join sys.schemas as ss on ss.schema_id = st.schema_id 
where ss.name = 'DataSync' and st.name like '%' + @TableName + '_dss_%'


-- list Data Sync store procedures
select * from sys.procedures as sp join sys.schemas as ss on ss.schema_id = sp.schema_id 
where ss.name = 'DataSync' and sp.name like '%' + @TableName + '_dss_%'

-- generate the script to drop Data Sync store procedures
select 'drop procedure [DataSync].['+ sp.name+ '];' from sys.procedures as sp join sys.schemas as ss on ss.schema_id = sp.schema_id 
where ss.name = 'DataSync' and sp.name like '%' + @TableName + '_dss_%'


-- list Data Sync triggers
select * from sys.objects where type = 'TR' and name like '%' + @TableName + '_dss_%'

-- generate the script to delete Data Sync triggers
select 'drop trigger [' + schema_name(schema_id) + '].[' + name + ']'
from sys.objects where type = 'TR' and name like '%' + @TableName + '_dss_%'


-- list Data Sync-related udtt
select * from sys.types as st join sys.schemas as ss on st.schema_id = ss.schema_id 
where ss.name = 'DataSync' and st.name like '%' + @TableName + '_dss_%'

-- generate the script to delete Data Sync-related udtt
select 'drop type  [DataSync].['+ st.name+ '];' from sys.types as st join sys.schemas as ss on st.schema_id = ss.schema_id 
where ss.name = 'DataSync' and st.name like '%' + @TableName + '_dss_%'
