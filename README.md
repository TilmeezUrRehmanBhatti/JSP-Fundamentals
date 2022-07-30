# JSP-Fundamentals


## What is a JSP file?
+ JSP file is an HTML page with some Java code sprinkled in .. 
+ It gives, include dynamic content from Java code

      <HTML code> Java code </HTML code>
     
## Where is the JSP procesed?
+ JSP is processd on the server
+ Results of Java code included in HTML returned to browser   
     ![image](https://user-images.githubusercontent.com/80107049/181236602-30b4d95f-71fb-41f4-8312-9c37d488449b.png)

## Where to place JSP file?
+ The JSP file goes in your **WebContent** folder
+ Must jave **.JSP** extension

![image](https://user-images.githubusercontent.com/80107049/181237487-ec7afc92-4d0a-42cf-ae90-0b4452c858e4.png)

## Code example 
helloworld.jsp
```JSP
<%--
  Created by IntelliJ IDEA.
  User: tilme
  Date: 26/07/2022
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Hello World of Java!</h3>

The time on the server is <%=new java.util.Date()%>

</body>
</html>
``` 
We have body in HTML coe `<h3>Hello World of Java!</h3>`  and `The time on the server is` and the only java code is ` <%=new java.util.Date()%>`, So, with JSP we make use of angle bracket persent and inside it can put JSP element `<% %> `, in our example we use what we call a JSP experssion, for that we use `=` symbol. Here we create new Data object,This will give us the current time stamp and than include the output of the state object in the page, so in effect, it will call toString method on the state object and include the result of that in this page that goes back to the browser.

## Scripting Elements

There are three types of scripting elements: 
+ JSP expressions
+ JSP scriptlets
+ JSP declarations.

|Element|Syntax|
| ------- | ------- |
| **JSP Expression** | <%= some Jave Expression %> |
| **JSP Scriptlet** | <% some java code: 1 to many lines %> |
| **JSP Declaration** | <%! varibale or method declaration %> |


### JSP Expressions 

+ Compute an expression 
+ Result is included in HTML returned to browser
**Syntax**
`<%= some Jave Expression %>`

#### **JSP Expression - Examples**

JSP file   
`The time on the server is  <%=new java.util.Date()%>`    
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;\   
 &emsp; Generated HTML  &emsp;&emsp;   \    
 &emsp;&emsp;&emsp;  `The time on the server is Wed Jul 27 14:11:29 CEST 2022`    
 
**expresion-test.jsp**
```JSP
<%--
  Created by IntelliJ IDEA.
  User: tilme
  Date: 26/07/2022
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Expressions Test</title>
</head>
<body>

Converting a string to uppercase: <%=new String("Hello World".toUpperCase())%>

<br/><br/>

25 multiplied by 4 equal <%= 25*4%>

<br/><br/>

Is 75 less than 69 ? <%= 75 < 69 %>



</body>

</html>
```
![image](https://user-images.githubusercontent.com/80107049/181247240-b9d833f5-4b5e-414b-b33f-40ba92a9de3e.png)

### JSP Scriptlets

A scriptlet is a JSP constrcut.
+ It allows to add/insert 1 to many lines of java code
+ To include content in page use:**out.println(...)**

**Syntax**
```JSP
<%
  // some lines of jave code
%>
```

> That code will be executed top down when the page is processed.

#### Code Example

```JSP
<h3>Hello World of Java</h3>

<%
  for (int i = 1; i <= 5; i++){
    ot.println("<br/>I really love to code: " + i);
  }
%>
```

Hello World of Java and than we add a scriplets. Here insted of **system.out.println()**, we use **out.println()**, so this will be included in the html page that's return.

scriptlet-test.jsp
```JSP
<%--
  Created by IntelliJ IDEA.
  User: tilme
  Date: 26/07/2022
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Scriptlet Test</title>
</head>
<body>

<h3>Hello World of Java</h3>
<%
  for (int i = 1; i <= 5; i++) {
    out.println("<br/>I really love to code : " + i);
  }
%>
</body>
</html>
```
![image](https://user-images.githubusercontent.com/80107049/181274232-4594666d-ec4a-454b-9136-0f57d84e44c4.png)

#### JSP Scriptlet - Best Practice
+ Minimize the amount if scriptlet code in JSP 
+ Avoid dumping thousands of lines of code in a JSP
+ Refactor into a seprate Java class ... make use of MVC

### JSP Declarations
A JSP declaration is used to declare variables and methods in a page's scripting language.
+ Declare a method in the JSP page
+ Call the method in the same JSP page 

**Syntax**
```JSP
<%!
  // declare a method
%>
```

> The syntax is basically an angle bracket, percent,with an exclamation point, and then you declare your method like any normal Java method.

#### Code Example
```JSP
<%!
  String makeItLower(String data){
    return data.toLowerCase();
  }
%>

Lower case "Hello World": <%= makeItLower("Hello World") %>
```
Uptop, declare a method using a declaration syntax. just like a normal Java method declaration. Have a return type of string, the name of the method, makeItLower, any input parameters, in this case we have string data, and then internally inside the body  you write your actual implementation code.

At the bottom we make use of that method, b using JSP expression.

```JSP 
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
```
![image](https://user-images.githubusercontent.com/80107049/181279660-90c5001d-3d51-47be-ae88-e5a0a26e3547.png)

#### JSP Declaration - Best Practice
+ Minimize the number of declarations in a JSP
+ Aviod dumping thousand of lines of code in a JSP
+ Refactor this into a separate Java class ... make use of MVC

## Call Java Class from JSP

**FunUtils.java**
```JAVA
package com.tilmeez.jspdemo;

public class FunUtils {

    public static String makeItLower(String data) {
        return data.toLowerCase();
    }
}
```


**fun-test.jsp**
```JSP
<%--
  Created by IntelliJ IDEA.
  User: tilme
  Date: 27/07/2022
  Time: 00:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.tilmeez.jspdemo.*" %>
<html>
<head>
    <title>Fun Test</title>
</head>
<body>

Let's have some fun: <%= FunUtils.makeItLower("FUN FUN FUN")%>

</body>
</html>
```

In **fun-test.jsp** in oder to call method'S define in **funUtils** class we use JSP expression but for that we need to give fully qualified class name `com.tilmeez.jspdemo.FunUtils.makeItLower(...)`   which includes **package name**, **Class name**, and **method name**. Also can used clean way by using import statement for that, in JSP file at top `<%@ page import="com.tilmeez.jspdemo.*" %>` with import we can clean up th JSP expression like ` <%= FunUtils.makeItLower("FUN FUN FUN")%>` we can also use **,** to import more package as required like `<%@ page import="com.tilmeez.jspdemo.*, java.util.ArrayList" %>`

![image](https://user-images.githubusercontent.com/80107049/181297232-bb735181-c380-4b02-9413-3abfe496dbee.png)

## JSP Built-In Objects
+ Given to you for free
+ Use  them directly in your JSP page  
    
<br/>

+ List of commonly used JSP objects

| Objects         | Description                                         |
| --------------- | --------------------------------------------------- |
| **request**     | Contains HTTP request header and form data          |
| **response**    | Provides HTTP support for sending response          |
| **out**         | JspWriter for including content in HTML page        |
| **session**     | Unique session for each user of the web application |
| **application** | Shared data for all users of the web application    |


![image](https://user-images.githubusercontent.com/80107049/181299760-cd8e9451-4bde-4fbd-ba7f-17fded69fea3.png)

The browser communicating with JSP. Behind the scenes, the HTTP protocol, they actually send over a request object. This request object contains header information and body information. The JSP can perform some work on that information and then send back a response. So, we have the whole request/response protocol going.

### Code Example:

**builtin-test.jsp**

```JSP
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
```

In order to find what kind of browser is user using, we can access this information useing the `**request object**` e.g. `request.getheader` and than header name of User-Agent ` <%=request.getHeader("User-Agent")%>` this will get the actual browser that the client is using also the the operating system information.To get language used by user `<%=request.getLocale()%>`
![image](https://user-images.githubusercontent.com/80107049/181301938-37aa58d7-b9bc-4fff-9cff-a16266261296.png)

##  Including Files in JSP

Common use case of including files is including standard headers and footers. For example When building website need to display header and footer information on every page for this simply create header and footer in separate file and include in JSP files.

```mermaid
graph LR
   
    JSP-->my-header.html
    JSP-->my-footer.jsp
 ``` 
 
 **my-header.html**
```html
<h1 align="center">JSP Tutorial</h1>
``` 
**my-footer.jsp**
```JSP
<p align="center">
  Last updated: <%=new java.util.Date()%>
</p>
```

**homepage.jsp**
```JSP
<%--
  Created by IntelliJ IDEA.
  User: tilme
  Date: 27/07/2022
  Time: 00:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="my-header.html"/>

Blah blah blah .... <br/><br/>
Blah blah blah .... <br/><br/>
Blah blah blah .... <br/><br/>
Blah blah blah .... <br/><br/>

<jsp:include page="my-footer.jsp"/>

</body>
</html>
```
![image](https://user-images.githubusercontent.com/80107049/181306392-b48d1ca6-cba6-4a12-8512-c06df93f8098.png)


# HTML Forms Overview

## Step 1: Build HTML Form


```HTML
<form action="student-response.jsp">
  
  First Name: <input type="text" name="firstName" />
  
  Last Name: <input type="text" name="lastName" />
  
  <input type="submit" value="Submit" />
  
</form>
```

+ Start with form tag than specify action ( where to send specify data)`action="student-response.jsp`
+ Next set-up our text field, `intput type="text"` than give `name="firstName"` which will be use on server side
+ Next we have submit button,`input type="submit"` and `value="Submit"` value portion is for label.
+ When submit button is hit, the data will be send to JSP page to process.

## Step 2: Reading Form data with JSP
**HTML FILE**
```HTML 
First Name: <input type="text" name="firstName" />
  
Last Name: <input type="text" name="lastName" />
```

&emsp;&emsp;&emsp;**JSP FILE**
```JSP
          The student is confirmed:
          <%= request.getParameter("firstName") %> <%= request.getParameter("lastName") %>
          ```

+ In JSP file, data is read by `request.getParameter("firstName")`
+ Alternate syntax: `${param.formFieldName}

```JAP
The student is confirmed: ${param.firstName} ${param.lastName}
```
>**NOTE**   
>Short cut method: Only use for display form data, if needed to read the data in maybe a scriptlet or something than have to resort back to `request.getParameter`.

**studetn-form.html**
```HTML
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Registration Form</title>
</head>
<body>

<form action="student-form.jsp">

    First Name: <input type="text" name="firstName"/>

    <br/><br/>

    Last Name: <input type="text" name="lastName"/>

    <br/><br/>

    <input type="submit" value="Submit"/>

</form>

</body>
</html>
```

**student-form.jsp**
```JSP
<html>

<head>
    <title>Student Confirmation Title</title>
</head>

<body>

    The student is confirmed: ${param.firstName} ${param.lastName}
</body>
</html>
```
![img.png](img.png)

![img_1.png](img_1.png)

## Drop-Down list

**Drop-Down List - HTML `<select>` Tag**

```HTML
<select name="country">
  <option>Brazil</option>
  <option>France</option>
  <option>Germany</option>
  <option>India</option>
  <option>Pakistan</option>
</select>
```

<select name="country">
  <option>Brazil</option>
  <option>France</option>
  <option>Germany</option>
  <option>India</option>
  <option>Pakistan</option>
</select>



+ To make drop-down list in HTML, `<select>` tag is used .
+ To put options is drop-down list, `<option>` tag is used inside  `<select>` tag.
+ `select name="country"` thats the name of form field that will be used in JSP page to read from data.

**student-dropdown-from.html**
```HTML
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Registration Form</title>
</head>
<body>

<form action="student-dropdown-response.jsp">

    First Name: <input type="text" name="firstName"/>

    <br/><br/>

    Last Name: <input type="text" name="lastName"/>

    <br/><br/>

    <select name="country">
        <option>Brazil</option>
        <option>France</option>
        <option>Germany</option>
        <option>India</option>
        <option>Pakistan</option>
    </select>

    <br/><br/>

    <input type="submit" value="Submit"/>

</form>

</body>
</html>
```
![img_3.png](img_3.png)   

**student-dropdown-response.jsp**
```JSP
<html>

<head>
    <title>Student Confirmation Title</title>
</head>

<body>

The student is confirmed: ${param.firstName} ${param.lastName}

<br/><br/>

The student's country: ${param.country}

</body>
</html>
```
        
![img_2.png](img_2.png)