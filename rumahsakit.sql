create database Rumah_Sakit
use Rumah_Sakit

create table Perawat
(
id_perawat varchar (20) not null,
nama_perawat varchar (50) not null,
jenis_kelamin varchar (20) not null,
no_telp varchar (15),
id_pasien varchar (20),
constraint PK_perawat primary key (id_perawat)
--constraint FK_merawat_pasien foreign key (id_pasien) references Pasien (id_pasien)
)

create table Obat 
(
kode_obat varchar (20) not null,
nama_obat varchar (50),
jenis_obat varchar (20),
tahun_produksi date,
masa_kadaluarsa date,
harga int,
constraint PK_kode_obat primary key (kode_obat)
)

create table Dokter 
(
id_dokter varchar (20) not null,
id_perawat varchar (20),
nama_dokter varchar (50) not null,
spesialis varchar (20) not null,
no_telp varchar (15),
alamat varchar (50),
--constraint FK_didampingi_perawat foreign key (id_perawat) references Perawat (id_perawat),
--constraint FK_menentukan_obat foreign key (kode_obat) references Obat (kode_obat)
)

create table Rekam_Medis 
(
id_rekam_medis varchar (20) not null,
tanggal date,
keluhan varchar (100),
pemeriksaan varchar (100),
pengobatan varchar (100),
constraint PK_rekam_medis primary key (id_rekam_medis)
)

create table Pasien
(
id_pasien varchar (20) not null,
nama_pasien varchar (50) not null,
no_telp varchar (15),
tgl_lahir date not null,
alamat varchar (50),
jenis_kelamin varchar (20) not null,
id_rekam_medis varchar (20),
id_perawat varchar (20),
kode_obat varchar (20),
no_kamar varchar (20),
constraint PK_pasien primary key (id_pasien),
--constraint FK_tercatat_rekam_medis foreign key (id_rekam_medis) references Rekam_Medis (id_rekam_medis),
--constraint FK_dirawat_perawat foreign key (id_perawat) references Perawat (id_perawat),
--constraint FK_resep_obat foreign key (kode_obat) references Obat (kode_obat),
--constraint FK_dirawat_di_kamar foreign key (no_kamar) references Kamar (no_kamar)
)

create table Kamar
(
id_pasien varchar (20),
no_kamar varchar (20) not null,
nama_kamar varchar (20),
jenis_kamar varchar (20),
kapasitas varchar (5),
fasilitas varchar (100),
harga int,
book int,
constraint PK_no_kamar primary key (no_kamar)
--constraint FK_pasien_menempati foreign key (id_pasien) references Pasien (id_pasien)
)

--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Penambahan foreign key 

alter table Perawat
add constraint
FK_merawat_pasien foreign key (id_pasien) references Pasien (id_pasien)

alter table Dokter
add constraint
FK_didampingi_perawat foreign key (id_perawat) references Perawat (id_perawat)

alter table Pasien
add constraint
FK_tercatat_rekam_medis foreign key (id_rekam_medis) references Rekam_Medis (id_rekam_medis)

alter table Pasien
add constraint 
FK_dirawat_perawat foreign key (id_perawat) references Perawat (id_perawat)

alter table Pasien
add constraint
FK_resep_obat foreign key (kode_obat) references Obat (kode_obat)

alter table Pasien
add constraint 
FK_dirawat_di_kamar foreign key (no_kamar) references Kamar (no_kamar)


--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Input data di Database

insert into 
Perawat (
id_perawat,
nama_perawat,
jenis_kelamin,
no_telp)
values
(
'Perawat001',
'Encep Samsudin',
'Laki-laki',
'+6289651316001'
)

insert into 
Perawat (
id_perawat,
nama_perawat,
jenis_kelamin,
no_telp)
values
(
'Perawat002',
'Ghania Maymunah',
'Perempuan',
'+6289651316002'
)

insert into 
Perawat (
id_perawat,
nama_perawat,
jenis_kelamin,
no_telp)
values
(
'Perawat003',
'Farah Maysarah',
'Perempuan',
'+6289651316003'
)

