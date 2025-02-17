<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
 
    <style>
        /* Global Styles */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
            color: #333;
            display: flex;
            min-height: 100vh;
            transition: all 0.3s ease;
        }
 
        /* Dark Mode Styles */
        body.dark-mode {
            background-color: #2c3e50;
            color: #ecf0f1;
        }
 
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding-top: 20px;
            position: fixed;
            height: 100%;
            top: 0;
            left: 0;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
 
        .sidebar.dark-mode {
            background-color: #34495e;
        }
 
        .sidebar h3 {
            text-align: center;
            font-size: 20px;
            color: #ecf0f1;
            margin-bottom: 30px;
        }
 
        .sidebar a {
            display: block;
            padding: 5px 10px;
            color: #ecf0f1;
            text-decoration: none;
            font-size: 16px;
            margin-bottom: 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease, padding-left 0.3s ease;
        }
 
        .sidebar a:hover {
            background-color: #34495e;
            padding-left: 35px;
        }
 
        .sidebar a.active {
            background-color: #1abc9c;
            padding-left: 35px;
        }
 
        .main-content {
            margin-left: 250px;
            padding: 30px;
            flex-grow: 1;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
 
        .main-content.dark-mode {
            background-color: #34495e;
        }
 
        h2 {
            font-size: 30px;
            font-weight: 500;
            margin-bottom: 20px;
        }
 
        .btn-logout {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            position: fixed;
            bottom: 20px;
            right: 20px;
        }
 
        .btn-logout:hover {
            background-color: #c0392b;
        }
        .button-container a:hover{
        	 background-color: #34495e;
             padding-left: 35px;
        }
 
        .button-container {
            margin-top: 30px;
            text-align: center;
            cursor: pointer;
        }
 
        .card {
            background-color: #ecf0f1;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
 
        .card.dark-mode {
            background-color: #34495e;
        }
 
        .card h4 {
            margin-bottom: 15px;
            font-size: 22px;
            color: #34495e;
        }
 
        .card.dark-mode h4 {
            color: #ecf0f1;
        }
 
        .card p {
            font-size: 16px;
            color: #7f8c8d;
        }
 
        .card.dark-mode p {
            color: #bdc3c7;
        }
 
        /* Dark Mode Toggle Button */
        .toggle-dark-mode {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #1abc9c;
            color: white;
            border: none;
            padding: 8px 16px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
 
        .toggle-dark-mode:hover {
            background-color: #16a085;
        }
 
        /* Media Query for responsiveness */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }
 
            .main-content {
                margin-left: 200px;
                padding: 20px;
            }
        }
 
        @media (max-width: 480px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
 
            .main-content {
                margin-left: 0;
                padding: 10px;
            }
 
            .sidebar a {
                padding: 15px;
                font-size: 14px;
            }
        }
    </style>
</head>
 
<body>
 
    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Super Admin Dashboard</h3>
        <a href="<c:url value='/superadmin/movie/add' />" class="active">Add Movie</a>
        <a href="<c:url value='/superadmin/theatre/add' />">Add Theatre</a>
        <a href="<c:url value='/superadmin/screen/add' />">Add Screen</a>
        <a href="<c:url value='/superadmin/show/add' />">Add Show</a>
        <a href="<c:url value='/superadmin/bookings' />">Manage Bookings</a>
        <a href="<c:url value='/superadmin/movies' />">Movie List</a>
        <a href="<c:url value='/superadmin/theatres' />">Theatre List</a>
        <a href="<c:url value='/superadmin/shows' />">Shows List</a>
        <a href="<c:url value='/superadmin/screens' />">Screen List</a>
       
        <h4> <a href="/logout" style="color: red; class="btn-primary">Logout</a></h4>
    </div>
 
    <!-- Main Content -->
    <div class="main-content">
        <!--Dark Mode Toggle Button (Top-Right)
        <button class="toggle-dark-mode" onclick="toggleDarkMode()">Toggle Dark Mode</button>-->
        
		                                                                                     
        <!-- Logout Button (Bottom-Right) -->
       <!--  <form action="/logout" method="post">
            <button type="submit" class="btn-logout">Logout</button>
        </form> -->
 
       <h2>Welcome to the Dashboard</h2>
        <div class="card">
            <h4>Manage Movies, Theatres, Screens, and Shows</h4>
            <p>Select one of the options from the sidebar to get started with managing your data.</p>
        </div>
 

          
      
    </div>
 
    <script>
        function toggleDarkMode() {
            document.body.classList.toggle("dark-mode");
            document.querySelector(".sidebar").classList.toggle("dark-mode");
            document.querySelector(".main-content").classList.toggle("dark-mode");
            const cards = document.querySelectorAll(".card");
            cards.forEach(card => card.classList.toggle("dark-mode"));
        }
    </script>
 
</body>
 
 
</html>