# Incident_Response

Otomatisasi Pengumpulan Data untuk Respons Insiden (IR)

Pengenalan

Selamat datang di skrip UbuntuIR. Skrip ini dirancang sebagai alat bantu untuk Incident Response (IR) dan Forensik Digital di server berbasis Ubuntu. Tujuan utamanya adalah untuk mengotomatisasi pengumpulan data penting (atau yang sering disebut triage data) dari sebuah sistem yang dicurigai telah diserang atau dikompromikan.

Apa itu Incident Response (IR)?

Incident Response (IR), atau Respons Insiden, adalah serangkaian langkah terstruktur yang diambil oleh organisasi untuk menanggapi dan mengelola insiden keamanan siber. Tujuannya adalah untuk:

    Mengidentifikasi insiden.

    Mengurangi dampak dan kerugian yang terjadi.

    Memulihkan operasi sistem kembali ke kondisi normal.

    Menganalisis penyebab insiden untuk mencegahnya terjadi lagi di masa depan.

Proses IR biasanya terbagi dalam beberapa fase, salah satunya adalah fase pengumpulan data. Pada fase ini, tim IR harus dengan cepat mengumpulkan data sebanyak mungkin dari sistem yang terpengaruh. Data ini akan menjadi "bukti" yang digunakan untuk menganalisis apa yang terjadi, bagaimana pelaku masuk, dan apa yang mereka lakukan di dalam sistem.

Mengapa Skrip ini Penting?

Dalam situasi insiden, setiap detik sangat berharga. Data penting di sistem bisa saja hilang, diubah, atau dihapus oleh pelaku. Skrip ini membantu mengatasi tantangan tersebut dengan cara:

    Kecepatan: Mengumpulkan data kritis secara otomatis dalam hitungan detik.

    Konsistensi: Memastikan data yang dikumpulkan selalu sama (standar) untuk setiap kasus, memudahkan perbandingan dan analisis.

    Non-intrusif: Skrip ini hanya mengumpulkan data yang tersedia dan tidak memodifikasi file penting sistem, sehingga integritas bukti tetap terjaga.

Bagaimana Cara Kerja Skrip ini?

Skrip ini bekerja dengan menjalankan serangkaian perintah Linux/Ubuntu standar untuk mengumpulkan informasi dari berbagai area penting di sistem, seperti:

    Informasi Sistem: Versi OS, uptime, dan paket yang terinstal.

    Proses dan Aplikasi: Daftar proses yang berjalan dan layanan yang aktif.

    Jaringan: Koneksi yang sedang terjalin, konfigurasi antarmuka, dan aturan firewall.

    Aktivitas Pengguna: Riwayat login, daftar pengguna, dan hak akses.

    Integritas File: Pencarian file dengan hak akses khusus (seperti SUID) dan file yang baru dimodifikasi.

    Log Sistem: Salinan log-log penting (auth.log, syslog, dll.) untuk analisis mendalam.

    Pencarian Tanda-tanda Awal Serangan: Pencarian string atau fungsi yang sering digunakan dalam backdoor di direktori web umum.

Semua data yang dikumpulkan akan disimpan dalam direktori UbuntuIR dan kemudian dikompres ke dalam satu file Collection.tar.gz. File ini dapat dengan mudah dieksfiltrasi (dipindahkan) untuk analisis lebih lanjut di lingkungan yang aman dan terisolasi, tanpa risiko mengkontaminasi bukti.

Cara Menggunakan

    Tempatkan skrip ini di sistem yang akan Anda periksa.

    Berikan hak eksekusi: chmod +x nama_skrip.sh

    Jalankan skrip dengan hak akses root: sudo ./nama_skrip.sh

Setelah selesai, file Collection.tar.gz akan dibuat di direktori yang sama.
