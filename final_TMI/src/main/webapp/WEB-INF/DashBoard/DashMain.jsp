<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--추가  --> <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>DashBoard</title>
<link rel="stylesheet" href="../css/Dash_dashMain.css">
<link rel="stylesheet" href="../css/Dash_an-skill-bar.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-indigo.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/snap.svg/0.3.0/snap.svg-min.js"></script> <!-- 도넛그래프  -->
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">



<!--추가  -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
      	<link rel="stylesheet" href="../css/Dash_style.css">
        <link rel="stylesheet" href="../css/Dash_jQuery.verticalCarousel.css">

<link rel="stylesheet" href="../css/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>



<script type="text/javascript">

$(document).ready(function(){
	var sum = parseInt($('#donut_comp').val())+ parseInt($('#donut_haveto').val())+ parseInt($('#donut_bfdead').val())+parseInt($('#donut_afdead').val());
	var deter = new Date(); 
	var year = deter.getFullYear(); 
	var month = new String(deter.getMonth()+1); 
	var day = new String(deter.getDate()); 
	
	// 한자리수일 경우 0을 채워준다. 
	if(month.length == 1){ 
	  month = "0" + month; 
	} 
	if(day.length == 1){ 
	  day = "0" + day; 
	} 

	/* 	$('#donut_haveto').val()+value: $('#donut_bfdead').val() + value: $('#donut_afdead').val()); */
    new Morris.Donut({ 
    	 
        element: 'dashDonut',
        data: [        
                {label: "완료된 일", value: Math.floor(parseInt($('#donut_comp').val())/sum*100)},
                {label: "계획된 일", value: Math.floor(parseInt($('#donut_haveto').val())/sum*100)},
                {label: "마감임박", value: Math.floor(parseInt($('#donut_bfdead').val())/sum*100)},
                {label: "마감지남", value: Math.floor(parseInt($('#donut_afdead').val())/sum*100)}
              ],
          colors: ["#5A5AFF", "#C1FF6B","#FF1493","#46AAFF"], //그래프 color를 지정해줍니다.
          formatter: function (y) { return (y) + "%" } 
    })  
	
	//graph test start
    var sum1 = parseInt($('#wk10').val())+ parseInt($('#wk20').val())+ parseInt($('#wk30').val())+parseInt($('#wk40').val());     
    var sum2 = parseInt($('#wk11').val())+ parseInt($('#wk21').val())+ parseInt($('#wk31').val())+parseInt($('#wk41').val());
    
	 var data= [{ name:$('#wk50').val(),
		  data:[
			    {value:Math.floor(parseInt($('#wk10').val())/sum1*100), date:month+"/"+(day-5)+"/"+year},
			    {value:Math.floor(parseInt($('#wk20').val())/sum1*100), date:month+"/"+(day-10)+"/"+year},
			    {value:Math.floor(parseInt($('#wk30').val())/sum1*100), date:month+"/"+(day-15)+"/"+year},
			    {value:Math.floor(parseInt($('#wk40').val())/sum1*100), date:month+"/"+(day-20)+"/"+year}    
			    ]
			  },
			  { name:$('#wk51').val(),
			  data:[
				  {value:Math.floor(parseInt($('#wk11').val())/sum2*100), date:month+"/"+(day-5)+"/"+year},
				  {value:Math.floor(parseInt($('#wk21').val())/sum2*100), date:month+"/"+(day-10)+"/"+year},
				  {value:Math.floor(parseInt($('#wk31').val())/sum2*100), date:month+"/"+(day-15)+"/"+year},
			      {value:Math.floor(parseInt($('#wk41').val())/sum2*100), date:month+"/"+(day-20)+"/"+year}    
			    ]
			  }
		  ]
		 // Multiple lines
	     options={
	       height: 150,
	       width: 840,
	     }
	  
	   $("#multi").pista(data, options);
   	
	//graph test end
   
   $('.bgstyle').click(function(){
	   $('.bgstyle').css('border','');
	   $('.bgstyle').removeAttr('id','');
	   //$('.bgstyle').removeAttr('name','');
	   $(this).css('border','3px solid lightgreen');
	   $(this).attr('id','bgsel');
	   //$(this).attr('name','bgsel'); 
   })
   
   $('#bgok').click(function(){
	  var bgsel = $('#bgsel').attr('style').substring(48,52);
	  //console.log(bgsel + " asd");
	  window.location.href="/tmi/DashBoard/DashChange?bgsel="+bgsel;
	  
/* 	   $.ajax({
		    url: 'DashChange' // 요청 할 주소
		    type: 'POST' // GET, PUT
		    data: { bgColor: 'ajax'}, // 전송할 데이터
		    dataType: 'text', // xml, json, script, html
		    success: function(jqXHR) {}, // 요청 완료 시
		}) */

   });

   
});





