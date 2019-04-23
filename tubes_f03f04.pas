unit tubes_f03f04; //unit menyimpan fungsi dan prosedur untuk pencarian buku (f03 dan f04)
interface
	uses tubes_datatypes;
	procedure searchCat (var koleksi : tabBuku);
	// Prosedur pencarian berdasarkan kategori buku
	procedure searchYr (var koleksi : tabBuku);
	// Prosedur pencarian berdasarkan tahun penerbitan buku

implementation
	procedure searchCat (var koleksi : tabBuku);
	var
		i   : integer;
		ada : boolean; //ada atau tidaknya kategori yang tersedia
		katg: string; //kategori input
	begin
		repeat
			ada := false;
			writeln();
			write('Masukkan kategori: ');
			readln(katg);
			if (katg = 'sastra') or (katg = 'sains') or (katg = 'manga') or (katg = 'sejarah') or (katg = 'programming') then
			begin
				for i := 1 to koleksi.neff do
				begin
					writeln();
					if(koleksi.tab[i].Kategori = katg) then
					begin
						writeln(koleksi.tab[i].ID_Buku, ' | ', koleksi.tab[i].Judul_Buku, ' | ', koleksi.tab[i].Author);
						ada := true;
					end;
				end;
				if not (ada) then
				begin
					writeln();
					writeln('Hasil pencarian:');
					writeln('Tidak ada buku dalam kategori ini.');
				end;
			end else
			begin
				writeln('Kategori ', katg, ' tidak valid.');
			end;
		until (katg = 'sastra') or (katg = 'sains') or (katg = 'manga') or (katg = 'sejarah') or (katg = 'programming');
	end;

	procedure searchYr (var koleksi : tabBuku);
	var
		i   : integer;
		ada : boolean;
		yr  : integer; //tahun terbit masukan
		op  : char;	   //operator <,>,=,<=,>=
	begin
		ada := false;
		write('Masukkan tahun: ');
		readln(yr);
		write('Masukkan kategori: ');
		readln(op);
		if(op = '>') then
		begin
			for i := 1 to koleksi.neff do
			begin
				if(koleksi.tab[i].Tahun_Penerbit > yr) then
				begin
					writeln(koleksi.tab[i].ID_Buku, ' | ', koleksi.tab[i].Judul_Buku, ' | ', koleksi.tab[i].Author);
					ada := true;
				end;
			end;
		end else if (op = '<') then
		begin
			for i := 1 to koleksi.neff do
			begin
				if(koleksi.tab[i].Tahun_Penerbit < yr) then
				begin
					writeln(koleksi.tab[i].ID_Buku, ' | ', koleksi.tab[i].Judul_Buku, ' | ', koleksi.tab[i].Author);
					ada := true;
				end;
			end;
		end else if (op = '=') then
		begin
			for i := 1 to koleksi.neff do
			begin
				if(koleksi.tab[i].Tahun_Penerbit = yr) then
				begin
					writeln(koleksi.tab[i].ID_Buku, ' | ', koleksi.tab[i].Judul_Buku, ' | ', koleksi.tab[i].Author);
					ada := true;
				end;
			end;
		end else if (op = '<=') then
		begin
			for i := 1 to koleksi.neff do
			begin
				if(koleksi.tab[i].Tahun_Penerbit <= yr) then
				begin
					writeln(koleksi.tab[i].ID_Buku, ' | ', koleksi.tab[i].Judul_Buku, ' | ', koleksi.tab[i].Author);
					ada := true;
				end;
			end;
		end else
		begin
			for i := 1 to koleksi.neff do
			begin
				if(koleksi.tab[i].Tahun_Penerbit >= yr) then
				begin
					writeln(koleksi.tab[i].ID_Buku, ' | ', koleksi.tab[i].Judul_Buku, ' | ', koleksi.tab[i].Author);
					ada := true;
				end;
			end;
		end;

		if not (ada) then //jika buku yang dicari tidak ada, 'ada' akan false
		begin
			writeln('Tidak ada buku dalam kategori ini');
		end;
	end;
end .