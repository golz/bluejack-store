<%@ include file="../connect.jsp"%>
<%
	String email = request.getParameter("txtEmail");
	String password = request.getParameter("txtPassword");
	String remember = request.getParameter("remember");
//	Check Registered Account
	rs = st.executeQuery("SELECT * FROM users WHERE email='"+(email==null?"":email)+"' AND password='"+(password==null?"":password)+"'");
	if(email == "")
	{
		response.sendRedirect("../login.jsp?err=Email must be filled");
	}
	else if(password == "")
	{
		response.sendRedirect("../login.jsp?err=Password must be filled");
	}
	else if(!rs.next())
	{
		response.sendRedirect("../login.jsp?err=You are not registered");
	}
	else
	{	
		session.setAttribute("id",rs.getString("user_id"));
		session.setAttribute("name",rs.getString("name"));
		session.setAttribute("email",email);
		session.setAttribute("role",rs.getString("role"));
		application.setAttribute("online",application.getAttribute("online") == null ? 1 : Integer.parseInt(application.getAttribute("online").toString())+1);
		if(remember != null){
			Cookie cookie = new Cookie("email",email);
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 * 24);
			response.addCookie(cookie);
		}
		//out.println(session.getAttribute("email"));	
		response.sendRedirect("../index.jsp");
	}
%>