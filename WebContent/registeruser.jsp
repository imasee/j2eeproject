<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:if test="${ not empty param.Submit}">

          <!--   <c:redirect url="insert.jsp" >
                <c:param name="errMsg" value="Please Enter Product and Quantity" />
            </c:redirect>
             -->
 
       
        <sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/j2eeproject" user="root" password="12345"></sql:setDataSource>
	
 
 
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO user(username,name,password,phone,address,email,isadmin) VALUES (?,?,?,?,?,?,?);
            <sql:param value="${param.user_name}" />
            <sql:param value="${param.name}" />
            <sql:param value="${param.password}" />
            <sql:param value="${param.phone}" />
            <sql:param value="${param.email}" />
            <sql:param value="${param.address}" />
            <sql:param value="${0}" />
            
        </sql:update>
        
 
 </c:if>

<!-- REGISTER FORM -->
	<form action="registeruser.jsp" method="post">
		<div style="border:solid">
				<table>
						<tr><td>
							<h1> User Register Form</h1>
						</td></tr>
				
				 <tr><td> Name:<input type="text" name="name"></td></tr>
				     
				 <tr><td>    User Name: 		<input type="text" name="user_name"></td></tr>
				     
				<tr><td>	 Password : 		<input type="password" name="password"></td></tr>
					 
				<tr><td>	 Re-enter Password: <input type="password" name="check-password"></td></tr>
					 
					<tr><td> Contact Number: 	<input type="text" name="phone"></td></tr>
					 
					<tr><td> Email:				<input type="text" name="email"></td></tr>
					 
					<tr><td> Address:			<input type="text" name="address"></td></tr>
					 
					<tr><td> <input type="submit" name="submit" value="Submit"></td></tr>
					 <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! You are now a member.</font>
 <c:redirect url="register_product.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
           
        </c:if> 
				
				</table>
		</div>
	</form>
	

</body>
</html>