<%
	if(session.getAttribute("role").equals("Member"))
	{
		%>
			<div class="nav-left">
				<div class="header-nav home" onclick="window.location.href='index.jsp'">
					Home	
				</div>
				<div class="header-nav product" onclick="window.location.href='product.jsp'">
					Product 	
				</div>
				<div class="header-nav member" onclick="window.location.href='member.jsp'">
					Member 	
				</div>
				<div class="header-nav transaction" onclick="window.location.href='transaction.jsp'">
					Transaction 	
				</div>
			</div>

			<div class="nav-right">
				<div class="header-nav cart" onclick="window.location.href='cart.jsp'">
					Cart 	
				</div>
				<div class="header-nav profile" onclick="window.location.href='profile.jsp'">
					Profile	
				</div>
				<div class="header-nav logout" onclick="window.location.href='auth/doLogout.jsp'">
					Logout
				</div>
			</div>
		<%
	}
	else if(session.getAttribute("role").equals("Admin"))
	{
		%>
			<div class="nav-left">
				<div class="header-nav home" onclick="window.location.href='index.jsp'">
					Home	
				</div>
				<div class="header-nav product" onclick="window.location.href='product.jsp'">
					Product 	
				</div>
				<div class="header-nav member" onclick="window.location.href='member.jsp'">
					Member 	
				</div>
				<div class="header-nav transaction" onclick="window.location.href='transaction.jsp'">
					Transaction 	
				</div>
			</div>

			<div class="nav-right">
				<div class="header-nav profile" onclick="window.location.href='profile.jsp'">
					Profile	
				</div>
				<div class="header-nav logout" onclick="window.location.href='auth/doLogout.jsp'">
					Logout
				</div>
			</div>
		<%
	}
%>
