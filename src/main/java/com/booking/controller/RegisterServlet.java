package com.booking.controller;

import com.booking.util.DBConnection;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest r, HttpServletResponse s)
            throws IOException {

        try (Connection c = DBConnection.getConnection()) {
            PreparedStatement ps =
                c.prepareStatement("INSERT INTO users(username,password,phone) VALUES(?,?,?)");
            ps.setString(1, r.getParameter("username"));
            ps.setString(2, r.getParameter("password"));
            ps.setString(3, r.getParameter("phone"));
            ps.executeUpdate();

            s.sendRedirect(r.getContextPath() + "/login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
