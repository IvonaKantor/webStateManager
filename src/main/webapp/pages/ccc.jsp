<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.beans.CBean" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CBean Manager</title>
</head>
<body>
<h1>CBean State Management</h1>

<%
    CBean bean = (CBean) request.getAttribute("atrCBean");
    HttpSession session = request.getAttribute("atrCBean");
    String sessionId = session.getId();
    String status = (bean != null) ? "Object exists" : "Object not found";
%>

<h2>Current State: <%= status %>
</h2>

<div>
    <h3>Stored Values:</h3>
    <p><strong>Value1:</strong> <%= bean != null && bean.getValue1() != null ? bean.getValue1() : "null" %>
    </p>
    <p><strong>Value2:</strong> <%= bean != null && bean.getValue2() != null ? bean.getValue2() : "null" %>
    </p>
    <p><strong>Value3:</strong> <%= bean != null && bean.getValue3() != null ? bean.getValue3() : "null" %>
    </p>
</div>

<div>
    <h3>Session :</h3>
    <p><strong>Session ID:</strong> <%= sessionId %>
    </p>
    <p><strong>Session Creation Time:</strong> <%= new java.util.Date(session.getCreationTime()) %>
    </p>
    <p><strong>Last Accessed Time:</strong> <%= new java.util.Date(session.getLastAccessedTime()) %>
    </p>
</div>

<div>
    <h3>Tests:</h3>
    <p><a href="Ccc?CBean=new&Value1=Test1&Value2=Test2&Value3=Test3">Create new bean with values</a></p>
    <p><a href="Ccc?Value1=Updated1&Value2=Updated2">Update existing bean values</a></p>
    <p><a href="Ccc">View current bean</a></p>
    <p><a href="Ccc?CBean=new&Value1=Session1&Value2=Session2&Value3=Session3">Create new session bean</a></p>
    <p><a href="Ccc?Value1=Updated1&Value2=Updated2">Update session bean values</a></p>
    <p><a href="Ccc">View current session bean</a></p>
</div>
</body>
</html>