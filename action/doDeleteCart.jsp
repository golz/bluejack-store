<%@include file="../connect.jsp"%>

<%
	rs = st.executeQuery("SELECT * FROM carts c JOIN cart_detail cd ON cd.cart_id = c.cart_id JOIN products p ON p.product_id = cd.product_id WHERE c.status = 'Active' AND cd.product_id = '"+request.getParameter("delete_id")+"'");
	//Setelah delete , kembalikan quantitynya
	rs.last();
	st.executeUpdate("UPDATE products SET stock=stock+"+Integer.parseInt(rs.getString("quantity"))+" WHERE product_id ='"+request.getParameter("delete_id").toString()+"'");
	st.executeUpdate("DELETE FROM cart_detail WHERE product_id='"+request.getParameter("delete_id").toString()+"'");
	response.sendRedirect("../cart.jsp");
%>