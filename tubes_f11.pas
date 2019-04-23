unit tubes_f11;
interface
uses tubes_datatypes,coba;
procedure RiwayatPeminjaman(var tBuku:tabBuku; var tUser: tabUser;var tHistoryPeminjaman: tabHistoryPeminjaman);
implementation
procedure RiwayatPeminjaman(var tBuku:tabBuku; var tUser: tabUser;var tHistoryPeminjaman: tabHistoryPeminjaman);

	var
	username,tgl	: String;//string username yang dimasukkan;
	i,ix		:Integer;// indeks 
	begin
		write('masukkan username pengunjung: '); readln(username);
		writeln('Riwayat: ');
		for i:=1 to tHistoryPeminjaman.neff Do
		begin
			if (username=tHistoryPeminjaman.tab[i].username) then //mencari username yang sama 
				begin
					tgl:='';
					if(tHistoryPeminjaman.tab[i].tanggal_peminjaman.hari<10) then tgl:=tgl+'0'+IntToStr(tHistoryPeminjaman.tab[i].tanggal_peminjaman.hari) else tgl:=tgl+IntToStr(tHistoryPeminjaman.tab[i].tanggal_peminjaman.hari);
						tgl:=tgl+'/';
					if(tHistoryPeminjaman.tab[i].tanggal_peminjaman.bulan<10) then tgl:=tgl+'0'+IntToStr(tHistoryPeminjaman.tab[i].tanggal_peminjaman.bulan) else tgl:=tgl+IntToStr(tHistoryPeminjaman.tab[i].tanggal_peminjaman.bulan);
						tgl:=tgl+'/';
						tgl:=tgl + IntToStr(tHistoryPeminjaman.tab[i].tanggal_peminjaman.tahun); //mengembalikan tanggal menjadi string;
					write(tgl);
					write('  |  ');
					write(tHistoryPeminjaman.tab[i].ID_Buku);
					write('  |  ');
					for ix:=1 to tBuku.neff Do //mencari id buku yang sama, yang akan dituliskan riwayatnya;
						begin
							if (tHistoryPeminjaman.tab[i].ID_Buku=tBuku.tab[ix].ID_Buku) then writeln(tBuku.tab[ix].Judul_Buku);					 	
						end;
				end;
		end;
	end;

end.