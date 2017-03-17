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
			<!-- Form Insert & Update nya -->
			<div class="background" style="text-align:center;">
			</div>
			<div class="popup">
				<form method="GET" action="action/doInsert.jsp" class="form-insert">
				<h1 class="title" style="text-decoration:none;margin-top:0px;" id="title_status"></h1>
				<span class="popup-close">&times</span>
				<table>
					<tr>
						<td colspan="2"><input type="hidden" name="old_id" id="old_id"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="hidden" name="old_insertedBy" id="old_insertedBy"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" name="proName" placeholder="Product Name" class="class-text" id="txtProName">
							<span class="fa fa-tag super-span"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" name="proPrice" placeholder="Price" class="class-text" id="txtProPrice">
							<span class="fa fa-money super-span"></span>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="proWeight" placeholder="Weight" class="class-text small" id="txtProWeight">
							<span class="fa fa-balance-scale super-span"></span>
						</td>
						<td>
							<input type="text" name="proStock" placeholder="Stock" class="class-text small" id="txtProStock">
							<span class="fa fa-database super-span"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<label for="sourceImage" class="my-upload-photo the-another">Browse...</label>
							<input type="file" name="proImage" onchange="changePicture()" id="sourceImage" class="my-file"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="preview" style="background-color:white;width :300px; height:150px;border:1px dashed #CCC;" id="preview-image-view">

							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<input type="submit" value="" class="class-button" id="submit">  
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
				</form>
			</div>

			<div class="body-container">
				<div class="push-top">	
				</div>

				<h1 class="title">Product List</h1>
				<div style="text-align:center;margin-bottom:20px;">
					<form method="GET" action="product.jsp">
						<input type="text" name="search" placeholder="Search Product  ex. Sepatu Bola" class="class-text"/>
						<button class="class-button" style="height : 50px;padding-top:1px;"><li class="fa fa-search" aria-hidden="true"></li></button>
					</form>
				</div>
				<!-- Content nya di sini -->
				<%
					//Seaching
					String query = "SELECT * FROM products";
					String search = "";
					if(request.getParameter("search")!=null)
					{
						search = request.getParameter("search");
						query += " WHERE name LIKE '%"+search+"%'";
					}
					rs = st.executeQuery(query);

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
										<td>Price</td>
										<td>:</td>
										<td>
											Rp. <%=rs.getString("price")%>,-
										</td>
									</tr>
									<tr>
										<td>Weight</td>
										<td>:</td>
										<td>
											<%=rs.getString("weight")%>kg
										</td>
									</tr>
									<tr>
										<td>Stock</td>
										<td>:</td>
										<td>
											<%=rs.getString("stock")%>pcs
										</td>
									</tr>
									<tr>
										<td colspan="3"><i style="font-size:10px;">Inserted by <%=rs.getString("insertedBy")%></i></td>
									</tr>
									<tr>
										<td colspan="3">
											<a href="review.jsp?id=<%=rs.getString("product_id")%>" style="text-decoration:none;color:#00B0FF;text-decoration:underline;cursor:pointer;font-size:11px;">View Product Review</a>
										</td>
									</tr>
								</table>
							</div>
							<!-- <button class="view-product">View Product</button> -->
							<%
								if(session.getAttribute("role").equals("Member"))
								{
							%>	
								<form action="action/doInsertCart.jsp" method="GET">

									<input type="text" placeholder="Qty" class="class-text carttype" name="txtQty">

									<input type="hidden" name="txtProductID" value="<%=rs.getString("product_id")%>"/>
									<span style="color:black;font-size:11px;float:right;margin-top:-80px;margin-right:-15px;">
										<%
											if(request.getParameter("err")!=null)
											{
												out.println(request.getParameter("err"));
											}
										%>
									</span>
								 	<button class="add-cart">
								 		<span>
								 			Add to Cart
								 			<li class="fa fa-cart-plus" aria-hidden="true"></li>
								 		</span>
								 	</button>
								 	
								</form>	
							<%
								}
							%>
							<%
								if(session.getAttribute("role").equals("Admin"))
								{
							%>	
									<div class="admin-button-group">
									 	<button class="update-product" onclick="updateProduct('<%=rs.getString("product_id")%>','<%=rs.getString("name")%>','<%=rs.getString("price")%>','<%=rs.getString("weight")%>','<%=rs.getString("stock")%>','<%=rs.getString("image")%>','<%=rs.getString("insertedBy")%>')">
									 		<li class="fa fa-level-up" aria-hidden="true"></li>
									 	</button>	
									 	<form method="GET" action="action/doDelete.jsp">
									 		<input type="hidden" name="delete_id" id="delete_id" value="<%=rs.getString("product_id")%>">
									 		<button class="remove-product">
									 			<li class="fa fa-remove" aria-hidden="true"></li>
									 		</button>	
									 	</form>
									</div>
							<%
								}
							%>
							</div>
				<%		
						}
					}		
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
								<a href="product.jsp?search=<%=search%>&page=<%=i%>"><span class="navigation-page"><%=i%></span></a>
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
				<%
					if(session.getAttribute("role").equals("Admin"))
					{
				%>
						<div class="product-nav" style="text-align:center;margin-top : 15px;">
							<!-- Insert Product -->
							<button class="class-button fixed-right insert-product" onclick="insertProduct()"><li class="fa fa-plus" aria-hidden="true"></li></button>
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
		    // $('.background').click(function(){
		    //     $('.background').fadeOut(speed);
		    //     $('.popup').fadeOut(speed);
		    // });
		    // $('.insert-product').click(function(){
		    // 	$('.background').fadeIn(speed);
		    // 	$('.popup').slideDown(speed);
		    // });

		});

	</script>
	<script type="text/javascript">
		function changePicture()
		{
			var img = document.createElement("img");
			img.src = "images/"+document.getElementById("sourceImage").files[0].name;

			var src = document.getElementById("preview-image-view");
			src.removeChild(src.childNodes[0]);   
			src.appendChild(img);
		}
		function insertProduct()
        {
            $('.background').show(0);
            $('.popup').slideDown(100);

            $('#old_id').val('');
            $('#txtProName').val('');
            $('#txtProPrice').val('');
            $('#txtProWeight').val('');
            $('#txtProStock').val('');
            $('#old_insertedBy').val('');
            $('#submit').val("Insert");
            document.getElementById("title_status").innerHTML = "Insert New Product";

        }
        function updateProduct(id,name,price,weight,stock,image,insertedBy)
        {
            $('.background').show(0);
            $('.popup').slideDown(100);

            $('#old_id').val(id);
            $('#txtProName').val(name);
            $('#txtProPrice').val(price);
            $('#txtProWeight').val(weight);
            $('#txtProStock').val(stock);
            $('#old_insertedBy').val(insertedBy);
            $('#submit').val("Update");
            document.getElementById("title_status").innerHTML = "Update Product";
        }
	</script>
</html>
