IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'rmxefilesystem_rmxedlstorage_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [rmxefilesystem_rmxedlstorage_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://rmxefilesystem@rmxedlstorage.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

CREATE EXTERNAL TABLE dbo.staging_riders (
	[rider_key] bigint,
	[first] nvarchar(4000),
	[last] nvarchar(4000),
	[address] nvarchar(4000),
	[birthday] datetime,
	[account_start_date] datetime,
	[account_end_date] datetime,
	[is_member] bit
	)
	WITH (
	LOCATION = 'publicriders.csv',
	DATA_SOURCE = [rmxefilesystem_rmxedlstorage_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO

