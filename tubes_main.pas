program tubes_main;

uses tubes_f01f02, tubes_f03f04, tubes_f09f10;

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
	input   : string;
	isAdmin : boolean;
	fileUsr : string;

begin
	Neff_1 := 0;
	Neff_2 := 0;
	isAdmin := false;
	fileUsr := 'user.csv';

	InitTabUsr(dataUsr, Neff_1, fileUsr);
	writeln('$ login');
	writeln();
	Login(dataUsr, Neff_1, isAdmin);
	if (isAdmin) then
	begin
		writeln('Selamat datang di Perpustakaan Ba Sing Tse');
		write('$ ');
		readln(input);

		if (input = 'register') then
		begin
			Register(dataUsr, Neff_1);
		end else if (input = 'cari') then
		begin
			searchCat(koleksi, Neff_2);
		end else if (input = 'caritahunterbit') then
		begin
			searchYr(koleksi, Neff_2);
		end else if (input = 'tambah_buku') then
		begin
			addBook(koleksi, Neff_2);
		end else if (input = 'tambah_jumlah_buku') then
		begin
			addNumBook(koleksi, Neff_2);
		end;
	end;
end .