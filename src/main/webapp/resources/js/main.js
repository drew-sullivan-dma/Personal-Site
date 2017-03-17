$(document).ready(function() {

	$('[data-toggle="tooltip"]').tooltip();
		
	var authorCount = 2;
	$(document).on('click', '.author-add', function(e) {
	    if(authorCount <= 6) {
	        var $authorInputLast = $(".author-input:last");
	        $authorInputLast.clone().insertAfter($authorInputLast);
	        var $firstName = $(".form-first-name:last");
	        var $middleInitials = $(".form-middle-initials:last")
	        var $lastName = $(".form-last-name:last")
	        var $postNominalInitials = $(".form-post-nominal-initials:last")
	        $firstName.attr("name", "author" + authorCount + "FirstName");
	        $middleInitials.attr("name", "author" + authorCount + "MiddleInitials");
	        $lastName.attr("name", "author" + authorCount + "LastName");
	        $postNominalInitials.attr("name", "author" + authorCount + "PostNominalInitials");
	        authorCount++;
	    } else {
	        document.getElementByClass("author-add").disabled = true;
	    }
	}).on('click', '.author-subtract', function(e) {
	    if(authorCount <= 2) {
	        document.getElementByClass("author-subtract").disabled = true;
	    }
	    var $authorInputLast = $(".author-input:last");
	    $authorInputLast.remove();
	    authorCount--;
	})

	var descriptionCount = 2;
	$(document).on('click', '.description-add', function(e) {
	    if(descriptionCount <= 6) {
	        var $descriptionInputLast = $(".description-input:last");
	        $descriptionInputLast.clone().insertAfter($descriptionInputLast);
	        var $description = $(".form-description:last");
	        $description.attr("name", "description" + descriptionCount);
	        descriptionCount++;
	    } else {
	        document.getElementByClass("description-add").disabled = true;
	    }   
	}).on('click', '.description-subtract', function(e) {
	    if(descriptionCount <= 2) {
	        document.getElementByClass("desciption-subtract").disabled = true;
	    }
	    var $descriptionInputLast = $(".description-input:last");
	    $descriptionInputLast.remove();
	    descriptionCount--;
	})
});