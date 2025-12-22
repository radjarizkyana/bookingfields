<%@ page import="java.util.List" %>
<%@ page import="com.booking.model.Field" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Pilih Lapangan - BookingFields</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Inter', sans-serif; }</style>
</head>
<body class="bg-slate-50 min-h-screen">

<nav class="bg-white border-b border-slate-200 sticky top-0 z-50">
    <div class="container mx-auto px-6 py-4 flex justify-between items-center">
        <span class="text-xl font-black text-slate-800 tracking-tight">Daftar Lapangan</span>
        <div class="flex gap-4">
            <a href="HistoryServlet" class="text-slate-600 hover:text-indigo-600 font-medium no-underline transition">Riwayat</a>
            <a href="logout" class="text-rose-600 hover:text-rose-700 font-medium no-underline transition">Logout</a>
        </div>
    </div>
</nav>

<div class="container mx-auto px-6 py-12">
    <div class="text-center mb-12">
        <h2 class="text-3xl font-bold text-slate-900 mb-2">Pilih Arena Bermainmu</h2>
        <p class="text-slate-500">Tersedia berbagai jenis lapangan dengan fasilitas terbaik.</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <%
        List<Field> fields = (List<Field>) request.getAttribute("fields");
        if (fields != null) {
            for (Field f : fields) {
        %>
        <div class="bg-white rounded-3xl overflow-hidden shadow-sm hover:shadow-2xl border border-slate-100 transition duration-300 group flex flex-col h-full">
            
            <%-- BAGIAN LOGIKA GAMBAR --%>
            <div class="h-48 w-full overflow-hidden bg-slate-200 relative">
                <% 
                   // Logika menentukan nama file gambar berdasarkan nama lapangan
                   String imgFile = "basket.jpg"; // Default fallback
                   String name = f.getName().toLowerCase();
                   
                   if (name.contains("futsal")) {
                       imgFile = "futsal.jpg";
                   } else if (name.contains("badminton")) {
                       imgFile = "badminton.jpg";
                   } else if (name.contains("basket")) {
                       imgFile = "basket.jpg";
                   }
                %>
                <%-- Memanggil gambar dari folder img/ --%>
                <img src="img/<%= imgFile %>" 
                     alt="<%= f.getName() %>" 
                     class="w-full h-full object-cover group-hover:scale-110 transition duration-500">
            </div>
            <%-- END BAGIAN GAMBAR --%>
            
            <div class="p-8 flex flex-col flex-grow">
                <h5 class="text-2xl font-bold text-slate-900 mb-2"><%= f.getName() %></h5>
                <p class="text-slate-500 text-sm mb-6 flex-grow">Fasilitas lengkap, bersih, dan nyaman.</p>
                
                <div class="flex items-end justify-between mb-6">
                    <div>
                        <span class="text-xs text-slate-400 uppercase font-bold tracking-wider">Harga</span>
                        <div class="text-xl font-bold text-indigo-600">
                            Rp <%= String.format("%,.0f", f.getHourlyRate()) %> <span class="text-sm font-normal text-slate-400">/jam</span>
                        </div>
                    </div>
                </div>
                
                <a href="booking.jsp?fieldId=<%= f.getFieldId() %>" class="block w-full text-center bg-slate-900 hover:bg-indigo-600 text-white py-3.5 rounded-xl font-bold transition duration-300 no-underline shadow-lg">
                    Booking Sekarang
                </a>
            </div>
        </div>
        <% }} %>
    </div>
</div>

</body>
</html>