insert into 
Perawat (
id_perawat,
nama_perawat,
jenis_kelamin,
no_telp)
values
(
'Perawat004',
'Jameelah Hanabawi',
'Perempuan',
'+6289651316004'
)

insert into 
Perawat (
id_perawat,
nama_perawat,
jenis_kelamin,
no_telp)
values
(
'Perawat005',
'Kayla Nur Maryam',
'Perempuan',
'+6289651316005'
)

insert into 
Perawat (
id_perawat,
nama_perawat,
jenis_kelamin,
no_telp)
values
(
'Perawat006',
'Zuma Difda un',
'Laki-laki',
'+6289651316006'
)


--select*from Perawat

insert into 
Obat (
kode_obat,
nama_obat,
jenis_obat,
tahun_produksi,
masa_kadaluarsa,
harga
)
values
(
'Obat001',
'Entecavir',
'Antivirus',
'1/11/2022',
'1/11/2023',
'350000'
)

insert into 
Obat (
kode_obat,
nama_obat,
jenis_obat,
tahun_produksi,
masa_kadaluarsa,
harga
)
values
(
'Obat002',
'Paracetamol (Acetaminophen)',
'Obat bebas',
'1/13/2022',
'1/13/2023',
'3000'
)

insert into 
Obat (
kode_obat,
nama_obat,
jenis_obat,
tahun_produksi,
masa_kadaluarsa,
harga
)
values
(
'Obat003',
'Oseltamivir',
'Antivirus',
'2022-02-24',
'2023-02-24',
'20000'
)

insert into 
Obat (
kode_obat,
nama_obat,
jenis_obat,
tahun_produksi,
masa_kadaluarsa,
harga
)
values
(
'Obat004',
'Tetracycline Hcl',
'Antibiotik',
'2022-02-4',
'2023-02-4',
'8000'
)

insert into 
Obat (
kode_obat,
nama_obat,
jenis_obat,
tahun_produksi,
masa_kadaluarsa,
harga
)
values
(
'Obat005',
'Albendazole',
'Antihelmintik',
'2021-04-13',
'2023-04-13',
'10000'
)

insert into 
Obat (
kode_obat,
nama_obat,
jenis_obat,
tahun_produksi,
masa_kadaluarsa,
harga
)
values
(
'Obat006',
'Triamcinolone',
'Kortikosteroid',
'2021-09-18',
'2023-09-18',
'12000'
)

--select*from Obat

insert into 
Dokter (
id_dokter,
id_perawat,
nama_dokter,
spesialis,
no_telp,
alamat
)
values
(
'Dokter001',
'Perawat001',
'Ramee El-Rahman',
'Ahli Hepatologi ',
'+6285848408001',
'Wangon, RT1 RW2'
)

insert into 
Dokter (
id_dokter,
id_perawat,
nama_dokter,
spesialis,
no_telp,
alamat
)
values
(
'Dokter002',
'Perawat002',
'Muhammad Thorin Jamaluddin',
'Ahli Penyakit Dalam ',
'+6285848408002',
'Wangon, RT2 RW2'
)

insert into 
Dokter (
id_dokter,
id_perawat,
nama_dokter,
spesialis,
no_telp,
alamat
)
values
(
'Dokter003',
'Perawat003',
'Zaytun Ahmad Hisaba',
'Dokter Anak ',
'+6285848408003',
'Wangon, RT3 RW3'
)

insert into 
Dokter (
id_dokter,
id_perawat,
nama_dokter,
spesialis,
no_telp,
alamat
)
values
(
'Dokter004',
'Perawat004',
'Jessica Abdurahman',
'Ahli Mikrobiologi ',
'+6285848408004',
'Wangon, RT4 RW4'
)

insert into 
Dokter (
id_dokter,
id_perawat,
nama_dokter,
spesialis,
no_telp,
alamat
)
values
(
'Dokter005',
'Perawat005',
'Obama Bin Laden',
'Dokter Umum ',
'+6285848408005',
'Wangon, RT5 RW5'
)

