<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/jsp/headerLinks.jsp" />
<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="secret-login-form" hidden>
    <form>
        <div class="form-group">
            <label>Password</label>
            <input type="password" class="form-control" name="password" placeholder="Password" id="password">
        </div>
        <input type="button" value="Login" id="submit" class="btn btn-primary login-btn"/>
    </form>
</div>
<div class="secret-input-form" hidden>
    <form <%-- action="bookRecommendations" --%> action="?newBook" method="POST">
        <div class="form-group">
            <label for="exampleInputEmail1">Title</label>
            <input type="text" name="title" class="form-control" placeholder="Title">
        </div>
        <label for="exampleInputPassword1">Author</label>
        <div class="form-inline author-input">
            <input type="text" name="author1FirstName" class="form-control form-first-name" placeholder="First Name">
            <input type="text" name="author1MiddleInitials" class="form-control form-middle-initials" placeholder="Middle Initials">
            <input type="text" name="author1LastName" class="form-control form-last-name" placeholder="Last Name">
            <input type="text" name="author1PostNominalInitials" class="form-control form-post-nominal-initials" placeholder="Post Nominal Initials">
            <button class="btn btn-success author-add" type="button">
                <span class="glyphicon glyphicon-plus"></span>
            </button>
            <button class="btn btn-danger author-subtract" type="button">
                <span class="glyphicon glyphicon-minus"></span>
            </button>
        </div>
        <br>
        <label for="exampleInputPassword1">Description</label>
        <div class="form-inline description-input">
            <textarea type="text" name="description1" class="form-control form-description" placeholder="Description"></textarea>
            <button class="btn btn-success description-add" type="button">
                <span class="glyphicon glyphicon-plus"></span>
            </button>
            <button class="btn btn-danger description-subtract" type="button">
                <span class="glyphicon glyphicon-minus"></span>
            </button>
        </div>
        <br>
        <label for="exampleInputPassword1">Categories</label>
        <c:forEach items="${categories}" var="category">
	        <div class="form-check">
	            <label class="form-check-label">
	                <input class="form-check-input" name="category-${category.name}" type="checkbox" value="${category.categoryId}">&nbsp;${category.name}
	            </label>
	        </div>
        </c:forEach>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
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
		        I get a small kickback, and it helps me improve the list. <a href="mailto:drew.sullivan.dma@gmail.com">Click here</a> to contact me.</p>
		        <button class="secret-login-button">(Login)</button>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-12">
	            <div class="dropdown">
	                <form action="bookRecommendations.jsp" method="POST">
	                    <select id="categoryFilter">
	                        <option selected="selected" disabled="disabled">Filter By...</option>
	                        <option value="0">The Whole List</option>
	                        <c:forEach items="${categories}" var="category">
	                        	<option value="${category.categoryId}">${category.name}</option>
	                        </c:forEach>
	                    </select>
	                </form>
	            </div>
	        </div>
    	</div>
    	<c:forEach items="${categories}" var="category">
		    <div class="row category-${category.categoryId}">
		        <div class="col-md-12 section-title">
		        	<h2 class="category-${category.categoryId}">${category.name}</h2>
		        	<c:forEach items="${category.books}" var="book">
		        		<input id="book" name="book-id-${book.id}" type="hidden" value="${book.id}"></input>
        				<div class="book book-category-${category.categoryId} book-book-id-${book.id}">
        					<div class="row">
	        					<div class="col-sm-9">
	        						<div class="delete-book" hidden>
						        		<form action="?deleteBook" method="POST" class="book-delete-form">
			        						<input name="id" type="hidden" value="${book.id}">
			        						<button type="submit" onClick="return confirm('Are you sure?')" class="btn btn-danger">
							                	<span class="glyphicon glyphicon-remove"></span>
							                </button>
							            </form>
						            </div>
		        					<h3><a data-toggle="modal" data-target="#largeModal${book.id}">${book.title}</a></h3>
	       							<div class="book-author">
		        						<c:forEach items="${book.authors}" var="author" varStatus="loop">
		        							<c:choose>
		        								<c:when test="${author.middleInitials == null && author.postNominalInitials == null}">
		        									${author.firstName}&nbsp;${author.lastName}
		        								</c:when>
		        								<c:when test="${author.middleInitials != null && author.postNominalInitials == null}">
		        									${author.firstName}&nbsp;${author.middleInitials}&nbsp;${author.lastName}
		        								</c:when>
		        								<c:when test="${author.middleInitials == null && author.postNominalInitials != null}">
		        									${author.firstName}&nbsp;${author.lastName}&nbsp;${author.postNominalInitials}
		        								</c:when>
		        								<c:otherwise>
		        									${author.firstName}&nbsp;${author.middleInitials}&nbsp;${author.lastName}&nbsp;${author.postNominalInitials}
		        								</c:otherwise>
		        							</c:choose>
			        						<c:choose>
				        						<c:when test="${fn:length(book.authors) == 2}">
				        							<c:if test="${!loop.last}">
				        								and
				        							</c:if>
				        						</c:when>
				        						<c:when test="${fn:length(book.authors) gt 2}">
				        							<c:if test="${!loop.last}">
					        							<c:choose>
						        							<c:when test="${loop.index == fn:length(book.authors) - 2}">,&nbsp;and&nbsp;</c:when>
						        							<c:otherwise>,&nbsp;</c:otherwise>
					        							</c:choose>
				        							</c:if>
				        						</c:when>
			        						</c:choose>
		        						</c:forEach>
		        					</div>
        						</div>
        						<div class="col-sm-3 btn-box">
								    <a target="_blank" href="https://www.amazon.com/gp/search?ie=UTF8&tag=drewsullivand-20&linkCode=ur2&linkId=fb8b29794ada8afbd24c93c9f7a08f58&camp=1789&creative=9325&index=books&keywords=${book.title}">
								    	<i class="fa fa-book"></i>
								    </a>
								    <img src="//ir-na.amazon-adsystem.com/e/ir?t=drewsullivand-20&l=ur2&o=1" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
								</div>
       						</div>
        				</div>
		        	</c:forEach>
		        </div>
		    </div>
		</c:forEach> 
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
        
        <button data-toggle="modal" data-target="#myModal">Open Modal</button>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
        
	    <div class="row">
	        <div class="col-md-12 section-title"><h2>More to Come!</h2></div>
	    </div>
    </div>
</div> <!-- container -->

<c:import url="/WEB-INF/jsp/footer.jsp" />