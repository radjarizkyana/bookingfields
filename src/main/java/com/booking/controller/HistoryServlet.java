package com.booking.controller;

import com.booking.dao.BookingDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/HistoryServlet")
public class HistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest r, HttpServletResponse s)
            throws IOException {

        HttpSession session = r.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            s.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        BookingDAO dao = new BookingDAO();
        r.setAttribute("history", dao.findByUser(userId));

        try {
            r.getRequestDispatcher("history.jsp").forward(r, s);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
