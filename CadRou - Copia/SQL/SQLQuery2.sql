USE [Integrado]
GO
/****** Object:  StoredProcedure [dbo].[ROTINAS_ROUPARIA]    Script Date: 03/25/2022 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ROTINAS_ROUPARIA] 
	@T INT,
	@USU Varchar(50),
	@COD decimal(18,0),
	@COD1 decimal(18,0),
	@COD2 decimal(18,0),
	@DATA DATETIME,
	@STR VARCHAR(100),
	@STR2 VARCHAR(100),
	@STR3 char(1),
	@OBS Varchar(50),
	@QTDE int,
	@EST decimal(18,0)
AS

IF @T = 1
BEGIN
	BEGIN TRANSACTION
		INSERT INTO rp_mov 
		(cod_material, data, motivo, mot_out, Qtde, Est_Total)
		VALUES
		(@COD, @DATA, @STR, @STR2, @QTDE, @EST)
		IF @@ERROR <> 0
	BEGIN
		RAISERROR('Erro na Inclusao/Alteracao do Registro', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION
		RETURN
	END
END	
IF @T = 12
BEGIN
	BEGIN TRANSACTION
		UPDATE RP_CAD
		SET Est_Roupa = Est_Roupa + @QTDE
		WHERE Codigo = @COD	
		IF @@ERROR <> 0
	BEGIN
		RAISERROR('Erro na Inclusao/Alteracao do Registro', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION
		RETURN
	END
END			

IF @T = 2
BEGIN
	BEGIN TRANSACTION
		INSERT INTO RP_REQ 
		(Usu_Sol, Material, cod_mat, Qtde, Setor, OBSERVACAo, data, liberacao)
		VALUES 
		(@USU, @STR, @COD1, @QTDE, @STR2, @OBS, @DATA, @STR3)
		IF @@ERROR <> 0
	BEGIN
		RAISERROR('Erro na Inclusao/Alteracao do Registro', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION
		RETURN
	END
END	

	IF @T = 3
		BEGIN
			IF(SELECT EST_ROUPA FROM RP_CAD WITH (NOLOCK) WHERE Codigo = @COD) >= @QTDE
			BEGIN
				BEGIN TRANSACTION
					UPDATE RP_CAD
					SET	Est_Roupa = Est_Roupa - @QTDE WHERE Codigo = @COD
				IF @@ERROR <> 0	
		BEGIN
			RAISERROR('Erro na Inclusao/Alteracao do Registro', 16, 1)
			ROLLBACK TRANSACTION
			RETURN
		END
		ELSE
		BEGIN
			COMMIT TRANSACTION
			RETURN
		END
		end else begin
			RAISERROR('Estoque Insuficiente, Favor Verificar com a Rouparia.', 16, 1)
			ROLLBACK TRANSACTION
			RETURN
	end
				
END
	IF @T = 36
		BEGIN
			IF((SELECT qtde FROM RP_REQ WITH (NOLOCK) WHERE req = @COD2) >= @QTDE)
			BEGIN
				BEGIN TRANSACTION
					UPDATE RP_CAD
					SET	Est_Roupa = Est_Roupa + @QTDE WHERE Codigo = @COD
					
					UPDATE RP_REQ
					SET RETORNO = @QTDE
					WHERE Req = @COD2
					
					UPDATE RP_REQ SET Liberacao = 'R' WHERE Req = @COD2
		IF @@ERROR <> 0
		BEGIN
			RAISERROR('Erro na Inclusao/Alteracao do Registro', 16, 1)
			ROLLBACK TRANSACTION
			RETURN
		END
		ELSE
		BEGIN
			COMMIT TRANSACTION
			RETURN
		END
	end else begin
			RAISERROR('Retorno maior que o estoque total.', 16, 1)
			ROLLBACK TRANSACTION
			RETURN
	
	end
END
	IF @T = 4
		BEGIN
			BEGIN TRANSACTION
			UPDATE RP_REQ
			SET Liberacao = 'E', Data_Lib = CURRENT_TIMESTAMP, Usu_Lib = @COD2
			where Req = @COD1
			IF @@ERROR <> 0
	BEGIN
		RAISERROR('Erro na Inclusao/Alteracao do Registro', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION
		RETURN
	END
	END
	IF @T = 5
BEGIN
	BEGIN TRANSACTION
				
		UPDATE RP_REQ SET Liberacao = 'F' WHERE Req = @COD

	IF @@ERROR <> 0
	BEGIN
		RAISERROR('Erro na Inclusao/Alteracao do Registro', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION
		RETURN
	END
END
IF @T = 6
BEGIN
	BEGIN TRANSACTION
				
		UPDATE RP_REQ SET Liberacao = 'A' WHERE Req = @COD
		

	IF @@ERROR <> 0
	BEGIN
		RAISERROR('Erro na Inclusao/Alteracao do Registro', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION
		RETURN
	END
end
if @T = 7
begin
		select top(100) c.codigo, c.est_total, c.est_roupa, r.*
		from RP_CAD as c, RP_REQ as r
		where c.Codigo = r.cod_mat
		order by r.Req desc	
end
if @T = 8
begin
	select top(100) c.codigo, c.est_total, c.est_roupa, r.*
		from RP_CAD as c, RP_REQ as r
		where c.Codigo = r.cod_mat
		and r.Liberacao <> 'R'
		order by r.Req desc
end
IF @T = '302'
BEGIN
	SELECT * FROM RP_CAD WITH (NOLOCK)
	WHERE Descricao LIKE @BUSCA
	ORDER BY Codigo	
END
IF @T = '303'
BEGIN
	SELECT * FROM RP_CAD WITH (NOLOCK)
	ORDER BY Codigo
END
IF @T = '304'
BEGIN
	select b.cod_material, b.DATA, b.motivo, b.qtde, b.est_total, a.est_total as Estoque_Hospital
	from RP_CAD as a, RP_MOV as b
	where b.cod_material = a.Codigo
END