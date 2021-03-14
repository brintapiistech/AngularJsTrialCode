USE DFW_Live
GO

/****** Object:  StoredProcedure [dbo]..InsertFloatingPointImage    Script Date: 3/12/2021 11:42:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertFloatingPointImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InsertFloatingPointImage]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE InsertFloatingPointImage
(
	@Id int OUTPUT,
	@FloatingPointId uniqueidentifier,
	@ImageLocation nvarchar(max),
	@ImageName nvarchar(500),
	@CreatedBy uniqueidentifier,
	@CreatedDate datetime
)
AS
    INSERT INTO [dbo].[FloatingPointImage] 
	(
	[FloatingPointId],
	[ImageLocation],
	[ImageName],
	[CreatedBy],
	[CreatedDate]
    ) 
	VALUES 
	(
	@FloatingPointId,
	@ImageLocation,
	@ImageName,
	@CreatedBy,
	@CreatedDate
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

/****** Object:  StoredProcedure [dbo].UpdateFloatingPointImage    Script Date: 3/12/2021 11:42:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateFloatingPointImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateFloatingPointImage]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE UpdateFloatingPointImage
(
	@Id int,
	@FloatingPointId uniqueidentifier,
	@ImageLocation nvarchar(max),
	@ImageName nvarchar(500),
	@CreatedBy uniqueidentifier,
	@CreatedDate datetime
)
AS
    UPDATE [dbo].[FloatingPointImage] 
	SET
	[FloatingPointId] = @FloatingPointId,
	[ImageLocation] = @ImageLocation,
	[ImageName] = @ImageName,
	[CreatedBy] = @CreatedBy,
	[CreatedDate] = @CreatedDate
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

/****** Object:  StoredProcedure [dbo].DeleteFloatingPointImage    Script Date: 3/12/2021 11:42:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteFloatingPointImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteFloatingPointImage]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE DeleteFloatingPointImage
(
	@Id int
)
AS
	DELETE [dbo].[FloatingPointImage] 

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

/****** Object:  StoredProcedure [dbo].GetAllFloatingPointImage    Script Date: 3/12/2021 11:42:24 AM  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAllFloatingPointImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAllFloatingPointImage]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE GetAllFloatingPointImage
AS
	SELECT *		
	FROM
		[dbo].[FloatingPointImage]

RETURN @@ROWCOUNT
GO

/****** Object:  StoredProcedure [dbo].GetFloatingPointImageById    Script Date: 3/12/2021 11:42:24 AM  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFloatingPointImageById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetFloatingPointImageById]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE GetFloatingPointImageById
(
	@Id int
)
AS
	SELECT *		
	FROM
		[dbo].[FloatingPointImage]
	WHERE ( Id = @Id )

RETURN @@ROWCOUNT
GO

/****** Object:  StoredProcedure [dbo].GetFloatingPointImageMaximumId    Script Date: 3/12/2021 11:42:24 AM  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFloatingPointImageMaximumId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetFloatingPointImageMaximumId]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE GetFloatingPointImageMaximumId
AS
	DECLARE @Result int
	SET @Result = 0
	
	SELECT @Result = MAX(Id) 		
	FROM
		[dbo].[FloatingPointImage]

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

/****** Object:  StoredProcedure [dbo].GetFloatingPointImageRowCount    Script Date: 3/12/2021 11:42:24 AM  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFloatingPointImageRowCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetFloatingPointImageRowCount]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE GetFloatingPointImageRowCount
AS
	DECLARE @Result int
	SET @Result = 0
	SELECT @Result = COUNT(*) 		
	FROM
		[dbo].[FloatingPointImage]
		
RETURN @Result
GO

/****** Object:  StoredProcedure [dbo].GetPagedFloatingPointImage    Script Date: 3/12/2021 11:42:24 AM  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetPagedFloatingPointImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetPagedFloatingPointImage]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE GetPagedFloatingPointImage
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

SET @SQL1 = 'WITH FloatingPointImageEntries AS (
			SELECT ROW_NUMBER() OVER ('+ @SortColumn +')AS Row,
	[Id],
	[FloatingPointId],
	[ImageLocation],
	[ImageName],
	[CreatedBy],
	[CreatedDate]
				FROM 
				[dbo].[FloatingPointImage]
					'+ @WhereClause +'
				)
				SELECT 
	[Id],
	[FloatingPointId],
	[ImageLocation],
	[ImageName],
	[CreatedBy],
	[CreatedDate]
				FROM 
					FloatingPointImageEntries
				WHERE 
					Row between '+ CONVERT(nvarchar(10), (@PageIndex * @RowPerPage) + 1) +'And ('+ CONVERT(nvarchar(10), (@PageIndex * @RowPerPage) +@RowPerPage+ 1) +')'
	

SET @SQL2 =		' SELECT @TotalRows = COUNT(*) 
				FROM 
				[dbo].[FloatingPointImage] ' + @WhereClause
								
EXEC sp_executesql @SQL2, N'@TotalRows int output', @TotalRows = @TotalRows output

EXEC sp_executesql @SQL1

RETURN @@ROWCOUNT
END
GO

/****** Object:  StoredProcedure [dbo].GetFloatingPointImageByQuery    Script Date: 3/12/2021 11:42:24 AM  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFloatingPointImageByQuery]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetFloatingPointImageByQuery]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE GetFloatingPointImageByQuery
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
				[dbo].[FloatingPointImage] ' + @Query
								
EXEC sp_executesql @SQL1

RETURN @@ROWCOUNT
END
GO

