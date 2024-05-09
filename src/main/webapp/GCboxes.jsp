
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
    <title>GC Bed Vacancy</title>
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
 
        .seat-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
            gap: 10px;
            padding : 50px;
        }

        .bed-box {
            border: 1px solid #000;
            padding: 10px;
            cursor: pointer;
            text-align: center;
        }

        .available { background-color: #aaffaa; }
        .booked { background-color: #ffaaaa; }
        .selected { background-color: #aaffaa; border: 2px solid #00ff00; }
        
       
        
    /* Style for the modal container */
    .modal1 {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        border: 1px solid #000;
        padding: 20px;
        background-color: #fff;
        z-index: 1;
        width: 300px; /* Adjust the width as needed */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    }

    /* Close button style */
    .modal1 span {
        cursor: pointer;
        float: right;
        font-size: 20px;
        font-weight: bold;
    }

    /* Header style */
    .modal1 h2 {
        font-size: 18px;
        margin-bottom: 10px;
    }

    /* Style for paragraphs and labels */
    .modal1 p, .modal label {
        font-size: 14px;
        margin-bottom: 5px;
    }

    /* Style for input fields */
    .modal1 input {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        box-sizing: border-box;
    }

    /* Style for the book button */
    .modal1 button {
        background-color: #4caf50; /* Green background color */
        color: white;
        padding: 10px;
        border: none;
        cursor: pointer;
        width: 100%;
        font-size: 16px;
        border-radius: 5px;
    }

    /* Disabled style for the book button */
    .modal1 button:disabled {
        background-color: #aaaaaa;
        cursor: not-allowed;
    }
    .modal1 input{
    border:1px solid black;
    }
</style>

 <script>
        function toggleSeat(id, bedStatus, bedDetails) {
            var modal = document.getElementById("modal");
            modal.style.display = "block";

            
            var bookButton = document.getElementById("bookButton");
            if (bedStatus === 'available') {
                bookButton.disabled = false;
                var detailsArray = bedDetails.split(',');
                document.getElementById("bedNumber").textContent = "Bed Number: " + detailsArray[1];
                document.getElementById("rent").textContent = "Allowance/day: " + detailsArray[2];
                document.getElementById("patientId").value = ""; 
                document.getElementById("bedDetailsInput").value = bedDetails;
                
            } else {
                bookButton.disabled = true;
            }
           
           
        }

        function hideModal() {
            var modal = document.getElementById("modal");
            modal.style.display = "none";
        }
    </script>
    

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
                    <a href="NurseCardiologyWard.jsp">
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
   
    <h2 style="text-align:right;">AC Beds Rs:1500/Day</h2>
    <div class="course-box">
        <form action="gcBedBook" method="post">
            
            <div class="seat-container">
                <% List<Bed> acBeds = new ArrayList<>();
                try (Connection conn = DBUtil.getConnection();
                     PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM cardiologyward WHERE type='AC'");
                     ResultSet resultSet = preparedStatement.executeQuery()) {

                    while (resultSet.next()) {
                        Bed bed = new Bed();
                        bed.setId(resultSet.getInt("id"));
                        bed.setBedno(resultSet.getString("bedno"));
                        bed.setRent(resultSet.getString("rent"));
                        bed.setNod(resultSet.getString("nod"));
                        bed.setType(resultSet.getString("type"));
                        bed.setPatientid(resultSet.getLong("patientid"));
                        acBeds.add(bed);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                for (Bed bed : acBeds) {
                    String statusClass = (bed.getPatientid() == 0) ? "available" : "booked";
                    String bedDetails = bed.getId() + "," + bed.getBedno() + "," + bed.getRent() + "," + bed.getNod() + "," + bed.getType() + "," + bed.getPatientid();
                    
                    if(statusClass!="booked"){
                    	
              
                %>
                <div id="seat_<%= bed.getId() %>" class="bed-box <%= statusClass %>" onclick="toggleSeat(<%= bed.getId() %>, '<%= statusClass %>', '<%= bedDetails %>')">
                    <p><%= bed.getBedno() %></p>
                </div>
                <%
                }else if(statusClass=="booked"){
                %>
                <div id="seat_<%= bed.getId() %>" class="bed-box <%= statusClass %>">
                    <p><%= bed.getBedno() %></p>
                </div>
                	<%}} %>
                
            </div>

            <!-- Modal for AC Beds -->
            <div id="modal" class="modal1">
                <span class="close" onclick="hideModal()">&times;</span>
                <form action="gcBedBook" method="post">
                    <h2>Bed Details</h2>
                    <p id="bedNumber"></p>
                    <p id="rent"></p>
                    <label for="patientId">Patient ID:</label>
                    <input type="number" id="patientId" name="patientId">
                    <input type="hidden" id="bedDetailsInput" name="bedDetails">
                    <button id="bookButton" type="submit" disabled>Book Bed</button>
                </form>
            </div>
        </form>
    </div>

    <!-- Non-AC Beds Section -->
    <h2 style="text-align:right;">Non-AC Beds Rs:750/Day</h2>
    <div class="course-box">
        <form action="gcBedBook" method="post">
            
            <div class="seat-container">
                <% List<Bed> nonacBeds = new ArrayList<>();
                try (Connection conn = DBUtil.getConnection();
                     PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM cardiologyward WHERE type='Non-ac'");
                     ResultSet resultSet = preparedStatement.executeQuery()) {

                    while (resultSet.next()) {
                        Bed bed = new Bed();
                        bed.setId(resultSet.getInt("id"));
                        bed.setBedno(resultSet.getString("bedno"));
                        bed.setRent(resultSet.getString("rent"));
                        bed.setNod(resultSet.getString("nod"));
                        bed.setType(resultSet.getString("type"));
                        bed.setPatientid(resultSet.getLong("patientid"));
                        nonacBeds.add(bed);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                for (Bed bed : nonacBeds) {
                    String statusClass = (bed.getPatientid() == 0) ? "available" : "booked";
                    String bedDetails = bed.getId() + "," + bed.getBedno() + "," + bed.getRent() + "," + bed.getNod() + "," + bed.getType() + "," + bed.getPatientid();
                    if(statusClass!="booked"){
                    	
                        
                        %>
                        <div id="seat_<%= bed.getId() %>" class="bed-box <%= statusClass %>" onclick="toggleSeat(<%= bed.getId() %>, '<%= statusClass %>', '<%= bedDetails %>')">
                            <p><%= bed.getBedno() %></p>
                        </div>
                        <%
                        }else if(statusClass=="booked"){
                        %>
                        <div id="seat_<%= bed.getId() %>" class="bed-box <%= statusClass %>">
                            <p><%= bed.getBedno() %></p>
                        </div>
                        	<%}} %>
            </div>

            <!-- Modal for Non-AC Beds -->
            <div id="modal" class="modal1">
                <span class="close" onclick="hideModal()">&times;</span>
                <form action="gcBedBook" method="post">
                    <h2>Bed Details</h2>
                    <p id="bedNumber"></p>
                    <p id="rent"></p>
                    <label for="patientId">Patient ID:</label>
                    <input type="number" id="patientId" name="patientId">
                    <input type="hidden" id="bedDetailsInput" name="bedDetails">
                    <button id="bookButton" type="submit" disabled>Book Bed</button>
                </form>
            </div>
        </form>
    </div>

</section>

</body>
</html>
