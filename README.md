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
