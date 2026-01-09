-- Drop and recreate (optional)
IF OBJECT_ID('dbo.Wimbledons_Champions', 'U') IS NOT NULL
    DROP TABLE dbo.Wimbledons_Champions;
GO

CREATE TABLE dbo.Wimbledons_Champions
(
    -- Optional surrogate key
    Id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Wimbledons_Champions PRIMARY KEY,

    [Gender] NVARCHAR(10) NOT NULL,
    [Champion] NVARCHAR(50) NOT NULL,
    [Mins] INT NULL,

    [Runner-up Nationality] CHAR(3) NULL,
    [Champion Nationality] CHAR(3) NOT NULL,

    [Runner-up] NVARCHAR(50) NULL,
    [Score] NVARCHAR(50) NOT NULL,

    -- Runner-up Seed contains values like 'U' (unseeded), so keep as text
    [Runner-up Seed] NVARCHAR(10) NULL,

    -- Champion Seed appears numeric
    [Champion Seed] SMALLINT NULL,

    [Year] INT NOT NULL,

    -- These appear to be alternate columns used for (some) rows in the CSV
    [Runner-up Nationality (Men''s)] CHAR(3) NULL,
    [Runner-Up] NVARCHAR(50) NULL
);
GO
