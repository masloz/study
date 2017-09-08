<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.C_totop {
	width: 50px;
	height: 48px;
	background-color: #0c0642;
	color: #fff;
	border-radius: 24px;
	text-align: center;
	line-height: 47px;
	position: fixed;
	z-index: 999999;
	top: 100%;
	opacity: .8;
	cursor: pointer;
	font-size: 14px;
	right: 0.6%;
	margin-left: -160px;
	margin-top: -89px;
}

.C_totop:hover {
	transition: all .3s ease-out;
}
</style>

<title>Insert title here</title>
</head>
<body>


	<script>
		$(function() {

			$('.C_totop').click(function() {

				$('body,html').animate({
					'scrollTop' : 0
				}, 500)
			})

			var spotarr = [];

			$('body section').each(function(i, e) {
				spotarr.push($(e).offset().top)
			})

			$(window).scroll(function() {
				var sct = $(window).scrollTop()

				$('body section').each(function(i, e) {
					bg(sct)
				})

			})

			$(window).trigger('scroll')

			function bg(x) {
				if (x > 200) {
					$('.C_totop').css({
						'opacity' : '1'
					})

				} else {
					$('.C_totop').css({
						'opacity' : '0'

					})

				}

			}

			$('.C_totop').on({

				mouseenter : function() {

					$(this).css({
						'background-color' : '#e2d056'
					})
				},

				mouseleave : function() {

					$(this).css({
						'background-color' : '#000'
					})
				}
			})

		})
	</script>


	<!-- Markup -->
	<div class="C_totop">
		<span>TOP</span>
	</div>



</body>
</html>