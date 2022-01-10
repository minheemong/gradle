<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../adminheader.jsp" %>
   
 <style>
article h1{/* //dd */
 text-align: center; margin-top: 50px;
}

#qnaList123{
margin:0 auto;
 width:1000px; border:1px soloid black; text-align: center;  margin-right: 80px;font-weight:bold;
 margin:0 auto;     border-collapse: collapse;
    border-collapse: collapse;

width:1000px;  border-bottom:1px solid #999;   color:#666; font-size:12px; table-layout:fixed;
margin:0 auto; margin-right:400px; 
border:1;
}
#qnaList123 tr th{
padding:5px 0 6px;  border-top: solid 1px #999;   border-bottom: solid 1px #b2b2b2; background-color:#9F876B; color: #333; font-weight: bold;  
line-height: 10px;
}
#qnaList123 tr td{
padding: 8px 0 6px; border-top:solid 1px #999; background-color:white; color:#333; font-weight: bold; vertical-align: top;
line-height: 30px; 
}
#qna_button{
border:1px solid black;
 height: 36px;
    width: 80px;
    font-weight: bold;
    background: #9F876B;
    font-size: 65%;
    /* //dd */
}

</style>

<script type="text/javascript">

 function go_view(qnaseq){
 	var url="adminQnaDetail?qnaseq="+qnaseq; 
	document.formm.action=url;
	document.formm.submit();
 }

function go_serch_qna(){
	
	if(document.formm.key.value=="") return;
	var url="adminQnaList?page=1";
	// 보던페이지가어떤에피이지 이더라도,검색갤겨의 1페이로 가기위해 파라미터page를 1로 전송.,
	document.formm.action=url;
	document.formm.submit();
	
	
}

function go_total_qna(){
	document.formm.key.value="";
	document.formm.action="adminQnaList?page=1";
	document.formm.submit();
	
}
function go_order_qna(){
	document.form.action="adminQnaList?page=1";
	document.form.submit();

}

</script>

<article>
<div style="margin: auto;">
<h1>Q&amp;A게시글 리스트 ${order}</h1>
<div style="    height: 30px;
    width: 200px;
    margin-bottom: -32px;
    margin-left: 450px;">
<form name="form"  method="post">
		<select name="tag" >		

			<option value ="1" <c:if test="${order eq '1'}">selected</c:if> >최신순</option>
			<option value ="2" <c:if test="${order eq '2'}">selected</c:if>>오래된순</option>
			<option value ="3" <c:if test="${order eq '3'}">selected</c:if> >답변완료</option>
			<option value ="4" <c:if test="${order eq '4'}">selected</c:if>>미답변</option>			
		
		</select> 
	<input  type = "button" value = "검색" onClick="go_order_qna();" style="    font-weight: bold; border: 1px solid black;
    background: #9F876B;">
	
</form>
</div>
<form name="formm" method="post">
<table style=" margin:0 auto;
	width:1000px; border:1px soloid black; text-align: center;  margin-right: 100px;font-weight:bold;">
  <tr>
     <td> 아이디<input type="text" name="key" value="${key}">
           <input class="btn" type="button"  value="검색"  onClick="go_serch_qna();" id="qna_button">
           <input class="btn" type="button" name="btb_total" value="전체보기" onClick="go_total_qna();"id="qna_button">
       
    </td>
    
  </tr>

</table>
</form>

<table  id="qnaList123" style="center;">
    <tr><th>번호</th><th >제목</th><th>작성자</th><th>작성일</th><th>답변여부</th></tr>
       <c:forEach items="${qnaList}" var ="qnaDto">
       <c:set var="size" value="${fn:length(qnaList)-(status.count)+1}"/>
             <tr>
             
         <%--  <td><c:out value="${size}"/></td --%>
             
                    <td>${qnaDto.qnaseq}</td>         
                    <td><a  href="adminQnaDetail?qnaseq=${qnaDto.qnaseq}">${qnaDto.title}</a>
        <c:choose>
        
                 <c:when test="${qnaDto.rep==1}">
                     <img width="10" height="9" id="new" src="static/images/ic_new.gif">  
                </c:when>
             
          </c:choose>    
                    </td>
                    <td >${qnaDto.id}</td>
                    <td><fmt:formatDate value="${qnaDto.indate }"/></td>
                    <td>
                     <c:choose>
                                <c:when test='${qnaDto.rep=="1"}'>(미처리)</c:when>
                                <c:otherwise>(답변 처리완료)</c:otherwise>
                     </c:choose>
                     </td>
              </tr>
       </c:forEach>
</table>
</div>
<br>
 <jsp:include page="../paging/paging.jsp">
		  <jsp:param name="page" value="${paging.page}" />
		  <jsp:param name="beginPage" value="${paging.beginPage}" />
		  <jsp:param name="endPage" value="${paging.endPage}" />
		  <jsp:param name="prev" value="${paging.prev}" />
		  <jsp:param name="next" value="${paging.next}" />
		  <jsp:param name="command" value="adminQnaList"/>
		
</jsp:include> 

</article>

<%@ include file="../adminfooter.jsp" %>