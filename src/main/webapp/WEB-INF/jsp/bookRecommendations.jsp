<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/jsp/headerLinks.jsp" />
<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="container-fluid bg-0 text-center book-recommendations">
	<div class="mid-page bg-white border-radius-top">
	    <div class="row">
	        <div class="col-md-12">
	        	<h1>Book Recommendations</h1>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-12">
		        <p>I've read a ton of great stuff. Please consider purchasing by clicking through to Amazon.com from this site. 
		        I get a small kickback, and it helps me improve the list. Let me know if there's something you think I should read. 
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-12">
	            <div class="dropdown">
					<button class="btn bg-white dropdown-toggle" type="button" data-toggle="dropdown">Go To...
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
					    <c:forEach items="${categories}" var="category">
                        	<li><a href="bookRecommendations/${category.categoryId}">${category.name}</a></li>
                        </c:forEach>
					</ul>
				</div>
				<a href="mailto:drew.sullivan.dma@gmail.com"><button class="btn bg-white pull-right" type="button">Contact Me</button></a>
	        </div>
    	</div>
	</div>
</div> <!-- container -->

<c:import url="/WEB-INF/jsp/footer.jsp" />