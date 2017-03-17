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
				<h1 class="title">Your Active Cart</h1>
				<%
					String query = "SELECT * FROM carts c JOIN cart_detail cd ON cd.cart_id = c.cart_id JOIN products p ON p.product_id = cd.product_id WHERE c.status = 'Active' AND c.user_id = '"+session.getAttribute("id")+"'";
					Integer totalPrice = 0;
					rs = st.executeQuery(query);
					rs.beforeFirst();
					if(!rs.next())
					{
						%>
							<div class="content" style="text-align:center;line-height:20px;color:#00B0FF;font-weight:bold;font-size:15px;">
								There is no product in your active cart
								<i class="fa fa-smile-o" style="display:block;font-size:30px;margin-top:10px;"></i>
							</div>

						<%
					}
					rs.beforeFirst();
					while(rs.next())
					{
						String image = "images/"+rs.getString("image");
						%>
							<div class="content">
								<div class="product-id" style="position:relative;left:0;background-color:#00B0FF;width:120px;height:25px;color:white;padding:3px;margin-left:-20px;margin-top:-20px;border-bottom-right-radius:100%;text-align:left;">
								<%=rs.getString("product_id")%>
								</div>
								<div class="product-image">
									<img src="<%=image%>">
								</div>
								<div class="product-information" style="text-align:left;">
									<table>
										<tr>
											<td>Name</td>
											<td>:</td>
											<td>
												<%=rs.getString("name")%>
											</td>
										</tr>
										<tr>
											<td>Quantity</td>
											<td>:</td>
											<td>
												<%=rs.getString("quantity")%>pcs
											</td>
										</tr>
										<tr>
											<td>Subtotal Price</td>
											<td>:</td>
											<td>
												Rp. <%=(Integer.parseInt(rs.getString("price"))*Integer.parseInt(rs.getString("quantity")))%>,-
												(Rp. <%=rs.getString("price")%>,- x <%=rs.getString("quantity")%>pcs)
												<%
													totalPrice +=  (Integer.parseInt(rs.getString("price"))*Integer.parseInt(rs.getString("quantity")));
												%>
											</td>
										</tr>
									</table>
								</div>
								<form method="GET" action="action/doDeleteCart.jsp">
									<div style="display:block;position:relative;float:right;">
										<input type="hidden" name="delete_id" id="delete_id" value="<%=rs.getString("product_id")%>">
								 		<button style="background-color:red;color:white;cursor:pointer;height:30px;width:30px;border:none;position:relative;float:right;display:block;padding:5px;margin-top:-125px;margin-right:-20px;">
								 			<li class="fa fa-remove" aria-hidden="true"></li>
								 		</button>	
									</div>
			 					</form>
							</div>
						<%
					}
					if(totalPrice!=0)
					{
						%>
							<div class="content" style="margin-bottom :10px;height:250px;">
								<div class="payment-title">
									<span class="dot">
										<i class="fa fa-circle" aria-hidden="true"></i>
									</span>
								</div>
								<center>
									<table style="width : 100%;text-align:center;">
										<tr>
											<td colspan="3">
												<span class="total-price">
													<i class="fa fa-credit-card" aria-hidden="true"></i>
													Rp. <%=totalPrice%>,-
												</span>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<button class="my-button" onclick="window.location.href='action/doCompleteCart.jsp'">Complete the Payment</button>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<div class="bank-bank">
													<img src="images/bca.png">
													<img src="images/mandiri.png">
													<img src="images/bri.png">
													<img src="images/bni.png">
													<img src="images/sinarmas.png">
												</div>
											</td>
										</tr>
									</table>
								</center>
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
