$(document).ready(function() {
	            // Sidebar Toggle Functionality
	            $(".toggle-btn").click(function() {
	                $("#sidebar").toggleClass("expand");
	                var icon = $("#icon");
	                icon.toggleClass("bxs-chevrons-right bxs-chevrons-left");
	            });
	        });