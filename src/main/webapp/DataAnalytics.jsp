<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
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
            DashboardDAO dao = new DashboardDAO();

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
</head>
<style>
.container {
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
<body>
 
<div class="container">
    <div class="chart">
        <canvas id="barchart" width="300" height="300"></canvas>
    </div>

    <div class="chart">
        <canvas id="doughnut" width="300" height="300"></canvas>
    </div>
</div>
</body>
</html>
