use SSRSUsageQueries;
go



		SELECT 
				c.Name
				,count (c.Name) as ExecutionCount
				,sum ( case when e.Status= 'rsSuccess' then 1 else 0 end ) as Success
				,sum ( case when e.Status= 'rsSuccess' then 0 else 1 end ) as Failure
		
				
		FROM dbo.Catalog AS c
		INNER JOIN dbo.ExecutionLog AS e ON c.ItemID = e.ReportID
		

		GROUP BY c.Name
		;
