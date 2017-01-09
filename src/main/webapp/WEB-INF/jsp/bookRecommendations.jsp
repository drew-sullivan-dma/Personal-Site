<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/headerLinks.jsp" />
<c:import url="/WEB-INF/jsp/header.jsp" />

<!-- TODO: 
Remove modal from row w/o changing styling

Build tool for choosing the next book based on:
1. Different genre than last time
2. Inspirational/Interesting
3. Getaway
4. How long it's been on the list
5. Sounds good at the moment -->

<div class="container-fluid bg-1 text-center book-recommendations">
	<div class="mid-page bg-2">
	    <div class="row">
	        <div class="col-md-12">
	        	<h1>Book Recommendations</h1>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-12">
		        <p>I've read a ton of great stuff. Please consider purchasing by clicking through to Amazon.com from this site. 
		        I get a small kickback, and it helps me improve the list. Click <a href="mailto:drew.sullivan.dma@gmail.com">here</a> to contact me</p>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-12">
	            <div class="dropdown">
	                <form action="bookRecommendations.jsp" method="POST">
	                    <select disabled name="myselect" id="myselect" onchange="this.form.submit()">
	                        <option selected="selected" disabled="disabled" value="1">Filter By...</option>
	                        <option value="all">The Whole List</option>
	                        <option value="nonFiction">Non-Fiction</option>
	                        <option value="fiction">Fiction</option>
	                    </select>
	                </form>
	            </div>
	        </div>
    	</div>
	    <div class="row">
	        <div class="col-md-12 section-title">
	        	<h2>Non-Fiction</h2>
	        </div>
	    </div>
	    
	    <c:forEach items="${books}" var="book">
		    <div class="row">
		        <div class="col-md-12 section-content">
		        	<div class="book">
		            	<a href="#" data-toggle="modal" data-target="#largeModal${book.id}">${book.title}</a> &mdash; ${book.authorFirstName} ${book.authorLastName}
			            <div class="pull-right icon-list">
			                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
			                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
			                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
			            </div>
		            </div>
		            <div class="modal fade" id="largeModal${book.id}" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
		                <div class="modal-dialog modal-lg">
		                    <div class="modal-content">
		                        <div class="modal-header">
		                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                            <h3 class="modal-title" id="myModalLabel">(At least) One Takeaway</h3>
		                        </div>
		                        <div class="modal-body">
		                            <ul>
		                            	<li>${book.description}</li>
		                            </ul>
		                        </div>
		                    </div>
		                </div>
		            </div> <!-- .modal -->
		        </div>
		    </div> <!-- .row -->
	    </c:forEach>
	    
	    <div class="row">
	        <div class="col-md-12 section-title"><h2>More to Come!</h2></div>
	    </div>
    </div>
</div> <!-- container -->

<c:import url="/WEB-INF/jsp/footer.jsp" />