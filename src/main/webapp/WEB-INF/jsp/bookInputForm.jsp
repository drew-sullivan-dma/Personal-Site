<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/headerLinks.jsp" />
<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="secret-input-form">
    <form action="?newBook" method="POST">
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
        <label for="exampleInputPassword1" class="util-block">Categories</label>
        <div class="category-checks">
       	<c:forEach items="${categories}" var="category">
	        <div class="form-check util-inline-block">
	            <label class="form-check-label">
	                <input class="form-check-input" name="category-${category.name}" type="checkbox" value="${category.categoryId}">&nbsp;${category.name}
	            </label>
	        </div>
	    </c:forEach>
	    </div>
        <button type="submit" class="btn btn-primary util-block">Submit</button>
    </form>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />