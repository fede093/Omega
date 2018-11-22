CREATE PROCEDURE spEliminarJuego
(
@COD_JUEGO INT,
@NOMBRE NVARCHAR(50),
@DESCRIPCION NVARCHAR(50),
@FECHA DATE,
@DESARROLLADOR NVARCHAR(50),
@DISTRIBUIDOR NVARCHAR(50),
@GENERO INT,
@IDIOMA NVARCHAR(50),
@PRECIO FLOAT,
@RUTA_IMAGEN NVARCHAR(100),
@CLASIFICACION NVARCHAR(50),
@PAGINA_OFICIAL NVARCHAR(50)
)
AS
DELETE Juego WHERE Id_juego = @COD_JUEGO
RETURN