insert into 
Dokter (
id_dokter,
id_perawat,
nama_dokter,
spesialis,
no_telp,
alamat
)
values
(
'Dokter006',
'Perawat006',
'Abu Yusef Abusive',
'Ahli Gigi ',
'+6285848408006',
'Wangon, RT6 RW6'
)

--select*from Dokter

insert into 
Rekam_Medis (
id_rekam_medis,
tanggal,
keluhan,
pemeriksaan,
pengobatan
)
values
(
'RekamMedis001',
'2022/11/2',
'Badan terasa capek, demam, mata dan kulit mengkuning, mual dan muntah, diare, tak berselar makan',
'Dari hasil pemeriksaan, terdapat gangguan pada fungsi hati',
'kurangi aktifitas fisik, atur pola makan dan pola istirahat'
)

insert into 
Rekam_Medis (
id_rekam_medis,
tanggal,
keluhan,
pemeriksaan,
pengobatan
)
values
(
'RekamMedis002',
'2022/11/2',
'Nyeri retro-orbital, demam, sakit kepala hebat, nyeri sendi dan otot yang intens. nyeri, dan mual',
'Dari hasil pemeriksaan, nyeri ulu hati, otot & sendi, serta muncul ruam',
'kurangi aktifitas fisik, atur pola makan dan pola istirahat'
)

insert into 
Rekam_Medis (
id_rekam_medis,
tanggal,
keluhan,
pemeriksaan,
pengobatan
)
values
(
'RekamMedis003',
'2022/11/2',
'Demam, sakit kepala, pilek, hidung tersumbat, serta batuk',
'Infeksi virus yang menyerang hidung, tenggorokan, dan paru-paru',
'kurangi aktifitas fisik, atur pola makan dan pola istirahat'
)

insert into 
Rekam_Medis (
id_rekam_medis,
tanggal,
keluhan,
pemeriksaan,
pengobatan
)
values
(
'RekamMedis004',
'2022/11/2',
'Demam tinggi, keringat berlebih, diare, dehidrasi',
'Terdeteksi adanya bakteri Salmonella enterica yang berlebihan',
'kurangi aktifitas fisik, atur pola makan dan pola istirahat'
)

insert into 
Rekam_Medis (
id_rekam_medis,
tanggal,
keluhan,
pemeriksaan,
pengobatan
)
values
(
'RekamMedis005',
'2022/11/2',
'sakit perut, diare, mual dan muntah, tidak nafsu makan, hingga penurunan berat badan',
'Infeksi cacing kremi atau Enterobius vermicularis dapat menyebabkan gatal-gatal di sekitar anus',
'Perbanyak makan makanan yang sehat dan ditempat yang bersih'
)

insert into 
Rekam_Medis (
id_rekam_medis,
tanggal,
keluhan,
pemeriksaan,
pengobatan
)
values
(
'RekamMedis006',
'2022/11/2',
'Luka atau peradangan di bibir dan di dalam mulut',
'Bagian dalam mulut dan tenggorokan berwarna merah.',
'Kurangi makanan yang terlalu panas'
)

--select*from Rekam_Medis

insert into 
Kamar (
id_pasien, 
no_kamar, 
nama_kamar, 
jenis_kamar, 
kapasitas, 
fasilitas, 
harga
)
values
(
'Pasien001',
'Kamar001',
'Kamar Alpha',
'Kelas VIP/VVIP',
'1',
'Tempat tidur, AC dan TV, ruang tamu, kulkas, dan toilet',
'1000000'
)

insert into 
Kamar (
id_pasien, 
no_kamar, 
nama_kamar, 
jenis_kamar, 
kapasitas, 
fasilitas, 
harga
)
values
(
'Pasien002',
'Kamar002',
'Kamar Bravo',
'Kelas I',
'2',
'Tempat tidur, AC dan toilet',
'500000'
)

insert into 
Kamar (
id_pasien, 
no_kamar, 
nama_kamar, 
jenis_kamar, 
kapasitas, 
fasilitas, 
harga
)
values
(
'Pasien003',
'Kamar003',
'Kamar Charlie',
'Kelas II',
'4',
'Tempat tidur',
'250000'
)

