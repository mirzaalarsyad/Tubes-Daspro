program tubes_main;

uses tubes_f01f02, tubes_f03f04, tubes_f09f10, tubes_f11, tubes_f12, tubes_f1314, tubes_f15, tubes_datatypes;

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
	dataUsr 				: tubes_f01f02.tabUsr;
	tBuku      		       	: tabBuku; 
	tUser  		 		  	: tabUser;
	tHistoryPeminjaman 	    : tabHistoryPeminjaman;
	Neff_1 					: integer; //Jumlah pengguna yang tersimpan dalam array data (nilai efektif)
	Neff_2					: integer; //jumlah buku tersedia
	input   				: string;
	isAdmin 				: boolean;
	fileUsr 				: string;
	tHistoryPengembalian	: tabHistoryPengembalian;
	tlaporanBukuHilang		: tablaporanBukuHilang;

begin
	Neff_1 := 0;
	isAdmin := false;
	fileUsr := 'user.csv';
	input := '';
	InitTabUsr(dataUsr, Neff_1, fileUsr);
	writeln('$ login');
	writeln();
	Login(dataUsr, Neff_1, isAdmin);
	writeln('Selamat datang di Perpustakaan Ba Sing Tse');
	while (input <> 'exit') do
	begin
		write('$ ');
		readln(input);
		if (isAdmin) then
		begin
			if (input = 'register') then
			begin
				Register(dataUsr, Neff_1);
			end;
		end;

		if (input = 'cari') then
		begin
			searchCat(tBuku);
		end else if (input = 'caritahunterbit') then
		begin
			searchYr(tBuku);
		end else if (input = 'tambah_buku') then
		begin
			addBook(tBuku);
		end else if (input = 'tambah_jumlah_buku') then
		begin
			addNumBook(tBuku);
		end else if (input = 'riwayat') then
		begin
			RiwayatPeminjaman(tBuku, tUser, tHistoryPeminjaman);
		end else if (input = 'statistik') then
		begin
			Statistik(tUser, tBuku);
		end else if (input = 'load') then 
		begin
			Loadcsv(tBuku, dataUsr, tHistoryPeminjaman, tHistoryPengembalian, tlaporanBukuHilang, Neff_1);
		end else if (input = 'save') then
		begin
			Writecsv(tBuku, dataUsr, tHistoryPeminjaman, tHistoryPengembalian, tlaporanBukuHilang, Neff_1);
		end else if (input = 'cari_anggota') then
		begin
			CariAnggota(tUser);
		end;
	end;
end .