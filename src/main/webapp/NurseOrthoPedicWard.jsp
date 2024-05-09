<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="dao.OrthoPedicDAO" %>
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
    <title>Dashboard</title>
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
            margin-top: 10px;
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
            font-size: 22px;
        }

        .main-skills .card p {
            font-size: 12px;
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
            text-transform: capitalize;
           
        }
        .main-course h1{
        	text-align:right;
        }

        .course-box {
            width: 100%;
          height: 100%;
            padding: 10px 10px 30px 10px;
            margin-top: 10px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
        }

        .course-box ul {
            list-style: none;
            display: flex;
        }

        .course-box ul li {
            margin: 10px;
            color: gray;
            cursor: pointer;
        }

        .course-box ul .active {
            color: #000;
            border-bottom: 1px solid #000;
        }

        .course-box .course {
            display: flex;
        }

        .box {
            width: 33%;
            padding: 10px;
            margin: 10px;
            border-radius: 10px;
            background: rgb(235, 233, 233);
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
        }

        .box p {
            font-size: 12px;
            margin-top: 5px;
        }

        .box button {
            background: #000;
            color: #fff;
            padding: 7px 10px;
            border-radius: 10px;
            margin-top: 3rem;
            cursor: pointer;
        }

        .box button:hover {
            background: rgba(0, 0, 0, 0.842);
        }

        .box i {
            font-size: 7rem;
            float: right;
            margin: -20px 20px 20px 0;
        }

        .html {
            color: rgb(25, 94, 54);
        }

        .css {
            color: rgb(104, 179, 35);
        }

        .js {
            color: rgb(28, 98, 179);
        }
        
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            text-align: center;
           
        }

        th, td {
            border:1px solid;
            padding: 12px;
            text-align: left;
             border-radius: 10px;
             text-align: center;
        }

        th {
            
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
            
        }

        tr:hover {
            background-color: #f5f5f5;
        }
        .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0, 0, 0); /* Fallback color */
        background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
    }

    .modal-content {
        background-color: #fefefe;
        margin: 10% auto; /* 10% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 80%; 
        border-radius: 10px;
    }
      .modal1 {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0, 0, 0); /* Fallback color */
        background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
    }
    .modal-content2 {
        background-color: #fefefe;
        margin: 10% auto; /* 10% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 60%; /* Could be more or less, depending on screen size */
        border-radius: 10px;
    }
    .close2 {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .modal-content1 {
        background-color: #fefefe;
        margin: 10% auto; /* 10% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 30%; /* Could be more or less, depending on screen size */
        border-radius: 10px;
    }
    .close1 {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close1:hover,
    .close1:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
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
                    <a href="NurseOrthoPedicWard.jsp">
                        <span class="nav-item">Home</span>
                    </a>
                </li>
                
                <li><a href="javascript:void(0);" onclick="openProfileModal()">
                    <span class="nav-item">Profile</span>
                </a></li>
				<li>
				    <a href="AddPatient.jsp" >
				        <span class="nav-item">Add Patient</span>
				    </a>
				</li>                
				<li><a href="OPboxes.jsp" >
                    <span class="nav-item">View Beds</span>
                </a></li>
                <li><a href="vpop.jsp" >
                    <span class="nav-item">View Patients</span>
                </a></li>
                <li>
    <a href="logoutServlet" class="logout">
        <i class="fas fa-sign-out-alt"></i>
        <span class="nav-item">Log out</span>
    </a>
</li>
            </ul>
        </nav>
        
    <% 
        int count = 0;
        int vac = 0;
        int book = 0;
        int acbooked=0;
        int acvacant=0;
        int nonacbooked=0;
        int nonacvacant=0;
        Connection con = null;

        try {
            con = DBUtil.getConnection();
           	OrthoPedicDAO dao = new OrthoPedicDAO();

            count = dao.getRowCount();
            vac = dao.vacantcount();
            book = dao.Bookedcount();
            acbooked=dao.BookedAcCount();
            acvacant=dao.acvacant();
            nonacbooked=dao.nonacbooked();
            nonacvacant=dao.nonacvacant();
            

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        HttpSession sessionq = request.getSession();
        sessionq.setAttribute("count", count);
        sessionq.setAttribute("vac", vac);
        sessionq.setAttribute("book", book);
        sessionq.setAttribute("acbook", acbooked);
        sessionq.setAttribute("acvacant", acvacant);
        sessionq.setAttribute("nonacbooked", nonacbooked);
        sessionq.setAttribute("nonacvacant", nonacvacant);
    %>
    
<section>
    <div id="profileModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeProfileModal()">&times;</span>
            <!-- Display user details here -->
            <h2>User Profile</h2>
            <p>Username: <%= username %></p>
            <!-- Add more user details as needed -->
        </div>
    </div>
</section>



<section>
<style>
    .form1 {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 400px;
    }

    .form1 h1 {
        text-align: center;
    }

    .form1 label {
        display: block;
        margin-bottom: 8px;
    }

    .form1 input {
        width: 100%;
        padding: 8px;
        margin-bottom: 16px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .form1 button {
        background-color: #4caf50;
        color: #fff;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .form1 button:hover {
        background-color: #45a049;
    }

    .form1 img {
        height: 500px;
    }

    @font-face {
        font-family: "Muli-Regular";
        src: url("../fonts/muli/Muli-Regular.ttf");
    }

    @font-face {
        font-family: "Muli-SemiBold";
        src: url("../fonts/muli/Muli-SemiBold.ttf");
    }


    .form1 {
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

    .form1 h3 {
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

<div id="addPatientModal" class="modal">
    <div class="modal-content1">
       

<div class="wrapper">
			<div class="inner">
				
    <form class="form1" action="addPatientServlet" method="post">
     <span class="close1" onclick="closeAddPatientModal()">&times;</span>
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
			</div>
			</div>
		
			</section>

            
        <section class="main">
            <div class="main-top">
                <h1 style="color:Black; background:White; padding:10px; border-radius:10px ">BMS Hospital - Nurse Dashboard</h1>
                
            </div>
            <div class="main-skills">
            
                <div class="card">
                    <p>Type of Ward Specification</p>
                    <h3>Ortho Pedic Ward</h3>
                </div>
                
             	<div class="card">
			        <p>Total Beds</p>
			        <h3><%= session.getAttribute("count") %></h3>
			    </div>
                
                <div class="card">
                    <p>Total Vacant Beds</p>
                    <h3><%= session.getAttribute("vac") %></h3>
                   
                </div>
                
                <div class="card">
                    <p>Total Occupied Beds</p>
                    <h3><%= session.getAttribute("book") %></h3>
          
                </div>
                
                <div class="card">
			        <p>Occupied AC Beds</p>
			        <h3><%= session.getAttribute("acbook") %></h3>
			    </div>
			    
			    <div class="card">
			        <p>Vacant AC Beds</p>
			        <h3><%= session.getAttribute("acvacant") %></h3>
			    </div>
			    
			    <div class="card">
			        <p>Occupied Non - AC Beds</p>
			        <h3><%= session.getAttribute("nonacbooked") %></h3>
			    </div>
			    
			    <div class="card">
			        <p>Vacant Non - AC Beds</p>
			        <h3><%= session.getAttribute("nonacvacant") %></h3>
			    </div>
            </div>

            <section class="main-course">
            <h1  style="color:Black; background:White; padding:10px; border-radius:10px ">Patients List</h1>
                <div class="course-box">
               <%
        AllPatientDAO patientDAO = new AllPatientDAO();
        List<Patient> patients = null;

        
            patients = patientDAO.getPatientswithOP();
         
    %>

    <table border="1">
        <thead>
            <tr>
                <th>Patient ID</th>
                <th>Patient Name</th>
                <th>Patient Age</th>
                <th>Gender</th>
                <th>Patient Phone Number</th>
                <th>Relative Phone Number</th>
                <th>Date of Admit</th>
                <th>Discharge Patient</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Patient patient : patients) {
            %>
            <tr>
                <td><%= patient.getPatientid() %></td>
                <td><%= patient.getPatientname() %></td>
                <td><%= patient.getPatientage() %></td>
                <td><%= patient.getGender() %></td>
                <td><%= patient.getPatientphonenumber() %></td>
                <td><%= patient.getRelativephonenumber() %></td>
                <td><%= patient.getDateofadmit() %></td>
                <td><a href="OPdeletePatient.jsp?patientId=<%= patient.getPatientid() %>" style="color: red; align-item:center">Discharge</a></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    </div>
    </section>
            
      
    </div>
    
    <script>
    function openAddPatientModal() {
        document.getElementById("addPatientModal").style.display = "block";
    }

   
    function closeAddPatientModal() {
        document.getElementById("addPatientModal").style.display = "none";
    }
   
    function openProfileModal() {
        var modal = document.getElementById('profileModal');
        modal.style.display = 'block';
    }
    
  
    function closeProfileModal() {
        var modal = document.getElementById('profileModal');
        modal.style.display = 'none';
    }
    
  
    
    
</script>

</body>
</html>
