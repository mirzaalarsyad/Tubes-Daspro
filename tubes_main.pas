program tubes_main;

uses tubes_f01f02, tubes_f03f04, tubes_f09f10,
	 blowfish;

{type
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
			jml  : integer; // Jumlah buku
			end;
	tabUsr = array [1..10000] of pengguna;
	tabBook = array [1..10000] of buku; }

var
	dataUsr : tubes_f01f02.tabUsr;
	koleksi	: tubes_f03f04.tabBook;
	Neff_1 	: integer; //Jumlah pengguna yang tersimpan dalam array data (nilai efektif)
	Neff_2	: integer; //jumlah buku tersedia
	input   : integer;
	isAdmin : boolean;

begin

	Neff_1 := 0;
	Neff_2 := 0;
	isAdmin := false;
	Login(dataUsr, Neff_1, isAdmin);
	if (isAdmin) then
	begin
		writeln('Menu Layanan Perpustakaan Ba Sing Tse');
		writeln('1. Registrasi Akun Pengunjung Baru');
		writeln('2. Pencarian Buku Berdasarkan Kategori');
		writeln('3. Pencarian Buku Berdasarkan Tahun Penerbitan');
		writeln('4. Penambahan Buku Baru');
		writeln('5. Penambahan Jumlah Buku');
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
		end else if (input = 4) then
		begin
			addBook(koleksi, Neff_2);
		end else if (input = 5) then
		begin
			addNumBook(koleksi, Neff_2);
		end;
	end;
end .