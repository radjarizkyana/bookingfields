<%@ page import="java.util.List" %>
<%@ page import="com.booking.model.Booking" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Admin Dashboard - BookingFields</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Inter', sans-serif; }</style>
</head>
<body class="bg-slate-50 min-h-screen">

<nav class="bg-indigo-600 shadow-lg sticky top-0 z-50">
    <div class="container mx-auto px-6 py-4 flex justify-between items-center">
        <span class="text-white text-xl font-bold tracking-wide">Halaman Admin</span>
        <a href="logout" class="bg-white/20 hover:bg-white/30 text-white px-4 py-2 rounded-lg text-sm font-semibold transition no-underline">
            Logout
        </a>
    </div>
</nav>

<div class="container mx-auto px-6 py-10">
    <div class="flex justify-between items-end mb-8">
        <div>
            <h2 class="text-3xl font-bold text-slate-800">Manajemen Booking</h2>
            <p class="text-slate-500 mt-1">Kelola semua permintaan masuk dari pengguna.</p>
        </div>
        <div class="bg-white px-4 py-2 rounded-lg shadow-sm border border-slate-200 text-sm font-medium text-slate-600">
            Total Data: <span class="text-indigo-600 font-bold"><%= (request.getAttribute("allBookings") != null) ? ((List)request.getAttribute("allBookings")).size() : 0 %></span>
        </div>
    </div>

    <div class="bg-white rounded-2xl shadow-sm border border-slate-200 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-slate-100 text-slate-600 uppercase text-xs font-bold tracking-wider">
                        <th class="p-4 border-b">ID</th>
                        <th class="p-4 border-b">Detail User</th>
                        <th class="p-4 border-b">Jadwal</th>
                        <th class="p-4 border-b">Pembayaran</th>
                        <th class="p-4 border-b">Status</th>
                        <th class="p-4 border-b text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-100">
                    <%
                        List<Booking> list = (List<Booking>) request.getAttribute("allBookings");
                        if (list != null && !list.isEmpty()) {
                            for (Booking b : list) {
                    %>
                    <tr class="hover:bg-slate-50 transition duration-150">
                        <td class="p-4 text-slate-500 font-mono text-sm">#<%= b.getId() %></td>
                        <td class="p-4">
                            <div class="text-sm font-bold text-slate-800">User ID: <%= b.getUserId() %></div>
                            <div class="text-xs text-slate-500">Field ID: <%= b.getFieldId() %></div>
                        </td>
                        <td class="p-4">
                            <div class="text-sm text-slate-800"><%= b.getBookingDate() %></div>
                            <div class="text-xs font-semibold text-indigo-600 bg-indigo-50 px-2 py-0.5 rounded inline-block mt-1">
                                <%= b.getStartTime() %> - <%= b.getEndTime() %>
                            </div>
                        </td>
                        <td class="p-4 text-sm font-bold text-slate-700">
                            Rp <%= String.format("%,.0f", b.getTotalCost()) %>
                        </td>
                        <td class="p-4">
                            <% if("PENDING".equalsIgnoreCase(b.getStatus())) { %>
                                <span class="px-3 py-1 rounded-full text-xs font-bold bg-amber-100 text-amber-700 border border-amber-200">PENDING</span>
                            <% } else if("APPROVED".equalsIgnoreCase(b.getStatus())) { %>
                                <span class="px-3 py-1 rounded-full text-xs font-bold bg-emerald-100 text-emerald-700 border border-emerald-200">APPROVED</span>
                            <% } else { %>
                                <span class="px-3 py-1 rounded-full text-xs font-bold bg-rose-100 text-rose-700 border border-rose-200">REJECTED</span>
                            <% } %>
                        </td>
                        <td class="p-4 text-center">
                            <% if("PENDING".equalsIgnoreCase(b.getStatus())) { %>
                                <div class="flex justify-center gap-2">
                                    <form action="AdminServlet" method="post">
                                        <input type="hidden" name="id" value="<%= b.getId() %>">
                                        <input type="hidden" name="action" value="APPROVED">
                                        <button class="bg-emerald-500 hover:bg-emerald-600 text-white p-2 rounded-lg shadow-sm transition" title="Approve">
                                            
                                        </button>
                                    </form>
                                    <form action="AdminServlet" method="post">
                                        <input type="hidden" name="id" value="<%= b.getId() %>">
                                        <input type="hidden" name="action" value="REJECTED">
                                        <button class="bg-rose-500 hover:bg-rose-600 text-white p-2 rounded-lg shadow-sm transition" title="Reject">
                                            
                                        </button>
                                    </form>
                                </div>
                            <% } else { %>
                                <span class="text-xs text-slate-400 italic">Selesai</span>
                            <% } %>
                        </td>
                    </tr>
                    <%      }
                        } else {
                    %>
                    <tr>
                        <td colspan="6" class="p-8 text-center text-slate-500">
                            Belum ada data booking yang masuk.
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>