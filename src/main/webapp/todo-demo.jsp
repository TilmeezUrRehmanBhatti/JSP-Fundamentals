<%--
  Created by IntelliJ IDEA.
  User: tilme
  Date: 02/08/2022
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- Step 1: Create HTML form -->
<form action="todo-demo.jsp">

    Add new item: <input type="text" name="theItem" />

    <input type="submit" value="Submit" />
</form>

<br>



<!-- Step 2: Add new item to "To Do list -->
<%
    // get the TO Do items from the session
    List<String> items = (List<String>) session.getAttribute("myToDoList");

    // if the To Do items doesn't exist, then create a new one
    if (items == null) {
        items = new ArrayList<String>();
        session.setAttribute("myToDoList", items);
    }

    // see if there is form data to add
    String theItem = request.getParameter("theItem");

    //
    // Code BLOCK for boolean and if/then statement
    //
    boolean isItemNotEmpty = theItem != null && theItem.trim().length() > 0;
    boolean isItemNotDuplicate = theItem != null && !items.contains(theItem.trim());

    if (isItemNotEmpty && isItemNotDuplicate) {
        items.add(theItem);
    }
%>

<!-- Step 3: Display all "To Do" item from session -->
<hr>
<b>To List Items:</b> <br/>

<ol>
    <%
        for (String temp : items) {
            out.println("<li>" + temp + "</li>");
        }
    %>
</ol>

</body>
</html>
</body>