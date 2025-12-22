package com.booking.controller;

import com.booking.util.DBConnection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest r, HttpServletResponse s)
            throws IOException {

        try {
            String username = r.getParameter("username");
            String password = r.getParameter("password");

            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = r.getSession(true);
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("role", rs.getString("role")); // Simpan role

                if(rs.getString("role").equals("admin")) {
                    s.sendRedirect("AdminServlet");
                } else {
                    s.sendRedirect("FieldServlet");
                }
                return;
            }

            // LOGIN GAGAL
            s.sendRedirect(r.getContextPath() + "/login.jsp?error=1");

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e); 
        }
    }

    @Override
    protected void doGet(HttpServletRequest r, HttpServletResponse s)
            throws IOException {
        s.sendRedirect(r.getContextPath() + "/login.jsp");
    }
}
