<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_components/all_css.jsp"%>
<title>Login</title>
<style>
.btn {
	padding: 4px;
	padding-top: 4px;
	width: 128px;
	padding-top: 5px;
	margin-top: 29px;
	margin-bottom: 22px;
	color: #fff;
	background: #079992;
	border: none;
	border-radius: 17px;
	height: 35px;
	font-size: 19px;
}

.form-group label {
	padding-right: 8px;
}

.form-group input {
	height: 27px;
}

* {
	font-family: RelativeSet, "Skyscanner Relative", -apple-system,
		BlinkMacSystemFont, "Roboto", "Oxygen", "Ubuntu", "Cantarell",
		"Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif
}

.form-group, .head {
	padding-top: 15px;
}
        #snackbar {
  visibility: hidden; /* Hidden by default. Visible on click */
  min-width: 250px; /* Set a default minimum width */
  margin-left: -125px; /* Divide value of min-width by 2 */
  background-color: #079992; /* Black background color */
  color: #fff; /* White text color */
  text-align: center; /* Centered text */
  border-radius: 2px; /* Rounded borders */
  padding: 16px; /* Padding */
  position: fixed; /* Sit on top of the screen */
  z-index: 1; /* Add a z-index if needed */
  left: 50%; /* Center the snackbar */
  bottom: 30px; /* 30px from the bottom */
}

#snackbar.show {
  visibility: visible; /* Show the snackbar */
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

/* Animations to fade the snackbar in and out */
@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}
</style>
</head>
<body style="margin: 0px">
	<%@include file="all_components/navbar.jsp"%>
	<div>
		<div style="padding-left: 30%; padding-right: 30%;">
			<div
				style="border-style: groove; border-radius: 46px; border-color: beige; margin-bottom: 77px; margin-top: 78px;">
				<div class="head" align="center">
					<i class="fa fa-user-circle" aria-hidden="true"
						style="font-size: 40px;"></i>
					<h5 style="font-size: 20px; margin-top: 4px; margin-bottom: 010px;">Login</h5>
				</div>
				<div class="content" align="center">
					<form action="Login" method="post">
						<div class="form-group">
							<label>Enter Email </label> <input required type="email"
								name="email" id="InputEmail">
						</div>
						<div class="form-group">
							<label>Enter Password </label> <input required type="password"
								name="pwd" id="InputPassword">
						</div>
						<button type="submit" class="btn">Login</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<% String register = (String)session.getAttribute("register");
	   session.removeAttribute("register");
	%>
	
	<div id="snackbar"></div>
	
	<script>
        var register = '<%=register%>';
        if (register != 'null') {
			// showToast
			document.getElementById("snackbar").innerHTML = register;
			showToast();
		}
        
        function showToast() {
        	  var x = document.getElementById("snackbar");
        	  x.className = "show";
        	  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
        }
        </script>
</body>
</html>