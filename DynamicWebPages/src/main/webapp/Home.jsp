<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="ExHome.css">
    <title>Home Page</title>
</head>
<body>
    <f:view>
         <h:form>
            <h2>Welcome to the Medicaid Application Portal</h2>
            <p>Complete the Medicaid Application Form below:</p>
            <h:outputLink value="applicationForm.jsf">Go to Application Form
            </h:outputLink><br/>
            <a href="Login.jsf" style="align-self: center;">Logout</a>
        </h:form>
    </f:view>
</body>
</html>