<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="com.booking.Flight"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travely</title>
<%@include file="all_components/all_css.jsp"%>
<style>
.back-img {
	background: url("img/index2.jpg");
	width: 100%;
	height: 90vh;
	background-repeat: no-repeat;
	background-size: cover;
}
table { border-collapse: collapse; }
.myList {
	padding-left: 100px;
	padding-right: 80px;
	padding-bottom: 50px;
	padding-top: 10px;
}
#notAvail {
	padding: 24px;
	text-align: center;
	font-size: 23px;
	color: #3d2a40;
	font-variant: petite-caps;
	font-weight: bolder;
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

.myList .pad {
	display: flex;
	justify-content: space-evenly;
	padding-left: 233px;
	padding-right: 233px;
	padding-top: 20px;
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
}

.myButtons .item a {
	text-decoration: none;
	color: black;
}

.myButtons .item:hover {
	box-shadow: 0 1px 3px 0 rgba(37, 32, 31, .3);
}

.footer {
	background: #c8d6e5
}
</style>
</head>
<body style="margin: 0px">
	<%@include file="all_components/navbar.jsp"%>
	<div class="back-img">
		<div>
			<h1 align="center"
				style="padding-top: 30px; color: white; margin: 0px;">Scan your favorite
				sites...</h1>
		</div>
		<div style="padding-top: 10px;">
			<div class="myList" align="center">
				<form action="SearchFlightLog" method="post">
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
			<tr style="border-bottom: solid thin darkgray;">
				<td id="val"><%=flight.getName()%></td>
				<td style="text-align: center; padding-top: 3%;">  <span>&#8377;</span>  <b>  <%=flight.getPrice()%> </b></td>
				<td style="text-align: center; padding-top: 3%;">Depart at <b><%=flight.getDeparture()%></b></td>
			</tr>
			<%
			}
			}
			}
			%>
		</tbody>
	</table>
<div id="space" style="padding-bottom:30px"></div>
	<script>
		var citySelect = document.getElementById("city-select");

		citySelect.addEventListener("change", function() {
			var selectedCity = this.value;
			if (selectedCity) {
				// alert("You selected " + selectedCity + ".");
			} else {
				alert("Please select a city.");
			}
		});
	</script>
</body>
</html>
