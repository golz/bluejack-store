<%@ include file="../connect.jsp"%>
<%@ page import="java.util.*" %>
<%
	String qty = request.getParameter("txtQty");
	String pro_id = request.getParameter("txtProductID").toString();

	//Validate Qty
	boolean qtyDigit = true;
	for(int i=0;i<qty.length();i++)
	{
		if(!Character.isDigit(qty.charAt(i)))
		{
			qtyDigit = false;
			break;
		}
	}	

	//cek stock
	rs = st.executeQuery("SELECT * FROM products WHERE product_id='"+pro_id+"'");
	rs.first();
	int currentStock = Integer.parseInt(rs.getString("stock"));

	if(qty=="")
	{
		response.sendRedirect("../product.jsp?err=Quantity must be filled");
	}
	else if(qtyDigit==false)
	{
		response.sendRedirect("../product.jsp?err=Quantity must be filled with number only");
	}
	else if(Integer.parseInt(qty) <= 0)
	{
		response.sendRedirect("../product.jsp?err=Quantity must more than 0");
	}
	else if(Integer.parseInt(qty) > currentStock)
	{
		response.sendRedirect("../product.jsp?err=Stock is not enough for "+qty+"pcs");
	}
	else
	{
		//decrease stock
		st.executeUpdate("UPDATE products SET stock=stock-"+Integer.parseInt(qty)+" WHERE product_id='"+pro_id+"'");
		//insert to cart
		rs = st.executeQuery("SELECT * FROM carts WHERE user_id='"+session.getAttribute("id").toString()+"' AND status='Active'");
		rs.last();
		if(rs.getRow()==0)
		{
			st.executeUpdate("INSERT INTO carts(user_id,status) VALUES('"+session.getAttribute("id")+"','Active')");
		}
		

		rs = st.executeQuery("SELECT * FROM carts c JOIN cart_detail cd ON cd.cart_id = c.cart_id JOIN products p ON p.product_id = cd.product_id WHERE c.status = 'Active' AND cd.product_id = '"+pro_id+"'");
		rs.last();
		if(rs.getRow()==0)
		{
			rs = st.executeQuery("SELECT * FROM carts WHERE user_id='"+session.getAttribute("id").toString()+"' AND status='Active'");
			rs.last();
			st.executeUpdate("INSERT INTO cart_detail(cart_id,product_id,quantity) VALUES("+rs.getString("cart_id")+",'"+pro_id+"',"+Integer.parseInt(qty)+")");
		}
		else
		{
			st.executeUpdate("UPDATE cart_detail SET quantity = quantity+"+Integer.parseInt(qty)+" WHERE cart_id="+rs.getString("cart_id")+" AND product_id='"+pro_id+"'");
		}

		response.sendRedirect("../product.jsp");
	}
%>