<!-- #include file="../../conector.asp" -->
<!DOCTYPE html>
<html>
<head>
	<title>Nuevo Cliente</title>
</head>
<body>
	<form action="#" method="post" accept-charset="utf-8">
		<label for="nombre">Nombre</label>
		<input type="text" id="nombre" name="nombre" required><br>
		<label for="tel">Telefono</label>
		<input type="number" id="tel" name="tel" min="111111111" max="999999999" required><br>
		<label for="nick">Usuario</label>
		<input type="text" id="nick" name="nick" required><br>
		<label for="pass">Contraseña</label>
		<input type="password" id="pass" name="pass" required><br>
		<input type="submit" name="enviar" value="Enviar"><br>
	</form>
	<%
		if not (strcomp(request.form("enviar"),"Enviar")) then
			consulta="INSERT INTO cliente (nombre,telefono,nick,pass) VALUES ('"&request.form("nombre")&"','"&request.form("tel")&"','"&request.form("nick")&"','"&request.form("pass")&"');"
			con.Execute(consulta)
			con.close
			response.redirect "index.asp"
		end if
	%>
</body>
</html>