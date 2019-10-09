USE master

USE Restaurante

--- STORED PROCEDURES ---

--- EMPLEADOS ---

--- INSERTAR ---

CREATE PROCEDURE usp_InsertarEmpleado
	@dniempl INT,
	@nomempl VARCHAR(30),
	@apeempl VARCHAR (20),
	@dist INT,
	@direcempl VARCHAR(30),
	@telempl NUMERIC,
	@sexo BIT,
	@cargo VARCHAR(15)

	AS
	DECLARE @idempl INT
	DECLARE @contempl INT

	SET @contempl=(SELECT COUNT(*) FROM Empleados)
	
	IF @contempl = 0 
		SET @contempl = '1'
	ELSE
        SET @idempl = (SELECT Right (MAX (Right (id_empl, 2) + 1 ), 2) 
    FROM Empleados)

	INSERT INTO Empleados VALUES(@dniempl, @nomempl, @apeempl, @dist, @direcempl, @telempl, @sexo, @cargo)

GO

--- ACTUALIZAR ---

CREATE PROCEDURE usp_ActualizarEmpleado
	@idempl INT,
	@dniempl INT,
	@nomempl VARCHAR(30),
	@apeempl VARCHAR (20),
	@dist INT,
	@direcempl VARCHAR(30),
	@telempl NUMERIC,
	@sexo BIT,
	@cargo VARCHAR(15)

	AS
	UPDATE Empleados SET dni_empl=@dniempl, nom_empl=@nomempl, ape_empl=@apeempl,
													@dist=@dist, direc_empl=direc_empl, tel_empl=@telempl,
													sexo=@sexo, cargo=@cargo
	WHERE id_empl=@idempl
	GO

--- ELIMINAR ---

CREATE PROCEDURE usp_EliminarEmpleado
	@idempl INT
	AS
	DELETE FROM Empleados
	WHERE id_empl=@idempl
GO

--- CONSULTAR ---

CREATE PROCEDURE usp_ConsultarEmpleado
	@idempl int
	AS
	SELECT id_empl, dni_empl, nom_empl, ape_empl, id_dist, direc_empl, tel_empl, sexo, cargo
	FROM Empleados 
	WHERE id_empl=@idempl
GO

--- LISTAR ---
CREATE PROCEDURE usp_ListarEmpleado
	AS
	SELECT id_empl, dni_empl, nom_empl, ape_empl, id_dist, direc_empl, tel_empl, sexo, cargo
	FROM Empleados 
GO

	--- CLIENTES ---

		--- INSERTAR --

CREATE PROCEDURE usp_InsertarCliente
	@dnicli INT,
	@nomcli VARCHAR(30),
	@apecli VARCHAR (30),
	@ruccli INT,
	@telcli NUMERIC

	AS
	DECLARE @idcli INT
	DECLARE @contcli INT

	SET @contcli=(SELECT COUNT(*) FROM Clientes)
	
	IF @contcli = 0 
		SET @contcli = '1'
	ELSE
        SET @idcli = (SELECT Right (MAX (Right (id_cli, 2) + 1 ), 2) 
    FROM Clientes)

	INSERT INTO Clientes VALUES(@dnicli, @nomcli, @apecli, @ruccli, @telcli)
GO

--- ACTUALIZAR ---

CREATE PROCEDURE usp_ActualizarCliente
	@idcli INT,
	@dnicli INT,
	@nomcli VARCHAR(30),
	@apecli VARCHAR (30),
	@ruccli INT,
	@telcli NUMERIC

	AS
	UPDATE Clientes SET dni_cli=@dnicli, nom_cli=@nomcli, ape_cli=@apecli,
										ruc_cli=ruc_cli, tel_cli=@telcli
	WHERE id_cli=@idcli
GO

			--- ELIMINAR ---

CREATE PROCEDURE usp_EliminarCliente
	@idcli INT
	AS
	DELETE FROM Clientes
	WHERE id_cli=@idcli
GO

--- CONSULTAR ---

CREATE PROCEDURE usp_ConsultarCliente
	@idcli int
	AS
	SELECT id_cli, dni_cli, nom_cli, ape_cli, ruc_cli, tel_cli
	FROM Clientes 
	WHERE id_cli=@idcli
GO
		
--- LISTAR ---

CREATE PROCEDURE usp_ListarCliente
	AS
	SELECT id_cli, dni_cli, nom_cli, ape_cli, ruc_cli, tel_cli
	FROM Clientes 
GO

--- PEDIDOS ---
		
--- INSERTAR ---

CREATE PROCEDURE usp_InsertarPedido
	@idcli INT,
	@idplato INT,
	@cantplato SMALLINT,
	@idmesa INT,
	@tipopedi BIT,
	@estapedi BIT

	AS
	DECLARE @idpedi INT
	DECLARE @contpedi INT

	SET @contpedi=(SELECT COUNT(*) FROM Pedidos)
	
	IF @contpedi = 0 
		SET @contpedi = '1'
	ELSE
        SET @idpedi = (SELECT Right (MAX (Right (id_pedi, 2) + 1 ), 2) 
    FROM Pedidos)

	INSERT INTO Pedidos VALUES(@idcli, @idplato, @cantplato, @idmesa, @tipopedi, @estapedi)