insert into 
Kamar (
id_pasien, 
no_kamar, 
nama_kamar, 
jenis_kamar, 
kapasitas, 
fasilitas, 
harga
)
values
(
'Pasien004',
'Kamar004',
'Kamar Delta',
'Kelas III',
'6',
'Tempat tidur',
'100000'
)

insert into 
Kamar (
id_pasien, 
no_kamar, 
nama_kamar, 
jenis_kamar, 
kapasitas, 
fasilitas, 
harga
)
values
(
'Pasien005',
'Kamar005',
'Kamar Echo',
'Kelas IV',
'8',
'Tempat tidur',
'50000'
)

insert into 
Kamar (
id_pasien, 
no_kamar, 
nama_kamar, 
jenis_kamar, 
kapasitas, 
fasilitas, 
harga
)
values
(
'Pasien006',
'Kamar006',
'Kamar Alpha',
'Kelas V',
'10',
'Tempat Tidur',
'25000'
)

update kamar
set book = 0;
--select * from Kamar


insert into 
Pasien (
id_pasien, 
nama_pasien, 
no_telp, 
tgl_lahir, 
alamat, 
jenis_kelamin, 
id_rekam_medis,
id_perawat,
kode_obat,
no_kamar)

values
(
'Pasien001',
'Taqub Kamaradin Jibiazah',
'+6285848401001',
'2004-09-18',
'Ajibarang, RT 01 RW 01',
'Laki-laki',
'RekamMedis001',
'Perawat001',
'Obat001',
'Kamar001'
)

insert into 
Pasien (
id_pasien, 
nama_pasien, 
no_telp, 
tgl_lahir, 
alamat, 
jenis_kelamin, 
id_rekam_medis,
id_perawat,
kode_obat,
no_kamar
)
values
(
'Pasien002',
'Khaleed Khasmiri',
'+6285848401002',
'2004-09-2',
'Ajibarang, RT 02 RW 02',
'Laki-laki',
'RekamMedis002',
'Perawat002',
'Obat002',
'Kamar002'
)

insert into 
Pasien (
id_pasien, 
nama_pasien, 
no_telp, 
tgl_lahir, 
alamat, 
jenis_kelamin, 
id_rekam_medis,
id_perawat,
kode_obat,
no_kamar
)
values
(
'Pasien003',
'Khidir Karawita',
'+6285848401003',
'2004-09-3',
'Ajibarang, RT 03 RW 03',
'Laki-laki',
'RekamMedis003',
'Perawat003',
'Obat003',
'Kamar003'
)

insert into 
Pasien (
id_pasien, 
nama_pasien, 
no_telp, 
tgl_lahir, 
alamat, 
jenis_kelamin, 
id_rekam_medis,
id_perawat,
kode_obat,
no_kamar
)
values
(
'Pasien004',
'Ismail Ahmad Kanabawi',
'+6285848401004',
'2004-09-4',
'Ajibarang, RT 04 RW 04',
'Laki-laki',
'RekamMedis004',
'Perawat004',
'Obat004',
'Kamar004'
)

insert into 
Pasien (
id_pasien, 
nama_pasien, 
no_telp, 
tgl_lahir, 
alamat, 
jenis_kelamin, 
id_rekam_medis,
id_perawat,
kode_obat,
no_kamar
)
values
(
'Pasien005',
'Usman Abdal Jalil Sisha',
'+6285848401005',
'2004-09-5',
'Ajibarang, RT 05 RW 05',
'Laki-laki',
'RekamMedis005',
'Perawat005',
'Obat005',
'Kamar005'
)

insert into 
Pasien (
id_pasien, 
nama_pasien, 
no_telp, 
tgl_lahir, 
alamat, 
jenis_kelamin, 
id_rekam_medis,
id_perawat,
kode_obat,
no_kamar
)
values
(
'Pasien006',
'Muhammad Sumbul',
'+6285848401006',
'2004-09-6',
'Ajibarang, RT 06 RW 06',
'Laki-laki',
'RekamMedis006',
'Perawat006',
'Obat006',
'Kamar006'
)


--select*from Pasien


--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Inner Join 3 tabel

