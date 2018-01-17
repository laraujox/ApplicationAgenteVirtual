IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_Sel_DataInicio')
	DROP PROCEDURE sp_Sel_DataInicio
	GO

CREATE PROCEDURE sp_Sel_DataInicio(
    @Operador	VARCHAR(5),
	@Valor	VARCHAR(200)
)
AS   
	DECLARE @Comando VARCHAR(MAX)

		IF TRY_CONVERT(DATETIME,@Valor) IS NOT NULL
			BEGIN

				SET @Comando = 'SELECT ID_Customer FROM [SKY].[db_SKYCarga].sky.Fatura 
				WHERE Ativo = 1 
							AND DataEnvio '+ @Operador + ' '''+ @Valor +''''

				EXECUTE(@Comando)

		END

		