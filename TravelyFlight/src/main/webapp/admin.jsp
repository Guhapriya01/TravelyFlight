<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="../all_components/all_css.jsp"%>
<style>
*{
	font-family: RelativeSet, "Skyscanner Relative", -apple-system,
		BlinkMacSystemFont, "Roboto", "Oxygen", "Ubuntu", "Cantarell",
		"Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif
}
.bg-custom {
	background: #002a4d;
	text-align: center;
	padding: 14px 16px;
	font-size: 17px;
	display: flex;
	justify-content: space-between
}

.back-img {
	background: url("img/admin.jpg");
	width: 100%;
	height: 92vh;
	background-repeat: no-repeat;
	background-size: cover;
}

.myButtons {
	display: flex;
	margin: 0 auto;
	justify-content: space-evenly;
}

.myButtons .item {
	width: 224px;
	height: 56px;
	text-align: center;
	padding: 22px;
	border: 2px solid #ddd7d7;
	border-radius: 21px;
	background: white;
}

.myButtons .item a {
	text-decoration: none;
	color: black;
}

.myButtons .item:hover {
	box-shadow: 0 1px 3px 1px white;
}
</style>
</head>
<body style="margin: 0px">
<% 
  if(session.getAttribute("username")==null){
	  //response.sendRedirect("index.jsp");
  }
session.setAttribute("username","admin");

%>
		<div class="bg-custom">
			<a href="#" style="text-decoration: none; color: white"> <i
			class="fa fa-globe" aria-hidden="true"></i> Travely
		</a> <br>
		<div align="center" class="topnav">
		<form action="Logout" method="post">
			<table>
				<tr>
					<td><button type="submit" 
						style="text-decoration: none; padding-left: 12px; color: white;
						background-color:#002a4d;border: none; font-size: 17px;"><i
							class="fa fa-sign-in" aria-hidden="true"></i> Logout</button></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	<div align="center">
		<div class="back-img">
			<h1 align="center"
				style="padding-top: 40px; color: white; margin: 0px;padding-bottom:25px">
				<i class="fa fa-user-secret" aria-hidden="true"></i> Welcome Admin
			</h1>

			<div style="padding-top: 30px;">

				<div class="myButtons">

					<div class="item">
						<a href="adminflight.jsp"><i class="fa fa-plane" aria-hidden="true"></i><br>
							Flights</a>
					</div>
					<div class="item">
						<a href="adminbooking.jsp"><i class="fa-solid fa-ticket" aria-hidden="true"></i><br>
							Bookings</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>