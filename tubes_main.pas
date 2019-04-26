program tubes_main;

uses tubes_f01f02, tubes_f03f04, tubes_f09f10, tubes_f11, tubes_f12, tubes_f1314, tubes_f15, tubes_datatypes,
	 tubes_f07f08, tubes_f05;

var
	dataUsr 				: tubes_f01f02.tabUsr;
	tBuku      		       	: tabBuku; 
	tUser  		 		  	: tabUser;
	tHistoryPeminjaman 	    : tabHistoryPeminjaman;
	Neff_1 					: integer; //Jumlah pengguna yang tersimpan dalam array data (nilai efektif)
	input   				: string;
	isAdmin 				: boolean;
	fileUsr 				: string;
	tHistoryPengembalian	: tabHistoryPengembalian;
	tlaporanBukuHilang		: tablaporanBukuHilang;
	i 					    : integer;
	id 						: string;
	x						: string; // pilihan sebelum exit
	sudahLogin              : boolean;
	sudahLoad				: boolean;
begin
	Neff_1 := 0;
	isAdmin := false;
	sudahLogin := false;
	sudahLoad  := false;
	while not(sudahLoad) and not(sudahLogin) do 
	begin
		write('$ ');
		readln(input);
		if(input = 'load') then
		begin
			Loadcsv(tBuku, dataUsr, tHistoryPeminjaman, tHistoryPengembalian, tlaporanBukuHilang, Neff_1);
			sudahLoad := true;
		end;

		if(sudahLoad) then
		begin
			Login(dataUsr,Neff_1, isAdmin, i);
			sudahLogin := true;
		end else 
		begin
			writeln('belum ada data di load, silakan load terlebih dahulu');
		end;

		if not (sudahLogin) then
		begin
			writeln('jika data sudah di load, silakan login');
		end;
	end;

	while (input <> 'exit') do
	begin
		write('$ ');
		readln(input);
		if (isAdmin) then
		begin
			if (input = 'register') then
			begin
				Register(dataUsr, Neff_1);
			end else if (input = 'lihat_laporan') then
			begin
				lihatLaporan(tlaporanBukuHilang, tBuku);
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
			Statistik(dataUsr, tBuku, Neff_1);
		end else if (input = 'load') then 
		begin
			Loadcsv(tBuku, dataUsr, tHistoryPeminjaman, tHistoryPengembalian, tlaporanBukuHilang, Neff_1);
		end else if (input = 'save') then
		begin
			Writecsv(tBuku, dataUsr, tHistoryPeminjaman, tHistoryPengembalian, tlaporanBukuHilang, Neff_1);
		end else if (input = 'cari_anggota') then
		begin
			CariAnggota(dataUsr, Neff_1);
		end else if (input = 'pinjam_buku') then
		begin
		    Peminjaman(tBuku, dataUsr, tHistoryPeminjaman);
		end else if (input = 'kembalikan_buku') then
		begin
		//	Pengembalian(dataUsr[i].usrNm; id);
		end else if (input = 'lapor_hilang') then
		begin
			laporHilang(dataUsr[i].usrNm, tlaporanBukuHilang);
		end;

	end;
	write('Apakah anda mau menyimpan? (y/n) ');
	readln(x);
	if(x = 'y') then
	begin
		Writecsv(tBuku, dataUsr, tHistoryPeminjaman, tHistoryPengembalian, tlaporanBukuHilang, Neff_1);
	end;
end.