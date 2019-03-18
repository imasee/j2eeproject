<!-- User Login Page-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login User</title>

}
</head>
<body>
<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/j2eeproject"
                           user="root"  password="123"/>

<div>
	<form method="post">
		<fieldset>
			<legend>Login</legend>
			<br>
			<center>
			<table>
				<tr>
					<td>User Id :</td>
					<td><input type="text" name="username" placeholder="user name"></td>
				</tr>
				<tr>
					<td>Password :</td>
					<td><input type="text" name="password" placeholder="Password"></td>
				</tr>
				<tr>
					<td><input type="submit" name="login" value="Log In"></td>
					<td><a href=""> Register new user.</a></td>
					
					<c:if test="${param.login != null }">
						<c:set var="userName" value="${ param.username}"></c:set>
						<c:set var="password" value="${ param.password}"></c:set>
							
						<c:choose>
							<c:when test="${userName.length() > 1 and password.length() > 1 }">
								<c:choose>
										<sql:query dataSource="${dbsource}" var="result">
            								SELECT * from user;
        								</sql:query>
        								<c:forEach var="row" items="${result.rows}">
        									<c:if test="${(userName eq row.username) and (password eq row.password)}">
        										<c:redirect url="userhome.jsp">
        											<c:param name="id" value="${userName }" />
        										</c:redirect>
        									</c:if>
        								</c:forEach>
									<c:otherwise>
									</c:otherwise>
									
								</c:choose>
							</c:when>
							<c:otherwise>
							</c:otherwise>
									
						</c:choose>
					</c:if>
				</tr>
			</table>
			</center>
		</fieldset>
	</form>
	
	
</div>
</body>
</html>