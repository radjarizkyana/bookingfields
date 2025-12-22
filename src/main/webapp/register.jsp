<!DOCTYPE html>
<html lang="id">
<head>
    <title>Register - BookingFields</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Inter', sans-serif; }</style>
</head>
<body class="bg-slate-100 flex items-center justify-center min-h-screen p-4">

<div class="w-full max-w-md">
    <div class="bg-white rounded-3xl shadow-2xl overflow-hidden">
        <div class="p-8 text-center bg-slate-900">
            <h2 class="text-3xl font-bold text-white mb-2">Buat Akun</h2>
            <p class="text-slate-400">Bergabunglah dengan BookingField</p>
        </div>
        
        <div class="p-8 pt-10">
            <form method="post" action="${pageContext.request.contextPath}/register" class="space-y-5">
                <div>
                    <label class="block text-sm font-semibold text-slate-700 mb-2">Username</label>
                    <input type="text" name="username" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-slate-800 focus:ring-4 focus:ring-slate-100 outline-none transition" placeholder="Masukan Username" required>
                </div>
                <div>
                    <label class="block text-sm font-semibold text-slate-700 mb-2">Password</label>
                    <input type="password" name="password" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-slate-800 focus:ring-4 focus:ring-slate-100 outline-none transition" placeholder="Masukan Password" required>
                </div>
                <div>
                    <label class="block text-sm font-semibold text-slate-700 mb-2">No. Handphone</label>
                    <input type="text" name="phone" class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-slate-800 focus:ring-4 focus:ring-slate-100 outline-none transition" placeholder="Masukan No Handphone" required>
                </div>
                <button class="w-full bg-emerald-500 hover:bg-emerald-600 text-white font-bold py-3.5 rounded-xl shadow-lg shadow-emerald-200 transition duration-300 transform active:scale-95">
                    Daftar Akun
                </button>
            </form>

            <div class="mt-8 text-center border-t border-slate-100 pt-6">
                <p class="text-slate-600 mb-4">Sudah punya akun? <a href="login.jsp" class="text-slate-900 font-bold hover:underline">Login disini</a></p>
                <a href="index.jsp" class="text-sm text-slate-400 hover:text-slate-600 transition no-underline">Kembali ke Beranda</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>