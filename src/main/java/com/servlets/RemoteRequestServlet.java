package com.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

public class RemoteRequestServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String urln_param = request.getParameter("urln");

        if (urln_param == null || urln_param.isEmpty()) {
            out.println("<h2>Parameter 'urln' is empty.</h2>");
            return;
        }

        String context_urln = "URL" + urln_param;
        String remoteUrl = getServletContext().getInitParameter(context_urln);

        if (remoteUrl == null) {
            out.println("<h2>Context parameter '" + context_urln + "' not found.</h2>");
            return;
        }

        try{
            URL url = new URL(remoteUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            int responseCode = conn.getResponseCode();
            out.println("<h3>Response Code : " + responseCode + "</h3>");
        }

    }
}