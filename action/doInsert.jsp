<%@ include file="../connect.jsp"%>
<%@ page import="java.util.*" %>
<%
	String productID = "";
	String productName = request.getParameter("proName");
	String productPrice = request.getParameter("proPrice");
	String productWeight = request.getParameter("proWeight");
	String productStock = request.getParameter("proStock");
	String productImage = request.getParameter("proImage");

	//Validate Price
	boolean priceDigit = true;
	for(int i=0;i<productPrice.length();i++)
	{
		if(!Character.isDigit(productPrice.charAt(i)))
		{
			priceDigit = false;
			break;
		}
	}	
	//Validate Weight
	boolean weightDigit = true;
	for(int i=0;i<productWeight.length();i++)
	{
		if(!Character.isDigit(productWeight.charAt(i)))
		{
			weightDigit = false;
			break;
		}
	}
	//Validate Stock
	boolean stockDigit = true;
	for(int i=0;i<productStock.length();i++)
	{
		if(!Character.isDigit(productStock.charAt(i)))
		{
			stockDigit = false;
			break;
		}
	}
	//Here is auto generate id
	rs = st.executeQuery("SELECT * FROM products");
	rs.last();
	productID = String.format("PR%03d",rs.getRow()+1);

	//VL
	if(productName=="")
	{
		response.sendRedirect("../product.jsp?err=Product Name must be filled");
	}
	else if(productPrice=="")
	{
		response.sendRedirect("../product.jsp?err=Product Price must be filled");
	}
	else if(priceDigit == false)
	{
		response.sendRedirect("../product.jsp?err=Product Price must be filled with number only");
	}
	else if(productWeight=="")
	{
		response.sendRedirect("../product.jsp?err=Product Weight must be filled");
	}
	else if(weightDigit == false)
	{
		response.sendRedirect("../product.jsp?err=Product Weight must be filled with number only");
	}
	else if(productStock=="")
	{
		response.sendRedirect("../product.jsp?err=Product Stock must be filled");
	}
	else if(stockDigit == false)
	{
		response.sendRedirect("../product.jsp?err=Product Stock must be filled with number only");
	}
	else if(Integer.parseInt(productStock) < 1)
	{
		response.sendRedirect("../product.jsp?err=Product Stock must greated than 0");
	}
	else if(!productImage.endsWith(".png") && !productImage.endsWith(".jpg"))
	{
		response.sendRedirect("../product.jsp?err=Image format must be .png or .jpg");
	}
	else 
	{
		String old_id = request.getParameter("old_id").toString();
		String old_insertedBy = request.getParameter("old_insertedBy");
		if(old_id!="")
		{
			st.executeUpdate("UPDATE products SET name='"+productName+"',price="+Double.parseDouble(productPrice)+",weight="+Double.parseDouble(productWeight)+",stock="+Integer.parseInt(productStock)+",image='"+productImage+"',insertedBy='"+old_insertedBy+"' WHERE product_id='"+old_id+"'");
		}
		else
		{
			st.executeUpdate("INSERT INTO products(product_id,name,price,weight,stock,image,insertedBy) VALUES('"+productID+"','"+productName+"',"+Double.parseDouble(productPrice)+","+Double.parseDouble(productWeight)+","+Integer.parseInt(productStock)+",'"+productImage+"','"+session.getAttribute("name")+"')");
		}
		response.sendRedirect("../product.jsp");
	}
%>