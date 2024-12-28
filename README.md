#GLAM Locations in Jakarta

#Deskripsi Proyek
Aplikasi ini adalah sebuah website interaktif untuk menampilkan lokasi-lokasi GLAM (Gallery, Library, Archive, Museum) di Jakarta. Menggunakan peta interaktif dari Leaflet.js, aplikasi ini memungkinkan pengguna untuk melihat informasi tentang berbagai institusi GLAM dengan mengklik marker pada peta.

Website ini terdiri dari dua bagian utama:
Frontend: Dibangun menggunakan HTML, CSS (Tailwind), dan JavaScript untuk menampilkan peta dan marker.
Backend: Menggunakan PHP untuk menyediakan data lokasi dalam format JSON.

Fitur Utama
Peta interaktif berbasis Leaflet.js.
Marker untuk setiap lokasi GLAM.
Informasi institusi ditampilkan dalam popup dan panel informasi.
Backend menggunakan PHP untuk menyediakan data lokasi.

Cara Menggunakan

1. Setup
Pastikan Anda memiliki server web lokal seperti XAMPP, WAMP, atau lainnya yang mendukung PHP. Pastikan internet aktif untuk mengakses pustaka eksternal seperti Leaflet.js dan Tailwind CSS.

2. Langkah-langkah Instalasi
Clone atau unduh proyek ini ke dalam direktori server lokal Anda. Letakkan file index.html dan locations.php di direktori root server Anda (misalnya, htdocs untuk XAMPP). Akses aplikasi melalui browser dengan URL: http://localhost/index.html

3. Menjalankan Aplikasi
Peta akan dimuat dengan marker dari data yang disediakan oleh locations.php.
Klik marker untuk melihat informasi tentang institusi tersebut.

Pengembangan Lebih Lanjut

Integrasi Database: Ganti array statis di locations.php dengan data dari database seperti MySQL.

Fitur Pencarian: Tambahkan fitur untuk mencari lokasi berdasarkan nama atau kategori.

Pengelompokan Marker: Gunakan cluster marker untuk menampilkan banyak lokasi secara efisien.

Hosting: Deploy aplikasi ke hosting seperti Netlify (frontend) dan Heroku atau VPS (backend).

Kontribusi
Kontribusi terbuka untuk pengembangan fitur baru dan perbaikan bug. Silakan fork repository ini dan ajukan pull request.

Lisensi
Proyek ini berada di bawah lisensi MIT. Anda bebas menggunakan, memodifikasi, dan mendistribusikan proyek ini dengan mencantumkan atribusi kepada pengembang asli.

Dikembangkan oleh: Nizam
TQ TQ ALL
