<!-- #include file="../../conector.asp" -->
<!DOCTYPE html>
<html>
<head>
	<title>Nuevo Cliente</title>
</head>
<body>
	<form action="#" method="post" accept-charset="utf-8">
		<label for="matricula">Matricula</label>
		<input type="text" id="matricula" name="matricula" required><br>
		<label for="modelo">Modelo</label>
		<input type="text" id="modelo" name="modelo" required><br>
		<label for="marca">Marca</label>
		<input type="text" id="marca" name="marca" required><br>
		<label for="puertas">Puertas</label>
		<input type="number" id="puertas" name="puertas" min=1 required><br>
		<label for="categoria">Categoria</label>
		<input type="number" id="categoria" name="categoria" min=1 max=3 required><br>
		<label for="precio">Precio</label>
		<input type="number" id="precio" name="precio" min=0 required><br>
		<input type="submit" name="enviar" value="Enviar"><br>
	</form>
	<%
		if not (strcomp(request.form("enviar"),"Enviar")) then
			consulta="INSERT INTO vehiculo VALUES ('"&request.form("matricula")&"','"&request.form("modelo")&"','"&request.form("marca")&"',"&request.form("puertas")&","&request.form("categoria")&","&request.form("precio")&");"
			con.Execute(consulta)
			con.close
			response.redirect "index.asp"
		end if
	%>
</body>
</html>