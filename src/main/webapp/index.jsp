<%@page import="com.tuespot.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="errorpage.jsp" %>

<% 
	User user=(User)session.getAttribute("currentUser");
	if(user == null){
		response.sendRedirect("login.jsp");
	}
%>

<jsp:include page="header.jsp" /> 
    <div class="jumbotron bg-white">
      <div class="container">
        <div class="row mt-5 justify-content-between">
          <div class="col-md-5">
            <h1 style="margin-top: 60px;" class="mb-3 font-weight-bold">
              Home Page
            </h1>
            <p class="mb-4">
              Lorem ipsum dolor sit, amet consectetur <br />
              adipisicing elit. Unde mollitia provident,
            </p>
            <button class="btn btn-warning font-weight-bold">
              Get Started
            </button>
          </div>
          <div class="col-md-6">
            <img
              src="coder.jpg"
              alt="coder image"
              class="img-fluid"
              style="height:300px; width:400px"
            />
          </div>
        </div>
      </div>
    </div>
     <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Add Employee</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form action="addemployee" method="post" id="myForm">
			  <div class="form-group">
			    <label for="name">Name</label>
			    <input type="text" class="form-control" placeholder="Enter Employee Name" id="name" name="eName">
			  </div>
			  <div class="form-group">
			    <label for="email">Email</label>
			    <input type="email" class="form-control" placeholder="Enter Email" id="email" name="emailId">
			  </div>
			  <div class="form-group">
			    <label for="pwd">Phone No.</label>
			    <input type="number" class="form-control" placeholder="Enter Phone no." id="phoneNo" name="phoneNo">
			  </div>
			  <div class="form-group">
			    <label for="pwd">Salary</label>
			    <input type="number" class="form-control" placeholder="Enter Salary" id="salary" name="salary">
			  </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        	<button type="submit" class="btn btn-primary">Submit</button>
			</form>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
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
				url : "addemployee",
				type : "POST",
				data : new FormData(this),
				processData : false,
				contentType : false,
				success : function(data){
					if(data.trim() == "done"){
						swal("Error !", "submit data successfully!", "success");
						$('#myForm).reset();
					}else{
						swal("Error !", "Something went wrong", "warning");
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
