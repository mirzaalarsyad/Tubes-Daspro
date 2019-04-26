unit tubes_f05;
interface
uses tubes_datatypes,coba, tubes_f01f02;
procedure Peminjaman(var tBuku:tabBuku; var tUser: tabUsr;var tHistoryPeminjaman: tabHistoryPeminjaman);
implementation
procedure Peminjaman(var tBuku:tabBuku; var tUser: tabUsr;var tHistoryPeminjaman: tabHistoryPeminjaman);

	var
	username,tgl 		: String;//string username dan tanggal yang dimasukkan;
	i,ifound,ID_Buku	: Integer;// indeks 
	found				: Boolean;
	TGLList				: Array [0..2] of string;
	tanggals,tanggalsb	: tanggal; // tanggal peminjaman, dan pengembalian;
	slash				: char;
	begin
		slash:= '/';
		write('masukkan Username: ');readln(username);
		write('masukkan ID Buku yang ingin dipinjam: '); readln(ID_Buku);
		found:=false;//awal bermula dengan tidak ditemukan
		for i:=1 to tBuku.neff Do //perulangan dari awal hingga akhir
			if (ID_Buku=tBuku.tab[i].ID_Buku) then //jika sama, maka found akan sama, sehingga menghasilkan nilai found menjadi true, dan mengetahui indeks dimana ID_Buku sama;
				begin
					found:=true;
					ifound:=i;	
				end;
		writeln('Masukkan tanggal hari ini'); readln(tgl);
			ExtractStrings(tgl,slash,TGLList);
		tanggals.hari  	:= StrToInt(TGLList[0]);
		tanggals.bulan	:= StrToInt(TGLList[1]);
		tanggals.tahun	:= StrToInt(TGLList[2]);
		//tanggal kembali
		if ((tanggals.bulan=1) or (tanggals.bulan=3) or (tanggals.bulan=5) or (tanggals.bulan=7) or (tanggals.bulan=8) or (tanggals.bulan=10) or (tanggals.bulan=12)) then
			begin 
				if(tanggals.hari>17) then 
					begin
						tanggalsb.hari:= tanggals.hari-17;
						tanggalsb.bulan:= tanggals.bulan+1;
						if (tanggalsb.bulan>12) then
							begin
									tanggalsb.bulan:=tanggalsb.bulan-12;
									tanggalsb.tahun:=tanggals.tahun+1;
							end else tanggalsb.tahun:=tanggals.tahun;	
					end else
					begin
						tanggalsb.hari:= tanggals.hari+14;
						tanggalsb.bulan:= tanggals.bulan;
						tanggalsb.tahun:=tanggals.tahun;
					end;				
			end else
		if ((tanggals.bulan=4) or (tanggals.bulan=6) or (tanggals.bulan=9) or (tanggals.bulan=11)) then	
			begin 
				if(tanggals.hari>16) then 
					begin
					tanggalsb.hari:= tanggals.hari-16;
					tanggalsb.bulan:= tanggals.bulan+1;
					tanggalsb.tahun:=tanggals.tahun;	
					end else
					begin
						tanggalsb.hari:= tanggals.hari+14;
						tanggalsb.bulan:= tanggals.bulan;
						tanggalsb.tahun:=tanggals.tahun;
					end;				
			end else
		if (tanggals.bulan=2) then
			begin 
				if(tanggals.hari>14) then 
					begin
						tanggalsb.hari:= tanggals.hari-14;
						tanggalsb.bulan:= tanggals.bulan+1;
						tanggalsb.tahun:=tanggals.tahun;	
					end else
					begin
						tanggalsb.hari:= tanggals.hari+14;
						tanggalsb.bulan:= tanggals.bulan;
						tanggalsb.tahun:=tanggals.tahun;
					end;				
			end;


		//
		if(tBuku.tab[ifound].Jumlah_Buku = 0) then 
			begin
				writeln('Buku' +tBuku.tab[ifound].Judul_Buku+ 'sedang habis!');
			end else
			begin
				writeln('Buku ' + tBuku.tab[ifound].Judul_Buku + ' berhasil dipinjam!');
					tBuku.tab[ifound].Jumlah_Buku := tBuku.tab[ifound].Jumlah_Buku - 1;
					tHistoryPeminjaman.neff:= tHistoryPeminjaman.neff +1;	
					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Username := username;
					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].ID_Buku := tBuku.tab[ifound].ID_Buku;
					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Tanggal_Peminjaman.hari := tanggals.hari ;
					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Tanggal_Peminjaman.bulan := tanggals.bulan ;
					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Tanggal_Peminjaman.tahun := tanggals.tahun ;
					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Tanggal_Batas.hari := tanggalsb.hari ;
					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Tanggal_Batas.bulan := tanggalsb.bulan ;
					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Tanggal_Batas.tahun := tanggalsb.tahun ;
					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Status_Pengembalian := False;
				writeln('Tersisa'+ IntToStr(tBuku.tab[ifound].Jumlah_Buku) +'Buku ' + tBuku.tab[ifound].Judul_Buku);
				writeln('Terima kasih sudah meminjam.');
			end;
	end;
end.