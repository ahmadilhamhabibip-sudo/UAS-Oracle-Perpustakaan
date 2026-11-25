-- Snapshot data aplikasi perpustakaan kampus.
-- Jalankan satu kali pada schema kosong. DBTOOLS$MCP_LOG adalah tabel audit SQLcl MCP,
-- sehingga tidak termasuk dalam script aplikasi ini.

CREATE TABLE anggota (
    id NUMBER PRIMARY KEY,
    nama VARCHAR2(100) NOT NULL,
    email VARCHAR2(255) NOT NULL,
    jurusan VARCHAR2(100) NOT NULL
);

CREATE TABLE buku (
    id NUMBER PRIMARY KEY,
    judul VARCHAR2(255) NOT NULL,
    penulis VARCHAR2(150) NOT NULL,
    tahun_terbit NUMBER(4),
    stok NUMBER DEFAULT 0 NOT NULL
);

CREATE TABLE peminjaman (
    id NUMBER PRIMARY KEY,
    anggota_id NUMBER NOT NULL,
    buku_id NUMBER NOT NULL,
    tgl_pinjam DATE NOT NULL,
    tgl_kembali DATE,
    status VARCHAR2(20) NOT NULL,
    CONSTRAINT fk_peminjaman_anggota
        FOREIGN KEY (anggota_id) REFERENCES anggota (id),
    CONSTRAINT fk_peminjaman_buku
        FOREIGN KEY (buku_id) REFERENCES buku (id)
);

INSERT INTO anggota (id, nama, email, jurusan)
VALUES (1, 'Alya Putri', 'alya.putri@kampus.ac.id', 'Informatika');
INSERT INTO anggota (id, nama, email, jurusan)
VALUES (2, 'Bima Pratama', 'bima.pratama@kampus.ac.id', 'Manajemen');
INSERT INTO anggota (id, nama, email, jurusan)
VALUES (3, 'Citra Lestari', 'citra.lestari@kampus.ac.id', 'Akuntansi');
INSERT INTO anggota (id, nama, email, jurusan)
VALUES (4, 'Dimas Saputra', 'dimas.saputra@kampus.ac.id', 'Teknik Sipil');
INSERT INTO anggota (id, nama, email, jurusan)
VALUES (5, 'Eka Wulandari', 'eka.wulandari@kampus.ac.id', 'Ilmu Komunikasi');
INSERT INTO anggota (id, nama, email, jurusan)
VALUES (6, 'Farhan Hakim', 'farhan.hakim@kampus.ac.id', 'Hukum');
INSERT INTO anggota (id, nama, email, jurusan)
VALUES (7, 'Gita Maharani', 'gita.maharani@kampus.ac.id', 'Psikologi');
INSERT INTO anggota (id, nama, email, jurusan)
VALUES (8, 'Hadi Nugroho', 'hadi.nugroho@kampus.ac.id', 'Biologi');
INSERT INTO anggota (id, nama, email, jurusan)
VALUES (9, 'Budi', 'budi@kampus.ac.id', 'Teknik Informatika');

INSERT INTO buku (id, judul, penulis, tahun_terbit, stok)
VALUES (1, 'Dasar-Dasar Pemrograman', 'Rosa A.S.', 2021, 4);
INSERT INTO buku (id, judul, penulis, tahun_terbit, stok)
VALUES (2, 'Basis Data Relasional', 'Fathansyah', 2018, 3);
INSERT INTO buku (id, judul, penulis, tahun_terbit, stok)
VALUES (3, 'Pengantar Manajemen', 'T. Hani Handoko', 2016, 4);
INSERT INTO buku (id, judul, penulis, tahun_terbit, stok)
VALUES (4, 'Akuntansi Keuangan', 'Kieso, Weygandt, dan Warfield', 2019, 2);
INSERT INTO buku (id, judul, penulis, tahun_terbit, stok)
VALUES (5, 'Komunikasi Organisasi', 'Arni Muhammad', 2017, 3);
INSERT INTO buku (id, judul, penulis, tahun_terbit, stok)
VALUES (6, 'Pengantar Ilmu Hukum', 'Peter Mahmud Marzuki', 2020, 4);
INSERT INTO buku (id, judul, penulis, tahun_terbit, stok)
VALUES (7, 'Psikologi Umum', 'Sarlito W. Sarwono', 2015, 2);
INSERT INTO buku (id, judul, penulis, tahun_terbit, stok)
VALUES (8, 'Biologi Dasar', 'Neil A. Campbell', 2020, 5);

INSERT INTO peminjaman (id, anggota_id, buku_id, tgl_pinjam, tgl_kembali, status)
VALUES (1, 1, 1, DATE '2026-11-01', NULL, 'DIPINJAM');
INSERT INTO peminjaman (id, anggota_id, buku_id, tgl_pinjam, tgl_kembali, status)
VALUES (2, 2, 3, DATE '2026-10-28', DATE '2026-11-05', 'DIKEMBALIKAN');
INSERT INTO peminjaman (id, anggota_id, buku_id, tgl_pinjam, tgl_kembali, status)
VALUES (3, 3, 2, DATE '2026-11-03', NULL, 'DIPINJAM');
INSERT INTO peminjaman (id, anggota_id, buku_id, tgl_pinjam, tgl_kembali, status)
VALUES (4, 4, 6, DATE '2026-10-20', DATE '2026-10-29', 'DIKEMBALIKAN');
INSERT INTO peminjaman (id, anggota_id, buku_id, tgl_pinjam, tgl_kembali, status)
VALUES (5, 5, 5, DATE '2026-11-10', NULL, 'DIPINJAM');
INSERT INTO peminjaman (id, anggota_id, buku_id, tgl_pinjam, tgl_kembali, status)
VALUES (6, 6, 4, DATE '2026-10-15', DATE '2026-10-24', 'DIKEMBALIKAN');
INSERT INTO peminjaman (id, anggota_id, buku_id, tgl_pinjam, tgl_kembali, status)
VALUES (7, 7, 7, DATE '2026-11-14', NULL, 'DIPINJAM');
INSERT INTO peminjaman (id, anggota_id, buku_id, tgl_pinjam, tgl_kembali, status)
VALUES (8, 8, 8, DATE '2026-10-30', DATE '2026-11-08', 'DIKEMBALIKAN');
INSERT INTO peminjaman (id, anggota_id, buku_id, tgl_pinjam, tgl_kembali, status)
VALUES (9, 9, 1, DATE '2026-11-25', NULL, 'DIPINJAM');

COMMIT;
