<%@ page contentType="text/html;charset=UTF-8" import="javax.servlet.ServletContext" %>

<%
    String url1 = getServletContext().getInitParameter("URL1");
    String url2 = getServletContext().getInitParameter("URL2");
%>
<p>URL1: <%= url1 %>
</p>
<p>URL2: <%= url2 %>
</p>
