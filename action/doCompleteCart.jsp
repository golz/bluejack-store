<%@ include file="../connect.jsp"%>
<%@ page import="java.util.*" %>
<%
	rs = st.executeQuery("SELECT * FROM carts WHERE user_id='"+session.getAttribute("id").toString()+"' AND status='Active'");
	rs.last();
	st.executeUpdate("UPDATE carts SET status='Waiting for Approval' WHERE cart_id="+Integer.parseInt(rs.getString("cart_id")));
	response.sendRedirect("../index.jsp");
%>