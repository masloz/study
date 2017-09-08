<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="reply.model.vo.Reply, java.util.*, java.sql.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/emos/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/emos/js/jquery.raty.js"></script>
<script type="text/javascript">
	$(function() {
		$('label#star').raty({
			score : 5,
			path : "/emos/images",
			width : 200,
			click : function(score, evt) {
				$("#starRating").val(score);
				$("#displayStarRating").html(score);
			}
		});
	});
</script>
<script>
function star(data) {
	      var rNumValue = data;
	      var tempA = $("#good" + data);

	      $.ajax({
	         url : "/emos/rgood",
	         data : {rNum : rNumValue},
	         type : "get",
	         success : function(data){
	        	 if(data=="true"){
	        		 tempA.text("♥" + (Number(tempA.text().substring(1)) + 1));
	 	            alert("성공(" + data + ")");
	        	 }else{
	        		 alert("이미 좋아요 완료!");
	        	 }
	            
	         },
	         error : function(data){
	            // tempA.text("♥" + (Number(tempA.text().substring(1)) + 1));
	            alert("실패(" + data + ")");
	         }
	      }); 
	   /* });//click */ 
	   }//star   
</script>
<script>
function rdelete(data) {
	var tr = $(data).parent().parent();
	var rNumValue = data;
	if (!confirm("삭제하시겠습니까?")) {
        return;
    }

	  $.ajax({
	         url : "/emos/rdelete",
	         data : {rNum : rNumValue},
	         type : "get",
	         success : function(data){
	        	 if(data=="true"){
	        		 tr.remove();
	        		 location.reload();
	                 alert("삭제되었습니다.");

	        	 }else{
	        		 alert("삭제할 수 없습니다.");
	        	 }
	            
	         },
	         error : function(data){
	            alert("실패(" + data + ")");
	         }
	      }); 
};
</script>
</head>
<body>
	<hr id=hr>
	<section id=main>
		<%
			if (member != null) {
		%>
		&nbsp; &nbsp; &nbsp;

		<form action="/emos/rinsert?storeNum=<%= s.getStoreNum() %>" method="post">
			<input type="hidden" name="rwriter" value="<%=member.getUserId()%>">
			<table align="center" width="600" bgcolor="yellow" border="1" id="test11">
				<tr>
					<td><input type="text" readonly	value="<%=member.getUserName()%>"></td>
				</tr>
				<tr>
					<td>&nbsp; <label id="star"></label> <!-- <label for="starRating">Value : </label> -->
						<!-- <input type="text" id="starRating" value="0" /> --> <input
						type="hidden" id="starRating" value="5" name="rstar">

						&nbsp; <label id="displayStarRating">5</label> <label
						for="displayStarRating">/5</label>
					</td>
				</tr>
				<tr>
					<td><textarea rows="7" cols="50" name="rcontent"
							placeholder="리뷰를 입력해주세요."></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="등록하기"> &nbsp; <input type="reset" value="등록취소">
					</td>
				</tr>
			</table>
		</form>
		<%
			}
		%>
		&nbsp;
		<table align="center" cellpadding="10" cellspacing="0" border="1"
			width="800" id="ptable">
	
	<%--  <tr align="center" valign="middle"> 
        <td colspan="2"> 
         <% if(member != null){ %>
            <a href="/first/views/Reply/ReplyReplyForm.jsp?bnum=<%= reply.getReplyNum() %>&page=<%= currentPage %>"> [댓글달기] </a> &nbsp;&nbsp; 
         <% } %>          
        </td> 
    	</tr> --%>
    	
		</table>
	</section>
	<p align="center">
		<a href="/emos/index.jsp">시작페이지로 이동</a> &nbsp; 
	</p>
	<hr>

	<footer>
	</footer>
	<script>