</script>

</head>
<body style="background-image:url(${bg});">
<%@include file="../include/Header.jsp"%>
<%@include file="../include/aside.jsp"%>
<c:forEach var="te" items="${donut}">
 <input type="hidden" id="donut_comp" value="${te.donut_comp}" />
 <input type="hidden" id="donut_haveto" value="${te.donut_haveto}" />
 <input type="hidden" id="donut_bfdead" value="${te.donut_bfdead}" />
 <input type="hidden" id="donut_afdead" value="${te.donut_afdead}" />
</c:forEach>
<c:forEach var="te" items="${graphlist}" begin="0" end="1" varStatus = "status">
	<input type="hidden" id="wk1${status.index}" value="${te.wk1}" />
	<input type="hidden" id="wk2${status.index}" value="${te.wk2}" />
	<input type="hidden" id="wk3${status.index}" value="${te.wk3}" />
	<input type="hidden" id="wk4${status.index}" value="${te.wk4}" />
	<input type="hidden" id="wk5${status.index}" value="${te.pid}" />
</c:forEach>      
      <!--  modal 버튼  -->

 
      <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-small" style="width: 3%;float: right; margin-right: 0.2%;" >
      <img src="../resources/Dash_images/changebg.png" style="width: 20px;">
      </button>
       
       
        <div id="id01" class="w3-modal" >
    <div class="w3-modal-content w3-animate-top w3-card-4" style="width: 31%" >
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2 style="font-family: 'Hi Melody', cursive;">배경화면 바꾸기</h2>
      </header>
      <div class="w3-container" style="z-index:3;">
      
 <!--  이미지 사진 -->     
      <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg01.jpg');"> 
      </div>
      <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg02.jpg');"> 
      </div>
      <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg03.jpg');"> 
      </div>
      <div class="bgstyle" style="background-image:url('../resources/Dash_images/bg04.jpg');"> 
      </div> 
      <br />
 
       <div class="bgstyle" style="background-image:url('../resources/Dash_images/su01.jpg');"> 
      </div>
      <div class="bgstyle" style="background-image:url('../resources/Dash_images/su02.jpg');"> 
      </div>     
      <div class="bgstyle" style="background-image:url('../resources/Dash_images/su03.jpg');"> 
      </div>
      <div class="bgstyle" style="background-image:url('../resources/Dash_images/su04.jpg');"> 
      </div>
      <br />
      
      </div>
      <footer class="w3-container w3-teal" style="margin-top: 1%;">
        <input type="button" class="w3-teal" style="font-family: 'Hi Melody', cursive; border: 0; outline: 0; cursor: pointer;" value="초기화" />
        <input type="button" class="w3-teal" id="bgok" style="font-family: 'Hi Melody', cursive; float:right; border:0; outline:0; cursor: pointer;" value="적용" /> 
      </footer>
    </div>
  </div>


   <!--  전체 틀-->
   <div class="grid_container">
      <!--  첫번째 틀-->
     <!--  첫번째 틀-->
      <div class="board_first">
         <div class="board1">

            <div class="w3-panel w3-pale-white w3-leftbar w3-border-black" style="height: 110%">
               <p class="text-uppercase mar-btm text-sm w3-xlarge">프로젝트 </p>
             <!--   <i class="fa fa-users fa-5x"></i> -->
               <hr>
               <p class="h2 text-thin"><a href="#"><c:out value="${pjcnt}" /></a></p>
            </div>
         </div>

         <div class="board2">
            
            <div class="w3-panel w3-pale-white w3-leftbar w3-border-yellow"
               style="height: 90%">
               <p class="text-uppercase mar-btm text-sm w3-xlarge">전체 일정</p>
              <!--  <i class="fa fa-comment fa-5x"></i> -->
               <hr>
               <p class="h2 text-thin"><a href="#"><c:out value="${alltodocnt}" /> </a></p>
            </div>
         </div>

         <div class="board3">
            

            <div class="w3-panel w3-pale-white w3-leftbar w3-border-purple" 
               style="height: 90%">
               <p class="text-uppercase mar-btm text-sm w3-xlarge">남은 업무</p>
               <!-- <i class="fa fa-shopping-cart fa-5x"></i> -->
               <hr>
               <p class="h2 text-thin"><a href="#"><c:out value="${recnt}" /></a></p>
            </div>


         </div>

         <div class="board4">
              <div class="w3-panel w3-pale-sand w3-leftbar w3-border-dark-grey" style="height: 90%">
                 <p class="text-uppercase mar-btm text-sm w3-xlarge">완료업무</p>
                       <!-- <i class="fa fa-dollar fa-5x"></i> -->
                       <hr>
                       <p class="h2 text-thin"><a href="#"><c:out value="${comcnt}" /></a></p>
              </div>
         </div>
         

      </div>
      
      <!--두번째 틀  -->
      <div class="board_second">
         <!--  두번째 안에 6개 -->
         <div class="board_chart1">
          <div class="verticalCarouselHeader ">
            <div class="w3-container w3-theme w3-large">
                    프로젝트 진행률 (곡선그래프)
          </div>
          </div>
          <div id="multi"></div>  
         </div>
         
         <div class="board_chart2">
          <div class="verticalCarouselHeader ">
            <div class="w3-container w3-theme  w3-large">
                팀원별 기여도 (가로 막대차트) 
          </div>
          </div>
         
            <div class="container" >
               <div id="skill">
               <c:set var = "total" value="0" />
               <c:forEach var="sum" items="${topList}" >
               	<c:set var ="total" value="${total + sum.total}"></c:set>
               </c:forEach>
                <c:forEach var="toplist" items="${topList}" end="4">
                     <div class="skillbar php" style="height:5%;">
                       <div class="filled" data-width="${toplist.total/total*100}%"></div>
                       <span class="title w3-small">${toplist.id}</span>
                       <span class="percent w3-small">
                      <%--  <fmt:formatNumber value="${toplist.total/total*100}" type="percent" maxFractionDigits="2" pattern="0.0%" /> --%>
                       <fmt:parseNumber value="${toplist.total/total*100}" integerOnly="true" />%
                       </span>           
                     </div>
                 </c:forEach>
                 
                 <div class="skillbar sass" style="height:5%;">
                       <div class="filled" data-width="15%"></div>
                       <span class="title w3-small">jjjj</span>
                       <span class="percent w3-small">30</span>
                     </div>
                     
                     <div class="skillbar css" style="height:5%;">
                       <div class="filled" data-width="15%"></div>
                       <span class="title w3-small">tim3</span>
                       <span class="percent w3-small">50</span>
                     </div>
                     
                     <div class="skillbar js" style="height:5%;">
                       <div class="filled" data-width="15%"></div>
                       <span class="title w3-small">tim4</span>
                       <span class="percent w3-small">50</span>
                     </div>
                     <div class="skillbar html" style="height:5%;">
                       <div class="filled" data-width="15%"></div>
                       <span class="title w3-small">tim4</span>
                       <span class="percent w3-small">50</span>
                     </div>
               
