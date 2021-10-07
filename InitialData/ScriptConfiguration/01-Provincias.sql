--Script no compilado--

DROP TABLE IF EXISTS #ProvinciaTemp

SELECT 
IdProvincia, NombreProvincia INTO #ProvinciaTemp
FROM(
VALUES
(1, 'San Jose'),
(2, 'Alajuela'),
(3, 'Cartago'),
(4, 'Puntarenas'),
(5, 'Heredia'),
(6, 'Guanacaste'),
(7, 'Limon')

)AS TEMP (IdProvincia, NombreProvincia)


----ACTUALIZAR DATOS---
UPDATE P SET
  P.NombreProvincia= TM.NombreProvincia
FROM Dbo.Provincia P
INNER JOIN #ProvinciaTemp TM
    ON P.IdProvincia= TM.IdProvincia


----INSERTAR DATOS---

SET IDENTITY_INSERT dbo.Provincia ON

INSERT INTO dbo.Provincia(
IdProvincia, NombreProvincia)
SELECT
IdProvincia, NombreProvincia
FROM #ProvinciaTemp


EXCEPT
SELECT
IdProvincia, NombreProvincia
FROM dbo.Provincia


SET IDENTITY_INSERT dbo.Provincia OFF

GO