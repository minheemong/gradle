<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
  
  function checkRoom () {
      var checkinStr =  document.formm.checkin.value;
      var checkoutStr = document.formm.checkout.value;
      var checkin = new Date(checkinStr);
      var checkout = new Date(checkoutStr);
      
   if (checkinStr == ""){
      alert("입실날짜를 입력하세요.");
      return false;
   } else if (checkoutStr == ""){
      alert("퇴실날짜를 입력하세요.");
      return false;
   } else if (document.formm.roomnum.value == ""){
      alert("객실갯수를 입력하세요.");
      document.formm.roomnum.focus();
      return false;
   } else if (document.formm.usernum.value ==""){
      alert("인원수를 입력하세요.");
      document.formm.usernum.focus();
      return false;
   } else if (checkin >= checkout){
      alert("예약날짜오류. 예약날짜를 확인하세요.");
      return false;
   }
 
   
   return true;
 
   
}
  </script>
</head>
<body>
<form name="formm" method="post" action="gotobookdetail" >
<div id="serch_bar_view"  style="border:1px solid black;">
<table>
<caption>
		<h2>${kind}</h2>
</caption>
<tr><td>방 클래스</td>          <td><input type="text"  name="kind" size="" value="${kind}" ></td>
<tr> <td>체크인 날짜</td> <td><input type="text"  name="checkin" id="datepicker1" size="20" ></td></tr>
<tr> <td>체크아웃 날짜</td><td><input type="text"  name="checkout" id="datepicker2" size="20" ></td></tr>
<tr> <td>객실 수</td>      <td><input type="text" name="roomnum" size="5" id="datepicker3" ></td></tr>
<tr> <td>인원  </td >      <td><input type="text" name="usernum" size="5" id="datepicker4">	</td></tr>
<tr><td><input type="submit" value="검색하기" id="" onclick="return checkRoom();"></td></tr>



</table>
   </div>
</form>
</body>
</html>