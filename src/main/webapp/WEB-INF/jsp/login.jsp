<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/headerLinks.jsp" />
<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="container-fluid bg-0 text-center book-recommendations">
	<div class="mid-page bg-white border-radius-top">
		<h1>Please Login</h1>
	    <div style="color: red">${error}</div>
			<form>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" placeholder="Email">
					</div>
				</div>
				<div class="form-group row">
						<label class="col-sm-2 col-form-label">Password</label>
					<div class="col-sm-10">
				    	<input type="password" class="form-control" placeholder="Password">
				  	</div>
				</div>
				<div class="form-group row">
				  	<button type="submit" class="btn bg-white util-block pull-right">Submit</button>
				</div>
			</form>
		</div>
	</div>
</div> <!-- container-fluid -->
    
<c:import url="/WEB-INF/jsp/footer.jsp" />