GO

--- ACTUALIZAR ---

CREATE PROCEDURE usp_ActualizarPedido
	@idpedi INT,
	@idcli INT,
	@idplato INT,
	@cantplato SMALLINT,
	@idmesa INT,
	@tipopedi BIT,
	@estapedi BIT

	AS
	UPDATE Pedidos SET id_pedi=@idpedi, id_cli=@idcli, @idplato=@idplato,
												cant_plato=@cantplato, id_mesa=@idmesa,
												tipo_pedi=@tipopedi, esta_pedi=@estapedi
	WHERE id_pedi=@idpedi
GO

--- ELIMINAR ---

CREATE PROCEDURE usp_EliminarPedido
	@idpedi INT
	AS
	DELETE FROM Pedido
	WHERE id_pedi=@idpedi
GO

--- CONSULTAR ---

CREATE PROCEDURE usp_ConsultarPedido
	@idpedi int
	AS
	SELECT id_pedi, id_cli, id_plato, cant_plato, id_mesa, tipo_pedi, esta_pedi
	FROM Pedidos 
	WHERE id_pedi=@idpedi
GO

--- LISTAR ---

CREATE PROCEDURE usp_ListarPedido
	AS
	SELECT id_pedi, id_cli, id_plato, cant_plato, id_mesa, tipo_pedi, esta_pedi
	FROM Pedidos 
GO

--- PLATOS ---

--- INSERTAR ---

CREATE PROCEDURE usp_InsertarPlato
	@nomplato VARCHAR(30),
	@catplato VARCHAR(10),
	@precioplato MONEY

	AS
	DECLARE @idplato INT
	DECLARE @contplato INT

	SET @contplato=(SELECT COUNT(*) FROM Platos)
	
	IF @contplato = 0 
		SET @contplato = '1'
	ELSE
        SET @contplato = (SELECT Right (MAX (Right (@idplato, 2) + 1 ), 2) 
    FROM Platos)

	INSERT INTO Platos VALUES(@nomplato, @catplato, @precioplato)
GO

--- ACTUALIZAR ---

CREATE PROCEDURE usp_ActualizarPlato
	@idplato INT,
	@nomplato VARCHAR(30),
	@catplato VARCHAR(10),
	@precioplato MONEY

	AS
	UPDATE Platos SET nom_plato=@nomplato, precio_plato=@precioplato
	WHERE id_plato=@idplato
	GO

--- ELIMINAR ---

CREATE PROCEDURE usp_EliminarPlato
	@idplato INT
	AS
	DELETE FROM Platos
	WHERE id_plato=@idplato
GO

--- CONSULTAR ---

CREATE PROCEDURE usp_ConsultarPlato
	@idplato int
	AS
	SELECT id_plato, nom_plato, precio_plato
	FROM Platos 
	WHERE id_plato=@idplato
GO

--- LISTAR ---

CREATE PROCEDURE usp_ListarPlato
	AS
	SELECT id_plato, nom_plato, precio_plato
	FROM Platos 
GO

--- MESAS ---

--- INSERTAR ---

CREATE PROCEDURE usp_InsertarMesa
	@nummesa TINYINT

	AS
	DECLARE @idmesa INT
	DECLARE @contmesa INT

	SET @contmesa=(SELECT COUNT(*) FROM Mesas)
	
	IF @contmesa = 0 
		SET @contmesa = '1'
	ELSE
        SET @contmesa = (SELECT Right (MAX (Right (@idmesa, 2) + 1 ), 2) 
    FROM Mesas)

	INSERT INTO Mesa VALUES(@nummesa)
GO

--- ACTUALIZAR ---

CREATE PROCEDURE usp_ActualizarMesa
	@idmesa TINYINT,
	@nummesa TINYINT

	AS
	UPDATE Mesas SET num_mesa=@nummesa
	WHERE id_mesa=@idmesa
GO

--- ELIMINAR

CREATE PROCEDURE usp_EliminarMesa
	@idmesa INT
	AS
	DELETE FROM Mesas
	WHERE id_mesa=@idmesa
GO

--- CONSULTAR ---

Create PROCEDURE usp_ConsultarMesa
	@idmesa TINYINT
	AS
	SELECT id_mesa, num_mesa
	FROM Mesa 
	WHERE id_mesa=@idmesa
GO

--- LISTAR ---

CREATE PROCEDURE usp_ListarMesa	
	AS
	SELECT id_mesa, num_mesa
	FROM Mesas
GO

---DISTRITOS ---

--- LISTAR ---
CREATE PROCEDURE usp_ListarDistrito	
	AS
	SELECT id_dist, nom_dist
	FROM Distritos
GO
