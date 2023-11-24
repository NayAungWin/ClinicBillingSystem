<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
	<style>
		.error {
			color: red
			}
	</style>
</head>
<body>
	<form:form action="validate" modelAttribute="student">
			User name: <form:input path="name" />
			<form:errors path="name" cssClass="error" /><br><br>
			Password(*): <form:password path="pass" />
			<form:errors path="pass" cssClass="error" /><br><br>
			<input type="submit" value="submit">
	</form:form>
</body>
</html>