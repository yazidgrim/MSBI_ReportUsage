use SSRSUsageQueries;
go


		SELECT 
				re.Name
				,count (re.Name) as ExecutionCount
				,sum ( case when re.Status= 'rsSuccess' then 1 else 0 end ) as Success
				,sum ( case when re.Status= 'rsSuccess' then 0 else 1 end ) as Failure
		FROM
		(
		SELECT	c.Name
				,e.Status
				
		FROM dbo.Catalog AS c
		INNER JOIN dbo.ExecutionLog AS e ON c.ItemID = e.ReportID
		) AS re

		GROUP BY re.Name
		;
