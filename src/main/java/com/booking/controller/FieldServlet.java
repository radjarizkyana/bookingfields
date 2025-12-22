package com.booking.controller;

import com.booking.service.BookingManager;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/FieldServlet")
public class FieldServlet extends HttpServlet {

    protected void doGet(HttpServletRequest r, HttpServletResponse s)
            throws IOException {

        HttpSession session = r.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            s.sendRedirect(r.getContextPath() + "/login.jsp");
            return;
        }

        BookingManager bm =
            (BookingManager) getServletContext().getAttribute("bm");

        if (bm == null) {
            bm = new BookingManager();
            getServletContext().setAttribute("bm", bm);
        }

        r.setAttribute("fields", bm.getAllFields());

        try {
            r.getRequestDispatcher("/fields.jsp").forward(r, s);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
