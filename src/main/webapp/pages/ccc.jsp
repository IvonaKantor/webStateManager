<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="com.beans.CBean" %>
<%
    CBean bean = (CBean) application.getAttribute("atrCBean");
%>
<p>Value1: <%= bean != null ? bean.getValue1() : "null" %></p>
<p>Value2: <%= bean != null ? bean.getValue2() : "null" %></p>
<p>Value3: <%= bean != null ? bean.getValue3() : "null" %></p>