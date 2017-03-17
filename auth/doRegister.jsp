<%@ include file="../connect.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import= "java.util.regex.Matcher" %>
<%@ page import= "java.util.regex.Pattern" %>
<%
	String fullname = request.getParameter("txtName");
	String phone = request.getParameter("txtPhone");
	String email = request.getParameter("txtEmail");
	String password = request.getParameter("txtPassword");
	String confirm = request.getParameter("txtConfirm");
	String gender = request.getParameter("txtGender");
	String dob = request.getParameter("txtDOB");
	String address = request.getParameter("txtAddress");
	String photo = request.getParameter("txtPhoto");
	//Check emailnya udah ada apa blom
	rs = st.executeQuery("SELECT * FROM users WHERE email = '"+email+"'");

	//Validate Fullname
	boolean validatedFullname = true;
	for(int i=0;i<fullname.length();i++)
	{
		if(!Character.isLetter(fullname.charAt(i)) && !Character.isWhitespace(fullname.charAt(i)))
		{
			validatedFullname = false;
		}
	}
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
	//Validate Email
	boolean validEmail = false;
	//String regex = "^(.+)@(.+)$";
	Pattern pattern = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
    Matcher matcher = pattern.matcher(email);
	validEmail = matcher.matches();

	//Validate Password
	boolean passDigit = false;
	boolean passLetter = false;
	for(int i=0;i<password.length();i++)
	{
		if(Character.isDigit(password.charAt(i)))
		{
			passDigit = true;
		}	
		else if(Character.isLetter(password.charAt(i)))
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

	//Validate DOB
	boolean validateDOB = true;
	Calendar birth = Calendar.getInstance();
	Calendar now = Calendar.getInstance(); 
	try{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		sdf.setLenient(false);

		birth.setTime(sdf.parse(dob));
		now.setTime(new java.util.Date());
	}catch(Exception e){
		out.print(e.getMessage());
		validateDOB = false;
	};
	
	if(fullname == "")
	{
		response.sendRedirect("../register.jsp?err=Fullname must be filled");
	}
	else if(validatedFullname == false)
	{
		response.sendRedirect("../register.jsp?err=Fullname can only contain alphabet and whitespace");
	}
	else if(phone == "")
	{
		response.sendRedirect("../register.jsp?err=Phone must be filled");
	}
	else if(phone.length() < 10 || phone.length() > 13)
	{
		response.sendRedirect("../register.jsp?err=Phone length must between 10 and 13");
	}
	else if(phoneDigit == false)
	{
		response.sendRedirect("../register.jsp?err=Phone length must be numeric");
	}
	else if(email == "")
	{
		response.sendRedirect("../register.jsp?err=Email must be filled");
	}		
	else if(validEmail == false)
	{
		response.sendRedirect("../register.jsp?err=Wrong email format");
	}
	else if(rs.next())
	{
		response.sendRedirect("../register.jsp?err=Email has been taken");
	}
	else if(password == "")
	{
		response.sendRedirect("../register.jsp?err=Password must be filled");
	}
	else if(passDigit == false || passLetter == false)
	{
		response.sendRedirect("../register.jsp?err=Password must be alphanumeric");
	}
	else if(!confirm.equals(password))
	{
		response.sendRedirect("../register.jsp?err=Confirm Password must same with Password");
	}
	else  if(gender == null)
	{
		response.sendRedirect("../register.jsp?err=Gender must be choosen");
	}
	else if(validateDOB == false)
	{
		response.sendRedirect("../register.jsp?err=Date of Birth must be filled with yyyy/MM/dd format");
	}
	else if(Math.abs(now.get(Calendar.YEAR)-birth.get(Calendar.YEAR)) < 17)
	{
		response.sendRedirect("../register.jsp?err=Minimal age is 17 years old");
	}
	else if(address == "")
	{
		response.sendRedirect("../register.jsp?err=Address must be filled");
	}
	else if(!address.endsWith(" Street"))
	{
		response.sendRedirect("../register.jsp?err=Address must be ends with ' Street'");
	}
	else if(photo == "")
	{
		response.sendRedirect("../register.jsp?err=Photo must be choosen");
	}
	else if(!photo.endsWith(".png") && !photo.endsWith(".jpg"))
	{
		response.sendRedirect("../register.jsp?err=Photo format must be .png or .jpg");
	}
	else
	{
		st.executeUpdate("INSERT INTO users(name,phone,email,password,gender,dob,address,photo,role) VALUES('"+fullname+"','"+phone+"','"+email+"','"+password+"','"+gender+"','"+birth.get(Calendar.YEAR)+"-"+birth.get(Calendar.MONTH)+"-"+birth.get(Calendar.DAY_OF_MONTH)+"','"+address+"','"+photo+"','"+"Member"+"')");
		response.sendRedirect("../index.jsp");
	}
%>