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
    CBean bean = (CBean) application.getAttribute("atrCBean");
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
</body>
</html>