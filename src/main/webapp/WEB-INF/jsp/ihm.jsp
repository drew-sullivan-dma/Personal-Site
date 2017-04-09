<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>I Heart Meetings</title>
		<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/favicons/I_Heart_Meetings_Favicon.png" />
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
			  rel="stylesheet" 
			  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
			  crossorigin="anonymous">
		<link href="<c:url value="/resources/css/ihm.css" />" rel="stylesheet">
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" 
			  rel="stylesheet" 
			  integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" 
			  crossorigin="anonymous">
	</head>
	<body>
		<div class="container">
		    <p id="counter" hidden>0</p>
		    <p class="time text-center">
		        <span id="hours">0</span> hours, 
		        <span id="mins">0</span> mins, 
		        <span id="secs">0</span> secs =</br> &#36;
		        <span id="cost">0</span>
		    </p>
		    <button id="start" class="btn btn-info controlPress" type="button">Start</button>
		    <button id="pause" class="btn btn-info controlRelease" type="button">Pause</button>
		    <button id="stop" class="btn btn-info controlRelease" type="button">Reset</button>
		    <form action="" id="salaryInputForm">    
		        <div class="input-group text-center">
		            <button id="newSalaryButton" class="btn btn-info" type="button">Add Salary</button>
		            <input type="password" id="newSalary"/>
		        </div>
		    </form>
		    <h3 id="totalSalaries"></h3>
		</div>
		<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" 
	    			integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" 
	    			crossorigin="anonymous">
	    	</script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" 
					integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" 
					crossorigin="anonymous">
			</script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" 
					integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" 
					crossorigin="anonymous">
			</script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	    	<script src="<c:url value="/resources/js/ihm.js" />"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
					integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" 
					crossorigin="anonymous"></script>
	</body>
</html>
