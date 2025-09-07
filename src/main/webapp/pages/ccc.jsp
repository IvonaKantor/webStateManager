<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="CBean.java" %>
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

</body>
</html>