<!-- #include file="../../conector.asp" -->
<!DOCTYPE html>
<html>
<head>
	<title>Factura</title>
</head>
<body>
	<%
		if (session("id")=0) then
			response.write("<form action='#' method='get' accept-charset='utf-8'>")
			response.write("<label for='cliente'>Cliente</label><select name='cli' id='cliente'>")
			consulta="SELECT codigo,nombre FROM cliente;"
			set rs=con.execute(consulta)
			do while not rs.eof
				response.write("<option value='"&rs("codigo")&"'")
				if not (strcomp(request.querystring("cli"),rs("codigo"))) then
					response.write(" selected")
				end if
				response.write(">"&rs("nombre")&"</option>")
				rs.MoveNext
			loop
			response.write("</select>")
			response.write("<input type='submit' name='Buscar' value='Buscar'></form>")
		end if
		if not (session("id")=0) or (strcomp(request.querystring("cli"),"")) then
			
			if (strcomp(request.querystring("cli"),"")) then
				consulta="SELECT v.precio, r.* FROM reservas r, vehiculo v WHERE v.matricula=r.vehiculo AND cliente="&request.querystring("cli")&";"
			else
				consulta="SELECT v.precio, r.* FROM reservas r, vehiculo v WHERE v.matricula=r.vehiculo AND cliente="&session("id")&";"
			end if
			set rs=con.execute(consulta)
			total=0
			response.write("<table border>")
			response.write("<tr><td>Vehiculo</td><td>Inicio</td><td>Fin</td><td>Precio</td></tr>")
			do while not rs.eof
				response.write("<tr><td>"&rs("vehiculo")&"</td>")
				response.write("<td>"&rs("inicio")&"</td>")
				response.write("<td>"&rs("fin")&"</td>")
				if (rs("fin")<date()) then
					total=total+rs("precio")
					response.write("<td>"&rs("precio")&"</td>")
				else
					response.write("<td>Pend.</td>")
				end if
				response.write("</tr>")
				rs.moveNext
			loop
			response.write("<tr><td>Total</td><td></td><td></td><td>"&total&"</td></tr>")
			response.write("</table>")
		end if
		con.close
	%>
</body>
</html>