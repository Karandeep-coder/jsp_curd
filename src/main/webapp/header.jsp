<html>
	<head>
	  <title>Home</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	  <style>
	  	@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
		
		body {
		  font-family: "Poppins" !important;
		}
		
		.my-navbar {
		  box-shadow: 0px 10px 30px rgba(216, 216, 216, 0.45);
		  position: fixed;
		  width: 100%;
		}
		
		.navbar-brand {
		  font-weight: bold;
		}
		.navbar-brand img {
		  width: 50px;
		}
		
		.nav-link {
		  border-bottom: 4px solid white;
		  margin-right: 24px;
		  transition: 0.3s ease;
		  padding: 5px;
		}
		.nav-link:hover {
		  color: black;
		  border-bottom: 4px solid #eb4027;
		}
		.nav-active a {
		  color: black !important;
		  font-weight: 600;
		  border-bottom: 4px solid #eb4027;
		}
	  	
	  </style>
	</head>
	<body>	
	<nav class="navbar my-navbar navbar-expand-lg navbar-light bg-white">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">
          <!--  <img src="https://imgur.com/sbUlQpy" alt="" />-->
          Tuespot</a
        >
        <button
          class="navbar-toggler border-0"
          type="button"
          data-toggle="collapse"
          data-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span
            class="iconify bar-icon"
            data-icon="fa-solid:bars"
            data-inline="false"
          ></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item nav-active">
              <a class="nav-link" href="index.jsp"
                >Home <span class="sr-only">(current)</span></a
              >
            </li>
            <li class="nav-item">
              <a data-toggle="modal" data-target="#myModal" class="nav-link" href="#">Add Employee</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="employeelist.jsp">Employee List</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logout.jsp">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>