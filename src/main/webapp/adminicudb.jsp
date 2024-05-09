<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="dao.ICUDAO" %>
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
    <title>Admin icu dashboard</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    
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
            text-transform: capitalize;
            width: 70%;
            height: 100vh;
           
        }
        .main-course h1{
        	text-align:right;
        }

        .course-box {
            width: 100%;
            height: 100vh;
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
                    out.print("Admin");
                }
                
               
            %>
        </span>
    </a>
</li>

                <li>
                    <a href="AdminDashBoard.jsp">
                        <span class="nav-item">Home</span>
                   </a>
                </li>
                
                <li>
                    <a href="AddICUWard.jsp">
                        <span class="nav-item">Add Bed for ICU</span>
                   </a>
                </li>
                
                
                 <li>
                    <a href="ICUboxes.jsp">
                        <span class="nav-item">View bed</span>
                   </a>
                </li>
                
                <li>
                    <a href="GeneratePDFServlet" >
                        <span class="nav-item">Download Patient Details</span>
                   </a>
                </li>
                
                
               
                <li>
    <a href="adminLogoutServlet" class="logout">
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
            ICUDAO dao = new ICUDAO();

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


       
            <section class="main-course">
           
          
<script>
document.addEventListener("DOMContentLoaded", function() {
    const ctx1 = document.getElementById('barchart').getContext('2d');

    new Chart(ctx1, {
        type: 'bar',
        data: {
            labels: ['Ac beds Occupied', 'non-Ac beds Occupied', 'Ac beds vacant', 'non-Ac beds vacant'],
            datasets: [{
                label: 'Counts',
                data: [<%= session.getAttribute("acbooked") %>,<%= session.getAttribute("nonacbooked") %>,<%= session.getAttribute("acvacant") %>,<%= session.getAttribute("nonacvacant") %> ],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.5)',   // Red
                    'rgba(54, 162, 235, 0.5)',   // Blue
                    'rgba(255, 206, 86, 0.5)',   // Yellow
                    'rgba(75, 192, 192, 0.5)',   // Green
                    'rgba(153, 102, 255, 0.5)', // Purple
                    'rgba(255, 159, 64, 0.5)'    // Orange 
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    const ctx2 = document.getElementById('doughnut').getContext('2d');

    new Chart(ctx2, {
        type: 'doughnut',
        data: {
            labels: ['Ac beds Occupied', 'non-Ac beds Occupied', 'Ac beds vacant', 'non-Ac beds vacant'],
            datasets: [{
                label: 'Counts',
                data: [<%= session.getAttribute("acbooked") %>,<%= session.getAttribute("nonacbooked") %>,<%= session.getAttribute("acvacant") %>,<%= session.getAttribute("nonacvacant") %>],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.5)',   // Red
                    'rgba(54, 162, 235, 0.5)',   // Blue
                    'rgba(255, 206, 86, 0.5)',   // Yellow
                    'rgba(75, 192, 192, 0.5)',   // Green
                    'rgba(153, 102, 255, 0.5)', // Purple
                    'rgba(255, 159, 64, 0.5)'    // Orange
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {}
    });
});
</script>

<style>
.container1 {
    display: flex;
    justify-content: space-around;
    padding: 10%;
    box-sizing: border-box;
}

.chart {
    flex: 1;
    padding: 20px;
    box-sizing: border-box;
    background-color: #f0f0f0;
}
</style>

 
<div class="container1">
    <div class="chart">
        <canvas id="barchart" width="300" height="300"></canvas>
    </div>

    <div class="chart">
        <canvas id="doughnut" width="300" height="300"></canvas>
    </div>
</div>
</body>
    
    </section>
            
      
    
    
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

</html>