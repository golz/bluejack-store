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
				<h1 class="title">Update Profile</h1>
				<%
					rs = st.executeQuery("SELECT * FROM users WHERE user_id="+session.getAttribute("id"));
					rs.first();
					String image = "images/"+rs.getString("photo");
				%>
				<div class="content profile-section" style="height:700px;width:80%;margin-bottom:15px;">
					<form method="POST" action="action/doUpdateProfile.jsp">
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
									<td>Old Password</td>
									<td>:</td>
									<td>
										<i class="fa fa-key" aria-hidden="true" style="margin-right:10px;"></i>
										<input type="password" placeholder="Old Password" class="class-text" name="old_password">
									</td>
								</tr>
								<tr>
									<td>New Password</td>
									<td>:</td>
									<td>
										<i class="fa fa-key" aria-hidden="true" style="margin-right:10px;"></i>
										<input type="password" placeholder="New Password" class="class-text" name="new_password">
									</td>
								</tr>
								<tr>
									<td>Confirm New Password</td>
									<td>:</td>
									<td>
										<i class="fa fa-key" aria-hidden="true" style="margin-right:10px;"></i>
										<input type="password" placeholder="Confirm New Password" class="class-text" name="confirm_password">
									</td>
								</tr>
								<tr>
									<td>Phone</td>
									<td>:</td>
									<td>
										<i class="fa fa-phone" aria-hidden="true" style="margin-right:10px;"></i>
										<input type="text" placeholder="Phone" class="class-text" name="txtPhone" value="<%=rs.getString("phone")%>">
									</td>
								</tr>
								<tr>
									<td>Address</td>
									<td>:</td>
									<td>
										<i class="fa fa-street-view" aria-hidden="true" style="margin-right:10px;"></i>
										<input type="text" placeholder="Address" class="class-text" name="txtAddress" value="<%=rs.getString("address")%>">
									</td>
								</tr>
								<tr>
									<td>Photo</td>
									<td>:</td>
									<td>
										<i class="fa fa-photo" aria-hidden="true" style="margin-right:10px;"></i>
										<input type="file" name="txtPhoto">
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<button class="my-button">Confirm</button>
									</td>
								</tr>
								<tr>
									<td colspan="3" style="text-align:center;">
										<font style="line-height:35px;font-size:11px;text-align:center;color:black;">
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
</html>
