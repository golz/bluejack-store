<%@ include file="../connect.jsp"%>
<%@ page import="java.util.*" %>
<%
	String pid = request.getParameter("txtProductID");
	String content = request.getParameter("txtContent");
	String star = request.getParameter("txtStar");	

	if(content=="")
	{
		response.sendRedirect("../review.jsp?id="+pid+"&err=Comment must be filled");
	}
	else if(content.length() > 255)
	{
		response.sendRedirect("../review.jsp?id="+pid+"&err=Comment length can't be more than 255");
	}
	else if(star=="")
	{
		response.sendRedirect("../review.jsp?id="+pid+"&err=Star must be selected");
	}
	else
	{
		st.executeUpdate("INSERT INTO comments(product_id,user_id,content,star) VALUES('"+pid+"',"+session.getAttribute("id")+",'"+content+"',"+star+")");
		response.sendRedirect("../review.jsp?id="+pid);
	}
%>