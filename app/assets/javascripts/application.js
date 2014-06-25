// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

window.onload = changeWidth;
window.onresize = changeWidth;
function changeWidth() {
	if (navigator.appName == 'Microsoft Internet Explorer')
	{
		var container = document.getElementById("left-bg");
		container.style.visibility = "hidden";
		var container = document.getElementById('left-bg-border');
		container.style.visibility = "hidden";
		var container = document.getElementById('right-bg');
		container.style.visibility = "hidden";
		var container = document.getElementById('right-bg-border');
		container.style.visibility = "hidden";
	}
}

$(document).ready(function() {
	$divs = $('#last_updates #cat_item');
   	$divs.on('mouseover', function(e) {
       	$(this).addClass("item_border");
       	$(this).find(".moredetails").show();
   	});
   	$divs.on('mouseout', function(e) {
       	$(this).removeClass("item_border");
       	$(this).find(".moredetails").hide();
   	});
   	$("#categories button").on("click", function() {
   		$(this).next('ul').slideToggle();
   		$downarr = $(this).find("#down");
   		$uparr = $(this).find("#up");
   		if ($downarr.is(':visible'))
   		{
   			$downarr.hide();
   			$uparr.show();
   		}
   		else {
   			$downarr.show();	
   			$uparr.hide();
   		}
   	})
})
