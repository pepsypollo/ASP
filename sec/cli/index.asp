<!-- #include file="../../conector.asp" -->
<!DOCTYPE html>
<html>
<head>
	<title>Clientes</title>
</head>
<body>
	<a href="/main.asp">Volver</a>
	<%
		if (session("id")=0) then
			response.write("<form action='#' method='get' accept-charset='utf-8'>")
				response.write("<input type='text' name='buscar'>")
				response.write("<input type='submit' name='enviar' value='Buscar'>")
			response.write("</form>")
			response.write("<a href='nuevo.asp'>Nuevo cliente</a>")
			if not (strcomp(request.queryString("enviar"),"Buscar")) then
				consulta="SELECT nombre,telefono,nick,pass FROM cliente WHERE nombre LIKE '%"&request.queryString("buscar")&"%';"
			else
				consulta="SELECT nombre,telefono,nick,pass FROM cliente;"
			end if
			set rs=con.Execute(consulta)
			response.write("<table border><tr><td>Nombre</td><td>Telefono</td><td>Nick</td><td>Pass</td></tr>")
			do while not rs.eof
				response.write("<tr><td>")
				response.write(rs("nombre"))
				response.write("</td><td>")
				response.write(rs("telefono"))
				response.write("</td><td>")
				response.write(rs("nick"))
				response.write("</td><td>")
				response.write(rs("pass"))
				response.write("</td></tr>")
				rs.MoveNext
			loop
			response.write("</table>")
		else
			consulta="SELECT modelo,marca,inicio,fin,precio FROM vehiculo v,reservas r WHERE matricula=vehiculo AND cliente="&session("id")
			set rs=con.Execute(consulta)
			response.write("<table border><tr><td>Modelo</td><td>Marca</td><td>Inicio</td><td>Fin</td><td>Precio</td></tr>")
			do while not rs.eof
				response.write("<tr><td>")
				response.write(rs("modelo"))
				response.write("</td><td>")
				response.write(rs("marca"))
				response.write("</td><td>")
				response.write(rs("inicio"))
				response.write("</td><td>")
				response.write(rs("fin"))
				response.write("</td><td>")
				response.write(rs("precio"))
				response.write("</td></tr>")
				rs.MoveNext
			loop
			response.write("</table>")
		end if
		con.close
	%>
</body>
</html>