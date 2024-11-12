<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Schiffahrtsgesellschaft</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <h2 class="text-center">Login</h2>
                <form action="validateLogin_from_passagier.jsp" method="post">
                    <div class="form-group">
                        <label for="passagiernummer">Passagiernummer</label>
                        <input type="text" class="form-control" id="passagiernummer" name="passagiernummer" required>
                    </div>
                    <div class="form-group">
                        <label for="svnr">SVNR</label>
                        <input type="password" class="form-control" id="svnr" name="svnr" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Login</button>
                </form>
                <c:if test="${param.error != null}">
                    <p class="text-danger text-center">Invalid username or password. Please try again.</p>
                </c:if>
                <div class="text-center">
                    <p>Don't have an account? <a href="register_personen_and_passagier.jsp">Register here</a></p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
