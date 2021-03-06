<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 카드 추천 페이지 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>카드 추천 | Quration: 답을 열어 줄 그런 사람</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	
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
	<div class="container body">
		<header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header>
		<div class="main_container marginTop60 sectionContent">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_personal.jsp" />
			<!-- /nav -->

			<div class="right_col" role="main">
				<!-- page content -->

				<div class="container marginTop30">

					<div class="row">
						<h4 class="col-xs-12 text-muted">
							키워드 맞춤 추천 
							<small>선호 키워드와 검색한 키워드를 바탕으로 추천해 드립니다.</small>
						</h4>
						<c:if test="${ empty customKeywordList }">
							<div class="col-xs-11 well marginLeft30 marginTop">
								<p>이런, 아직 이용하신 키워드가 없군요 &#58;&#40;</p>
								<small class="text-muted">
									<a href="${ pageContext.request.contextPath }/login/interest.do" title="선호 키워드 선택 페이지로 이동">선호 키워드를 선택</a>하거나, 검색한 후에 카드를 추천해드립니다.
								</small>
								<jsp:include page="/jsp/component/search_suggestion.jsp"/>
							</div>
						</c:if>
						<c:set var="cards" value="${ customKeywordList }" scope="request" />
						<section class="col-xs-12 card-container mdl-grid">
							<jsp:include page="/jsp/component/card.jsp"/>
						</section>
					</div>
					
					<div class="row">
						<h4 class="col-xs-12 text-muted marginTop30">
							사이트 맞춤 추천 
							<small>${ userVO.lastName} ${ userVO.firstName } 님이 가장 많은 카드를 담은 사이트의 콘텐츠를 추천해 드립니다.</small>
						</h4>
						<c:if test="${ empty customSourceList }">
							<div class="col-xs-11 well marginLeft30 marginTop">
								<p>이런, 아직 담은 카드가 없습니다. &#58;&#40;</p>
								<small class="text-muted">
									카드를 내 서랍에 담으면 새로운 카드를 추천해드립니다.
								</small>
								<jsp:include page="/jsp/component/search_suggestion.jsp"/>
							</div>
						</c:if>
						<c:set var="cards" value="${ customSourceList }" scope="request" />
						<section class="col-xs-12 card-container mdl-grid">
							<jsp:include page="/jsp/component/card.jsp"/>
						</section>
					</div>
					
					<div class="row">
						<h4 class="col-xs-12 text-muted marginTop30">
							인기 콘텐츠 추천 
							<small>다른 사용자들이 많이 본 콘텐츠를 추천해 드립니다.</small>
						</h4>
						<c:set var="cards" value="${ popularList }" scope="request" />
						<section class="col-xs-12 card-container mdl-grid">
							<jsp:include page="/jsp/component/card.jsp"/>
						</section>
					</div>
					
				</div>

				<!-- /page content -->
			</div>
			<!-- Footer -->
		    <Footer class="footer">
				<jsp:include page="/jsp/include/footer.jsp" />
			</Footer> 
		</div>
	</div>

	<!-- 공통 js -->
	<jsp:include page="/jsp/include/commonJs.jsp" />
	
	<!-- Modal -->
	<jsp:include page="/jsp/modal/card_save.jsp" />
	<jsp:include page="/jsp/modal/report_bug.jsp" />
	<jsp:include page="/jsp/modal/report_spam.jsp" />
	
	<!-- likeBtn Event -->
	<jsp:include page="/jsp/component/likBtnEvent.jsp" />

	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
</body>
</html>