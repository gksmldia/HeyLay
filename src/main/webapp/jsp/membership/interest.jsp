<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>관심사 설정 페이지 | Quration: 답을 열어 줄 그런 사람</title>
	
	<!-- Bootstrap -->
    <link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
	<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
     
    <!-- icon-font -->
   	<script src="https://use.fontawesome.com/bbddce3010.js"></script>
   	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- google analytics -->
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
		
		ga('create', 'UA-90558257-1', 'auto');
		ga('send', 'pageview');
	</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/nav_search.jsp" />
	</header> 
	
	<section id="interest">
		<div class="container marginTop60">
          	<div class="row">
               <div class="page-header text-center col-md-6 col-md-offset-3">
                   <h1>관심 키워드 선택</h1>
               </div>
         	</div>
         	
         	 <form name="interestForm" class="formBottom15" 
                   action="${pageContext.request.contextPath }/interest.do" method="post">
             		<c:forEach var="keyword" items="${ interestList }" varStatus="loop">
             			<div class="col-md-6 col-md-offset-3">
             				<c:out value="${loop.count}"/>
             				<label for="interest">
             					<c:out value="${keyword.keyword}"/>
             				</label>
             				<input type="checkbox" name="interest" id="interest"/> 
             			</div>
             		</c:forEach>
             	<p class="text-center"><small>최소 3항목을 선택해 주세요.</small></p>
             	
             	<div class="row"> 
	                  <div class="col-md-6 col-md-offset-3 text-center ">
	                     <button type="submit" class="btn btn-primary marginRight" >키워드 선택 완료</button>
	                     <button type="reset" class="btn">초기화</button>
	                  </div>
	            </div>      
             </form> 
         </div>
	</section>
	<!-- Footer -->
    <Footer>
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer> 
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
</body>
</html>