USE SSRSUsageQueries;
GO
	
SELECT 
		e.UserName
		,(case when e.Status= 'rsSuccess' then 'Success' else 'Failure' end ) AS Status
		,e.TimeRendering AS 'Rendering Time'
		,e.TimeDataRetrieval AS 'Time for query to execute'
		,e.TimeProcessing AS 'Processing Time'
		,e.Parameters
		,CONVERT(VARCHAR(11), e.TimeStart,110) + '  '+
		CONVERT(VARCHAR(5),e.TimeStart, 108) AS 'Execution Date-time'

FROM dbo.Catalog AS c INNER JOIN dbo.ExecutionLogStorage AS e ON c.ItemID= e.ReportID

WHERE c.name= 'Report2' 
;