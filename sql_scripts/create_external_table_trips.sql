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

CREATE EXTERNAL TABLE dbo.staging_trips (
	[trip_id] nvarchar(4000),
	[rideable_type] nvarchar(4000),
	[start_at] datetime2(0),
	[ended_at] datetime2(0),
	[start_station_id] nvarchar(4000),
	[end_station_id] nvarchar(4000),
	[rider_id] bigint
	)
	WITH (
	LOCATION = 'publictrips.csv',
	DATA_SOURCE = [rmxefilesystem_rmxedlstorage_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO

