<%@ page import = "java.sql.*, java.util.*, java.text.SimpleDateFormat"%>
<%
	Connection connection = null;
	Statement st = null;
	ResultSet rs = null;
	
	Statement st2 = null;
	ResultSet rs2 = null;

	Statement st3 = null;
	ResultSet rs3 = null;

	try{
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/prk","prk","prk");
		//connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webprog1","root","");
		st = connection.createStatement(1004,1008);
		st2 = connection.createStatement(1004,1008);
		st3 = connection.createStatement(1004,1008);
	}catch(Exception e){
		e.printStackTrace();
		if(e.getMessage().contains("Access denied")){
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/prk","root","");
			//connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webprog1","root","");
			st = connection.createStatement(1004,1008);
			st2 = connection.createStatement(1004,1008);
			st3 = connection.createStatement(1004,1008);
		}
	}
%>