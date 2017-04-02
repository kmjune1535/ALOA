<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("div").slice(0, 4).show();
		$("#loadMore").on('click', function(e) {
			e.preventDefault();
			$("div:hidden").slice(0, 4).slideDown();
			if ($("div:hidden").length == 0) {
				$("#loadMore").fadeOut('slow');
			}
			$('html,body').animate({
				scrollTop : $(this).offset().top
			}, 1500);
		});
	});

	$('a[href=#top]').click(function() {
		$('body,html').animate({
			scrollTop : 0
		}, 600);
		return false;
	});

	$(window).scroll(function() {
		if ($(this).scrollTop() > 50) {
			$('.totop a').fadeIn();
		} else {
			$('.totop a').fadeOut();
		}
	});
</script>
<style>
body {
	background-color: #f6f6f6;
	width: 400px;
	margin: 20px auto;
	font: normal 13px/100% sans-serif;
	color: #444;
}

div {
	display: none;
	padding: 10px;
	border-width: 0 1px 1px 0;
	border-style: solid;
	border-color: #fff;
	box-shadow: 0 1px 1px #ccc;
	margin-bottom: 5px;
	background-color: #f1f1f1;
}

.totop {
	position: fixed;
	bottom: 10px;
	right: 20px;
}

.totop a {
	display: inline;
}

a, a:visited {
	color: #33739E;
	text-decoration: none;
	display: block;
	margin: 10px 0;
}

a:hover {
	text-decoration: none;
}

#loadMore {
	padding: 10px;
	text-align: center;
	background-color: #33739E;
	color: #fff;
	border-width: 0 1px 1px 0;
	border-style: solid;
	border-color: #fff;
	box-shadow: 0 1px 1px #ccc;
	transition: all 600ms ease-in-out;
	-webkit-transition: all 600ms ease-in-out;
	-moz-transition: all 600ms ease-in-out;
	-o-transition: all 600ms ease-in-out;
}

#loadMore:hover {
	background-color: #fff;
	color: #33739E;
}
</style>
</head>
<body>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>

	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>

	<div>Content</div>
	<div>Content</div>
	<div>Content</div>
	<div>Content</div>


	<a href="#" id="loadMore">Load More</a>

	<p class="totop">
		<a href="#top">Back to top</a>
	</p>
</body>
</html>