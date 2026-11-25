# Sistem Perpustakaan Kampus

## Deskripsi kasus

Perpustakaan kampus membutuhkan basis data untuk mengelola anggota, koleksi buku, dan transaksi peminjaman. Sistem menyimpan identitas anggota dan buku, stok buku, serta tanggal dan status setiap peminjaman. Data Budi dan peminjamannya termasuk dalam snapshot ini; stok buku pertama sudah dikurangi satu.

## Tujuan

- Menyimpan data anggota dan buku dengan primary key.
- Menghubungkan transaksi peminjaman ke anggota dan buku melalui foreign key.
- Mencatat tanggal peminjaman, tanggal pengembalian, dan status.
- Menyediakan snapshot SQL yang dapat dijalankan untuk membuat dan mengisi tabel aplikasi.

## Tools yang digunakan

- Oracle XE 21c
- SQLcl MCP
- GitHub Copilot
- Visual Studio Code (VS Code)

## Isi proyek

- `perpustakaan.sql` — perintah `CREATE TABLE` dan `INSERT` untuk tabel aplikasi `anggota`, `buku`, dan `peminjaman`.

Tabel `DBTOOLS$MCP_LOG` tidak disertakan karena merupakan tabel audit internal SQLcl MCP, bukan tabel aplikasi perpustakaan. Script berisi snapshot data saat ini, termasuk stok buku pertama sebesar 4.

## Langkah penggunaan

1. Buka folder proyek di VS Code.
2. Pastikan Oracle XE 21c dapat diakses melalui SQLcl.
3. Buka `perpustakaan.sql` di SQLcl atau SQLcl MCP dan jalankan script pada schema kosong.
4. Periksa tabel dan data, misalnya dengan `SELECT * FROM anggota;`, `SELECT * FROM buku;`, dan `SELECT * FROM peminjaman;`.

Script ini untuk inisialisasi satu kali pada schema kosong. Script tidak menghapus tabel yang sudah ada dan tidak menyertakan password atau kredensial.

## Prompt yang digunakan

- “List my saved Oracle connections and connect to uas_project.”
- “Design a library database for a campus library. Create tables: anggota (id, nama, email, jurusan), buku (id, judul, penulis, tahun_terbit, stok), peminjaman (id, anggota_id, buku_id, tgl_pinjam, tgl_kembali, status) with primary keys and foreign keys. Insert 8 sample rows per table, then show the contents of every table.”
- “buku mana yang stocknya kurang dari 3”
- “anggota yang paling sering meminjam”
- “peminjaman yang belim dikembalikan”
- “Tambahkan anggota baru bernama Budi dari jurusan Teknik Informatika, lalu catat dia meminjam buku pertama dan kurangi stoknya.” (digunakan dua kali)
- “Tampilkan data anggota Budi beserta peminjamannya dan stok buku yang dipinjam.”
