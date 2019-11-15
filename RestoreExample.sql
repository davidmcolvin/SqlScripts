USE master
GO
-- Create Regular Database
CREATE DATABASE RegularDB
GO
USE RegularDB
GO
-- Create Snapshot Database
CREATE DATABASE SnapshotDB ON
(Name ='RegularDB',
FileName='C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SSDB.ss1')
AS SNAPSHOT OF RegularDB;
GO

USE master
GO
RESTORE DATABASE RegularDB
FROM DATABASE_SNAPSHOT = 'SnapshotDB'

USE master
GO
-- Clean up
DROP DATABASE [SnapshotDB];
DROP DATABASE [RegularDB];
GO

