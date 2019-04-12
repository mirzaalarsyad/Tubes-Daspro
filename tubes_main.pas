program tubes_main;

uses tubes_f01f02, tubes_f03f04;

type
	pengguna = record
			nama  : string; // nama user
			addr  : string; // alamat user
			usrNm : string; // username
			pw	  : string; // password
			role  : string; // role, admin atau pengunjung
			end;
	buku = record
			id	 : integer; // ID Buku
			judul: string;  // Judul Buku
			auth : string;  // penulis (author) buku
			ktg	 : string;  // Kategoti buku
			thn  : integer; // Tahun terbit
			end;

var
	user 	: pengguna;
	dataUsr : array [1..1000] of pengguna;
	Neff_1 	: integer; //Jumlah pengguna yang tersimpan dalam array data (nilai efektif)
	input   : integer;
	buku 	: idBuku;
	koleksi	: array [1..10000] of buku;
	Neff_2	: integer; //jumlah buku tersedia

begin
	Neff := 0;
	isAdmin := false;
	Login(dataUsr, Neff_1, isAdmin);
	if (isAdmin) then
	begin
		writeln('Menu Layanan Perpustakaan Ba Sing Tse');
		writeln('1. Registrasi Akun Pengunjung Baru');
		writeln('2. Pencarian Buku Berdasarkan Kategori');
		writeln('3. Pencarian Buku Berdasarkan Tahun Penerbitan');
		write('Masukkan pilihan: ');
		readln(input);

		if (input = 1) then
		begin
			Register(dataUsr, Neff_1);
		end else if (input = 2) then
		begin
			searchCat(koleksi, Neff_2);
		end else if (input = 3) then
		begin
			searchYr(koleksi, Neff_2);
		end;
end .