<!--                      <div class="skillbar css" style="height:5%;">
                       <span class="title w3-small">ㅎㅎㅎㅎ</span>
                       <span class="percent w3-small">20%</span>
                       <div class="filled" data-width="20%"></div>
                     </div>
               
                     <div class="skillbar js" style="height:5%;">
                       <span class="title w3-small">ㅎㅎㅎㅎ</span>
                       <span class="percent w3-small">30%</span>
                       <div class="filled" data-width="30%"></div>
                     </div>
               
                     <div class="skillbar php" style="height:5%;">
                       <span class="title w3-small">ㅎㅎㅎㅎ</span>
                       <span class="percent w3-small">40%</span>
                       <div class="filled" data-width="40%"></div>
                     </div>
               
                     <div class="skillbar sass" style="height:5%;">
                       <span class="title w3-small">ㅎㅎㅎㅎ</span>
                       <span class="percent w3-small">50%</span>
                       <div class="filled" data-width="50%"></div>
                     </div> -->
                     
                 </div>       <!--  skill div end -->
              </div>    

         </div>
         
         <!----차트3 다가올 일정 ---->
         <div class="board_chart3" style="float: left;">
         
            <div class="verticalCarousel1">
            <div class="verticalCarouselHeader ">
                <h3 class="w3-theme  w3-large"> 다가올 일정</h3>
                <a href="#" class="vc_goDown"><i class="fa fa-fw fa-angle-down"></i></a>
                <a href="#" class="vc_goUp"><i class="fa fa-fw fa-angle-up"></i></a>
            </div>
            <ul class="verticalCarouselGroup vc_list">
           		<c:forEach var="comlist" items="${comlist}">
               <li>
                    <p class="w3-small" style="font-weight: bold;"><a href="#">${comlist.sch_name}</a>
                    <span class="datediv w3-small" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${comlist.sch_start} ~ ${comlist.sch_end} 
                    </span>
                    </p>
                </li>
                </c:forEach>
            </ul>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="../js/Dash_jQuery.verticalCarousel.js"></script>
        <script>
            $(".verticalCarousel1").verticalCarousel({
                currentItem: 1,
                showItems: 4,
            });
        </script>
            </div>
            
            <!--차트 6 도넛 그래프   -->
         <div class="board_chart6">
          <div class="verticalCarouselHeader">
            <div class="w3-container w3-theme w3-large">
                   나의 배정 업무 
          </div>
          </div>
           <!--  <svg id="svg" style="height: 80%;"></svg> -->
            <div class="boxsize">  
            <div id="dashDonut" style="width: 90%;height: 80%; position: static; float: left; margin-top: 20px;">
            </div>
         	</div> 
         	</br>
         	</br>
         	</br>
         	<div class="circle1"></div><p class="w3-large">&nbsp;&nbsp;&nbsp;마감지남</p>
         	<div class="circle2"></div><p class="w3-large">&nbsp;&nbsp;&nbsp;마감임박</p>
         	<div class="circle3"></div><p class="w3-large">&nbsp;&nbsp;&nbsp;계획된 일</p>
         	<div class="circle4"></div><p class="w3-large">&nbsp;&nbsp;&nbsp;완료된 일</p>
         </div>
         <!---- 차트 4 최근 일정 목록---->
         
         <div class="board_chart4"  style="float: left; ">
         
            <div class="verticalCarousel2">
            <div class="verticalCarouselHeader ">
                <h3 class="w3-theme w3-large"> 최근(등록)일정 목록</h3>
                <a href="#" class="vc_goDown"><i class="fa fa-fw fa-angle-down"></i></a>
                <a href="#" class="vc_goUp"><i class="fa fa-fw fa-angle-up"></i></a>
            </div>
            <ul class="verticalCarouselGroup vc_list">
           		<c:forEach var="reList" items="${relist}">
                <li>
                    <p class="w3-small" style="font-weight: bold;"><a href="#">${reList.sch_name}</a>
                     <span class="datediv w3-small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${reList.sch_start} ~ ${reList.sch_end} 
                    </span>
                    </p>
                     <span class="w3-small" style="color: gray;">${reList.id}</span>
                </li>
				</c:forEach>
            </ul>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="../js/Dash_jQuery.verticalCarousel.js"></script>
        <script>
            $(".verticalCarousel2").verticalCarousel({
                currentItem: 1,
                showItems: 4,
            });
        </script>
            </div>
            
            <!--  차트5 타임라인-->
           <div class="board_chart5">
            
            <div class="verticalCarousel3">
            <div class="verticalCarouselHeader ">
                <h3 class="w3-theme  w3-large"> 타임라인</h3>
                <a href="#" class="vc_goDown"><i class="fa fa-fw fa-angle-down"></i></a>
                <a href="#" class="vc_goUp"><i class="fa fa-fw fa-angle-up"></i></a>
            </div>
            <ul class="verticalCarouselGroup vc_list">
                <c:forEach var="tmList" items="${timelist}">
                <li>
                    <p class="w3-small" style="font-weight: bold;"><input type="hidden" value="${tmList.tl_id}" />
                    <a href="#">${tmList.tl_info}</a></p>
                   <span class="w3-small" style="color: gray;"> ${tmList.id} </span>
                </li>
                </c:forEach>
            </ul>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="../js/Dash_jQuery.verticalCarousel.js"></script>
        <script>
            $(".verticalCarousel3").verticalCarousel({
                currentItem: 1,
                showItems: 3,
            });
        </script>
        
        
        
            </div>
         
        <!--  modal 버튼 -->
                 
                 
        </div><!--두번째틀 끝 -->    
      </div> <!--  전체틀 끝 -->
      
      

      

<script src="../js/Dash_jquery.pista.min.js"></script> <!-- 곡선그래프 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
<script src="../js/Dash_an-skill-bar.js"></script>
<script src="../js/Dash_DashMainGraph.js"></script>
<div id="parkclear" style="clear:both"></div>
</body>
</html>