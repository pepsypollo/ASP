<!-- #include file="../../conector.asp" -->
<!DOCTYPE html>
<html>
<head>
	<title>Vehiculos</title>
</head>
<body>
	<%
		if (session("id")=0) then
			response.write("<a href='nuevo.asp'>Vehiculo nuevo</a>")
			response.write("<form action='#' method='get' accept-charset='utf-8'>")
				response.write("<input type='text' name='buscar'>")
				response.write("<input type='submit' name='enviar' value='Buscar'>")
			response.write("</form>")
			if (strcomp(request.form("Enviar"),"")) then
				consulta="UPDATE vehiculo SET matricula='"&request.form("matricula")&"',modelo='"&request.form("modelo")&"',marca='"&request.form("marca")&"',n_puertas="&request.form("puertas")&",categoria="&request.form("categoria")&",precio="&request.form("precio")&" WHERE matricula='"&request.form("matricula")&"';"
				con.execute(consulta)
			end if
		end if

			if (strcomp(request.queryString("Buscar"),"")) then
				consulta="SELECT * FROM vehiculo WHERE marca LIKE '%"&request.queryString("buscar")&"%' OR modelo LIKE '%"&request.queryString("buscar")&"%' OR matricula LIKE '%"&request.queryString("buscar")&"%';"
			else
				consulta="SELECT * FROM vehiculo;"
			end if
		set rs=con.Execute(consulta)
			response.write("<table border><tr><td>Matricula</td><td>Modelo</td><td>Marca</td><td>Nº Puertas</td><td>Categoria</td><td>Precio</td>")
		if (session("id")=0) then
			response.write("<td>Modificar</td>")
		end if
		response.write("</tr>")
			do while not rs.eof
				response.write("<tr><td>")
				response.write(rs("matricula"))
				response.write("</td><td>")
				response.write(rs("modelo"))
				response.write("</td><td>")
				response.write(rs("marca"))
				response.write("</td><td>")
				response.write(rs("n_puertas"))
				response.write("</td><td>")
				response.write(rs("categoria"))
				response.write("</td><td>")
				response.write(rs("precio"))
				if (session("id")=0) then
					response.write("</td><td>")
					response.write("<form action='#' method='post' accept-charset='utf-8'><input type='hidden' name='mat' value='"&rs("matricula")&"'><input type='submit' name='Cambiar' value='Cambiar'></form></td>")
				end if
				response.write("</td></tr>")
				rs.MoveNext
			loop
			response.write("</table>")

			if (strcomp(request.form("Cambiar"),"")) then

				consulta="SELECT * FROM vehiculo WHERE matricula='"&request.form("mat")&"';"
				set rs=con.Execute(consulta)
				if not rs.eof then
		%>
		<form action="#" method="post" accept-charset="utf-8">
			<label for="matricula">Matricula</label>
			<input type="text" id="matricula" name="matricula" value='<% response.write(rs("matricula")) %>' required><br>
			<label for="modelo">Modelo</label>
			<input type="text" id="modelo" name="modelo" value='<% response.write(rs("modelo")) %>' required><br>
			<label for="marca">Marca</label>
			<input type="text" id="marca" name="marca" value='<% response.write(rs("marca")) %>' required><br>
			<label for="puertas">Puertas</label>
			<input type="number" id="puertas" name="puertas" min=1 value='<% response.write(rs("n_puertas")) %>' required><br>
			<label for="categoria">Categoria</label>
			<input type="number" id="categoria" name="categoria" min=1 max=3 value='<% response.write(rs("categoria")) %>' required><br>
			<label for="precio">Precio</label>
			<input type="number" id="precio" name="precio" min=0 value='<% response.write(rs("precio")) %>' required><br>
			<input type="submit" name="Enviar" value="Enviar"><br>
		</form>
		<%
				end if
			end if
	%>
</body>
</html>