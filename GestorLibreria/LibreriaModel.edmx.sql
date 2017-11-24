
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/23/2017 10:15:36
-- Generated from EDMX file: C:\Users\SOPORTE\Source\Repos\GestorLibreria\GestorLibreria\LibreriaModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LibreriaHC];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHE	MA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'LibrosSet'
CREATE TABLE [dbo].[LibrosSet] (
    [ISBN] nvarchar(20)  NOT NULL,
    [Titulo] nvarchar(250)  NOT NULL,
    [Pais] nvarchar(250)  NOT NULL,
    [Stock] int  NOT NULL,
    [Editorial] nvarchar(250)  NOT NULL,
    [CategoriaId] int  NOT NULL
);
GO

-- Creating table 'CategoriasSet'
CREATE TABLE [dbo].[CategoriasSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Genero] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'AutoresSet'
CREATE TABLE [dbo].[AutoresSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [Apellido] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'LibroAutorSet'
CREATE TABLE [dbo].[LibroAutorSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [LibroISBN] nvarchar(20)  NOT NULL,
    [AutorId] int  NOT NULL
);
GO

-- Creating table 'LibroEjemplarSet'
CREATE TABLE [dbo].[LibroEjemplarSet] (
    [Codigo] nvarchar(30)  NOT NULL,
    [LibroISBN] nvarchar(20)  NOT NULL,
    [Numero] int  NOT NULL
);
GO

-- Creating table 'ClientesSet'
CREATE TABLE [dbo].[ClientesSet] (
    [Identificacion] nvarchar(25)  NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [Apellido] nvarchar(100)  NOT NULL,
    [Telefono] nvarchar(20)  NOT NULL,
    [Correo] nvarchar(30)  NOT NULL
);
GO

-- Creating table 'DireccionSet'
CREATE TABLE [dbo].[DireccionSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ClienteID] nvarchar(25)  NOT NULL,
    [Sector] nvarchar(50)  NOT NULL,
    [Pais] nvarchar(50)  NOT NULL,
    [Calle] nvarchar(50)  NOT NULL,
    [Provincia] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'HistorialPrestamoSet'
CREATE TABLE [dbo].[HistorialPrestamoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [LibroEjemplarCodigo] nvarchar(30)  NOT NULL,
    [ClientesIdentificacion] nvarchar(25)  NOT NULL,
    [Fecha_Ini] datetime  default GETDATE(),
    [Fecha_Fin] datetime  NOT NULL,
    [Estado] int  NOT NULL
);
GO

-- Creating table 'VariablesSet'
CREATE TABLE [dbo].[VariablesSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [Valor] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'CredencialesSet'
CREATE TABLE [dbo].[CredencialesSet] (
    [Codigo] nvarchar(50)  NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [Password] nvarchar(250)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ISBN] in table 'LibrosSet'
ALTER TABLE [dbo].[LibrosSet]
ADD CONSTRAINT [PK_LibrosSet]
    PRIMARY KEY CLUSTERED ([ISBN] ASC);
GO

-- Creating primary key on [Id] in table 'CategoriasSet'
ALTER TABLE [dbo].[CategoriasSet]
ADD CONSTRAINT [PK_CategoriasSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AutoresSet'
ALTER TABLE [dbo].[AutoresSet]
ADD CONSTRAINT [PK_AutoresSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LibroAutorSet'
ALTER TABLE [dbo].[LibroAutorSet]
ADD CONSTRAINT [PK_LibroAutorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC,[LibroISBN], [AutorId]);
GO

-- Creating primary key on [Codigo] in table 'LibroEjemplarSet'
ALTER TABLE [dbo].[LibroEjemplarSet]
ADD CONSTRAINT [PK_LibroEjemplarSet]
    PRIMARY KEY CLUSTERED ([Codigo] ASC);
GO

-- Creating primary key on [Identificacion] in table 'ClientesSet'
ALTER TABLE [dbo].[ClientesSet]
ADD CONSTRAINT [PK_ClientesSet]
    PRIMARY KEY CLUSTERED ([Identificacion] ASC);
GO

-- Creating primary key on [Id], [ClienteID] in table 'DireccionSet'
ALTER TABLE [dbo].[DireccionSet]
ADD CONSTRAINT [PK_DireccionSet]
    PRIMARY KEY CLUSTERED ([Id], [ClienteID] ASC);
GO

-- Creating primary key on [Id] in table 'HistorialPrestamoSet'
ALTER TABLE [dbo].[HistorialPrestamoSet]
ADD CONSTRAINT [PK_HistorialPrestamoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC,[LibroEjemplarCodigo]);
GO

-- Creating primary key on [Id] in table 'VariablesSet'
ALTER TABLE [dbo].[VariablesSet]
ADD CONSTRAINT [PK_VariablesSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Codigo] in table 'CredencialesSet'
ALTER TABLE [dbo].[CredencialesSet]
ADD CONSTRAINT [PK_CredencialesSet]
    PRIMARY KEY CLUSTERED ([Codigo] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategoriaId] in table 'LibrosSet'
ALTER TABLE [dbo].[LibrosSet]
ADD CONSTRAINT [FK_CategoriaLibro]
    FOREIGN KEY ([CategoriaId])
    REFERENCES [dbo].[CategoriasSet]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriaLibro'
CREATE INDEX [IX_FK_CategoriaLibro]
ON [dbo].[LibrosSet]
    ([CategoriaId]);
GO

-- Creating foreign key on [LibroISBN] in table 'LibroAutorSet'
ALTER TABLE [dbo].[LibroAutorSet]
ADD CONSTRAINT [FK_LibrosLibroAutor]
    FOREIGN KEY ([LibroISBN])
    REFERENCES [dbo].[LibrosSet]
        ([ISBN])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LibrosLibroAutor'
CREATE INDEX [IX_FK_LibrosLibroAutor]
ON [dbo].[LibroAutorSet]
    ([LibroISBN]);
GO

-- Creating foreign key on [AutorId] in table 'LibroAutorSet'
ALTER TABLE [dbo].[LibroAutorSet]
ADD CONSTRAINT [FK_AutoresLibroAutor]
    FOREIGN KEY ([AutorId])
    REFERENCES [dbo].[AutoresSet]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AutoresLibroAutor'
CREATE INDEX [IX_FK_AutoresLibroAutor]
ON [dbo].[LibroAutorSet]
    ([AutorId]);
GO

-- Creating foreign key on [LibroISBN] in table 'LibroEjemplarSet'
ALTER TABLE [dbo].[LibroEjemplarSet]
ADD CONSTRAINT [FK_LibrosLibroEjemplar]
    FOREIGN KEY ([LibroISBN])
    REFERENCES [dbo].[LibrosSet]
        ([ISBN])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LibrosLibroEjemplar'
CREATE INDEX [IX_FK_LibrosLibroEjemplar]
ON [dbo].[LibroEjemplarSet]
    ([LibroISBN]);
GO

-- Creating foreign key on [LibroEjemplarCodigo] in table 'HistorialPrestamoSet'
ALTER TABLE [dbo].[HistorialPrestamoSet]
ADD CONSTRAINT [FK_LibroEjemplarHistorialPrestamo]
    FOREIGN KEY ([LibroEjemplarCodigo])
    REFERENCES [dbo].[LibroEjemplarSet]
        ([Codigo])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LibroEjemplarHistorialPrestamo'
CREATE INDEX [IX_FK_LibroEjemplarHistorialPrestamo]
ON [dbo].[HistorialPrestamoSet]
    ([LibroEjemplarCodigo]);
GO

-- Creating foreign key on [ClientesIdentificacion] in table 'HistorialPrestamoSet'
ALTER TABLE [dbo].[HistorialPrestamoSet]
ADD CONSTRAINT [FK_ClientesHistorialPrestamo]
    FOREIGN KEY ([ClientesIdentificacion])
    REFERENCES [dbo].[ClientesSet]
        ([Identificacion])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO
----
alter table[dbo].[DireccionSet]
add Constraint [FK_DireccionCliente]
	foreign Key (ClienteID)
	references [dbo].[ClientesSet]
		([Identificacion])
	on Delete no action on update no action;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientesHistorialPrestamo'
CREATE INDEX [IX_FK_ClientesHistorialPrestamo]
ON [dbo].[HistorialPrestamoSet]
    ([ClientesIdentificacion]);
GO


-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
