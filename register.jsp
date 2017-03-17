<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.Date, java.text.SimpleDateFormat" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Bluejack Store | Register</title>
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
					<h1 class="title">Register</h1>
					<div class="register-form">
						<center>
						<form method="POST" action="auth/doRegister.jsp">
							<table>
								<tr>
									<td>Full Name</td>
									<td>:</td>
									<td><input type="text" placeholder="Full Name" name="txtName" class="my-text"></td>
								</tr>
								<tr>
									<td>Phone</td>
									<td>:</td>
									<td><input type="text" placeholder="Phone Number" name="txtPhone" class="my-text"></td>
								</tr>
								<tr>
									<td>Email</td>
									<td>:</td>
									<td><input type="text" placeholder="Email" name="txtEmail" class="my-text"></td>
								</tr>
								<tr>
									<td>Password</td>
									<td>:</td>
									<td><input type="password" placeholder="Password" name="txtPassword" class="my-text"></td>
								</tr>
								<tr>
									<td>Confirm Password</td>
									<td>:</td>
									<td><input type="password" placeholder="Confirm Password" name="txtConfirm" class="my-text"></td>
								</tr>
								<tr>
									<td>Gender</td>
									<td>:</td>
									<td style="text-align:left;">
										<label class="label">
											<input type="radio" name="txtGender" value="Male">
											<span>Male</span>
										</label>
										<label class="label">
											<input type="radio" name="txtGender" value="Female">
											<span>Female</span>
										</label>
									</td>
								</tr>
								<tr>
									<td>Date of Birth</td>
									<td>:</td>
									<td>
										<input type="text" name="txtDOB" placeholder="yyyy/MM/dd" class="my-text">
									</td>
								</tr>
								<tr>
									<td>Address</td>
									<td>:</td>  
									<td><textarea placeholder="Address" name="txtAddress" rows="4" cols="18" wrap maxlength="255" class="my-text"></textarea></td>
								</tr>
								<tr>
									<td>Photo</td>
									<td>:</td>  
									<td>
										<label for="upload-photo" class="my-upload-photo">Browse...</label>
										<input type="file" name="txtPhoto" id="upload-photo" class="my-file" onchange="changeInputBrowse()"/>
									</td>
								</tr>
								<tr>
									
									<td colspan="3" style="text-align:center;">
										<center>
										<div class="preview" style="width :55px; height:55px;border:1px dashed #CCC;border-radius:50%;" id="preview-image-view1">
										</div>
										</center>
									</td>
									
								</tr>
								<tr>
									<td colspan="3"><input type="submit" value="Register" class="my-button" style="margin-top:-3px;"></td>
								</tr>
								<tr>
									<td colspan="3" style="text-align:center;">
										<font style="line-height:35px;font-size:11px;text-align:center;color:white;">
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
						</form>
						</center>
					</div>
			</div>
			<footer class="footer-container">
				2016 &copy PT Bluejack Store 16-1
			</footer>
		</div>
	</body>
	<script type="text/javascript" src="script/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
		function changeInputBrowse()
		{
			var img = document.createElement("img");
			img.src = "images/"+document.getElementById("upload-photo").files[0].name;

			var src = document.getElementById("preview-image-view1");
			src.removeChild(src.childNodes[0]);   
			src.appendChild(img);
		}
	</script>
</html>
