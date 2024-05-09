
    <%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="dao.DashboardDAO" %>
<%@ page import="model.Bed" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>


<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>



<%@ page import="model.Patient" %>
<%@ page import="dao.AllPatientDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="Util.DBUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add Patient</title>
<style>
        * {
            margin: 0;
            padding: 0;
            outline: none;
            border: none;
            text-decoration: none;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
        
            background: #dfe9f5;
        }

       .container {
            display: flex;
            background-image:url('assets/img/hospitals.jpg');
	    background-size: cover; 
	    background-position: center;
	    background-repeat: no-repeat;
        }

            nav {
            position: relative;
            
            height: 43rem;
            background:#fff;
            color: rgba(255, 255, 255, 0.0);
            width: 280px;
            overflow: hidden;
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
        }

        .logo {
            text-align: center;
            display: flex;
            margin: 10px 0 0 10px;
        }

        .logo img {
            width: 45px;
            height: 45px;
            border-radius: 50%;
        }

        .logo span {
            font-weight: bold;
            padding-left: 15px;
            font-size: 18px;
            text-transform: uppercase;
        }

        a {
        	font-weight:1000;
            position: relative;
           	color: Black;
            font-size: 10px;
            display: table;
            width: 280px;
            padding: 10px;
            margin-left: 15px;
        }

        .nav-item {
            position: relative;
            top: 2px;
            margin-left: 10px;
            font-weight: 500;
            font-size: 14px;
            
            
        }

        a:hover {
            background: skyblue;
        }

        .logout {
            position: absolute;
            bottom: 0;
        }

        /* Main Section */
        .main {
            position: relative;
            padding: 20px;
            width: 100%;
        }

        .main-top {
            display: flex;
            width: 100%;
            justify-content: right;
        }
        

        .main-top i {
            position: absolute;
            right: 0;
            margin: 10px 30px;
            color: rgb(110, 109, 109);
            cursor: pointer;
        }

        .main-skills {
           
            display: grid;
		    grid-template-columns: repeat(4, 1fr); 
		    gap: 20px;
            margin-top: 20px;
        }

        .main-skills .card {
            width: 100%;
            margin: 10px;
            background: #fff;
            text-align: center;
            border-radius: 20px;
            padding: 10px;
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
        }

        .main-skills .card h3 {
            margin: 10px;
            text-transform: capitalize;
            font-size: 32px;
        }

        .main-skills .card p {
            font-size: 15px;
        }

        .main-skills .card button {
            background: orangered;
            color: #fff;
            padding: 7px 15px;
            border-radius: 10px;
            margin-top: 15px;
            cursor: pointer;
        }

        .main-skills .card button:hover {
            background: rgba(223, 70, 15, 0.856);
        }

        .main-skills .card i {
            font-size: 22px;
            padding: 10px;
        }

        /* Courses */
        .main-course {
            margin-top: 20px;
            margin-left: 10%;
            text-transform: capitalize;
            width: 50%
           
        }
        .main-course h1{
        	text-align:right;
        }
        .main-course h2{
        color:#fff;
        background:#000;
        padding:5px;
        margin-left:50%;
        border-radius:5px;
        }

        
      .course-box {
            width: 100%;
            height: 250px;
            padding: 30px;
            margin-top: 10px;
             margin-bottom: 20px;
            background:  #fff;
            border-radius: 10px;
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
        h1{
        text-align:center;
        }
        
        
        	
		@font-face {
		  font-family: "Muli-Regular";
		  src: url("../fonts/muli/Muli-Regular.ttf");
		}
		@font-face {
		  font-family: "Muli-SemiBold";
		  src: url("../fonts/muli/Muli-SemiBold.ttf");
		}
		* {
		  -webkit-box-sizing: border-box;
		  -moz-box-sizing: border-box;
		  box-sizing: border-box;
		}

		body {
		  font-family: "Muli-Regular";
		  font-size: 14px;
		  margin: 0;
		  color: #999;
		}

		input, textarea, select, button {
		  font-family: "Muli-Regular";
		}

		p, h1, h2, h3, h4, h5, h6, ul {
		  margin: 0;
		}

		img {
		  max-width: 100%;
		}

		ul {
		  padding-left: 0;
		  margin-bottom: 0;
		}

		a {
		  text-decoration: none;
		}

		:focus {
		  outline: none;
		}

		.wrapper {
		  min-height: 80vh;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  
		}

		.inner {
		  position: relative;
		  width: 435px;
		}

		.image-1 {
		  position: absolute;
		  bottom: -12px;
		  left: -171px;
		  z-index: 99;
		  height:500px
		}

		.image-2 {
		  position: absolute;
		  bottom: 0;
		  right: -129px;
		}

		form {
		  width: 100%;
		  position: relative;
		  z-index: 9;
		  padding: 25px 50px 32px;
		  background: #fff;
		  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
		  -webkit-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
		  -moz-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
		  -ms-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
		  -o-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
		}

		h3 {
		  text-transform: uppercase;
		  font-size: 25px;
		  font-family: "Muli-SemiBold";
		  color: #333;
		  letter-spacing: 3px;
		  text-align: center;
		  margin-bottom: 33px;
		}

		.form-holder {
		  position: relative;
		  margin-bottom: 21px;
		}
		.form-holder span {
		  position: absolute;
		  left: 0;
		  top: 50%;
		  transform: translateY(-50%);
		  font-size: 15px;
		  color: #333;
		}
		.form-holder span.lnr-lock {
		  left: 2px;
		}

		.form-control {
		  border: none;
		  border-bottom: 1px solid #e6e6e6;
		  display: block;
		  width: 100%;
		  height: 38px;
		  background: none;
		  padding: 3px 42px 0px;
		  color: #666;
		  font-family: "Muli-SemiBold";
		  font-size: 16px;
		}
		.form-control::-webkit-input-placeholder {
		  font-size: 14px;
		  font-family: "Muli-Regular";
		  color: #999;
		  transform: translateY(1px);
		}
		.form-control::-moz-placeholder {
		  font-size: 14px;
		  font-family: "Muli-Regular";
		  color: #999;
		  transform: translateY(1px);
		}
		.form-control:-ms-input-placeholder {
		  font-size: 14px;
		  font-family: "Muli-Regular";
		  color: #999;
		  transform: translateY(1px);
		}
		.form-control:-moz-placeholder {
		  font-size: 14px;
		  font-family: "Muli-Regular";
		  color: #999;
		  transform: translateY(1px);
		}
		.form-control:focus {
		  border-bottom: 1px solid #accffe;
		}

		button {
		  border: none;
		  width: 100%;
		  height: 49px;
		  margin-top: 50px;
		  cursor: pointer;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  padding: 0;
		  background: #99ccff;
		  color: #fff;
		  text-transform: uppercase;
		  font-family: "Muli-SemiBold";
		  font-size: 15px;
		  letter-spacing: 2px;
		  transition: all 0.5s;
		  position: relative;
		  overflow: hidden;
		}
		button span {
		  position: relative;
		  z-index: 2;
		}
		button:before,
		button:after {
		  content: '';
		  position: absolute;
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		  z-index: 1;
		  background-color: rgba(52, 152, 253, 0.25);
		  -webkit-transition: all 0.3s;
		  -moz-transition: all 0.3s;
		  -o-transition: all 0.3s;
		  transition: all 0.3s;
		  -webkit-transform: translate(-100%, 0);
		  transform: translate(-100%, 0);
		  -webkit-transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
		  transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
		}
		button:after {
		  -webkit-transition-delay: 0.2s;
		  transition-delay: 0.2s;
		}
		button:hover:before,
		button:hover:after {
		  -webkit-transform: translate(0, 0);
		  transform: translate(0, 0);
		}

		@media (max-width: 991px) {
		  .inner {
			width: 400px;
			left: 4%;
		  }
		}
		@media (max-width: 767px) {
		  .inner {
			width: 100%;
			left: 0;
		  }

		  .image-1,
		  .image-2 {
			display: none;
		  }

		  form {
			padding: 35px;
			box-shadow: none;
			-webkit-box-shadow: none;
			-moz-box-shadow: none;
			-ms-box-shadow: none;
			-o-box-shadow: none;
		  }

		  .wrapper {
			background: none;
		  }
		

		.form-holder p {
		  margin: 10px 0;
		  font-size: 14px;
		  text-align: center;
		  color: #333;
		}

		.form-holder a {
		  color: #99ccff;
		  font-weight: bold;
		  text-decoration: underline;
		}

		.form-holder a:hover {
		  color: #0066cc;
		}

	
    
</style>

 

</head>
<body>

    <div class="container">
        <nav>
            <ul>
                <li>
    <a href="#" class="logo">
        <img src="https://i.pinimg.com/736x/c0/74/9b/c0749b7cc401421662ae901ec8f9f660.jpg" alt="">
        <span class="nav-item">
            <%
                String username = (String) session.getAttribute("username");
                if (username != null) {
                    out.print(username + "!");
                } else {
                    out.print("Guest");
                }
            %>
        </span>
    </a>
</li>

                <li>
                    <a href="NurseICU.jsp">
                        <span class="nav-item">Home</span>
                    </a>
                </li>
                
               
				
                 <li><a href="logoutServlet" class="logout">
        <i class="fas fa-sign-out-alt"></i>
        <span class="nav-item">Log out</span>
    </a></li>
            </ul>
        </nav>
        


<section class="main-course">
     

<body>
<div class="wrapper">
			<div class="inner">
				<img src="image/nurse.png" alt="" class="image-1">
    <form action="add3" method="post">
    	<h1>Add Patient</h1>
        <label for="patientname">Patient Name:</label>
        <input type="text" id="patientname" name="patientname" required>

        <label for="patientage">Patient Age:</label>
        <input type="number" id="patientage" name="patientage" required>

        <label for="gender">Gender:</label>
        <input type="text" id="gender" name="gender" required>

        <label for="patientphonenumber">Patient Phone Number:</label>
        <input type="tel" id="patientphonenumber" name="patientphonenumber" pattern="[0-9]{10}" required>

        <label for="relativephonenumber">Relative Phone Number:</label>
        <input type="tel" id="relativephonenumber" name="relativephonenumber" pattern="[0-9]{10}" required>

        <label for="dateofadmit">Date of Admit:</label>
        <input type="date" id="dateofadmit" name="dateofadmit" required>

        <button type="submit">Submit</button>
    </form>
    
				</div>
			</div>
   

</section>

</body>

</html>