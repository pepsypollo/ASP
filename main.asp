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
				response.write("<li><a href=''>Introducir nuevo cliente</a></li>")
				response.write("<li><a href=''>Listar todos los clientes</a></li>")
				response.write("<li><a href=''>Buscar cliente por nombre</a></li>")
			end if
		%>
		<li><a href="">Ver factura</a></li>
	</ul>
	<a href="sec/vehi/index.asp">Vehículos</a>
	<ul>
		<%
			if (session("id")=0) then
				response.write("<li><a href=''>Introducir nuevo vehículo</a></li>")
				response.write("<li><a href=''>Modificar vehículo</a></li>")
				response.write("<li><a href=''>Buscar vehículo</a></li>")
			end if
		%>
		<li><a href="">Listar todos los vehículos</a></li>
	</ul>
	<a href="sec/res/index.asp">Reservas</a>
	<ul>
		<%
			if (session("id")=0) then
				response.write("<li><a href=''>Introducir nueva reserva</a></li>")
				response.write("<li><a href=''>Borrar reservas canceladas</a></li>")
			end if
		%>
		<li><a href="">Buscar reserva</a></li>
		<li><a href="">Listado reservas</a></li>
		<li><a href="">Ver factura</a></li>
	</ul>
</body>
</html>