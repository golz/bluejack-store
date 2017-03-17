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
				<h1 class="title">Transaction</h1>
				<%
					String query = "";
					if(session.getAttribute("role").equals("Admin"))
					{
						query = "SELECT * FROM carts c JOIN users u ON c.user_id = u.user_id WHERE c.status != 'Active'";
					}
					else if(session.getAttribute("role").equals("Member"))
					{
						query = "SELECT * FROM carts c JOIN users u ON c.user_id = u.user_id WHERE c.status != 'Active' AND c.user_id ="+session.getAttribute("id");
					}
					rs = st.executeQuery(query);
					rs.beforeFirst();
					if(!rs.next())
					{
						%>
							<div class="content" style="text-align:center;line-height:20px;color:#00B0FF;font-weight:bold;font-size:15px;">
								There is no transaction history
								<i class="fa fa-smile-o" style="display:block;font-size:30px;margin-top:10px;"></i>
							</div>

						<%
					}
					//Paging
					int currentPage = 1;
					int itemPerPage = 5;
					rs.last();
					int totalItem = rs.getRow();
					int totalPage = (int)Math.ceil((double)totalItem/itemPerPage);
					if(request.getParameter("page")!=null)
					{
						currentPage = Integer.parseInt(request.getParameter("page"));
					}
					rs.beforeFirst();
					while(rs.next())
					{
						if(rs.getRow()<=itemPerPage*currentPage && rs.getRow()>itemPerPage*(currentPage-1))
						{
						%>
							<div class="content" style="min-height:30px0px;">
								<%
									if(rs.getString("status").equals("Completed"))
									{
								%>
										<center>
											<div class="approved">
												<div style="color:#00B0FF;font-weight:bold;font-size:11px;border:1px solid #00B0FF;width:200px;position:relative;margin-top:115px;">
													<%
														rs3 = st3.executeQuery("SELECT * FROM header_transaction WHERE cart_id ="+rs.getString("cart_id"));
														rs3.last();
													%>
													Approved at <%=rs3.getString("date")%>
												</div>
											</div>
											
										</center>
								<%
									}
								%>
								<div class="product-id" style="position:relative;left:0;background-color:#00B0FF;width:300px;height:50px;color:white;padding:3px;margin-left:-20px;margin-top:-20px;border-bottom-right-radius:100%;text-align:left;">
									Transaction ID : <%=rs.getString("cart_id")%> 
									<br>
									Status : <%=rs.getString("status")%>
								</div>
								<div class="product-image" style="color:#00B0FF;font-weight:bold;">
									By <%=rs.getString("name")%>
								</div>
								<div class="product-information" style="margin-left:20px;">
									<ul style="list-style-type:decimal;">
										<%
											int totalPrice = 0;
											rs2 = st2.executeQuery("SELECT * FROM cart_detail cd JOIN products p ON cd.product_id = p.product_id WHERE cart_id='"+rs.getString("cart_id")+"'");
											rs2.beforeFirst();
											while(rs2.next())
											{
												int subTotal = (Integer.parseInt(rs2.getString("price")) * Integer.parseInt(rs2.getString("quantity")));
												totalPrice += subTotal;
												%>
													<li>
														<%=rs2.getString("name")%>
														- Rp. <%=subTotal%>,- 
														(Rp. <%=rs2.getString("price")%>,- 
														x <%=rs2.getString("quantity")%>pcs)
													</li>
												<%
											}
										%>
									</ul>
								</div>
								<div class="pull-right-information">
									<span>Rp. <%=totalPrice%>,-</span>
								</div>
								<%
									if(session.getAttribute("role").equals("Admin") && rs.getString("status").equals("Waiting for Approval"))
									{
										%>
											<form action="action/doApproveCart.jsp" method="POST">
												<div style="width:100%;text-align:center;margin-top : 30px;">
													<input type="hidden" value="<%=rs.getString("cart_id")%>" name="txtCartID">
													<button class="class-button" style="width:200px;">Approve</button>
												</div>	
											</form>
										<%
									}
								%>
								
							</div>
						<%
							
						}
					}

				%>
				<%
				//Paging Navigation
				if(totalPage >= 1)
				{
					%><div class="page-section"><%
					for (int i = 1; i <= totalPage; i++) 
					{

						%><%
						if(i != currentPage)
						{
				%>
							<a href="transaction.jsp?page=<%=i%>"><span class="navigation-page"><%=i%></span></a>
				<%
						}
						else
						{
							%><span class="navigation-page"><%out.println(i);%></span><%
						}
						%><%
					}
					%></div><%
				}
				%>
			</div>

			<footer class="footer-container">
				2016 &copy PT Bluejack Store 16-1
			</footer>
		</div>
	</body>
</html>
