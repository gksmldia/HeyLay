<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 카드 서랍 속 날짜순 정렬 페이지 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>카드 서랍 | Quration: 답을 열어 줄 그런 사람</title>

	<!-- 공통css  -->
 	<jsp:include page="/jsp/include/css.jsp" />
    	
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
<body class="nav-md">
	<div class="container body ">

		<header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
	        <div class="row" style="margin-top: 60px"></div>
		</header>

        <!-- nav -->
		<jsp:include page="/jsp/include/nav_personal.jsp" />
		<!-- /nav -->
        
        <!-- Page Content -->
        <div class="right_col" role="main">
        	<div class="body">
	            <section class="container sectionContent minHeight">
							<div class="row">
								<div class="col-xs-12">
									Sort: 
									<a href="${ pageContext.request.contextPath }/drawer.do?sort=directory">폴더별</a>
									| <a href="${ pageContext.request.contextPath }/drawer.do?sort=days">날짜별</a>
									| <a href="${ pageContext.request.contextPath }/drawer.do?sort=type">자료유형별</a>
									| <a href="${ pageContext.request.contextPath }/drawer.do?sort=source">사이트별</a>
									| <a href="${ pageContext.request.contextPath }/directory.do">폴더 관리</a>
								</div>
							</div>
	                <c:choose>
						<c:when test="${ (cardsByDays eq null) or (empty cardsByDays) }">
							<div class="row">
								<p class="lead text-center marginTop60">아직 저장한 카드가 없습니다 &#58;O</p>
							</div>
							<div class="text-center marginTop80 minHeight700">
								<jsp:include page="/jsp/component/search_suggestion.jsp" />
							</div>
						</c:when>
						<c:otherwise>
							<div class="row">
								<c:forEach var="drawer" items="${ cardsByDays }" varStatus="loop">
									<h4 class="col-xs-12 text-muted">
										${ drawer.header } <small>${ fn:length(drawer.cards) }건</small>
									</h4>
									<c:set var="cards" value="${ drawer.cards }" scope="request" />
									<section class="col-xs-12 card-container mdl-grid">
										<jsp:include page="/jsp/component/card.jsp"/>
									</section>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
	            </section>
            </div>
        </div>
        <!-- /#Page Content -->

    </div>
    <!-- /.container -->
    
	<!-- Footer -->
    <Footer class="footer">
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer>

	<!-- 공통 js -->
	<jsp:include page="/jsp/include/commonJs.jsp" />
	
	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
	
	<!-- Modal -->
	<jsp:include page="/jsp/modal/card_save.jsp" />
	<jsp:include page="/jsp/modal/report_bug.jsp" />
	<jsp:include page="/jsp/modal/report_spam.jsp" />
	
	<!-- likeBtn Event -->
	<jsp:include page="/jsp/component/likBtnEvent.jsp" />
	
</body>
</html>