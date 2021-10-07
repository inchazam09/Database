CREATE PROCEDURE [exp].[TipoIdentificacionObtener]
      @IdTipoIdentificacion int= NULL
AS BEGIN
  SET NOCOUNT ON

  SELECT 
     I.IdTipoIdentificacion,
     I.Descripcion
        
    FROM EXP.TipoIdentificacion I
    WHERE
    (@IdTipoIdentificacion IS NULL OR @IdTipoIdentificacion=@IdTipoIdentificacion)

END