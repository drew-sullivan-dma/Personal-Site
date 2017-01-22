$(document).ready(function() {

	//TODO: Refactor into something a human would have actually written
	var currentdate = new Date(); 
    var dateAndTime = "Last Sync: " + currentdate.getDate() + "/"
        + (currentdate.getMonth()+1)  + "/" 
        + currentdate.getFullYear() + " @ "  
        + currentdate.getHours() + ":"  
        + currentdate.getMinutes() + ":" 
        + currentdate.getSeconds();
	
    var springColors = ['#5484A4','#F6D155', '#004B8D', '#F2552C', 
                        '#95DEE3', '#EDCDC2', '#88B04B', '#CE3175', 
                        '#5A7247', '#CFB095'];
    var fallColors = ['#4C6A92', '#92B6D5', '#838487', '#B93A32',
                      '#AF9483', '#AD5D5D', '#006E51', '#D8AE47', 
                      '#9E4624', '#B76BA3'];
    var rand;
    
    if (currentdate.getHours() <= 9 || currentdate.getHours() >= 18) {
        rand = fallColors[Math.floor(Math.random() * springColors.length)];
    } else {
        rand = springColors[Math.floor(Math.random() * springColors.length)];
    }
    
    if (rand === "#CFB095" || 
        rand === '#EDCDC2' || 
        rand === '#95DEE3' || 
        rand === '#F6D155' ||
        rand === '#92B6D5' ||
        rand === '#D8AE47' ||
        rand === '#B76BA3' ||
        rand === '#88B04B') {
    	$('.container-fluid').css('background-color', rand).css('color', '#2f2f2f');
    } else {
    	$('.container-fluid').css('background-color', rand).css('color', 'white');
    }
	
	var colors = ['#5484A4', '#F6D155', '#004B8D', '#F2552C', '#95DEE3', '#EDCDC2', '#88B04B', '#CE3175', '#5A7247'];
	
	$('.navbar-nav li a, .navbar-brand').mouseenter(function() {
	    var rand = colors[Math.floor(Math.random() * colors.length)];
	    $(this).css('color', rand);
	});
	
	$('.navbar-nav li a, .navbar-brand').mouseleave(function() {
	    var rand = colors[Math.floor(Math.random() * colors.length)];
	    $(this).css('color', 'grey');
	});
	
	$('footer a, .mid-page i').mouseenter(function() {
	    var rand = colors[Math.floor(Math.random() * colors.length)];
	    $(this).css('color', rand);
	});
	
	$('footer a, .mid-page i').mouseleave(function() {
	    var rand = colors[Math.floor(Math.random() * colors.length)];
	    $(this).css('color', 'white');
	});
	
	
	$('[data-toggle="tooltip"]').tooltip();
		
	$('#categoryFilter').change(function() {
		var $selection = $(this).val();
		var $opt1 = $('[class$="category-1"]');
		var $opt2 = $('[class$="category-2"]');
		var $opt3 = $('[class$="category-3"]');
		var $opt4 = $('[class$="category-4"]');
		var $opt5 = $('[class$="category-5"]');
		var $opt6 = $('[class$="category-6"]');
		var $opt7 = $('[class$="category-7"]');
		var $opt8 = $('[class$="category-8"]');
		var $opt9 = $('[class$="category-9"]');
		var $opt10 = $('[class$="category-10"]');
//		const NUM_CATEGORIES = 10;
//		
//		for(var i = 1; i <= NUM_CATEGORIES; i++) {
//			if($selection == i) {
//				$('[class$="category-i"]').show('slow');
//			} else {
//				$('[class$="category-i"]').hide('slow');
//			}
//		}
		
		if($selection == 0) {
			$opt1.show('slow');
			$opt2.show('slow');
			$opt3.show('slow');
			$opt4.show('slow');
			$opt5.show('slow');
			$opt6.show('slow');
			$opt7.show('slow');
			$opt8.show('slow');
			$opt9.show('slow');
			$opt10.show('slow');
		}
		if($selection == 1) {
			$opt1.show('slow');
			$opt2.hide('slow');
			$opt3.hide('slow');
			$opt4.hide('slow');
			$opt5.hide('slow');
			$opt6.hide('slow');
			$opt7.hide('slow');
			$opt8.hide('slow');
			$opt9.hide('slow');
			$opt10.hide('slow');
		} 
		if($selection == 2) {
			$opt1.hide('slow');
			$opt2.show('slow');
			$opt3.hide('slow');
			$opt4.hide('slow');
			$opt5.hide('slow');
			$opt6.hide('slow');
			$opt7.hide('slow');
			$opt8.hide('slow');
			$opt9.hide('slow');
			$opt10.hide('slow');
		}
		if($selection == 3) {
			$opt1.hide('slow');
			$opt2.hide('slow');
			$opt3.show('slow');
			$opt4.hide('slow');
			$opt5.hide('slow');
			$opt6.hide('slow');
			$opt7.hide('slow');
			$opt8.hide('slow');
			$opt9.hide('slow');
			$opt10.hide('slow');
		} 
		if($selection == 4) {
			$opt1.hide('slow');
			$opt2.hide('slow');
			$opt3.hide('slow');
			$opt4.show('slow');
			$opt5.hide('slow');
			$opt6.hide('slow');
			$opt7.hide('slow');
			$opt8.hide('slow');
			$opt9.hide('slow');
			$opt10.hide('slow');
		} 
		if($selection == 5) {
			$opt1.hide('slow');
			$opt2.hide('slow');
			$opt3.hide('slow');
			$opt4.hide('slow');
			$opt5.show('slow');
			$opt6.hide('slow');
			$opt7.hide('slow');
			$opt8.hide('slow');
			$opt9.hide('slow');
			$opt10.hide('slow');
		} 
		if($selection == 6) {
			$opt1.hide('slow');
			$opt2.hide('slow');
			$opt3.hide('slow');
			$opt4.hide('slow');
			$opt5.hide('slow');
			$opt6.show('slow');
			$opt7.hide('slow');
			$opt8.hide('slow');
			$opt9.hide('slow');
			$opt10.hide('slow');
		} 
		if($selection == 7) {
			$opt1.hide('slow');
			$opt2.hide('slow');
			$opt3.hide('slow');
			$opt4.hide('slow');
			$opt5.hide('slow');
			$opt6.hide('slow');
			$opt7.show('slow');
			$opt8.hide('slow');
			$opt9.hide('slow');
			$opt10.hide('slow');
		} 
		if($selection == 8) {
			$opt1.hide('slow');
			$opt2.hide('slow');
			$opt3.hide('slow');
			$opt4.hide('slow');
			$opt5.hide('slow');
			$opt6.hide('slow');
			$opt7.hide('slow');
			$opt8.show('slow');
			$opt9.hide('slow');
			$opt10.hide('slow');
		} 
		if($selection == 9) {
			$opt1.hide('slow');
			$opt2.hide('slow');
			$opt3.hide('slow');
			$opt4.hide('slow');
			$opt5.hide('slow');
			$opt6.hide('slow');
			$opt7.hide('slow');
			$opt8.hide('slow');
			$opt9.show('slow');
			$opt10.hide('slow');
		}
		if($selection == 10) {
			$opt1.hide('slow');
			$opt2.hide('slow');
			$opt3.hide('slow');
			$opt4.hide('slow');
			$opt5.hide('slow');
			$opt6.hide('slow');
			$opt7.hide('slow');
			$opt8.hide('slow');
			$opt9.hide('slow');
			$opt10.show('slow');
		} 
	});
});