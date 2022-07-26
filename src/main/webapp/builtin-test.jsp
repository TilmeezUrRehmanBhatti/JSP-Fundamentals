<%--
  Created by IntelliJ IDEA.
  User: tilme
  Date: 27/07/2022
  Time: 00:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP Built-In Objects</title>
</head>
<body>
<h3>JSP Built-In Objects</h3>

Request user agent: <%=request.getHeader("User-Agent")%>

<br/><br/>

Request language: <%=request.getLocale()%>

</body>
</html>
