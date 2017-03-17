<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.Date, java.text.SimpleDateFormat, java.text.DecimalFormat, java.text.DecimalFormatSymbols" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Bluejack Store | All Product</title>
		<link rel="stylesheet" type="text/css" href="style/style.css">
		<link rel="icon" href="images/icon.png" sizes="16x16" type="image/png"> 
		<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open Sans">
		<link rel="stylesheet" href="font-awesome-4.6.3/css/font-awesome.min.css">
	</head>
	<%@ include file="connect.jsp"%>
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
				<h1 class="title">Profile</h1>
				<%
					rs = st.executeQuery("SELECT * FROM users WHERE user_id="+session.getAttribute("id"));
					rs.first();
					String image = "images/"+rs.getString("photo");
				%>
				<div class="content profile-section" style="height:600px;width:80%;">
					<center>
						<table style="width:600px;">
							<tr>
								<center>
									<td colspan="3" class="profile-image" style="text-align:center;"> 
										<img src="<%=image%>" style="border-radius:50%;border:3px solid #00B0FF;">
									</td>
								</center>
							</tr>
							<tr>
								<td colspan="3">
									<hr style="margin-top:10px;display:block;height;1px;border:0;border-top:1px solid #00B0FF;margin:1em 0;padding:0;">
								</td>
							</tr>
							<tr>
								<td>Name</td>
								<td>:</td>
								<td>
									<i class="fa fa-tags" aria-hidden="true" style="margin-right:10px;"></i>
									<%=rs.getString("name")%>
								</td>
							</tr>
							<tr>
								<td>Phone</td>
								<td>:</td>
								<td>
									<i class="fa fa-phone" aria-hidden="true" style="margin-right:10px;"></i>
									<%=rs.getString("phone")%>
								</td>
							</tr>
							<tr>
								<td>Email</td>
								<td>:</td>
								<td>
									<i class="fa fa-inbox" aria-hidden="true" style="margin-right:10px;"></i>
									<%=rs.getString("email")%>
								</td>
							</tr>
							<tr>
								<td>Gender</td>
								<td>:</td>
								<td>
									<i class="fa fa-heart-o" aria-hidden="true" style="margin-right:10px;"></i>
									<%=rs.getString("gender")%>
								</td>
							</tr>
							<tr>
								<td>Date of Birth</td>
								<td>:</td>
								<td>
									<i class="fa fa-birthday-cake" aria-hidden="true" style="margin-right:10px;"></i>
									<%=rs.getString("dob")%>
								</td>
							</tr>
							<tr>
								<td>Address</td>
								<td>:</td>
								<td>
									<i class="fa fa-street-view" aria-hidden="true" style="margin-right:10px;"></i>
									<%=rs.getString("address")%>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<button class="my-button" onclick="window.location.href='updateprofile.jsp'">Update Profile</button>
								</td>
							</tr>
						</table>
					</center>
				</div>
			</div>

			<footer class="footer-container">
				2016 &copy PT Bluejack Store 16-1
			</footer>
		</div>
	</body>
</html>
