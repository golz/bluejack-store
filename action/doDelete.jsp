<%@include file="../connect.jsp"%>

<%
	// statement.executeUpdate("DELETE FROM products WHERE id="+request.getParameter("tweetid").toString());
	// response.sendRedirect("../"+request.getParameter("source").toString());
	st.executeUpdate("DELETE FROM products WHERE product_id='"+request.getParameter("delete_id").toString()+"'");
	response.sendRedirect("../product.jsp");
%>