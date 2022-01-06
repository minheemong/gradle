<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>

<div  class="clear"></div>

<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script>
  $.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
  });

  $(function() {
    $("#datepicker1, #datepicker2").datepicker();
    

  });
  
  $(function(){
      var num = 2;
      var time1;
      $('img').hover(
         function(){
            clearInterval(time1);
         },
         function(){
            time1 =  setInterval(function(){
                 $('img').attr('src','static/images/jeju_hotel'+num+".JPEG");
                 num++;
                 if(num==4) num=1;
             },2500);
         }
      );
      $('img').trigger('mouseleave')
   });

  
function days () {
	var datepicker1= document.getElementById('datepicker1').value;
	var datepicker2=  document.getElementById('datepicker2').value;
	
	
	
	
	fromDate= new Date(datepicker1);
	toDate = new Date(datepicker2);
	
	var days =  (((toDate - fromDate)/1000)/3600)/24;
	

	
	
	alert(datepicker2);
	alert(datepicker1);
	alert(days);
	
}

  
</script>
<style>
#main_video{
position: relative; text-align: center; margin:0 auto; font-weight: bold;
    font-size: 30px; 
    margin-top: 10px;
    
}
</style>


<div id="main_img">
   <img id="img" src="static/images/jeju_hotel1.JPEG">     
</div>


<form name="formm" method="post" action="bookForm" style="background-color: #F1EBD6;">
<div id="serch_bar_view"  style="border:1px solid black;">
           <div id="serch_bar">
                  <ul>
                    <li >체크인&nbsp;&nbsp;<input type="text"  name="checkin" id="datepicker1" size="20" > </li>                  
                    <li >체크아웃&nbsp;&nbsp;<input type="text" name="checkout" id="datepicker2" size="20" >  </li>
                            
                    <li>객실&nbsp;&nbsp;<input type="text" name="roomnum" size="5" id="datepicker3" ></li>
                    <li>성인&nbsp;&nbsp;<input type="text" name="usernum" size="5" id="datepicker4"></li>
                    <li><input type="submit" value="검색하기" id="serch_bar_button" onclick="return checkRoom();"></li>
                  </ul>
           </div>           
</div>
</form>
<script type="text/javascript"></script>
<div id="main_video">
<div style="text-style">  제주 우리 호텔 소개 영상 </div>
<div>
<iframe width="800" height="330" src="https://www.youtube.com/embed/wphai3v-SXE?autoply=1&mute=1" 
title="YouTube video player" frameborder="0" allow="accelerometer; autoplay=; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
allowfullscreen></iframe>
</div>
</div>


<%@ include file="footer.jsp" %>