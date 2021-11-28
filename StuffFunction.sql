USE AdventureWorks2019
GO

-- Using STUFF function
IF EXISTS(SELECT [name] FROM tempdb.sys.tables WHERE [name] like '#tempTable%') 
BEGIN
    DROP TABLE #tempTable
END;
SELECT EmailAddress INTO #tempTable FROM Person.EmailAddress
SELECT TOP 1
    STUFF(
            (SELECT ';'+EmailAddress FROM #tempTable FOR XML PATH ('')), 1, 1, '') AS EmailAddress
FROM #tempTable 



--Using STRING_AGG function
SELECT STRING_AGG (CONVERT(NVARCHAR(MAX),EmailAddress), ';') AS csv 
FROM Person.EmailAddress







