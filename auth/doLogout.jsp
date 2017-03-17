<%
	session.invalidate();
	application.setAttribute("online",Integer.parseInt(application.getAttribute("online").toString())-1);
	response.sendRedirect("../");
%>