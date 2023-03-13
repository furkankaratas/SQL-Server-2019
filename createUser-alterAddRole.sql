
DECLARE @lcSQL VARCHAR(MAX), @memberName VARCHAR(150)

DECLARE curYetki CURSOR FOR
 
SELECT  m.name AS member_principal_name
FROM sys.sysusers m 
WHERE islogin=1 AND issqlrole=0 AND isntgroup=0 
ORDER BY m.name ASC


	OPEN curYetki 
	FETCH NEXT FROM curYetki INTO  @memberName
	WHILE @@FETCH_STATUS =0
		
		BEGIN
			SET @lcSQL = 'USE SSOv3; CREATE USER '+'['+@memberName+']'+' FOR LOGIN '+'['+@memberName+']'
			PRINT @lcSQL
			--EXEC (@lcSQL)
			FETCH NEXT FROM curYetki INTO  @memberName
		END
	CLOSE curYetki 
	
DEALLOCATE curYetki 

----------------------------------------------------------------------------------------------------------------

DECLARE @lcSQL VARCHAR(MAX),@roleName VARCHAR(150), @memberName VARCHAR(150)

DECLARE curYetki CURSOR FOR
 
SELECT r.name role_principal_name, m.name AS member_principal_name
FROM sys.database_role_members rm 
JOIN sys.database_principals r 
    ON rm.role_principal_id = r.principal_id
JOIN sys.database_principals m 
    ON rm.member_principal_id = m.principal_id 

	OPEN curYetki 
	FETCH NEXT FROM curYetki INTO @roleName, @memberName
	WHILE @@FETCH_STATUS =0
		
		BEGIN
			SET @lcSQL = 'USE SSOv3; ALTER ROLE '+'['+@roleName+']'+' ADD MEMBER '+'['+@memberName+']'
			PRINT @lcSQL
			--EXEC (@lcSQL)
			FETCH NEXT FROM curYetki INTO @roleName, @memberName
		END
	CLOSE curYetki 
	
DEALLOCATE curYetki 


