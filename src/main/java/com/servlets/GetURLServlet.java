package com.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/GetURL")
public class GetURLServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

        try {
            URL url = new URL(remoteUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            int responseCode = conn.getResponseCode();
            out.println("<h3>Response Code : " + responseCode + "</h3>");

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuffer content = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
                content.append("\n");
            }
            in.close();
            conn.disconnect();

            out.println(content.toString());
        } catch (Exception e) {
            out.println("<h2>Exception: " + e.getMessage() + "</h2>");
            e.printStackTrace(out);
        }
    }
}