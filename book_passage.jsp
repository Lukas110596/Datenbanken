<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>

<%
    // Generate a unique booking number (you might want to replace this with a better mechanism)
    Random rand = new Random();
    int buchungsnummer = rand.nextInt(1000000);

    // Get current date and time for buchungsdatum
    java.sql.Timestamp buchungsdatum = new java.sql.Timestamp(new java.util.Date().getTime());

    // Get passagiernummer from session
    String passagiernummer = (String) session.getAttribute("passagiernummer");

    // Get passagennummer from the form submission
    String passagennummer = request.getParameter("passagennummer");

    // Debugging output
    System.out.println("Passagiernummer: " + passagiernummer);
    System.out.println("Passagennummer: " + passagennummer);

    // Check if passagennummer is null or empty
    if (passagennummer == null || passagennummer.isEmpty()) {
        throw new ServletException("Passagennummer is null or empty");
    }
%>

<sql:setDataSource
    driver="oracle.jdbc.driver.OracleDriver"
    url="jdbc:oracle:thin:@localhost:1521/xepdb1"
    user="csdc25vz_04"
    password="aibe2Bahbae"
    var="ds"
/>

<sql:update dataSource="${ds}">
    INSERT INTO BUCHEN (PASSAGIERNUMMER, PASSAGENNUMMER, BUCHUNGSNUMMER, BUCHUNGSDATUM, KLASSE)
    VALUES (?, ?, ?, ?, ?)
    <sql:param value="<%= passagiernummer %>" />
    <sql:param value="<%= passagennummer %>" />
    <sql:param value="<%= buchungsnummer %>" />
    <sql:param value="<%= buchungsdatum %>" />
    <sql:param value="Economy" />
</sql:update>

<% response.sendRedirect("welcome_passagier.jsp"); %>