$(document).ready(function () {
	var p = 0;
	
	$.ajax({
		url : "/emos/rdetail",
		type : "get",
		dataType : "json",
		/* complete : function(){
				console.log("이거이거");
			}
		, */
		success : function(data){
			//console.log("데이타"+data);
			var jsonStr = JSON.stringify(data);  //객체를 문자열로 변환
			//console.log("dd2" + jsonStr);
			var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
			p = json.currentPage;
			
			var mId = null;
			<%
			if (member != null) {
			%>
				mId = "<%= member.getUserId() %>";
			<% } %>
				
			var values = ""; 
			$("table#ptable").html(); 
			for(var i in json.list){
				
				 //한글 깨짐을 막기 위해 문자 인코딩 처리한 json 객체의 값은 decodeURIComponent() 로 디코딩 처리함
				values += "<tr><td>" + json.list[i].replyNum + "</td><td>" + json.list[i].storeNum + "</td><td>" + json.list[i].userId + "</td><td>" + 
				decodeURIComponent(json.list[i].content) + "</td>"
				values += "<td>";
				for(var k = 0; k < Number(json.list[i].point); k++){
					values +=	"<img src='/emos/images/star-on.png'>" 
				} 
				for(var k = 5; k > Number(json.list[i].point); k--){ 
					values += "<img src='/emos/images/star-off.png'>"
				}
				
				values += '<label id="displayStarRating2" style="padding-left: 10px;">' + json.list[i].point;
				values += '</label> <label for="displayStarRating2">/5</label></td>';
				
				values += "<td>" + json.list[i].replyDate + "</td>";
				
				if(json.list[i].userId == mId){
					values += "<td>♥" + json.list[i].good + "</td>"
					+ "<td><a onclick=rdelete(" + json.list[i].replyNum + ")>삭제</a></td></tr>";
				}else if(mId != null){
					values += "<td><a id=good" + json.list[i].replyNum + " class=good onclick=star(" + json.list[i].replyNum + ")>♥" + json.list[i].good + "</a></td>"
					+ "<td></td></tr>";
				}else{
					values += "<td>♥" + json.list[i].good + "</td><td></td></tr>";
				}
			}
			//console.log("v" + values)
									
			$("table#ptable").append(values);
			},
		error : 
			function(textStatus){
				//console.log("에러 : " + textStatus.status);
		}
		
	}); //ajax
	
	$(document).scroll(function() {
	var maxHeight = $(document).height();
	var currentScroll = $(window).scrollTop() + $(window).height();

	if (maxHeight <= currentScroll + 100) {
					p = p + 1;
					/* p++; */
				//console.log("콘솔" + p);
					$.ajax({
						url : "/emos/rdetail",
						data : {page : p},
						type : "post",
						dataType : "json",
						success : function(data){
							//console.log("데이타"+data);
							var jsonStr = JSON.stringify(data);  //객체를 문자열로 변환
							//console.log("dd2" + jsonStr);
							var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
							
							var mId = null;
							<%
							if (member != null) {
							%>
								mId = "<%= member.getUserId() %>";
							<% } %>
							
							var values = "";
							for(var i in json.list){
								
								if (json.list[i].storeNum == 1) {
								//한글 깨짐을 막기 위해 문자 인코딩 처리한 json 객체의 값은 decodeURIComponent() 로 디코딩 처리함
								values += "<tr><td>" + json.list[i].replyNum + "</td><td>" + json.list[i].storeNum + "</td><td>" + json.list[i].userId + "</td><td>" + 
								decodeURIComponent(json.list[i].content) + 
								"</td>"
								values += "<td>";
								for(var k = 0; k < Number(json.list[i].point); k++){
									values +=	"<img src='/emos/images/star-on.png'>" 
								} 
								for(var k = 5; k > Number(json.list[i].point); k--){ 
									values += "<img src='/emos/images/star-off.png'>"
								}
								
								values += '<label id="displayStarRating2" style="padding-left: 10px;">' + json.list[i].point;
								values += '</label> <label for="displayStarRating2">/5</label></td>';
								
								values += "<td>" + json.list[i].replyDate + "</td>";
								
									if(json.list[i].userId == mId){
										values += "<td>♥" + json.list[i].good + "</td>"
										+ "<td><a onclick = rdelete(" + json.list[i].replyNum + ")>삭제</a></td></tr>";
									}else if(mId != null){
										values += "<td><a id=good" + json.list[i].replyNum + " class=good onclick=star(" + json.list[i].replyNum + ")>♥" + json.list[i].good + "</a></td>"
										+ "<td></td></tr>";
									}else{
										values += "<td>♥" + json.list[i].good + "</td><td></td></tr>";
									}
								}
							}
							
							$("table#ptable").append(values);
						} ,
						error : 
							function(textStatus){
								//console.log("에러 : " + textStatus.status);
						}
						
					}); //ajax
				
			}; //if
	});	//scroll
});//ready
</script>
</body>
</html>
