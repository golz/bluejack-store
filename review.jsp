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
				<h1 class="title"></h1>
				<%
					rs = st.executeQuery("SELECT * FROM products p WHERE p.product_id='"+request.getParameter("id").toString()+"'");
					rs.first();
					String image = "images/"+rs.getString("image");
				%>
				<div class="content profile-section" style="height:350px;width:80%;">
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
								<td colspan="3" style="text-align:center;">
									<%=rs.getString("name")%>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<hr style="margin-top:5px;display:block;height;1px;border:0;border-top:1px solid #00B0FF;margin:1em 0;padding:0;">
								</td>
							</tr>
							<tr>
								<%
									rs = st.executeQuery("SELECT * FROM comments c JOIN users u ON u.user_id = c.user_id WHERE c.product_id='"+request.getParameter("id").toString()+"'");
									rs.beforeFirst();
									if(!rs.next())
									{
										%>
										<td colspan="3" style="text-align:center;">
											<img src="images/star5.png" style="margin-top:-30px;">
										</td>
										<%
									}
									else
									{
										rs3 = st3.executeQuery("SELECT AVG(star) as RATARATA FROM comments WHERE product_id='"+request.getParameter("id")+"'");
										rs3.first();
										Double dstar = Double.parseDouble(rs3.getString("RATARATA"));
										int star = (int)Math.ceil(dstar);
								%>
								<td colspan="3" style="text-align:center;">
									<img src="images/star<%=star%>.png" style="margin-top:-30px;">
								</td>
								<%
									}
								%>
							</tr>
						</table>
					</center>
				</div>
				<h1 class="title" style="text-decoration:none;margin-top:10px;"> Comment </h1>
				<%
					rs = st.executeQuery("SELECT * FROM comments c JOIN users u ON u.user_id = c.user_id WHERE c.product_id='"+request.getParameter("id").toString()+"'");
					rs.beforeFirst();

					if(!rs.next())
					{
						%>
						<div class="comment" style="text-align:center;line-height:20px;color:#00B0FF;font-weight:bold;font-size:15px;">
							There is no comment for this product
								<i class="fa fa-smile-o" style="display:block;font-size:30px;margin-top:10px;"></i>
						</div>
						<%
					}
					else
					{
						%>
						<div class="background" style="text-align:center;">
						</div>
						<div class="popup">
							<form action="action/doUpdateComment.jsp" method="POST" class="form-insert" style="height:300px;width:400px;">
								<span class="popup-close" style="margin-top:10px;">&times</span>
								<h1 class="title" style="text-decoration:none;margin-top:0px;" id="title_status">Update Comment</h1>
								<center>
								<table>
									<tr>
										<td colspan="2"><input type="hidden" name="product_id" id="product_id"></td>
									</tr>
									<tr>
										<td colspan="2"><input type="hidden" name="user_id" id="user_id"></td>
									</tr>
									<tr>
										<td colspan="2">
											<input type="hidden" id="old_comment" name="old_content">
											<textarea name="text_content" class="my-text" style="border:1px solid #00B0FF;height:100px;width:300px;" placeholder="Update your comment here..." id="comment_comment"></textarea>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<i class="fa fa-star" aria-hidden="true" style="float:left;color:#00B0FF;line-height:55px;"></i>
											<select name="star_star" class="my-text" style="width:55px;float:left;border:1px solid #00B0FF;text-align:center;margin-left:10px;" id="star_star">
												<%
													for(int i=5;i>=1;i--)
													{
														%>
														<option value="<%=i%>"><%=i%></option>
														<%
													}
												%>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<button class="my-button">Update</button>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align:center;">
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
						<%
						rs.beforeFirst();
						while(rs.next())
						{
							String pp = "images/"+rs.getString("photo");
							%>

								
							<div class="comment">
								<span class="comment-person">
									<img src="<%=pp%>" style="border-radius:50%;border:1px solid #00B0FF;width:50px;height:50px;">
									<%=rs.getString("name")%>
								</span>
								<div class="comment-content wordwrap" >
								“<%=rs.getString("content")%>”
								</div>
								<div class="comment-star">
									<img src="images/star<%=rs.getString("star")%>.png">
								</div>
								<%
									if(session.getAttribute("id").equals(rs.getString("user_id")))
									{
								%>
										<form method="GET" action="action/doDeleteComment.jsp">
											<div style="display:block;position:relative;float:right;">
												<input type="hidden" name="delete_content" value="<%=rs.getString("content")%>">
												<input type="hidden" name="delete_id" value="<%=request.getParameter("id").toString()%>">
										 		<button style="background-color:red;color:white;cursor:pointer;height:30px;width:30px;border:none;position:relative;float:right;display:block;padding:5px;margin-top:-145px;margin-right:-20px;">
										 			<li class="fa fa-remove" aria-hidden="true"></li>
										 		</button>	
											</div>
					 					</form>
										<button class="comment-update" class="comment-update-btn" onclick="updateComment('<%=request.getParameter("id").toString()%>','<%=rs.getString("content")%>','<%=rs.getString("star")%>')">
											<li class="fa fa-level-up" aria-hidden="true"></li>
										</button>
								<%
									}
								%>
							</div>
							<%
						}
					}
				%>
				<div class="comment" class="comment-section">
					<form action="action/doInsertComment.jsp" method="POST" style="text-align:right;">
							<input type="hidden" name="txtProductID" value="<%=request.getParameter("id").toString()%>">
							<textarea name="txtContent" class="my-text" style="border:1px solid #00B0FF;height:70px;" placeholder="Add your comment here..."></textarea>
							<select name="txtStar" class="my-text" style="width:55px;float:left;border-left:1px solid #00B0FF;border-right:1px solid #00B0FF;border-bottom:1px solid #00B0FF;text-align:center;">
								<%
									for(int i=5;i>=1;i--)
									{
										%>
										<option value="<%=i%>"><%=i%></option>
										<%
									}
								%>
							</select>
							<button class="class-button">
								<i class="fa fa-plus" aria-hidden="true"></i>
							</button>
							<span style="float:left;margin-left:50px;margin-top:15px;">
								<%
									if(request.getParameter("err")!=null)
									{
										out.print(request.getParameter("err"));
									}
								%>
							</span>
							
					</form>
				</div>
				
			</div>

			<footer class="footer-container">
				2016 &copy PT Bluejack Store 16-1
			</footer>
		</div>
	</body>
	<script type="text/javascript" src="script/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
		$('.background').hide(0);
		$('.popup').hide(0);
		$(document).ready(function(){
			$('.background').hide(0);
		    $('.popup').hide(0);
		    var speed = 100;

		    $('.popup-close').click(function(){
		        $('.background').hide(0);
		        $('.popup').slideUp(speed);
		    });
		});
	</script>
	<script type="text/javascript">
		function updateComment(productID,content,star)
        {
            $('.background').show(0);
            $('.popup').slideDown(100);
            $('#product_id').val(productID);
            $('#old_comment').val(content);
            $('#comment_comment').val(content);
        }
	</script>
</html>
