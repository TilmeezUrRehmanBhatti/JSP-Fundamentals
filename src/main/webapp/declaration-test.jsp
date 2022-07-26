<%--
  Created by IntelliJ IDEA.
  User: tilme
  Date: 26/07/2022
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Declaration Test</title>
</head>
<body>

<%!
  String makeItLower(String data) {
    return data.toLowerCase();
  }
%>

Lower case "Hello World": <%=makeItLower("Hello World")%>

</body>
</html>
