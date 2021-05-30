DECLARE @RawContent [nvarchar](MAX) = (select ParamValue from dms..dms_Contextdata nolock where ParamKey = 'ChildrenPerformingColdstart');
DECLARE @XMLContent XML = CAST(REPLACE(@RawContent, '<?xml version="1.0" encoding="UTF-8"?>', '') AS XML)

 

 

 

select T.N.value('Key[1]', 'varchar(max)') as 'NodeId'
, h.NodeLogicalName 
, T.N.value('Value[1]', 'datetime') +getdate() -GETUTCDATE() as 'ColdStartTime'
, Datediff(mi,( T.N.value('Value[1]', 'datetime') +getdate() -GETUTCDATE()),getdate()) 'Duration (min)'
from  @XMLContent.nodes('/SerializableDictionaryOfGuidDateTime/ArrayOfEntry/Entry') as T(N) 
inner join dms..DMS_ServersHierarchy as h (nolock) on h.NodeId = T.N.value('Key[1]', 'varchar(max)')
order by T.N.value('Value[1]', 'datetime') +getdate() -GETUTCDATE() 