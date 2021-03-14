USE DFW_Live
GO

/****** Object:  StoredProcedure [dbo]..InsertFloatingPoint    Script Date: 3/12/2021 11:42:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertFloatingPoint]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InsertFloatingPoint]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE InsertFloatingPoint
(
	@Id int OUTPUT,
	@FloatingPointId uniqueidentifier,
	@Name nvarchar(250),
	@District nvarchar(100),
	@City nvarchar(100),
	@Lat nvarchar(100),
	@Lng nvarchar(100),
	@IsDealer bit,
	@CreatedBy uniqueidentifier,
	@CreatedDate datetime,
	@RouteDay nvarchar(500),
	@ShopName nvarchar(250),
	@OwnerName nvarchar(250),
	@OwnerPhone nvarchar(100),
	@Competitor1TvWalton int,
	@Competitor1RfWalton int,
	@Competitor2TvVision int,
	@Competitor2RfVision int,
	@Competitor3TvMarcel int,
	@Competitor3RfMinister int,
	@MonthlySaleTv float,
	@MonthlySaleRf float,
	@MonthlySaleAc float,
	@ShowroomSize float,
	@DisplayOut float,
	@DisplayIn float
)
AS
    INSERT INTO [dbo].[FloatingPoint] 
	(
	[FloatingPointId],
	[Name],
	[District],
	[City],
	[Lat],
	[Lng],
	[IsDealer],
	[CreatedBy],
	[CreatedDate],
	[RouteDay],
	[ShopName],
	[OwnerName],
	[OwnerPhone],
	[Competitor1TvWalton],
	[Competitor1RfWalton],
	[Competitor2TvVision],
	[Competitor2RfVision],
	[Competitor3TvMarcel],
	[Competitor3RfMinister],
	[MonthlySaleTv],
	[MonthlySaleRf],
	[MonthlySaleAc],
	[ShowroomSize],
	[DisplayOut],
	[DisplayIn]
    ) 
	VALUES 
	(
	@FloatingPointId,
	@Name,
	@District,
	@City,
	@Lat,
	@Lng,
	@IsDealer,
	@CreatedBy,
	@CreatedDate,
	@RouteDay,
	@ShopName,
	@OwnerName,
	@OwnerPhone,
	@Competitor1TvWalton,
	@Competitor1RfWalton,
	@Competitor2TvVision,
	@Competitor2RfVision,
	@Competitor3TvMarcel,
	@Competitor3RfMinister,
	@MonthlySaleTv,
	@MonthlySaleRf,
	@MonthlySaleAc,
	@ShowroomSize,
	@DisplayOut,
	@DisplayIn
    )
	DECLARE @Err int
	DECLARE @Result int

	SET @Result = @@ROWCOUNT
	SET @Err = @@ERROR 
	If @Err <> 0 
	BEGIN
		SET @Id = -1
		RETURN @Err
	END
	ELSE
	BEGIN
		If @Result = 1 
		BEGIN
			-- Everything is OK
			SET @Id = @@IDENTITY
		END
		ELSE
		BEGIN
			SET @Id = -1
			RETURN 0
		END
	END

	RETURN @Id
GO

/****** Object:  StoredProcedure [dbo].UpdateFloatingPoint    Script Date: 3/12/2021 11:42:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateFloatingPoint]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateFloatingPoint]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE UpdateFloatingPoint
(
	@Id int,
	@FloatingPointId uniqueidentifier,
	@Name nvarchar(250),
	@District nvarchar(100),
	@City nvarchar(100),
	@Lat nvarchar(100),
	@Lng nvarchar(100),
	@IsDealer bit,
	@CreatedBy uniqueidentifier,
	@CreatedDate datetime,
	@RouteDay nvarchar(500),
	@ShopName nvarchar(250),
	@OwnerName nvarchar(250),
	@OwnerPhone nvarchar(100),
	@Competitor1TvWalton int,
	@Competitor1RfWalton int,
	@Competitor2TvVision int,
	@Competitor2RfVision int,
	@Competitor3TvMarcel int,
	@Competitor3RfMinister int,
	@MonthlySaleTv float,
	@MonthlySaleRf float,
	@MonthlySaleAc float,
	@ShowroomSize float,
	@DisplayOut float,
	@DisplayIn float
)
AS
    UPDATE [dbo].[FloatingPoint] 
	SET
	[FloatingPointId] = @FloatingPointId,
	[Name] = @Name,
	[District] = @District,
	[City] = @City,
	[Lat] = @Lat,
	[Lng] = @Lng,
	[IsDealer] = @IsDealer,
	[CreatedBy] = @CreatedBy,
	[CreatedDate] = @CreatedDate,
	[RouteDay] = @RouteDay,
	[ShopName] = @ShopName,
	[OwnerName] = @OwnerName,
	[OwnerPhone] = @OwnerPhone,
	[Competitor1TvWalton] = @Competitor1TvWalton,
	[Competitor1RfWalton] = @Competitor1RfWalton,
	[Competitor2TvVision] = @Competitor2TvVision,
	[Competitor2RfVision] = @Competitor2RfVision,
	[Competitor3TvMarcel] = @Competitor3TvMarcel,
	[Competitor3RfMinister] = @Competitor3RfMinister,
	[MonthlySaleTv] = @MonthlySaleTv,
	[MonthlySaleRf] = @MonthlySaleRf,
	[MonthlySaleAc] = @MonthlySaleAc,
	[ShowroomSize] = @ShowroomSize,
	[DisplayOut] = @DisplayOut,
	[DisplayIn] = @DisplayIn
	WHERE ( Id = @Id )

	DECLARE @Err int
	DECLARE @Result int
	SET @Result = @@ROWCOUNT
	SET @Err = @@ERROR 

	If @Err <> 0 
	BEGIN
		SET @Result = -1
	END

	RETURN @Result
GO

/****** Object:  StoredProcedure [dbo].DeleteFloatingPoint    Script Date: 3/12/2021 11:42:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteFloatingPoint]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteFloatingPoint]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE DeleteFloatingPoint
(
	@Id int
)
AS
	DELETE [dbo].[FloatingPoint] 

    WHERE ( Id = @Id )

	DECLARE @Err int
	DECLARE @Result int

	SET @Result = @@ROWCOUNT
	SET @Err = @@ERROR 

	If @Err <> 0 
	BEGIN
		SET @Result = -1
	END

	RETURN @Result
GO

/****** Object:  StoredProcedure [dbo].GetAllFloatingPoint    Script Date: 3/12/2021 11:42:24 AM  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllFloatingPoint]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAllFloatingPoint]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE GetAllFloatingPoint
AS
	SELECT *		
	FROM
		[dbo].[FloatingPoint]

RETURN @@ROWCOUNT
GO

/****** Object:  StoredProcedure [dbo].GetFloatingPointById    Script Date: 3/12/2021 11:42:24 AM  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFloatingPointById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetFloatingPointById]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE GetFloatingPointById
(
	@Id int
)
AS
	SELECT *		
	FROM
		[dbo].[FloatingPoint]
	WHERE ( Id = @Id )

RETURN @@ROWCOUNT
GO

/****** Object:  StoredProcedure [dbo].GetFloatingPointMaximumId    Script Date: 3/12/2021 11:42:24 AM  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFloatingPointMaximumId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetFloatingPointMaximumId]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE GetFloatingPointMaximumId
AS
	DECLARE @Result int
	SET @Result = 0
	
	SELECT @Result = MAX(Id) 		
	FROM
		[dbo].[FloatingPoint]

	If @Result > 0 
		BEGIN
			-- Everything is OK
			RETURN @Result
		END
		ELSE
		BEGIN
			RETURN 0
		END
RETURN @Result
GO

/****** Object:  StoredProcedure [dbo].GetFloatingPointRowCount    Script Date: 3/12/2021 11:42:24 AM  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFloatingPointRowCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetFloatingPointRowCount]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE GetFloatingPointRowCount
AS
	DECLARE @Result int
	SET @Result = 0
	SELECT @Result = COUNT(*) 		
	FROM
		[dbo].[FloatingPoint]
		
RETURN @Result
GO

/****** Object:  StoredProcedure [dbo].GetPagedFloatingPoint    Script Date: 3/12/2021 11:42:24 AM  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetPagedFloatingPoint]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetPagedFloatingPoint]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE GetPagedFloatingPoint
(
	@TotalRows		int	OUTPUT,
	@PageIndex	int,
	@RowPerPage		int,
	@WhereClause	nvarchar(4000),
	@SortColumn		nvarchar(128),
	@SortOrder		nvarchar(4)
)
AS
BEGIN 

SET @PageIndex = isnull(@PageIndex, -1)
SET @RowPerPage = isnull(@RowPerPage, -1)
SET @WhereClause = isnull(@WhereClause, '')
SET @SortColumn = isnull(@SortColumn, '')
SET @SortOrder = isnull(@SortOrder, '')
SET @TotalRows = 0
SET @RowPerPage = @RowPerPage -1
DECLARE @SQL1 nvarchar(4000)
DECLARE @SQL2 nvarchar(4000)

IF (@WhereClause != '')
BEGIN
	SET @WhereClause = 'WHERE ' + char(13) + @WhereClause	
END

IF (@SortColumn != '')
BEGIN
	SET @SortColumn = 'ORDER BY ' + @SortColumn

	IF (@SortOrder != '')
	BEGIN
		SET @SortColumn = @SortColumn + ' ' + @SortOrder
	END
END
ELSE
BEGIN
	SET @SortColumn = @SortColumn + ' ORDER BY [Id] ASC'
END

SET @SQL1 = 'WITH FloatingPointEntries AS (
			SELECT ROW_NUMBER() OVER ('+ @SortColumn +')AS Row,
	[Id],
	[FloatingPointId],
	[Name],
	[District],
	[City],
	[Lat],
	[Lng],
	[IsDealer],
	[CreatedBy],
	[CreatedDate],
	[RouteDay],
	[ShopName],
	[OwnerName],
	[OwnerPhone],
	[Competitor1TvWalton],
	[Competitor1RfWalton],
	[Competitor2TvVision],
	[Competitor2RfVision],
	[Competitor3TvMarcel],
	[Competitor3RfMinister],
	[MonthlySaleTv],
	[MonthlySaleRf],
	[MonthlySaleAc],
	[ShowroomSize],
	[DisplayOut],
	[DisplayIn]
				FROM 
				[dbo].[FloatingPoint]
					'+ @WhereClause +'
				)
				SELECT 
	[Id],
	[FloatingPointId],
	[Name],
	[District],
	[City],
	[Lat],
	[Lng],
	[IsDealer],
	[CreatedBy],
	[CreatedDate],
	[RouteDay],
	[ShopName],
	[OwnerName],
	[OwnerPhone],
	[Competitor1TvWalton],
	[Competitor1RfWalton],
	[Competitor2TvVision],
	[Competitor2RfVision],
	[Competitor3TvMarcel],
	[Competitor3RfMinister],
	[MonthlySaleTv],
	[MonthlySaleRf],
	[MonthlySaleAc],
	[ShowroomSize],
	[DisplayOut],
	[DisplayIn]
				FROM 
					FloatingPointEntries
				WHERE 
					Row between '+ CONVERT(nvarchar(10), (@PageIndex * @RowPerPage) + 1) +'And ('+ CONVERT(nvarchar(10), (@PageIndex * @RowPerPage) +@RowPerPage+ 1) +')'
	

SET @SQL2 =		' SELECT @TotalRows = COUNT(*) 
				FROM 
				[dbo].[FloatingPoint] ' + @WhereClause
								
EXEC sp_executesql @SQL2, N'@TotalRows int output', @TotalRows = @TotalRows output

EXEC sp_executesql @SQL1

RETURN @@ROWCOUNT
END
GO

/****** Object:  StoredProcedure [dbo].GetFloatingPointByQuery    Script Date: 3/12/2021 11:42:24 AM  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFloatingPointByQuery]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetFloatingPointByQuery]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE GetFloatingPointByQuery
(
	@Query	nvarchar(4000)
)
AS
BEGIN 

SET @Query = isnull(@Query, '')
DECLARE @SQL1 nvarchar(4000)

IF (@Query != '')
BEGIN
	SET @Query = 'WHERE ' + char(13) + @Query	
END

SET @SQL1 =		'SELECT * 
				FROM 
				[dbo].[FloatingPoint] ' + @Query
								
EXEC sp_executesql @SQL1

RETURN @@ROWCOUNT
END
GO

