<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.Date, java.text.SimpleDateFormat" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Bluejack Store | Home</title>
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
					<h1 class="title">Welcome to Bluejack Store</h1>
					<div class="content" style="background-color : white">
						<img src="images/welcome.png" class="my-image">
						<p style="text-indent:50px;font-size:15px;">
							<font style="color:#00B0FF;font-weight:bold;font-size:18px;">Bluejack Store</font> is a market / largest online mall in Indonesia which allows individuals and business owners in Indonesia to open and manage their online stores easily and free of charge, as well as provide an online shopping experience that is safer and more comfortable. Online trading becomes more enjoyable. Have an online shop? Open your branch in <font style="color:#00B0FF;font-weight:bold;font-size:18px;">Bluejack Store</font> now! Free!
						</p>
					</div>
				<!-- 	<div class="content">
						<div class="product-image">
							<img src="images/icon.png">
						</div>
						<div class="product-information">
							<span class="product-name">Product Name</span>
							<span class="product-price">Product Price</span>
							<span class="product-weight">Weight</span>
							<span class="product-stock">Stock</span>
						</div>
						<button class="view-product">
							<span>View Product</span>
						</button>
					</div> -->
			</div>
			<footer class="footer-container">
				2016 &copy PT Bluejack Store 16-1
			</footer>
		</div>
	</body>
	<script type="text/javascript" src="script/jquery-3.1.0.min.js"></script>
</html>
