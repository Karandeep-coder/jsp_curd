<!DOCTYPE html>
<html lang="en">
<head>
  <title>Register</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

  <style>
      html,body { 
            height: 100%; 
        }

        .global-container{
            height:100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f5f5f5;
        }

        form{
            padding-top: 10px;
            font-size: 14px;
            margin-top: 30px;
        }

        .card-title{ font-weight:300; }

        .btn{
            font-size: 14px;
            margin-top:20px;
        }


        .login-form{ 
            width:330px;
            margin:20px;
        }

        .sign-up{
            text-align:center;
            padding:20px 0 0;
        }

        .alert{
            margin-bottom:-30px;
            font-size: 13px;
            margin-top:20px;
        }
  </style>

</head>
<body>

    <div class="global-container">
        <div class="card login-form">
        <div class="card-body">
            <h3 class="card-title text-center">Create Account</h3>
            <div class="card-text">
                <!--
                <div class="alert alert-danger alert-dismissible fade show" role="alert">Incorrect username or password.</div> -->
                <form action="register" method="post" id="myForm">
                    <!-- to error: add class "has-danger" -->
                    <div class="form-group">
                        <label for="exampleInputEmail1">Username</label>
                        <input type="text" class="form-control form-control-sm" name="userName" id="exampleInputusername1" aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" class="form-control form-control-sm" name="email" id="exampleInputEmail1" aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input type="password" class="form-control form-control-sm" name="password" id="exampleInputPassword1">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Create</button>
                    
                    <div class="sign-up">
                        Already have an account? <a href="login.jsp">Login One</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>
    

</body>
</html>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
	$(document).ready(function(){
		$("#myForm").on("submit",function(e){
			e.preventDefault();
			
			
			$.ajax({
				url : "register",
				type : "POST",
				data : new FormData(this),
				processData : false,
				contentType : false,
				success : function(data){
					if(data.trim() == "done"){
						document.location.href='/Tuespot/login.jsp';
					}else{
						swal("Error !", "Something went wrong!", "warning");
					}
					
				},
				error(error){
					console.log(error)
				} 
		
			})
			//const myForm = new FormData(this);
			//console.log(myForm);
		})
		
		
	})
</script>