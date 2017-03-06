<!-- #include file="../../conector.asp" -->
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../../general.css">
	<title>Vehiculos</title>
</head>
<body>
	<a href="factura.asp">Ver factura</a>
	<%
		if (session("id")=0) then
			response.write("<a href='nuevo.asp'>Nueva reserva</a>")
			if (strcomp(request.form("Borrar"),"")) then
				consulta="DELETE FROM reservas WHERE cliente="&request.form("cliente")&" AND vehiculo='"&request.form("vehiculo")&"' AND inicio=#"&request.form("inicio")&"#;"
				set rs=con.Execute(consulta)
			end if
		end if
		response.write("<form action='#' method='get' accept-charset='utf-8'>")

		if (session("id")=0) then
		response.write("<label for='cliente'>Cliente</label><select name='cli' id='cliente'>")
			consulta="SELECT codigo,nombre FROM cliente;"
			set rs=con.execute(consulta)
			response.write("<option value=''>-</option>")
			do while not rs.eof
				response.write("<option value='"&rs("codigo")&"'>"&rs("nombre")&"</option>")
				rs.MoveNext
			loop
		response.write("</select><br>")
		else
			response.write("<input type='hidden' name='cli' value='"&session("id")&"'>")
		end if
		response.write("<label for='vehiculo'>Vehiculo</label><select name='vehi' id='vehiculo'>")
			consulta="SELECT * FROM vehiculo;"
			set rs=con.execute(consulta)
			response.write("<option value=''>-</option>")
			do while not rs.eof
				response.write("<option value='"&rs("matricula")&"'>"&rs("matricula")&","&rs("marca")&","&rs("modelo")&"</option>")
				rs.MoveNext
			loop
		response.write("</select><br>")
		response.write("<label for='inicio'>Inicio</label>")
		response.write("<input type='date' name='fecha' id='inicio'>")
		response.write("<input type='submit' name='Buscar' value='Buscar'>")
		response.write("</form>")

		if (strcomp(request.queryString("Buscar"),"")) then
			consulta="SELECT c.nombre, r.* FROM reservas r,cliente c WHERE c.codigo=r.cliente"
			if (strcomp(request.queryString("cli"),"")) then
				consulta=consulta+" AND cliente="&request.queryString("cli")
			end if
			if (strcomp(request.queryString("vehi"),"")) then
				consulta=consulta+" AND vehiculo='"&request.queryString("vehi")&"'"
			end if
			if (strcomp(request.queryString("fecha"),"")) then
				consulta=consulta+" AND inicio=#"&request.queryString("fecha")&"#"
			end if
		else
			if (session("id")=0) then
				consulta="SELECT c.nombre, r.* FROM reservas r,cliente c WHERE c.codigo=r.cliente;"
			else
				consulta="SELECT c.nombre, r.* FROM reservas r,cliente c WHERE c.codigo=r.cliente AND cliente="&session("id")&";"
			end if
		end if

		set rs=con.Execute(consulta)
			response.write("<table border><tr><td>Cliente</td><td>Vehiculo</td><td>Inicio</td><td>Fin</td>")
		if (session("id")=0) then
			response.write("<td>Borrar</td>")
		end if
		response.write("</tr>")
			do while not rs.eof
				response.write("<tr><td>")
				response.write(rs("nombre"))
				response.write("</td><td>")
				response.write(rs("vehiculo"))
				response.write("</td><td>")
				response.write(rs("inicio"))
				response.write("</td><td>")
				response.write(rs("fin"))
				if (session("id")=0) then
					response.write("</td><td>")
					if (date()>rs("inicio")) then
						response.write("<form action='#' method='post' accept-charset='utf-8'>")
						response.write("<input type='hidden' name='cliente' value='"&rs("cliente")&"'>")
						response.write("<input type='hidden' name='vehiculo' value='"&rs("vehiculo")&"'>")
						response.write("<input type='hidden' name='inicio' value='"&rs("inicio")&"'>")
						response.write("<input type='submit' name='Borrar' value='Borrar'></form>")
						response.write("</td>")
					else
						response.write("Pase")
					end if
				end if
				response.write("</td></tr>")
				rs.MoveNext
			loop
			response.write("</table>")
	%>
</body>
</html>