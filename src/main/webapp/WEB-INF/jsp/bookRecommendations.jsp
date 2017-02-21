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
    <form action="bookRecommendations" method="POST">
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
            <input type="text" name="description1" class="form-control form-description" placeholder="Description">
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
						        		<form action="bookRecommendations" method="POST" class="book-delete-form">
			        						<input name="bookRecord" type="hidden" value="${book.id}">
			        						<button type="submit" onClick="return confirm('Are you sure?')" class="btn btn-danger">
							                	<span class="glyphicon glyphicon-remove"></span>
							                </button>
							            </form>
						            </div>
		        					<h3><a href="#">${book.title}</a></h3>
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
								    <a href="#">
								    	<i class="fa fa-book" aria-hidden="true"></i>
								    </a>
								    <a href="#">
								    	<i class="fa fa-tablet" aria-hidden="true"></i>
								    </a>
								    <a href="#">
								    	<i class="fa fa-headphones" aria-hidden="true"></i>
								    </a>
								</div>
       						</div>
        				</div>
		        	</c:forEach>
		        </div>
		    </div>
		</c:forEach> 
		   <%--      
		    </div>
			<c:forEach items="${category.books}" var="book">
			    <c:choose>
			    	<c:when test="${book.categoryId == category.categoryId}">
					    <div class="row">
					        <div class="col-md-12 section-content">
					        	<div class="book cut-text book-category-${book.categoryId}">
					            	<span data-toggle="modal" data-target="#largeModal${book.id}">${book.title} &mdash; </span>
					            	<c:choose>
					            		<c:when test="${book.authorMiddleInitials != null && book.authorPostNominalInitials != null}">
					            			${book.authorFirstName} ${book.authorMiddleInitials} ${book.authorLastName}, ${book.authorPostNominalInitials}
					            		</c:when>
					            		<c:when test="${book.authorMiddleInitials == null && book.authorPostNominalInitials != null}">
					            			${book.authorFirstName} ${book.authorLastName}, ${book.authorPostNominalInitials}
					            		</c:when>
					            		<c:when test="${book.authorMiddleInitials != null && book.authorPostNominalInitials == null}">
					            			${book.authorFirstName} ${book.authorMiddleInitials} ${book.authorLastName}
					            		</c:when>
					            		<c:otherwise>
					            			${book.authorFirstName} ${book.authorLastName}
					            		</c:otherwise>
					            	</c:choose>
					            	<c:choose>
					            		<c:when test="${book.secondAuthorMiddleInitials != null && book.secondAuthorPostNominalInitials != null}">
					            			and ${book.secondAuthorFirstName} ${book.secondAuthorMiddleInitials} ${book.secondAuthorLastName}, ${book.secondAuthorPostNominalInitials}
					            		</c:when>
					            		<c:when test="${book.secondAuthorMiddleInitials == null && book.secondAuthorPostNominalInitials != null}">
					            			and ${book.secondAuthorFirstName} ${book.secondAuthorLastName}, ${book.secondAuthorPostNominalInitials}
					            		</c:when>
					            		<c:when test="${book.secondAuthorMiddleInitials != null && book.secondAuthorPostNominalInitials == null}">
					            			and ${book.secondAuthorFirstName} ${book.secondAuthorMiddleInitials} ${book.secondAuthorLastName}
					            		</c:when>
					            		<c:when test="${book.secondAuthorFirstName == null}">
					            			
					            		</c:when>
					            		<c:otherwise>
					            			and ${book.secondAuthorFirstName} ${book.secondAuthorLastName}
					            		</c:otherwise>
					            	</c:choose>
					            	<c:choose>
					            		<c:when test="${book.etAl != null}">
					            			, ${book.etAl}
					            		</c:when>
					            		<c:otherwise>
					            			 ${book.etAl}
					            		</c:otherwise>
					            	</c:choose>
					     			<div class="pull-right icon-list">
						                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
						                <a href="#"><i class="fa fa-tablet" aria-hidden="true"></i></a>
						                <a href="#"><i class="fa fa-headphones" aria-hidden="true"></i></a>
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
					        </div> <!-- .col-md-12 .section-content -->
					    </div> <!-- .row -->
				 	</c:when>
			    </c:choose>
			</c:forEach> 
	    </c:forEach> --%>
	    
	    <div class="row">
	        <div class="col-md-12 section-title"><h2>More to Come!</h2></div>
	    </div>
    </div>
</div> <!-- container -->

<c:import url="/WEB-INF/jsp/footer.jsp" />