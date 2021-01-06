<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<article>
			<div class="container" role="main">
				<h2>board Form</h2>
				<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/board/saveBoard">
					<div class="mb-3">
						<label for="title">제목</label>
						<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
					</div>
	
					<div class="mb-3">
						<label for="reg_id">작성자</label>
						<input type="text" class="form-control" name="reg_id" id="reg_id" placeholder="이름을 입력해 주세요">
					</div>
	
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
					</div>
	
					<div class="mb-3">
						<label for="tag">TAG</label>
						<input type="text" class="form-control" name="tag" id="tag" placeholder="태그를 입력해 주세요">
					</div>
				</form>
				<div >
					<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
				</div>
			</div>
		</article>
	</body>
	
	<script>
			window.onload = function(){
				var listBtn = document.getElementById('btnList');
				var insertBtn = document.getElementById('btnSave');
				
				listBtn.onclick = function(){
					location.href = "/board/getBoardList";			
				}
				
				insertBtn.onclick = function(){
					console.log('나는 야이야이야~')
					if(validation()){
						document.getElementById('form').submit();	
					}
				}
			}
			
			function validation(){
				var title = document.getElementById('title');
				var regId = document.getElementById('reg_id');
				var content = document.getElementById('content');
				
				if(title.value === null || title.value === ''){
					alert('제목을 입력해주세요.');
					title.focus();
					return false;
				}else if(regId.value === null || regId.value === ''){
					alert('작성자를 입력해주세요.');
					regId.focus();
					return false;
				}else if(content.value === null || content.value === ''){
					alert('내용을 입력해주세요.');
					content.focus();
					return false;
				}
				
				return true;
			}
		</script>
</html>