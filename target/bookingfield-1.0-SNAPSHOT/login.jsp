<!DOCTYPE html>
<html lang="id">
<head>
    <title>Login - BookingFields</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Inter', sans-serif; }</style>
</head>
<body class="bg-slate-100 flex items-center justify-center min-h-screen p-4">

<div class="w-full max-w-md">
    <div class="bg-white rounded-3xl shadow-2xl overflow-hidden">
        <div class="p-8 text-center bg-indigo-600">
            <h2 class="text-3xl font-bold text-white mb-2">Selamat Datang di BookingField</h2>
            <p class="text-indigo-100">Silakan login untuk melanjutkan</p>
        </div>
        
        <div class="p-8 pt-10">
            <% if(request.getParameter("error") != null) { %>
                <div class="bg-rose-50 border-l-4 border-rose-500 text-rose-700 p-4 mb-6 text-sm rounded-r" role="alert">
                    <p class="font-bold">Error</p>
                    <p>Username atau Password salah.</p>
                </div>
            <% } %>

            <form method="post" action="${pageContext.request.contextPath}/login" class="space-y-6">
                <div>
                    <label class="block text-sm font-semibold text-slate-700 mb-2">Username</label>
                    <input type="text" name="username" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-indigo-500 focus:ring-4 focus:ring-indigo-100 outline-none transition" placeholder="Masukan Username" required>
                </div>
                <div>
                    <label class="block text-sm font-semibold text-slate-700 mb-2">Password</label>
                    <input type="password" name="password" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-indigo-500 focus:ring-4 focus:ring-indigo-100 outline-none transition" placeholder= "Masukan Password" required>
                </div>
                <button class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-3.5 rounded-xl shadow-lg shadow-indigo-200 transition duration-300 transform active:scale-95">
                    Masuk Sekarang
                </button>
            </form>

            <div class="mt-8 text-center border-t border-slate-100 pt-6">
                <p class="text-slate-600 mb-4">Belum punya akun? <a href="register.jsp" class="text-indigo-600 font-bold hover:underline">Daftar disini</a></p>
                <a href="index.jsp" class="text-sm text-slate-400 hover:text-slate-600 transition no-underline">Kembali ke Beranda</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>