<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookings</title>
<style>
* {
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

.tab {
	padding: 20px;
	display: flex;
	justify-content: space-evenly;
}

.tab a {
	text-decoration: none;
	color: black;
	width: 350px;
	height: 16px;
	padding: 22px;
	border: 2px solid #ddd7d7;
}

.tab a.active {
	background-color: #ccc;
}

.tabcontent {
	display: none;
	/*padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;*/
}

.number-input {
	display: flex;
	align-items: center;
}

.number-input input {
	width: 100px;
	height: 30px;
	padding-right: 30px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	text-align: center;
}

.number-input .increment-btn {
	position: absolute;
	right: 10px;
	cursor: pointer;
}

.myList {
	padding-left: 100px;
	padding-right: 80px;
	padding-bottom: 50px;
	padding-top: 10px;
}

.myList div select {
	width: 209px;
	height: 40px;
	border-radius: 10px;
	border: none;
}

.myList div input {
	width: 209px;
	height: 40px;
	border-radius: 10px;
	border: none;
}

.myList div button {
	width: 209px;
	height: 40px;
	border-radius: 20px;
	color: white;
	background: blue;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.myList .pad label {
	padding-right: 50px;
}

.myList .pad {
	font-weight: bolder;
	/*display: flex;
	justify-content: space-evenly;
	padding-left: 233px;
	padding-right: 233px;*/
	padding-bottom: 20px;
	padding-top: 20px;
	color: black
}

#message {
	text-align: center;
	color: #844444;
	font-size: x-large;
	padding-bottom: -3px;
	font-variant: small-caps;
	font-weight: bolder;
}
.back-img {
	background: url("https://wallpaperaccess.com/full/254361.jpg");
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
}

</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body style="margin: 0px">
<% 
  if(session.getAttribute("username")==null){
	  response.sendRedirect("index.jsp");
  }

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
						style="text-decoration: none; padding-left: 12px; color: white;background-color:#002a4d"><i
							class="fa fa-sign-in" aria-hidden="true"></i> Logout</button></td>
				</tr>
			</table>
			</form>
		</div>
</div>


	<div class="back-img">
		<div>
			<h1 align="center"
				style="padding-top: 30px; color: white; margin: 0px;">Know who are all ready to travel !</h1>
		</div>
			
		<div style="padding-top: 10px;">
			<div class="myList" align="center">
				<form action="GetBooking" method="post">
					<div class="pad">
						<label>Flight Id</label> <input class="form-control" required
							name="id" placeholder="Enter Id" id="InputIn" type="text"/>
					</div>

					<div style="padding-top: 30px;">
						<button type="submit">
							Search <i class="fa fa-arrow-right" aria-hidden="true"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%
	String flightName = "", cabin = "";
	%>

	<table class="table table-bordered"
		style="width: 80%; margin-left: 10%; margin-top: 55px;">
		<tbody>
			<%
			if (request.getAttribute("flights") != null) {

				ArrayList<String> flights = (ArrayList<String>) request.getAttribute("flights");

				if (flights.size() == 0) {
			%>
			<div id="notAvail">No Bookings Available !!</div>
			<%
			} else {

			for (String flight : flights) {
				String[] str = flight.split("/");
				
			%>
			<tr>
				<td id="val">Name : <%=str[0]%></td>
				<td style="text-align: center; padding-top: 3%;"> Total Cost :  <span>&#8377;</span>  <b>  <%=str[3]%> </b></td>
				<td style="text-align: center; padding-top: 3%;">Cabin : <b><%=str[2]%></b>
				</td>
				<td style="text-align: center; padding-top: 3%;"><b> Date :  <%=str[1]%> </b></td>
				
			</tr>
			<%
			}
			}
			}
			%>
		</tbody>
	</table>
	<div id="space" style="padding-bottom:30px"></div>
</body>
</html>