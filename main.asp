<!DOCTYPE html>
<html>
<head>
	<title>Principal</title>
</head>
<body>
	<a href="sec/cli/index.asp">Clientes</a>
	<ul>
		<%
			if (session("id")=0) then
				response.write("<li><a href='sec/cli/nuevo.asp'>Introducir nuevo cliente</a></li>")
			end if
		%>
	</ul>
	<a href="sec/vehi/index.asp">Vehículos</a>
	<ul>
		<%
			if (session("id")=0) then
				response.write("<li><a href='sec/vehi/nuevo.asp'>Introducir nuevo vehículo</a></li>")
			end if
		%>
	</ul>
	<a href="sec/res/index.asp">Reservas</a>
	<ul>
		<%
			if (session("id")=0) then
				response.write("<li><a href='sec/res/nuevo.asp'>Introducir nueva reserva</a></li>")
			end if
		%>
		<li><a href="sec/res/factura.asp">Ver factura</a></li>
	</ul>
	<a href="inicio.asp">Cerrar sesion</a>
</body>
</html>