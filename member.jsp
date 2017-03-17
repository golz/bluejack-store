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
				<h1 class="title">All Active Member</h1>
				<div style="text-align:center;margin-bottom:20px;">
					<form method="GET" action="member.jsp">
						<input type="text" name="search" placeholder="Search Member" class="class-text"/>
						<button class="class-button" style="height : 50px;padding-top:1px;"><li class="fa fa-search" aria-hidden="true"></li></button>
					</form>
				</div>
				<%
					//Searching
					String query = "SELECT * FROM users";
					String search = "";
					if(request.getParameter("search")!=null)
					{
						search = request.getParameter("search");
						query += " WHERE name LIKE '%"+search+"%'";
					}
					rs = st.executeQuery(query);
					rs.beforeFirst();
					while(rs.next())
					{
						String image = "images/"+rs.getString("photo");
						%>
							<div class="content">
								<div class="product-image">
									<img src="<%=image%>" style="border-radius:50%;border:1px solid #00B0FF;">
								</div>
								<div class="product-information" style="text-align:left;">
									<table style="color:#00B0FF">
										<tr>
											<td style="color:#00B0FF;font-weight:bold;font-size:15px;" colspan="2">
												<%
													if(rs.getString("gender").equals("Male"))
													{	
														%>
															<i class="fa fa-male" aria-hidden="true"></i>
														<%
													}
													else
													{
														%>
															<i class="fa fa-female" aria-hidden="true"></i>
														<%
													}
												%>
												<%=rs.getString("name")%>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<i class="fa fa-phone" aria-hidden="true" ></i>
												<%=rs.getString("phone")%>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<i class="fa fa-inbox" aria-hidden="true" ></i>
												<%=rs.getString("email")%>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<i class="fa fa-birthday-cake" aria-hidden="true" ></i>
												<%=rs.getString("dob")%>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<i class="fa fa-street-view" aria-hidden="true" ></i>
												<%=rs.getString("address")%>
											</td>
										</tr>
									</table>
								</div>
							</div>
						<%
					}
				%>
			</div>

			<footer class="footer-container">
				2016 &copy PT Bluejack Store 16-1
			</footer>
		</div>
	</body>
</html>
