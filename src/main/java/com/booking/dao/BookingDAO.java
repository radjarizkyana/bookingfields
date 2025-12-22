package com.booking.dao;

import com.booking.model.Booking;
import com.booking.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    
    // Simpan booking baru dengan status default 'PENDING'
    public void save(Booking b) {
        String sql = "INSERT INTO bookings (user_id, field_id, booking_date, start_time, end_time, hours, total_cost, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'PENDING')";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, b.getUserId());
            ps.setInt(2, b.getFieldId());
            ps.setString(3, b.getBookingDate());
            ps.setString(4, b.getStartTime());
            ps.setString(5, b.getEndTime());
            ps.setInt(6, b.getHours());
            ps.setDouble(7, b.getTotalCost());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // Ambil jadwal yang sudah APPROVED untuk ditampilkan di kalender/view
    public List<Booking> getApprovedBookings(int fieldId, String date) {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT * FROM bookings WHERE field_id = ? AND booking_date = ? AND status = 'APPROVED'";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, fieldId);
            ps.setString(2, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setStartTime(rs.getString("start_time"));
                b.setEndTime(rs.getString("end_time"));
                list.add(b);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // Ambil SEMUA data untuk Admin
    public List<Booking> findAll() {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT * FROM bookings ORDER BY id DESC";
        try (Connection c = DBConnection.getConnection();
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Booking b = new Booking();
                b.setId(rs.getInt("id"));
                b.setUserId(rs.getInt("user_id"));
                b.setFieldId(rs.getInt("field_id"));
                b.setBookingDate(rs.getString("booking_date"));
                b.setStartTime(rs.getString("start_time"));
                b.setEndTime(rs.getString("end_time"));
                b.setTotalCost(rs.getDouble("total_cost")); // WAJIB ADA AGAR HARGA TIDAK 0.0
                b.setStatus(rs.getString("status"));       // WAJIB ADA AGAR AKSI MUNCUL
                list.add(b);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void updateStatus(int id, String status) {
        String sql = "UPDATE bookings SET status = ? WHERE id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
    
    public List<Booking> findByUser(int userId) {
        List<Booking> list = new ArrayList<>();
        String sql =
            "SELECT * FROM bookings " +
            "WHERE user_id = ? " +
            "ORDER BY id DESC"; // Diurutkan berdasarkan ID terbaru

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking b = new Booking();
                b.setFieldId(rs.getInt("field_id"));
                b.setBookingDate(rs.getString("booking_date"));
                b.setStartTime(rs.getString("start_time"));
                b.setEndTime(rs.getString("end_time"));
                b.setHours(rs.getInt("hours"));
                b.setTotalCost(rs.getDouble("total_cost"));
                b.setStatus(rs.getString("status")); // TAMBAHKAN BARIS INI

                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}