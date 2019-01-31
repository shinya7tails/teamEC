<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/table.css">
	<title>マイページ</title>
</head>
<body>
	<s:include value="header.jsp"/>
	<div id="contents">
		<h1>マイページ画面</h1>
		<s:form action="PurchaseHistoryAction">
			<table class="vertical-list-table">
				<tr>
					<th scope="row"><s:label value="姓" /></th>
					<td><div class="txt"><s:property  value="#session.familyName"  /></div></td>
				</tr>

				<tr>
					<th scope="row"><s:label value="名" /></th>
					<td><div class="txt"><s:property  value="#session.firstName"  /></div></td>
				</tr>

				<tr>
					<th scope="row"><s:label value="ふりがな" /></th>
					<td><div class="txt"><s:property  value="#session.familyNameKana"  /><span> </span><s:property value="#session.firstNameKana"/></div></td>
				</tr>

				<tr>
					<th scope="row"><s:label value="性別" /></th>
					<td><div class="txt"><s:if test="#session.sex==0">男性</s:if>
						<s:if test="#session.sex==1">女性</s:if></div></td>
				</tr>

				<tr>
					<th scope="row"><s:label value="メールアドレス" /></th>
					<td><div class="txt"><s:property  value="#session.email"  /></div></td>
				</tr>
			</table>
			<div class="submit_btn_box">
				<s:submit value="購入履歴" class="submit_btn" />
			</div>
		</s:form>
	</div>
	<s:include value="footer.jsp" />
</body>
</html>