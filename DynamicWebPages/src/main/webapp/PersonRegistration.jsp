<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
<html>
<head>
    <title>User Registration</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        #center {
            margin: 50px auto;
            width: 400px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        #center h2 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group:last-child {
            margin-bottom: 0;
        }
        .error-message {
            color: red;
            margin-top: 5px;
        }
        .signin-link {
            display: block;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div id="center">
        <h2>Medicaid User Registration</h2>
        <h:form id="form">
            <div class="form-group">
                <label for="name">Name :</label>
                <h:inputText value="#{user.name}" id="name" />
            </div>
            <div class="form-group">
                <label for="email">Email :</label>
                <h:inputText value="#{user.email}" id="email" />
            </div>
            <div class="form-group">
                <label for="username">Username :</label>
                <h:inputText value="#{user.username}" id="username" />
                <h:message for="username" styleClass="error-message" />
            </div>
            <div class="form-group">
                <label for="password">Password :</label>
                <h:inputSecret value="#{user.password}" id="password" />
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password :</label>
                <h:inputSecret value="#{user.confirmPassword}" id="confirmPassword" />
            </div>
            <input type="submit" value="Register" /><br/>
            <a href="Login.jsf" class="signin-link">Sign in</a>
        </h:form>
    </div>
</body>
</html>
</f:view>
