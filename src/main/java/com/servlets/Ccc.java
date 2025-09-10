package com.servlets;

import webapp.pages.CBean;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Ccc")
public class Ccc extends HttpSErvlet {

    @Override
    public void init() throws ServletException {
        ServletContext context = getServletContext();
        CBean bean = new CBean();
        context.setAttribute("atrCBean", bean);
        System.out.println("init : CBean created and set");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
        request.getRequestDispatcher("Ccc.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
        request.getRequestDispatcher("Ccc.jsp").forward(request, response);
    }

    private void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServletContext context = getServletContext();
        String mode = request.getParameter("CBean");
        CBean bean;

        if ("new".equals(mode)) {
            bean = new CBean();
            context.setAttribute("atrCBean", bean);
        } else {
            bean = (CBean) context.getAttribute("atrCBean");
        }

        if (request.getParameter("Value1") != null) bean.setValue1(request.getParameter("Value1"));
        if (request.getParameter("Value2") != null) bean.setValue2(request.getParameter("Value2"));
        if (request.getParameter("Value3") != null) bean.setValue3(request.getParameter("Value3"));
    }
}