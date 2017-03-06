<!-- #include file="../../conector.asp" -->
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../../general.css">
	<title>Nuevo Cliente</title>
</head>
<body>
	<form action="#" method="post" accept-charset="utf-8">
		<label for="cliente">Cliente</label>
		<select name="cliente" id="cliente">
			<% 
				consulta="SELECT codigo,nombre FROM cliente;"
				set rs=con.execute(consulta)
				do while not rs.eof
					response.write("<option value='"&rs("codigo")&"'>"&rs("nombre")&"</option>")
					rs.MoveNext
				loop
			%>
		</select><br>
		<label for="vehiculo">Vehiculo</label>
		<select name="vehiculo" id="vehiculo">
			<% 
				consulta="SELECT * FROM vehiculo;"
				set rs=con.execute(consulta)
				do while not rs.eof
					response.write("<option value='"&rs("matricula")&"'>"&rs("matricula")&","&rs("marca")&","&rs("modelo")&"</option>")
					rs.MoveNext
				loop
			%>
		</select><br>
		<label for="inicio">Inicio</label>
		<input type="date" id="inicio" name="inicio" required><br>
		<label for="fin">Fin</label>
		<input type="date" id="fin" name="fin" required><br>
		<input type="submit" name="enviar" value="Enviar"><br>
	</form>
	<%
		if not (strcomp(request.form("enviar"),"Enviar")) then
			consulta="INSERT INTO reservas VALUES ('"&request.form("cliente")&"','"&request.form("vehiculo")&"','"&request.form("inicio")&"','"&request.form("fin")&"');"
			con.Execute(consulta)
			response.redirect "index.asp"
		end if
		con.close
	%>
</body>
</html>