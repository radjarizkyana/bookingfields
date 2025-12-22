package com.booking.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest r, HttpServletResponse s)
            throws IOException {
        HttpSession session = r.getSession(false);
        if (session != null) session.invalidate();
        s.sendRedirect(r.getContextPath() + "/login.jsp");
    }
}
