<!-- receiverView.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Receiver Portlet</title>
</head>
<body>
    <h2>Receiver Portlet</h2>
    <%
        String sharedData = (String) request.getAttribute("sharedData");
        if (sharedData != null) {
            out.println("<p>Received Data: " + sharedData + "</p>");
        } else {
            out.println("<p>No data received yet.</p>");
        }
    %>
</body>
</html>
