<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
	<header class="navbar bg-navbar">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>                        
				</button>
			  	<a class="navbar-brand nav-logo" href="${pageContext.request.contextPath}/homePage">
			  		<img src="${pageContext.request.contextPath}/resources/images/logo.png" />
			  	</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
			  	<ul class="nav navbar-nav navbar-right">
				    <li><a href="${pageContext.request.contextPath}/bookRecommendations">Books</a></li>
				    <li><a href="${pageContext.request.contextPath}/aboutMe">About Me</a></li>
				    <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
			  	</ul>
			</div>
		</div>
	</header>