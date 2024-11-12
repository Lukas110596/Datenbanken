<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
// Get the booking number from the form submission
String buchungsnummer = request.getParameter("buchungsnummer");
%>

<sql:setDataSource
    driver="oracle.jdbc.driver.OracleDriver"
    url="jdbc:oracle:thin:@localhost:1521/xepdb1"
    user="csdc25vz_04"
    password="aibe2Bahbae"
    var="ds"
/>

<sql:update dataSource="${ds}">
    DELETE FROM BUCHEN WHERE BUCHUNGSNUMMER = ?
    <sql:param value="<%= buchungsnummer %>" />
</sql:update>

<% response.sendRedirect("welcome_passagier.jsp"); %>
