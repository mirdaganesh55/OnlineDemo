<!-- senderView.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sender Portlet</title>
</head>
<body>
    <h2>Sender Portlet</h2>
    <form action="<portlet:actionURL/>" method="post">
        <label for="data">Data to send:</label><br>
        <input type="text" id="data" name="data"><br><br>
        <input type="submit" value="Send Data">
    </form>
</body>
</html>
