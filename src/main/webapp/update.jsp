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
  	<h2>Employee Update </h2>  
  </div>     
  <br>  
  <hr>
  <br>  
<%
	String id=request.getParameter("id");
	
	int ids=Integer.parseInt(id);
	EmployeeDao empDao=new EmployeeDao(JdbcConn.getConnection());
	List<Employee> listEmp=empDao.getEmployeeById(ids);
	for(Employee em: listEmp ){

	
%>
      <div class="row">
      	<div class="col-md-4"></div>
      	<div class="col-md-4">
			  <form action="update" method="post">
			    <div class="form-group">
			      <label for="email">Name</label>
			      <input type="hidden" class="form-control" id="name" placeholder="Enter Name" name="id" value="<%=em.getId() %>">
			      <input type="text" class="form-control" id="name" placeholder="Enter Name" name="eName" value="<%=em.geteName() %>">
			    </div>
			    <div class="form-group">
			      <label for="email">Email</label>
			      <input type="email" class="form-control" id="email" placeholder="Enter Email" name="emailId" value="<%=em.getEmailId() %>">
			    </div>
				<div class="form-group">
			      <label for="phoneNo">Phone No.</label>
			      <input type="number" class="form-control" id="phoneNo" placeholder="Enter Phone No." name="phoneNo" value="<%=em.getPhoneNo() %>">
			    </div>
			    <div class="form-group">
			      <label for="salary">Salary</label>
			      <input type="number" class="form-control" id="salary" placeholder="Enter salary" name="salary" value="<%=em.getSalary() %>">
			    </div>
			    <button type="submit" class="btn btn-primary">Submit</button>
			  </form>
      	</div>
      	<div class="col-md-4"></div>
      </div>
<%
	}
%>

    </tbody>
  </table>
</div>
</body>
</html>
