<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/headerLinks.jsp" />	
<c:import url="/WEB-INF/jsp/header.jsp" />	

<div class="home-page">
	<div class="container-fluid bg-1 text-center">
		<h3 class="margin">Software Developer</h3>
		<img src="resources/images/pic2.jpg" class="img-responsive margin center-block hero">
		<a href="https://www.linkedin.com/in/drew-sullivan"><i class="fa fa-linkedin-square"></i></a>
		<a href="mailto:drew.sullivan.dma@gmail.com"><i class="fa fa-envelope-o"></i></a>
		<i class="fa fa-mobile test" data-toggle="tooltip" title="(909) 418-8114"></i>
	</div>
	
	<div class="container-fluid bg-3 text-center">    
  		<div class="row">
    		<div class="col-sm-4">
      			<h4>About Me</h4>
      			<a href="aboutMe"><img src="resources/images/pic2.jpg" class="img-responsive margin center-block about-me" style="width:100%" alt="Image"></a>
			</div>
			<div class="col-sm-4"> 
				<h4>Books</h4>
				<a href="bookRecommendations"><img src="resources/images/ereader.png" class="img-responsive margin center-block book-recommendations" alt="e-reader-image"></a>
			</div>
			<div class="col-sm-4"> 
				<h4>Past Life</h4>
				<a href="pastLife"><img src="resources/images/clarinet.png" class="img-responsive margin center-block past-life" style="width:65%" alt="clarinet-image"></a>
    		</div>
  		</div>
	</div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />


