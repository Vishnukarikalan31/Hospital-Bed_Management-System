<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Patient" %>
<%@ page import="Util.DBUtil" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Patients</title>
    <style >
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
                    <a href="NurseGeneralWard.jsp">
                        <span class="nav-item">Home</span>
                    </a>
                </li>
                
                <li><a href="Boxes.jsp" >
                    <span class="nav-item">View Beds</span>
                </a></li>
				
                   <li>
    <a href="logoutServlet" class="logout">
        <i class="fas fa-sign-out-alt"></i>
        <span class="nav-item">Log out</span>
    </a>
</li>
            </ul>
        </nav>
      <section class="course-box" style="margin-left:8%;">
    <h1>Patient List</h1>
    <%
    // DAO logic directly in JSP (not recommended)

    List<Patient> patients = new ArrayList<>();

    try {
      
        Connection connection = DBUtil.getConnection();
        String query = "SELECT * FROM patient";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Patient patient = new Patient();
                patient.setId(resultSet.getInt("id"));
                patient.setPatientid(resultSet.getLong("patientid"));
                patient.setPatientname(resultSet.getString("patientname"));
                patient.setPatientage(resultSet.getInt("patientage"));
                patient.setGender(resultSet.getString("gender"));
                patient.setPatientphonenumber(resultSet.getString("patientphonenumber"));
                patient.setRelativephonenumber(resultSet.getString("relativephonenumber"));
                patient.setDateofadmit(resultSet.getString("dateofadmit"));
                patient.setDateofdischarge(resultSet.getString("dateofdischarge"));
                patients.add(patient);
            }
        }
        connection.close();
    } catch ( SQLException e) {
        e.printStackTrace();
    }
%>
    <table border="1">
        <thead>
            <tr> 
                <th>Patient ID</th>
                <th>Patient Name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Patient Phone Number</th>
                <th>Relative Phone Number</th>
                <th>Date of Admit</th>
                <th>Date of Discharge</th>
            </tr>
        </thead>
        <tbody>
            <% for (Patient patient : patients) { %>
            <tr>
              
                <td><%= patient.getPatientid() %></td>
                <td><%= patient.getPatientname() %></td>
                <td><%= patient.getPatientage() %></td>
                <td><%= patient.getGender() %></td>
                <td><%= patient.getPatientphonenumber() %></td>
                <td><%= patient.getRelativephonenumber() %></td>
                <td><%= patient.getDateofadmit() %></td>
                 <td><%= (patient.getDateofdischarge() != null) ? patient.getDateofdischarge() : "Staying" %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    </section>
    </div>
</body>
</html>
