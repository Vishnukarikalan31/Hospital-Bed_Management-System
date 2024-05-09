<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Home Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="fonts/linearicons/style.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
       
        body {
        background-image:url('https://img.freepik.com/free-photo/health-still-life-with-copy-space_23-2148854031.jpg?t=st=1708975454~exp=1708979054~hmac=d6aa57ca4236d7c3bcce49871064098fe9c656a362cdd7ab4946b90864e66add&w=996');
           
             
    background-size: cover; 
    background-position: center;
    background-repeat: no-repeat;
            margin: 0;
            font-family: "Muli-Regular";
            font-size: 14px;
            color: #999;
        }

        .wrapper {
            display: flex;
            justify-content: space-around;
            align-items: center;
            min-height: 100vh;
            margin-left: 500px;
        }

        .inner {
            width: 400px;
            position: relative;
            padding: 20px;
            background: #fff;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            transition: transform 0.3s ease-in-out;
        }

        .inner:hover {
            transform: scale(1.05);
        }

        .image {
            width: 100%;
            max-height: 200px;
            border-radius: 10px 10px 0 0;
        }

        .button-container {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .login-button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-family: "Muli-SemiBold";
            font-size: 15px;
            text-transform: uppercase;
            transition: background 0.3s ease-in-out;
        }

        .admin-button {
            background-color: #ff9999;
            color: #fff;
        }

        .nurse-button {
            background-color: #99ccff;
            color: #fff;
        }

        .admin-button:hover, .nurse-button:hover {
            background-color: #ff6666;
        }

        @media (max-width: 991px) {
            .inner {
                width: 100%;
            }
        }

        @media (max-width: 767px) {
            .wrapper {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>

    <div class="wrapper">
        <div class="inner">
            <img src="https://img.freepik.com/free-photo/young-handsome-physician-medical-robe-with-stethoscope_1303-17818.jpg?w=826&t=st=1708969823~exp=1708970423~hmac=66873a4c33e73ce7bea60cc31aedc401f47ac57909201e70c8081fc97bc87698" alt="Admin Image" class="image">
            <div class="button-container">
                <button class="login-button admin-button" onclick="location.href='AdminLogin.jsp'">
                    Admin Login
                </button>
            </div>
        </div>

        <div class="inner">
            <img src="https://img.freepik.com/premium-photo/middle-selection-female-doctor-stand-bright-modern-hospital-woman-hold-strehoscope-hands_152637-3262.jpg?w=826" alt="Nurse Image" class="image">
            <div class="button-container">
                <button class="login-button nurse-button" onclick="location.href='login.jsp'">
                    Nurse Login
                </button>
            </div>
        </div>
    </div>

</body>
</html>
