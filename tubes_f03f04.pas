unit tubes_f03f04; //unit menyimpan fungsi dan prosedur untuk pencarian buku (f03 dan f04)
interface
	type
		buku = record
				id	 : integer; // ID Buku
				judul: string;  // Judul Buku
				auth : string;  // penulis (author) buku
				ktg	 : string;  // Kategoti buku
				thn  : integer; // Tahun terbit
				end;
	
	procedure searchCat (var koleksi : array of buku; var Neff : integer);
	// Prosedur pencarian berdasarkan kategori buku
	procedure searchYr (var koleksi : array of buku; var Neff : integer);
	// Prosedur pencarian berdasarkan tahun penerbitan buku

implementation
	procedure searchCat (var koleksi : array of buku; var Neff : integer);
	var
		i   : integer;
		ada : boolean; //ada atau tidaknya kategori yang tersedia
		katg: string; //kategori input
	begin
		repeat
			ada := false;
			write('Masukkan kategori: ');
			readln(katg);
			if (katg = 'sastra') or (katg = 'sains') or (katg = 'manga') or (katg = 'sejarah') or (katg = 'programming') then
			begin
				for i := 1 to Neff do
				begin
					if(koleksi[i].ktg = katg) then
					begin
						writeln(koleksi[i].id, ' | ', koleksi[i].judul, ' | ', koleksi[i].auth);
						ada := true;
					end;
				end;
				if not (ada) then
				begin
					writeln('Hasil pencarian:');
					writeln('Tidak ada buku dalam kategori ini.');
				end;
			end else
			begin
				writeln('Kategori ', katg, ' tidak valid.');
			end;
		until (katg = 'sastra') or (katg = 'sains') or (katg = 'manga') or (katg = 'sejarah') or (katg = 'programming');
	end;

	procedure searchYr (var koleksi : array of buku; var Neff : integer);
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
			for i := 1 to Neff do
			begin
				if(koleksi[i].thn > yr) then
				begin
					writeln(koleksi[i].id, ' | ', koleksi[i].judul, ' | ', koleksi[i].auth);
					ada := true;
				end;
			end;
		end else if (op = '<') then
		begin
			for i := 1 to Neff do
			begin
				if(koleksi[i].thn < yr) then
				begin
					writeln(koleksi[i].id, ' | ', koleksi[i].judul, ' | ', koleksi[i].auth);
					ada := true;
				end;
			end;
		end else if (op = '=') then
		begin
			for i := 1 to Neff do
			begin
				if(koleksi[i].thn = yr) then
				begin
					writeln(koleksi[i].id, ' | ', koleksi[i].judul, ' | ', koleksi[i].auth);
					ada := true;
				end;
			end;
		end else if (op = '<=') then
		begin
			for i := 1 to Neff do
			begin
				if(koleksi[i].thn <= yr) then
				begin
					writeln(koleksi[i].id, ' | ', koleksi[i].judul, ' | ', koleksi[i].auth);
					ada := true;
				end;
			end;
		end else
		begin
			for i := 1 to Neff do
			begin
				if(koleksi[i].thn >= yr) then
				begin
					writeln(koleksi[i].id, ' | ', koleksi[i].judul, ' | ', koleksi[i].auth);
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