<!-- #include file="conector.asp" -->
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<%
		user=request.form("user")
		pass=request.form("pass")
		consulta="SELECT codigo,nombre FROM cliente WHERE nick='"&user&"' AND pass='"&pass&"';"
		set rs=con.Execute(consulta)
		if not rs.eof then
			session("nombre")=rs("nombre")
			session("id")=rs("codigo")
			response.redirect "main.asp"
		else
			if not strcomp(user,"admin") and not strcomp(pass,"admin") then
				session("nombre")="Administrador"
				session("id")=0
				response.redirect "main.asp"
			end if
			response.redirect "/.."
		end if
		con.close
	%>
</body>
</html>