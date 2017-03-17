<%@ include file="../connect.jsp"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.GregorianCalendar" %>
<%
	st.executeUpdate("UPDATE carts SET status='Completed' WHERE cart_id="+Integer.parseInt(request.getParameter("txtCartID").toString()));
	Calendar c = Calendar.getInstance();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String currentDate = df.format(c.getTime());

	st.executeUpdate("INSERT INTO header_transaction(cart_id,date) VALUES("+Integer.parseInt(request.getParameter("txtCartID").toString())+",'"+currentDate+"')");
	response.sendRedirect("../transaction.jsp");
%>