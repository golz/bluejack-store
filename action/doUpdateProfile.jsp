<%@ include file="../connect.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import= "java.util.regex.Matcher" %>
<%@ page import= "java.util.regex.Pattern" %>
<%
	String oldpassword = request.getParameter("old_password");
	String newpassword = request.getParameter("new_password");
	String confirm = request.getParameter("confirm_password");
	String phone = request.getParameter("txtPhone");
	String address = request.getParameter("txtAddress");
	String photo = request.getParameter("txtPhoto");

	//Validate phone
	boolean phoneDigit = true;
	for(int i=0;i<phone.length();i++)
	{
		if(!Character.isDigit(phone.charAt(i)))
		{
			phoneDigit = false;
			break;
		}
	}	

	//Validate Old Password
	rs = st.executeQuery("SELECT * FROM users WHERE password='"+(oldpassword==null?"":oldpassword)+"' AND user_id = "+session.getAttribute("id"));

	//Validate New Password
	boolean passDigit = false;
	boolean passLetter = false;
	for(int i=0;i<newpassword.length();i++)
	{
		if(Character.isDigit(newpassword.charAt(i)))
		{
			passDigit = true;
		}	
		else if(Character.isLetter(newpassword.charAt(i)))
		{ 
			passLetter = true;
		}
		else 
		{ 
			passDigit = false;
			passLetter = false;
			break;
		}
	}

	//Validate
	if(oldpassword == "")
	{
		response.sendRedirect("../updateprofile.jsp?err=Old Password must be filled");
	}
	else if(!rs.next())
	{
		response.sendRedirect("../updateprofile.jsp?err=Old Password must match with current password");
	}
	else if(newpassword == "")
	{
		response.sendRedirect("../updateprofile.jsp?err=New Password must be filled");
	}
	else if(passDigit == false || passLetter == false)
	{
		response.sendRedirect("../updateprofile.jsp?err=New Password must be alphanumeric");
	}
	else if(!confirm.equals(newpassword))
	{
		response.sendRedirect("../updateprofile.jsp?err=Confirm Password must same with Password");
	}
	else if(phone == "")
	{
		response.sendRedirect("../updateprofile.jsp?err=Phone must be filled");
	}
	else if(phone.length() < 10 || phone.length() > 13)
	{
		response.sendRedirect("../updateprofile.jsp?err=Phone length must between 10 and 13");
	}
	else if(phoneDigit == false)
	{
		response.sendRedirect("../updateprofile.jsp?err=Phone length must be numeric");
	}
		else if(address == "")
	{
		response.sendRedirect("../updateprofile.jsp?err=Address must be filled");
	}
	else if(!address.endsWith(" Street"))
	{
		response.sendRedirect("../updateprofile.jsp?err=Address must be ends with ' Street'");
	}
	else if(photo == "")
	{
		response.sendRedirect("../updateprofile.jsp?err=Photo must be choosen");
	}
	else if(!photo.endsWith(".png") && !photo.endsWith(".jpg"))
	{
		response.sendRedirect("../updateprofile.jsp?err=Photo format must be .png or .jpg");
	}
	else
	{
		st.executeUpdate("UPDATE users SET password='"+newpassword+"',phone='"+phone+"',address='"+address+"',photo='"+photo+"' WHERE user_id="+session.getAttribute("id"));
		response.sendRedirect("../profile.jsp");
	}
%>