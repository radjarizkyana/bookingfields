<%@ page import="java.util.List" %>
<%@ page import="com.booking.model.Booking" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Riwayat Booking - BookingFields</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Inter', sans-serif; }</style>
</head>
<body class="bg-slate-50 min-h-screen">

<% if (session.getAttribute("userId") == null) {
    response.sendRedirect("login.jsp");
    return;
} %>

<nav class="bg-white border-b border-slate-200 sticky top-0 z-50">
    <div class="container mx-auto px-6 py-4 flex justify-between items-center">
        <span class="text-xl font-bold text-slate-800">Riwayat Pesanan</span>
        <div class="flex gap-4 items-center">
            <a href="FieldServlet" class="text-slate-600 hover:text-indigo-600 font-medium no-underline transition">Lapangan</a>
            <a href="logout" class="bg-rose-50 text-rose-600 hover:bg-rose-100 px-4 py-2 rounded-lg text-sm font-bold transition no-underline">Logout</a>
        </div>
    </div>
</nav>

<div class="container mx-auto px-6 py-10">
    <div class="bg-white rounded-2xl shadow-sm border border-slate-200 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead class="bg-slate-900 text-white">
                    <tr>
                        <th class="p-4 font-semibold text-sm">ID Lapangan</th>
                        <th class="p-4 font-semibold text-sm">Tanggal</th>
                        <th class="p-4 font-semibold text-sm">Jam</th>
                        <th class="p-4 font-semibold text-sm">Total Harga</th>
                        <th class="p-4 font-semibold text-sm">Status</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-100">
                <%
                List<Booking> history = (List<Booking>) request.getAttribute("history");

                if (history == null || history.isEmpty()) {
                %>
                <tr>
                    <td colspan="5" class="p-8 text-center text-slate-500">
                        <div class="text-4xl mb-2"></div>
                        Belum ada riwayat booking. Yuk pesan lapangan sekarang!
                    </td>
                </tr>
                <%
                } else {
                    for (Booking b : history) {
                %>
                <tr class="hover:bg-slate-50 transition">
                    <td class="p-4 font-mono text-slate-500">#<%= b.getFieldId() %></td>
                    <td class="p-4 font-medium text-slate-800"><%= b.getBookingDate() %></td>
                    <td class="p-4 text-indigo-600 font-semibold text-sm"><%= b.getStartTime() %> - <%= b.getEndTime() %></td>
                    <td class="p-4 font-bold text-slate-900">Rp <%= String.format("%,.0f", b.getTotalCost()) %></td>
                    <td class="p-4">
                        <% if("PENDING".equalsIgnoreCase(b.getStatus())) { %>
                            <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-amber-100 text-amber-800 border border-amber-200">
                                <span class="w-2 h-2 rounded-full bg-amber-500"></span> PENDING
                            </span>
                        <% } else if("APPROVED".equalsIgnoreCase(b.getStatus())) { %>
                            <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-emerald-100 text-emerald-800 border border-emerald-200">
                                <span class="w-2 h-2 rounded-full bg-emerald-500"></span> APPROVED
                            </span>
                        <% } else if("REJECTED".equalsIgnoreCase(b.getStatus())) { %>
                            <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-rose-100 text-rose-800 border border-rose-200">
                                <span class="w-2 h-2 rounded-full bg-rose-500"></span> REJECTED
                            </span>
                        <% } %>
                    </td>
                </tr>
                <%
                    }
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>