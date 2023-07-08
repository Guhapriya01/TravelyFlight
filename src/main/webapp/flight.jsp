<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="com.booking.Flight"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flights</title>
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


#notAvail {
	padding: 24px;
	text-align: center;
	font-size: 23px;
	color: #3d2a40;
	font-variant: petite-caps;
	font-weight: bolder;
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

#val{
	padding: 23px;
	box-shadow: aquamarine;
	font-size: 24px;
	text-align: center;
	font-style: oblique;
	font-variant: petite-caps;
	font-weight: bold;
}

.back-img {
	background: url("https://wallpaperaccess.com/full/254361.jpg");
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
}

.myList .pad {
	font-weight: bolder;
	display: flex;
	justify-content: space-evenly;
	padding-left: 233px;
	padding-right: 233px;
	padding-top: 20px;
	color: white
}
</style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body style="margin: 0px;">
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
				style="padding-top: 30px; color: white; margin: 0px;">The best
				flight deals to everywhere, from anywhere </h1>
		</div>
		<div style="padding-top: 10px;">
			<div class="myList" align="center">
				<form action="SearchFlight" method="post">
					<div class="pad">
						<select id="fcity-select" name="from">
							<option value="">From</option>
							<option value="new-york">New York</option>
							<option value="los-angeles">Los Angeles</option>
							<option value="chicago">Chicago</option>
							<option value="houston">Houston</option>
							<option value="miami">Miami</option>
						</select> <select id="tcity-select" name="to">
							<option value="">To</option>
							<option value="new-york">New York</option>
							<option value="los-angeles">Los Angeles</option>
							<option value="chicago">Chicago</option>
							<option value="houston">Houston</option>
							<option value="miami">Miami</option>
						</select>
					</div>

					<div class="pad">
						<label>Date</label> <input class="form-control" required
							name="date" placeholder="date" id="InputIn" type="text"
							onfocus="(this.type='date')" />
					</div>


					<div class="pad">
						<select id="economy-select" name="cabin">
							<option value="">Select Cabin</option>
							<option value="economy">Economy</option>
							<option value="premium">Premium Economy</option>
							<option value="business">Business Class</option>
							<option value="first_class">First Class</option>
						</select>
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

				ArrayList<Flight> flights = (ArrayList<Flight>) request.getAttribute("flights");

				if (flights.size() == 0) {
			%>
			<div id="notAvail">No Flights Available !!</div>
			<%
			} else {
			cabin = (String) request.getAttribute("cabin");

			for (Flight flight : flights) {
				flightName = (String) flight.getName();
			%>
			<tr>
				<td id="val"><%=flight.getName()%></td>
				<td style="text-align: center; padding-top: 3%;">  <span>&#8377;</span>  <b>  <%=flight.getPrice()%> </b></td>
				<td style="text-align: center; padding-top: 3%;">Depart at <b><%=flight.getDeparture()%></b></td>
				<form action="FlightName" method="post">
					<input id="name" name="name" type="hidden"
						value="<%=flight.getName()%>"> <input id="Gcabin"
						name="Gcabin" type="hidden" value="<%=cabin%>">
					<td style="text-align: center; padding-top: 2%;"><button
							style="border: none; color: white; background-color: #17931e; width:90px;border-radius: 14px; padding: 10px;"
							type="submit">Book</button></td>
				</form>
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