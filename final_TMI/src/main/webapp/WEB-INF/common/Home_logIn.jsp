<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-------------------------------------- js,css연결 -------------------------------------->
<script src="/tmi/js/home.js" type='text/javascript'></script>
<link href='/tmi/css/homeLogin.css' type='text/css' rel='stylesheet'>

<!---------------------------------------- 헤더 연결 ---------------------------------------->
<jsp:include page="../include/Header.jsp"></jsp:include>
<title>세계의 모든일 Task Universe</title>
<script type="text/javascript">
 /* 	$(document).ready(function(){
		var p = $('.project');
		p.css('margin-top','-80px');
		
		$('#pro_div').on('mouseover',function(){
			p.css('margin-top','0px');
	
			if(p.length>6)
			$('#pro_div').css({'margin-top':'50px','padding-top':'0px'});
			else{
				$('#pro_div').css({'margin-top':450-p.length*50+'px','padding-top':'0px'});
			}
			$('#projects').hide();
			
			$('.project').on('mouseover',function(){
				if(p.length>6){
					 if($('#pro_div').css('padding-top').split('p')[0]<50) {
							$('#pro_div').css({'width':'1200px','transition':'0s'});
							$(this).css('width', '1170px');
						 }
				}else{
					 if($('#pro_div').css('padding-top').split('p')[0]<50*(6-p.length)) {
							$('#pro_div').css({'width':'1200px','transition':'0s'});
							$(this).css('width', '1170px');
						 }
				}
						
			}).on('mouseleave',function(){
				$(this).css('width', '320px');
			})
			
			
		}).on('mouseleave',function(){
			p.css('margin-top','-80px');
			$('#pro_div').css({'margin-top':'350px','transition':'1.2s','width':'500px','padding-top':'100px'});
			$('#projects').show();
		}) */
		
/* 					$('.project').on('mouseover',function(){
				if(p.length>6){			
					 if($('#pro_div').css('padding-top').split('p')[0]<50) {
							$('#pro_div').css({'width':'1200px','transition':'0s'});
							$(this).css('width', '1170px');
						 }				
				}
					else{
						$('#pro_div').css({'width':'1200px','transition':'0s'});
						$(this).css('width', '1170px');
					}
			}).on('mouseleave',function(){
				$(this).css('width', '320px');
			}) */

 	/* }) */
 </script>
 <style type="text/css">
 .project{
visibility: hidden;
margin-top: -80px;
 }
 #projects{
visibility: visible;
 }
  #pro_div{
 }
 #pro_div:hover{
margin-top: 50px;
padding-top: 0px;
 }
 #pro_div:hover> #projects{/*  */
transition:0s;
visibility: hidden;
 }
#pro_div:hover>.project{
margin-top: 0px;
visibility: visible;
 }

.project:hover{	/*  */
  transition-delay:0.5s;
transform: translate(-30%, 0);
width: 1170px;
 }
 </style>
</head>
<body>
	<div id='bodywrap'>
		<div id="pro_div">
			<c:choose>
				<c:when test="${not empty projectHomeList }">
					<c:forEach items="${projectHomeList}" var="i">
						<div class='project'>
							<input type="hidden" name="pro_id" id="pro_id"
								value="${i.pro_id }">
							<div class="pro_header">
								<div class="pro_name no-drag  tmi_skin tmi_skin1">${i.pro_name }
								</div>
							</div>
							<div class="pro_body">
								<div class="pro_man no-drag">
									<span>매니저</span>${i.pro_man }</div>
								<div class="pro_per no-drag">
									<span>진행률</span>${i.pro_per }</div>
								<div class="pro_end no-drag">
									<span>종료일</span>${i.pro_end }</div>
								<div class="pro_dday no-drag">
									<c:choose>
										<c:when test="${i.pro_dday >0 }">
											<p>D</p>-${i.pro_dday }
										</c:when>
										<c:when test="${i.pro_dday ==0 }">
											<p>D</p>day
										</c:when>
										<c:when test="${i.pro_dday <0 }">
											<strong class="pro_dday_over">기한초과</strong>
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class='project' id='projects'>
							<div class="pro_header">
								<div class="pro_name no-drag  tmi_skin tmi_skin1">마우스를 올려주세요
								</div>
							</div>
						</div>
					
				</c:when>				
				<c:otherwise>
					<div style="text-align: center">
						<div style="font-size: 31px; padding: 21px;">프로젝트가 없어요</div>
						아래의 버튼을 눌러 프로젝트를 생성해주세요
					</div>
				</c:otherwise>
			</c:choose>
			<form id="pro-form" class="modal" action="project/insertProject">
				<label for="pro_name">프로젝트 제목</label> <input type="text"
					required="required" autocomplete="off" id="pro_name" maxlength="10"
					name="pro_name" placeholder="프로젝트 제목">
					<div id="overlap" style="display: none; color: red;">중복된 이름입니다</div>
					 <label
					for="pro_info">프로젝트 내용</label> <input type="text"
					required="required" autocomplete="off" id="pro_info"
					name="pro_info" placeholder="프로젝트 내용"> <label
					for="pro_start">프로젝트 기간</label> <input type="text"
					readonly="readonly" required="required" id="pro_start"
					name="pro_start" placeholder="프로젝트 시작일"> <input type="text"
					readonly="readonly" required="required" id="pro_end" name="pro_end"
					placeholder="프로젝트 종료일"> <label for="search_id">아이디로
					팀원들을 찾아보세요</label>
				<ul class="table-list" id="pro_team_list">

				</ul>
				<input type="text" id="search_id">
				<ul id="search_result" hidden="" class="autocomplete-results">
				</ul>

				<input id="pro-form_btn" type="button" value="프로젝트 추가">
			</form>
		</div>
		<a href="#" class="btn pro_name no-drag  tmi_skin tmi_skin1">프로젝트
			추가</a>
	</div>

</body>
</html>