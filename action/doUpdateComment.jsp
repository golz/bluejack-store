<%@ include file="../connect.jsp"%>
<%@ page import="java.util.*" %>
<%
	String pid = request.getParameter("product_id");
	String oldcontent = request.getParameter("old_content");
	String content = request.getParameter("text_content");
	String star = request.getParameter("star_star");	

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
		st.executeUpdate("UPDATE comments SET content='"+content+"',star="+Integer.parseInt(star)+" WHERE product_id='"+pid+"' AND user_id='"+session.getAttribute("id")+"' AND content='"+oldcontent+"'");
		response.sendRedirect("../review.jsp?id="+pid);
	}
%>