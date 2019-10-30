<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" type="text/css" href="resources/CSS/A_P002_D002.css?ver=1">
</head>

<div id="wrap">
        <div class="wrap-inner">
    <div id="contents" class="member-join" role="region">
		<div class="section-main" role="main">			
			<form method="post" action="./join.aspx" id="generalMemberFrm" class="joinFrm">
				<h2>가입 신청 양식</h2>
				<fieldset class="basic-info">
					<span><em class="require">(필수)</em>표시 항목은 필수 입력 항목입니다</span>
					<div class="required-group">					
						<label for="userId" class="header"><em class="require">(필수)</em>아이디(ID)</label>
						<span class="form-guide" id="spUseridValid">6~12자 영문, 숫자로 입력 해주세요.</span>                        
						<input name="ctl00$ContentPlaceHolder1$userId" type="text" id="userId" style="width:170px" title="6~12자 영문, 숫자로 입력 해주세요." maxlength="12" required="">
						<button type="button" onclick="return fnDuplicCheck();" id="btnDuplicCheck">중복확인</button>
                        <input name="ctl00$ContentPlaceHolder1$h_IdConfirm" type="hidden" id="h_IdConfirm" value="N">
                        <input name="ctl00$ContentPlaceHolder1$h_UserIdConfirm" type="hidden" id="h_UserIdConfirm">						
					</div>

					<div class="required-group">
                        <span class="header"><em class="require">(필수)</em>실명확인</span>                   
                        <button type="button" id="btnCertPhone" onclick="fnCertCheck('phone');">휴대폰 인증</button>
                        <button type="button" id="btnCertIpin" onclick="fnCertCheck('ipin');">I-PIN 인증</button>                      
					</div>
					<div class="gotten-user-info">
						<dl>
							<dt>이름</dt>
							<dd id="ddUserName">홍길동</dd>
							<dt>성별</dt>
							<dd id="ddSex">남</dd>
							<dt>생년월일</dt>
							<dd id="ddBirth">2018년 1월 10일</dd>
						</dl>
					</div>
					<div>
						<label for="phoneNumber" class="header">휴대폰번호</label>
						<input name="ctl00$ContentPlaceHolder1$phoneNumber" type="text" id="phoneNumber" style="width:170px" maxlength="13" class="isPhone" required="">
					</div>
					<div class="required-write-group">
						<div>
							<label for="password" class="header"><em class="require">(필수)</em>비밀번호</label>
							<span class="form-guide">8~20자, 영문 대,소문자, 숫자, 특수문자(.!@#$%) 중 3가지 조합으로 입력하세요.</span>
							<input name="ctl00$ContentPlaceHolder1$password" type="password" id="password" style="width:170px" title="8~20자, 영문 대,소문자, 숫자, 특수문자(.!@#$%) 중 3가지 조합으로 입력하세요." maxlength="20" required="">
						</div>
						<div>
							<label for="passwordCheck" class="header"><em class="require">(필수)</em>비밀번호확인</label>
							<span class="form-guide">비밀번호재입력</span>
							<input name="ctl00$ContentPlaceHolder1$passwordCheck" type="password" id="passwordCheck" style="width:170px" title="비밀번호재입력" maxlength="20" required="">
						</div>
					</div>
					<div class="email-group">
						<label for="emailAddress" class="header">이메일주소</label>
						<span class="form-guide email-guide">※휴대폰번호와 이메일 주소는 아이디/비밀번호찾기 및 이벤트 당첨 연락에 사용되니 정확히 입력 해주세요.</span>
						<input name="ctl00$ContentPlaceHolder1$emailAddress" type="text" id="emailAddress" maxlength="100" style="width:170px" title="이메일 아이디부분" required="">
						<span class="email-at">@</span>
						<input name="ctl00$ContentPlaceHolder1$emailDomain" type="text" id="emailDomain" maxlength="100" style="width:120px" required="" title="이메일 도메인 부분">
						<select name="domainSelect" id="domainSelect" class="email-choice" style="width:120px" title="이메일 도메인을 선택하세요">
							<option value="direct">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hotmail.com">hotmail.com</option>	
						</select>
					</div>
					
				</fieldset>
				<h2>서비스 이용약관 동의</h2>
				<fieldset class="survice-agreement">
					<input type="checkbox" name="allAgreement" id="allAgreement">
					<label class="all-agreement" for="allAgreement">전체약관에 동의합니다</label>
					<div class="terms-group">
						<div>
							<h3>서비스 이용약관(필수)</h3>
							<a href="https://www.pooq.co.kr/customer/agreement.html" target="_blank" title="새 창 띄움">약관크게보기</a>
							<blockquote class="terms-body" tabindex="0">서비스 이용약관 내용</blockquote>
							<input name="ctl00$ContentPlaceHolder1$serviceAgreement" type="checkbox" id="serviceAgreement">
							<label for="serviceAgreement">동의합니다</label>
						</div>
						<div>
							<h3>개인정보 처리방침(필수)</h3>
							<a href="https://www.pooq.co.kr/customer/agreement.html?category=privacy" target="_blank" title="새 창 띄움">약관크게보기</a>
							<blockquote class="terms-body" tabindex="0">
								개인정보 처리방침 내용

							</blockquote>
							<input name="ctl00$ContentPlaceHolder1$individualDataAgreement" type="checkbox" id="individualDataAgreement">
							<label for="individualDataAgreement">동의합니다</label>
						</div>
							
					</div>
				</fieldset>
                <button onclick="__doPostBack('ctl00$ContentPlaceHolder1$btnConfirm','')" id="btnConfirm" type="button" class="btn-submit">가입하기</button>   
			</form>
		</div>
	</div>

        </div>        
    </div>