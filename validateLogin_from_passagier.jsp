<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sql:setDataSource
    driver="oracle.jdbc.driver.OracleDriver"
    url="jdbc:oracle:thin:@localhost:1521/xepdb1"
    user="csdc25vz_04"
    password="aibe2Bahbae"
    var="ds"
/>

<sql:query dataSource="${ds}" var="result">
    SELECT * FROM Passagier_in WHERE PASSAGIERNUMMER = ? AND SVNR = ?
    <sql:param value="${param.passagiernummer}" />
    <sql:param value="${param.svnr}" />
</sql:query>

<c:choose>
    <c:when test="${not empty result.rows}">
        <c:set var="passagiernummer" value="${param.passagiernummer}" scope="session" />
        <c:redirect url="welcome_passagier.jsp" />
    </c:when>
    <c:otherwise>
        <c:redirect url="login_passagiere.jsp?error=true" />
    </c:otherwise>
</c:choose>
