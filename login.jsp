<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.Date, java.text.SimpleDateFormat" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Bluejack Store | Login</title>
		<link rel="stylesheet" type="text/css" href="style/style.css">
		<link rel="icon" href="images/icon.png" sizes="16x16" type="image/png"> 
		<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open Sans">
		<link rel="stylesheet" href="font-awesome-4.6.3/css/font-awesome.min.css">
	</head>
	<body>
		<div id="main-container">
			<header class="header-container">
				<div class="header-wrapper">
					<%
						if(session.getAttribute("email")==null)
						{
							%>
								<%@include file="guestheader.jsp"%>
							<%
						}
						else if(session.getAttribute("email")!=null)
						{	
							%>
								<%@include file="memberheader.jsp"%>
							<%
						}
					%>
				</div>
			</header>
			<div class="information-container">
				<div>
					<%
						if(session.getAttribute("email")!=null)
						{
							out.println("Hello, " + session.getAttribute("name") +"<br>");
							%>
								User Online : <%=application.getAttribute("online")%> <i class="fa fa-user" aria-hidden="true"></i>
								<br>
							<%
						}
						else
						{
							out.println("Hello, Guest <br>");
							%>
								User Online : <%=application.getAttribute("online")%> <i class="fa fa-user" aria-hidden="true"></i>
								<br>
							<%
						}
					%>
					<%= new SimpleDateFormat("MMM dd, yyyy").format(new Date()) %>
				</div>
			</div>
			<div class="body-container">
				<div class="push-top">	
				</div>
				<h1 class="title">Login</h1>
				<div class="login-form">
					<form method="POST" action="auth/doLogin.jsp">
						<center>
						<table>
							<tr>
								<td colspan="2"><input type="text" name="txtEmail" placeholder="email" class="my-text"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="password" name="txtPassword" placeholder="password" class="my-text"></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="remember"></td>
								<td style="color:white;">Remember Me</td>
							</tr>
							<tr>
								<td colspan="2"><a href="register.jsp" class="my-link">Don't have an account? Register here!</a></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="Login" class="my-button"> </td>
							</tr>
							<tr>
								<td colspan="2" style="text-align:center;">
									<font style="line-height:35px;font-size:11px;text-align:center;color:white;margin-top:15px;">
									<%
										if(request.getParameter("err")!=null)
										{
											out.print(request.getParameter("err"));
										}
									%>
									</font>
								</td>
							</tr>
						</table>
						</center>
					</form>
				</div>	
			</div>
			<footer class="footer-container">
				2016 &copy PT Bluejack Store 16-1
			</footer>
		</div>
	</body>
	<script type="text/javascript" src="script/jquery-3.1.0.min.js"></script>
</html>
