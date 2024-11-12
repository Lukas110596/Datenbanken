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
    SELECT * FROM ANGESTELLTE WHERE SVNR = ? AND ANGESTELLTENNUMMER = ?
    <sql:param value="${param.svnr}" />
    <sql:param value="${param.ANGESTELLTENNUMMER}" />
</sql:query>

<c:choose>
    <c:when test="${not empty result.rows}">
        <c:set var="ANGESTELLTENNUMMER" value="${param.ANGESTELLTENNUMMER}" scope="session" />
        <c:set var="rolle" value="${result.rows[0].ROLLE}" scope="session" />
        <c:set var="SVNR" value="${result.rows[0].SVNR}" scope="session" />
        <c:choose>
            <c:when test="${rolle == 'Kapitaen_in'}">
                <c:redirect url="welcome_kapitaen.jsp" />
            </c:when>
            <c:otherwise>
                <c:redirect url="welcome_angestellte.jsp" />
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <c:redirect url="login_mitarbeiter.jsp?error=true" />
    </c:otherwise>
</c:choose>
