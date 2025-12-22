<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>BookingFields - Sewa Lapangan Online</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>body { font-family: 'Inter', sans-serif; }</style>
</head>
<body class="bg-slate-50">

<nav class="bg-white/80 backdrop-blur-md border-b border-slate-200 sticky top-0 z-50">
    <div class="container mx-auto px-6 py-3 flex justify-between items-center">
        <a class="text-2xl font-black text-indigo-600 no-underline hover:text-indigo-700 transition" href="index.jsp">
            BookingFields
        </a>
        <ul class="flex items-center gap-4 m-0 p-0 list-none">
            <% if (session.getAttribute("userId") == null) { %>
                <li><a class="text-slate-600 hover:text-indigo-600 font-medium no-underline transition" href="login.jsp">Login</a></li>
                <li><a class="bg-indigo-600 hover:bg-indigo-700 text-white px-5 py-2.5 rounded-full font-bold shadow-lg shadow-indigo-200 transition no-underline" href="register.jsp">Register</a></li>
            <% } else { %>
                <li><a class="text-slate-600 hover:text-indigo-600 font-medium no-underline px-3" href="FieldServlet">Lapangan</a></li>
                <li><a class="text-slate-600 hover:text-indigo-600 font-medium no-underline px-3" href="HistoryServlet">Riwayat</a></li>
                <li><a class="bg-rose-50 text-rose-600 hover:bg-rose-100 px-4 py-2 rounded-lg font-bold transition no-underline" href="logout">Logout</a></li>
            <% } %>
        </ul>
    </div>
</nav>

<section class="py-24 text-center px-4">
    <div class="max-w-4xl mx-auto">
        <span class="bg-indigo-50 text-indigo-600 px-4 py-1.5 rounded-full text-sm font-bold tracking-wide uppercase mb-6 inline-block">Platform Olahraga #1</span>
        <h1 class="text-5xl md:text-7xl font-extrabold text-slate-900 mb-6 tracking-tight leading-tight">
            Booking Lapangan <br> <span class="text-transparent bg-clip-text bg-gradient-to-r from-indigo-600 to-purple-600">Tanpa Ribet.</span>
        </h1>
        <p class="text-xl text-slate-500 mb-10 leading-relaxed max-w-2xl mx-auto">
            Temukan lapangan futsal, badminton, dan basket terbaik di Jakarta Selatan. Cek jadwal real-time dan booking dalam hitungan detik.
        </p>
        
        <% if (session.getAttribute("userId") == null) { %>
            <a href="login.jsp" class="inline-block bg-slate-900 hover:bg-slate-800 text-white text-lg px-8 py-4 rounded-xl font-bold transition transform hover:-translate-y-1 shadow-xl no-underline">
                Mulai Booking Sekarang 
            </a>
        <% } else { %>
            <a href="FieldServlet" class="inline-block bg-indigo-600 hover:bg-indigo-700 text-white text-lg px-8 py-4 rounded-xl font-bold transition transform hover:-translate-y-1 shadow-xl shadow-indigo-200 no-underline">
                Lihat Daftar Lapangan 
            </a>
        <% } %>
        
        <p class="text-sm text-slate-500 mb-10 leading-relaxed max-w-2xl mx-auto mt-5">
            Lokasi: BookingFields - Jalan Halimun Jakata Selatan
        </p>
    </div>
</section>

<section class="py-16 bg-white border-t border-slate-100">
    <div class="container mx-auto px-6">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="p-8 rounded-3xl bg-slate-50 border border-slate-100 hover:shadow-xl transition duration-300 group cursor-pointer">
                <div class="text-5xl mb-6 group-hover:scale-110 transition duration-300 inline-block"></div>
                <h3 class="text-2xl font-bold text-slate-900 mb-2">Futsal</h3>
                <p class="text-slate-500 mb-4">Rumput sintetis standar FIFA dengan penerangan malam hari.</p>
                <div class="text-indigo-600 font-bold">Mulai Rp 150.000 / jam</div>
            </div>
            <div class="p-8 rounded-3xl bg-slate-50 border border-slate-100 hover:shadow-xl transition duration-300 group cursor-pointer">
                <div class="text-5xl mb-6 group-hover:scale-110 transition duration-300 inline-block"></div>
                <h3 class="text-2xl font-bold text-slate-900 mb-2">Badminton</h3>
                <p class="text-slate-500 mb-4">Lantai karpet vinyl anti-slip dan sirkulasi udara sejuk.</p>
                <div class="text-indigo-600 font-bold">Mulai Rp 100.000 / jam</div>
            </div>
            <div class="p-8 rounded-3xl bg-slate-50 border border-slate-100 hover:shadow-xl transition duration-300 group cursor-pointer">
                <div class="text-5xl mb-6 group-hover:scale-110 transition duration-300 inline-block"></div>
                <h3 class="text-2xl font-bold text-slate-900 mb-2">Basket</h3>
                <p class="text-slate-500 mb-4">Lapangan indoor full-court dengan ring profesional.</p>
                <div class="text-indigo-600 font-bold">Mulai Rp 200.000 / jam</div>
            </div>
        </div>
    </div>
</section>

</body>
</html>