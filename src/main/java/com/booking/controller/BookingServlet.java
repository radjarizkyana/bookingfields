package com.booking.controller;

import com.booking.dao.BookingDAO;
import com.booking.model.Booking;
import com.booking.model.Field;
import com.booking.service.BookingManager;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalTime;
import java.util.List;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest r, HttpServletResponse s) throws IOException {
        HttpSession session = r.getSession(false);
        if (session == null) {
            s.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        int fieldId = Integer.parseInt(r.getParameter("fieldId"));
        String date = r.getParameter("bookingDate");
        String startStr = r.getParameter("startTime");
        String endStr = r.getParameter("endTime");

        LocalTime startInput = LocalTime.parse(startStr);
        LocalTime endInput = LocalTime.parse(endStr);

        // 1. Validasi: Jam selesai tidak boleh sebelum jam mulai
        if (endInput.isBefore(startInput)) {
            s.sendRedirect("booking.jsp?fieldId=" + fieldId + "&error=invalid_time");
            return;
        }

        // 2. LOGIKA VALIDASI BENTROK JADWAL
        BookingDAO dao = new BookingDAO();
        List<Booking> approvedList = dao.getApprovedBookings(fieldId, date);

        for (Booking existing : approvedList) {
            LocalTime existingStart = LocalTime.parse(existing.getStartTime());
            LocalTime existingEnd = LocalTime.parse(existing.getEndTime());

            // Rumus bentrok: (StartA < EndB) AND (EndA > StartB)
            if (startInput.isBefore(existingEnd) && endInput.isAfter(existingStart)) {
                // Jika bentrok, arahkan kembali dengan pesan error
                s.sendRedirect("booking.jsp?fieldId=" + fieldId + "&bookingDate=" + date + "&error=conflict");
                return;
            }
        }

        // 3. Jika tidak bentrok, lanjut hitung biaya dan simpan
        int hours = endInput.getHour() - startInput.getHour();
        if (hours <= 0) hours = 1; // Minimal 1 jam

        BookingManager bm = (BookingManager) getServletContext().getAttribute("bm");
        Field field = bm.getFieldById(fieldId);
        double total = field.calculateCost(hours);

        Booking b = new Booking();
        b.setUserId(userId);
        b.setFieldId(fieldId);
        b.setBookingDate(date);
        b.setStartTime(startStr);
        b.setEndTime(endStr);
        b.setHours(hours);
        b.setTotalCost(total);

        dao.save(b);
        s.sendRedirect("HistoryServlet");
    }
}