<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>비밀번호 찾기 | Quration: 답을 열어줄 그런 사람</title>
	
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
</head>
<body>
	
	<header>
		<jsp:include page="/jsp/include/nav_search.jsp" />
	</header> 
	
  	<!-- 비밀번호 찾기 Section -->
    <section id="findPassword">
    	<div class="container marginTop60 minHeight">
    		<div class="row">
			    <div class="page-header  text-center col-md-6 col-md-offset-3">
			        <h1>비밀번호 찾기</h1>
			    </div>
			 </div>
		    <form  name="findPasswordForm" action="${pageContext.request.contextPath }/membership/findPw.do" method="post" 
				   onsubmit="" autocomplete="off" >			    
			    <div class="row">
                    <div class="col-md-6 col-md-offset-3 marginBottom marginTop">
                        <div class="input-group">
                          <input type="text" name="email" class="form-control" placeholder="계정(이메일)" alt="계정(이메일)입력 폼"/>
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-default ">메일 인증</button>
                          </span>
                        </div><!-- /input-group -->
                    </div><!-- /.col-lg-6 -->
                </div><!-- /.row -->
				<div class="row">
						<div class="col-md-push-3 col-md-3 marginBottom marginTop">
							<input type="text" name="firstName" class="form-control" placeholder="이름" alt="회원 가입시 작성한 이름 입력 폼"/>
						</div>
						<div class="col-md-push-3 col-md-3 marginBottom marginTop">
							<input type="text" name="lastName" class="form-control" placeholder="성" alt="회원 가입시 작성한 성 입력 폼"/>		
						</div>
					</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center marginBottom marginTop">
						<select name="question" class="form-control" >
							<option value="비밀번호 찾기 질문을 선택하세요" disabled selected>비밀번호 찾기 질문을 선택하세요</option>
							<option value="첫 애완 동물 이름은 무엇인가요?">첫 애완 동물 이름은 무엇인가요? </option>
							<option value="나의 보물 1호">나의 보물 1호 는?   </option>
							<option value="처음 여행 간 도시 이름">처음 여행 간 도시 이름은?  </option>
							<option value="어머니 성함">어머니 성함은? </option>
							<option value="아버지 성함">아버지 성함은? </option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center  marginTop marginBottom">
						<input type="text" name="answer" class="form-control" placeholder="답변" alt="계정 찾기용 질문 답변 입력 폼"/>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3  text-center marginTop">
						<button type="submit" class="btn btn-primary marginRight">확인</button>
						<a href="${pageContext.request.contextPath}" class="btn btn-default" title="홈 화면 이동 링크" role="button">홈으로</a>
					</div>	
				</div>
			</form>
		</div>
	</section>
	
	<!-- Footer -->
    <Footer>
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer> 
<script>
	if("${ msg }") {
		if('${ userPw }') 
			location.href = "${ pageContext.request.contextPath}";
		else {
			alert('${ msg }');
			location.href = "${ pageContext.request.contextPath}/membership/tellPw.do";
		}
	}
</script>
</body>
</html>