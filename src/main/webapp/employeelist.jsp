<%@page import="com.tuespot.entity.User"%>
<%@page import="com.tuespot.entity.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.tuespot.helper.JdbcConn"%>
<%@page import="com.tuespot.dao.EmployeeDao"%>
<% 
	User user=(User)session.getAttribute("currentUser");
	if(user == null){
		response.sendRedirect("login.jsp");
	}
%>
<jsp:include page="header.jsp" /> 
<br>
<br>
<br>
<div class="container">
  <div class="text-center">
  	<h2>Employee Details </h2>  
  </div>     
  <br>    
  <table class="table table-borderless">
    <thead class="thead-dark">
      <tr>
      <th>Employee Id</th>
        <th>Employee Name</th>
        <th>Email Id</th>
        <th>Phone No.</th>
        <th>Salary</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
<%
	EmployeeDao empDao=new EmployeeDao(JdbcConn.getConnection());
	List<Employee> listEmp=empDao.getAllEmployee();
	for(Employee em: listEmp ){

	
%>
      <tr>
        <td><%=em.getId() %></td>
		<td><%=em.geteName() %></td>
		<td><%=em.getEmailId() %></td>
		<td><%=em.getPhoneNo() %></td>
		<td><%=em.getSalary() %></td>
		<td><a href="update.jsp?id=<%=em.getId() %>"><i class='fas fa-edit' style='font-size:30px;color:black'></a></i>&nbsp;&nbsp;&nbsp;<a href="delete.jsp?id=<%=em.getId() %>"><i class='fas fa-trash-alt' style='font-size:30px;color:red'></i></a></td>
      </tr>
<%
	}
%>

    </tbody>
  </table>
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