<%@include file="../connect.jsp"%>

<%
	String pid = request.getParameter("delete_id");
	String oldcontent = request.getParameter("delete_content");

	st.executeUpdate("DELETE FROM comments WHERE product_id='"+pid+"' AND content='"+oldcontent+"' AND user_id='"+session.getAttribute("id")+"'");
	response.sendRedirect("../review.jsp?id="+pid);
%>