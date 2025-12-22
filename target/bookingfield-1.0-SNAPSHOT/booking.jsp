<%@ page import="com.booking.dao.BookingDAO, com.booking.model.Booking, java.util.List" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Form Booking - BookingFields</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Inter', sans-serif; }</style>
    <script>
        function refreshSchedule() {
            let date = document.getElementsByName("bookingDate")[0].value;
            let fieldId = "<%= request.getParameter("fieldId") %>";
            if (date) {
                window.location.href = "booking.jsp?fieldId=" + fieldId + "&bookingDate=" + date;
            }
        }
    </script>
</head>
<body class="bg-slate-50 min-h-screen">

<% 
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    } 
    
    String fId = request.getParameter("fieldId");
    String bDate = request.getParameter("bookingDate");
    
    BookingDAO dao = new BookingDAO();
    List<Booking> taken = new java.util.ArrayList<>();
    if(fId != null && bDate != null && !bDate.isEmpty()) {
        taken = dao.getApprovedBookings(Integer.parseInt(fId), bDate);
    }
%>

<nav class="bg-white shadow-sm border-b border-slate-200">
    <div class="container mx-auto px-6 py-4 flex justify-between items-center">
        <span class="text-lg font-bold text-slate-800">Form Pemesanan</span>
        <a href="logout" class="text-sm font-semibold text-rose-500 hover:text-rose-700 no-underline">Logout</a>
    </div>
</nav>

<div class="container mx-auto px-4 py-10">
    <div class="max-w-2xl mx-auto">
        
        <% if("conflict".equals(request.getParameter("error"))) { %>
            <div class="bg-rose-50 border-l-4 border-rose-500 text-rose-700 p-4 mb-6 rounded shadow-sm flex justify-between items-center">
                <span><strong>Gagal!</strong> Jam tersebut sudah dibooking orang lain.</span>
                <a href="#" onclick="this.parentElement.style.display='none'" class="text-rose-700 font-bold no-underline">×</a>
            </div>
        <% } else if("invalid_time".equals(request.getParameter("error"))) { %>
            <div class="bg-amber-50 border-l-4 border-amber-500 text-amber-700 p-4 mb-6 rounded shadow-sm">
                <strong>Perhatian!</strong> Jam selesai harus lebih besar dari jam mulai.
            </div>
        <% } %>

        <div class="bg-white rounded-3xl shadow-xl overflow-hidden border border-slate-100">
            <div class="bg-slate-900 px-8 py-6">
                <h3 class="text-xl font-bold text-white mb-1">Detail Pesanan</h3>
                <p class="text-slate-400 text-sm">Lengkapi data di bawah untuk booking.</p>
            </div>
            
            <div class="p-8">
                <div class="bg-slate-50 rounded-2xl p-6 mb-8 border border-slate-200">
                    <h6 class="font-bold text-slate-700 flex items-center gap-2 mb-3">
                        <span class="w-3 h-3 bg-rose-500 rounded-full animate-pulse"></span>
                        Jadwal Terisi (Approved)
                    </h6>
                    <div class="flex flex-wrap gap-2">
                        <% if(taken.isEmpty()) { %> 
                            <span class="text-slate-400 text-sm italic">Belum ada booking di tanggal ini. Semua jam tersedia.</span> 
                        <% } else { %>
                            <% for(Booking b : taken) { %>
                                <span class="bg-white text-rose-600 border border-rose-200 px-3 py-1.5 rounded-lg text-sm font-mono font-semibold shadow-sm">
                                    <%= b.getStartTime() %> - <%= b.getEndTime() %>
                                </span>
                            <% } %>
                        <% } %>
                    </div>
                </div>

                <form action="booking" method="post" class="space-y-6">
                    <input type="hidden" name="fieldId" value="<%= fId %>">
                    
                    <div>
                        <label class="block text-sm font-bold text-slate-700 mb-2">Tanggal Booking</label>
                        <input type="date" name="bookingDate" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-indigo-500 focus:ring-4 focus:ring-indigo-50 outline-none transition" 
                               value="<%= bDate != null ? bDate : "" %>" 
                               onchange="refreshSchedule()" required>
                    </div>

                    <div class="grid grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-bold text-slate-700 mb-2">Jam Mulai</label>
                            <input type="time" name="startTime" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-indigo-500 focus:ring-4 focus:ring-indigo-50 outline-none transition" required>
                        </div>
                        <div>
                            <label class="block text-sm font-bold text-slate-700 mb-2">Jam Selesai</label>
                            <input type="time" name="endTime" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-indigo-500 focus:ring-4 focus:ring-indigo-50 outline-none transition" required>
                        </div>
                    </div>

                    <button type="submit" class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-4 rounded-xl shadow-lg shadow-indigo-200 transition duration-300 transform active:scale-[0.99] mt-4">
                        Konfirmasi & Bayar
                    </button>
                </form>
            </div>
            <div class="bg-slate-50 px-8 py-4 text-center border-t border-slate-100">
                <a href="FieldServlet" class="text-sm font-semibold text-slate-500 hover:text-slate-800 no-underline">Batalkan & Kembali</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>