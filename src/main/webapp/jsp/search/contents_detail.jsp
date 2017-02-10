<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${ contents.title } | Quration: 답을 열어 줄 그런 사람</title>
    <!-- 각 콘텐츠 제목을 title로 동적 지정 -->

    <!-- Bootstrap CSS SET -->
    <link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
    
    <!-- icon-font -->
    <script src="https://use.fontawesome.com/bbddce3010.js"></script>
    
    <!-- MDL Hosted start -->
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />
    
	<script>
    	<!-- google analytics -->
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
		
		ga('create', 'UA-90558257-1', 'auto');
		ga('send', 'pageview');
	</script>
	
</head>

<body>
    <div class="container">
	    <header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header> 
		
        <!-- Breadcrumb -->
        <div class="row">
        	<div class="col-md-12">
	            <ol class="breadcrumb" style="margin-top: 75px">
	                <li><a href="${ pageContext.request.contextPath }/">Home</a></li>
	                <li><a href="#">${ contents.category }</a></li>
	                <li class="active">${ contents.title }</li>
	            </ol>
            </div>
        </div>
        <!-- /Breadcrumb -->

        <div class="row">
            <section class="col-md-8">
                <!-- main information of contents -->
                <article>
                    <header>
                        <p class="pull-right">
                        	<a href="${ contents.url }" target="_blank" title="원본 페이지로 이동(새 창)">
	                        	<i class="fa fa-external-link" aria-hidden="true"></i>
	                        	원본 보기
                        	</a>
                        </p>
                        <p>
                            <span class="label label-default">
                            	${ contents.category }
                            </span>
                            <span class="label label-info">
                            	${ contents.dataType }
                            </span>
                            <a href="${ contents.sourceUrl }" class="label label-primary" target="_blank" title="원본 사이트로 이동(새 창)">
                            	${ contents.source }
                            </a>
                        </p>
                        <div class="">
                        	<h2>${ contents.title }</h2>
                        </div>
                    </header>
                    
                    <p class="text-justify marginTop40">${ contents.summary }</p>
                    <footer class="text-right ">
                        <time class="text-muted">${ contents.lastScraped }</time>
                    </footer>
                </article>

                <div role="toolbar" class="pull-right marginTop40">
					<c:choose>
						<c:when test="${ (userVO ne null) and (not empty userVO) }">
							<button type="button" class="btn btn-info saveCardBtn" 
								data-toggle="modal" data-target="#saveCardModal" 
								id="${ card.no }" title="카드 담기">
		                        <i class="fa fa-bookmark-o" aria-hidden="true"></i> 저장하기
		                    </button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-info saveCardBtn" 
								id="${ card.no }" title="카드 담기: 로그인이 필요한 서비스입니다">
		                        <i class="fa fa-bookmark-o" aria-hidden="true"></i> 저장하기
		                    </button>
						</c:otherwise>
					</c:choose>
					<%-- 
                    <button type="button" class="btn btn-info" title="카드를 좋아합니다.">
                        <i class="fa fa-heart-o" aria-hidden="true"></i> 좋아요
                    </button> 
                    --%>
                    <div id="report" class="btn-group" title="신고">
                        <a href="#" role="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
                            <i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Report
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                            	<a href="${ pageContext.request.contextPath }/contact/bug.do?no=${ contents.no }&type=contents" title="오류 신고">
	                            	<i class="fa fa-bug fa-fw" aria-hidden="true"></i>
	                            	오류 신고
	                            </a>
                            </li>
                            <li>
	                            <a href="${ pageContext.request.contextPath }/contact/spamContents.do?no=${ contents.no }" title="유해물 신고">
	                            	<i class="fa fa-ban fa-fw" aria-hidden="true"></i>
	                            	유해물 신고
	                            </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- /main information of contents -->

            <!-- additional information of contents -->
            <aside class="col-md-3 well pull-right marginRight15">
            	<%--
                <div id="info">
                	<p class="lead"><i class="fa fa-info-circle" aria-hidden="true"></i> 정보</p>
                	<ul class="list-unstyled">
                		<li><strong>${ contents.viewCnt }</strong>회 조회</li>
                		<li><strong>${ contents.saveCnt }</strong>명이 저장함</li>
                		<li><strong>${ contents.likeCnt }</strong>명이 좋아함</li>
                	</ul>
                </div>
                --%>
                <hr/>
                <div id="share">
                    <p class="lead"><i class="fa fa-share-alt" aria-hidden="true"></i> 공유</p>
                    <ul class="list-unstyled" role="menu">
                        <li><a href="#" title="카카오톡으로 공유"><i class="fa fa-commenting fa-fw" aria-hidden="true"></i> KakaoTalk</a></li>
                        <li><a href="#" title="페이스북으로 공유"><i class="fa fa-facebook fa-fw" aria-hidden="true"></i> Facebook</a></li>
                        <li><a href="#" title="트위터로 공유"><i class="fa fa-twitter fa-fw" aria-hidden="true"></i> Twitter</a></li>
                        <li><a href="#" title="에버노트로 공유"><i class="fa fa-sticky-note fa-fw" aria-hidden="true"></i> Evernote</a></li>
                    </ul>
                </div>
               
            </aside>
            <!-- /additional information of contents -->
        </div>
        
        <!-- memo -->
        <section id="memo" class="row">
            <hr/>
            <h4>Memo</h4>
            
			<%-- 메모가 없을 때 --%>
        	<c:if test="${ (memoList eq null) or (empty memoList) }"> 
				<div class="row">
					<div class="col-md-12">
						<p class="lead text-muted">첫 메모를 남겨보세요 &#58;&#41;</p>
					</div>
				</div>
        	
				<div class="row">
					
				</div>
        	</c:if>
	        	
       		<div class="row card-container mdl-grid">
				<!-- Button trigger modal -->
       			<div id="addMemo" class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--0dp">
	       			<c:choose>
	       				<c:when test="${ (userVO ne null) and (not empty userVO) }">
	       					<button type="button" class="btn btn-default btn-block"
									data-toggle="modal" data-target="#writeMemo" 
									style="min-height: 15.2em">
								<i class="fa fa-plus-circle fa-5x text-muted" aria-hidden="true"></i>
							</button>
	       				</c:when>
	       				<c:otherwise>
	       					<button type="button" class="btn btn-default btn-block" onclick="location.href='${ pageContext.request.contextPath }/login/login.do'"
									style="min-height: 15.2em">
								<i class="fa fa-plus-circle fa-5x text-muted" aria-hidden="true"></i>
							</button>
	       				</c:otherwise>
	       			</c:choose>
					
				</div>
					
	        	<%-- 메모가 있을 때 --%>
	        	<c:if test="${ (memoList ne null) and (not empty memoList) }">
	        		<c:forEach var="memo" items="${ memoList }" varStatus="loop">
	                <!-- card -->
	                <div id="${ memo.no }" class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">
	                    <div class="mdl-card__title mdl-color-text--grey-500">
	                        <h5 class="author mdl-card__title-text">
	                        	<c:out value="${ memo.lastName } ${ memo.firstName }"/>
	                        </h5>
	                    </div>
	                    <div class="content mdl-card__supporting-text mdl-color-text--grey-800">
	                        <p id="${ memo.no }" class="message text-justify"><c:out value="${ memo.message }"/></p>
	                    </div>
	                    <div class="mdl-card__menu">
	                        <div id="report" class="btn-group dropdown pull-right" title="신고">
	                            <a href="#" role="button" class="dropdown-toggle mdl-color-text--grey-500" data-toggle="dropdown" aria-expanded="false" title="메모 관리">
	                                <i class="fa fa-bars fa-lg" aria-hidden="true"></i>
	                            </a>
	                            <ul class="dropdown-menu" role="menu">
	                            <c:if test="${ memo.memberNo eq userVO.no }">
	                                <li>
	                                	<a href="#" id="${ memo.no }" class="editMemo" role="button" title="메모 수정">
		                                	<i class="fa fa-pencil fa-fw" aria-hidden="true"></i>
		                                	수정
	                                	</a>
	                                </li>
	                                <li>
	                                	<a href="#" id="${ memo.no }" class="delMemo" role="button" title="메모 삭제">
		                                	<i class="fa fa-trash fa-fw" aria-hidden="true"></i>
		                                	삭제
	                                	</a>
	                                </li>
	                                <li role="presentation" class="divider"></li>
	                            </c:if>
	                                <li>
	                                	<a href="${ pageContext.request.contextPath }/contact/bug.do?no=${ memo.no }&type=memo" title="오류 신고">
		                                	<i class="fa fa-bug fa-fw" aria-hidden="true"></i>
		                                	오류 신고
	                                	</a>
	                                </li>
	                            <c:if test="${ memo.memberNo ne userVO.no }">
	                                <li>
	                                	<a href="${ pageContext.request.contextPath }/contact/spamMemo.do?no=${ memo.no }" title="유해물 신고">
	                                		<i class="fa fa-ban fa-fw" aria-hidden="true"></i>
	                                		유해물 신고
	                                	</a>
	                                </li>
	                            </c:if>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	                <!-- /card -->
					</c:forEach>
				</c:if>
       		</div>
        </section>
        <!-- /memo -->
    </div>
    <!-- /container -->
    
    <!-- footer -->
    <jsp:include page="/jsp/include/footer.jsp" />
    <!-- /footer -->

	<!-- Bootstrap JS SET -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

    <!-- Modal -->
	<jsp:include page="/jsp/modal/memo_add.jsp" />
	
	<!-- Modal -->
	<jsp:include page="/jsp/modal/card_save.jsp" />
	
	
</body>

</html>