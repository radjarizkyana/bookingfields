package com.booking.controller;

import com.booking.dao.BookingDAO;
import com.booking.model.Booking;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest r, HttpServletResponse s) throws IOException {
        HttpSession session = r.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            s.sendRedirect("login.jsp");
            return;
        }
        
        List<Booking> allBookings = new BookingDAO().findAll();
        r.setAttribute("allBookings", allBookings);
        try {
            r.getRequestDispatcher("admin_dashboard.jsp").forward(r, s);
        } catch (Exception e) { e.printStackTrace(); }
    }

    protected void doPost(HttpServletRequest r, HttpServletResponse s) throws IOException {
        int id = Integer.parseInt(r.getParameter("id"));
        String action = r.getParameter("action"); // "APPROVED" atau "REJECTED"
        new BookingDAO().updateStatus(id, action);
        s.sendRedirect("AdminServlet");
    }
}