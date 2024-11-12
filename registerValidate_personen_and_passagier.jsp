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

<!-- Einfügen in die Tabelle PERSON -->
<sql:update dataSource="${ds}" var="updateCount">
    INSERT INTO Person (SVNR, Vorname, Nachname, Ort, Strasse, Postleitzahl, Hausnummer) VALUES (?, ?, ?, ?, ?, ?, ?)
    <sql:param value="${param.svnr}" />
    <sql:param value="${param.vorname}" />
    <sql:param value="${param.nachname}" />
    <sql:param value="${param.ort}" />
    <sql:param value="${param.strasse}" />
    <sql:param value="${param.postleitzahl}" />
    <sql:param value="${param.hausnummer}" />
</sql:update>

<c:choose>
    <c:when test="${updateCount >= 1}">
        <!-- Fetch the current maximum PASSAGIERNUMMER -->
        <sql:query dataSource="${ds}" var="maxPassagiernummerQuery">
            SELECT MAX(PASSAGIERNUMMER) AS maxPassagiernummer FROM PASSAGIER_IN
        </sql:query>

        <!-- Calculate the next PASSAGIERNUMMER -->
        <c:set var="nextPassagiernummer" value="${maxPassagiernummerQuery.rows[0].maxPassagiernummer + 1}" />

        <!-- Automatisches Einfügen in die Tabelle PASSAGIER_IN -->
        <sql:update dataSource="${ds}" var="updatePassagier">
            INSERT INTO PASSAGIER_IN (SVNR, PASSAGIERNUMMER)
            VALUES (?, ?)
            <sql:param value="${param.svnr}" />
            <sql:param value="${nextPassagiernummer}" />
        </sql:update>

        <c:choose>
            <c:when test="${updatePassagier >= 1}">
                <c:redirect url="register_personen_and_passagier.jsp">
                    <c:param name="successPassagiernummer" value="${nextPassagiernummer}" />
                </c:redirect>
            </c:when>
            <c:otherwise>
                <p>Fehler beim Einfügen in die Passagier-Tabelle. Bitte kontaktieren Sie den Administrator.</p>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <p>Fehler bei der Registrierung. Bitte versuchen Sie es erneut.</p>
        <a href="register_personen_and_passagier.jsp">Zurück zur Registrierung</a>
    </c:otherwise>
</c:choose>