select pasien.nama_pasien, obat.nama_obat, perawat.nama_perawat perawat
from pasien
inner join Obat on  obat.kode_obat = pasien.kode_obat
inner join Perawat on  perawat.id_perawat = pasien.id_perawat

select Pasien.nama_pasien, Kamar.no_kamar, Rekam_Medis.keluhan
from pasien
inner join Kamar on Kamar.no_kamar = pasien.no_kamar
inner join Rekam_Medis on Rekam_Medis.id_rekam_medis = Pasien.id_rekam_medis

-- Pembuatan 2 Procedure

create procedure detail_pasien_untuk_apotik 
as
select pasien.nama_pasien, obat.nama_obat, perawat.nama_perawat perawat
from pasien
inner join Obat on  obat.kode_obat = pasien.kode_obat
inner join Perawat on  perawat.id_perawat = pasien.id_perawat
go


create procedure detail_pasien_untuk_dokter
as
select Pasien.nama_pasien, Kamar.no_kamar, Rekam_Medis.keluhan
from pasien
inner join Kamar on Kamar.no_kamar = pasien.no_kamar
inner join Rekam_Medis on Rekam_Medis.id_rekam_medis = Pasien.id_rekam_medis
go

create procedure caripasien4
@nama varchar (50)
as
Select * from Pasien where nama_pasien like  '%' + @nama + '%'
go

exec detail_pasien_untuk_apotik
exec detail_pasien_untuk_dokter
exec caripasien4 'Abdal'

-- Pembuatan 3 Trigger

create trigger tambahpasien
on Pasien for insert
as 
print 'Pasien Telah Ditambahkan'
print 'Dimodifikasi : '+ convert (varchar, getdate())
print 'Nama Host : '+ host_name()

create trigger tambahobat
on Obat for insert
as 
print 'Obat Telah Ditambahkan'
print 'Dimodifikasi : '+ convert (varchar, getdate())
print 'Nama Host : '+ host_name()

create trigger tambahperawat
on Perawat for insert
as 
print 'Perawat Telah Ditambahkan'
print 'Dimodifikasi : '+ convert (varchar, getdate())
print 'Nama Host : '+ host_name()


--create trigger booked on Pasien
--for insert
--as 
--update pasien
--set Pasien.no_kamar = (select TOP 1 Kamar.no_kamar from Kamar where Kamar.book = 0 )
--update kamar
--set Kamar.book =  1 WHERE kamar.book = 0
--and kamar.book = (select TOP 1 Kamar.no_kamar from Kamar where Kamar.book = 0)


--select * from Obat;

--Pembuatan 2 Function


CREATE FUNCTION 
dbo.hargakamar2 (@hari int, @no_kamar varchar (20))
returns int 
as
begin return @hari * (select harga from Kamar where no_kamar = @no_kamar)
end;

select id_pasien, dbo.hargakamar2 (2,no_kamar) from Pasien
select * from kamar
-- Akan ditambahkan informasi secara detail menggunakan inner join

CREATE FUNCTION 
dbo.hargaobat (@jumlah_obat int, @kode_obat varchar (20))
returns int 
as
begin return @jumlah_obat * (select harga from Obat where kode_obat = @kode_obat)
end;

select id_pasien, dbo.hargaobat (2,kode_obat) from Pasien
-- Akan ditambakan bagaiamana cara agar si Pasien 
-- bisa tau harga obat setelah kerumah sakit




--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--Special Thanks
--Mas Nakyon yang ngajarin di bagian teknisnya
--Mas Daafn yang ngajarin dibagian implementasinya
--Mas Blitz yang kerja di bidang database tapi dia ternyata pake Oracle.
--Mas Redawn yang mahasiswa semester 8 tapi malah ngajak main Minecraft.
--Mas Yumii4sr yang malah dapet Nahida di Genshin Impact yang padahal Saya juga pengin.
--Mas Lotus yang mahasiswa Farmasi yang bilang tidur bentar tapi masih belum bangun dari jam 5 pagi sampai jam 3 sore.
--Dan juga teman-teman Discord lainnya.
