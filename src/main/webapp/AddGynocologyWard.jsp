<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gynocaology Ward Sheets Form</title>
    <style>
        body {
              font-family: "Muli-Regular", Arial, sans-serif;
           background-image:url('assets/img/hospitals.jpg');
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .wrapper {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #accffe;
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
            height: 500px;
        }

        .image-2 {
            position: absolute;
            bottom: 0;
            right: -129px;
        }

        form {
            width: 65%;
            position: relative;
            z-index: 10;
            padding: 25px 50px 32px;
            background: #fff;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
            -webkit-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
            -moz-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
            -ms-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
            -o-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-transform: uppercase;
            font-size: 25px;
            font-family: "Muli-SemiBold";
            color: #333;
            letter-spacing: 3px;
            text-align: center;
            margin-bottom: 33px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        select,
        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            border: none;
            width: 100%;
            height: 49px;
            margin-top: 20px;
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
</head>
<body>
   
        <div class="inner">
        
            <form action="gcServlet" method="post">
                <h2>Gynocology Ward Bed Adding Form</h2>

                <label for="bedno">Bed Number:</label>
                <input type="text" id="bedno" name="bedno" required><br>

                <label for="Rent">Rent:</label>
                <select id="Rent" name="rent" required>
                <option value="" disabled selected></option>
                    <option value="750">750/DAY</option>
                    <option value="1500">1500/DAY</option>
               
                </select><br>

               <label for="type">Type:</label>
                <select id="type" name="type" required>
                <option value="" disabled selected></option>
                    <option value="Non-ac">NON-AC</option>
                    <option value="ac">AC</option>
                </select>

                <button type="submit">Add Bed</button>
            </form>

          
        
    </div>
</body>
</html>
