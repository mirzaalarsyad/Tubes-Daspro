unit tubes_f09f10;
interface
	uses  tubes_datatypes;
	procedure addBook(var koleksi : tabBuku);
	// tambah buku ke perpustakaan
	procedure addNumBook(var koleksi : tabBuku);
	// tambah jumlah buku

implementation
	procedure addBook(var koleksi : tabBuku);
	var
		input : buku;
	begin
		writeln('Masukkan Informasi buku yang ditambahkan:');
		write('Masukkan id buku:');
		readln(input.ID_Buku);
		write('Masukkan judul buku:');
		readln(input.Judul_Buku);
		write('Masukkan pengarang buku:');
		readln(input.Author);
		write('Masukkan jumlah buku:');
		readln(input.Jumlah_Buku);
		write('Masukkan tahun terbit buku:');
		readln(input.Tahun_Penerbit);
		write('Masukkan kategori buku:');
		readln(input.Kategori);
		koleksi.tab[koleksi.neff] := input;
		writeln();
		writeln('Buku berhasil ditambahkan ke dalam sistem!');
	end;

	procedure addNumBook(var koleksi : tabBuku);
	var
		input : buku;
		i 	  : integer;
		cek   : boolean;
	begin
		write('Masukkan ID Buku:');
		readln(input.ID_Buku);
		write('Masukkan jumlah buku yang ditambahkan:');
		readln(input.Jumlah_Buku);
		cek := false;
		i := 0;
		repeat
			i := i+1;
		until (i = koleksi.neff) or (koleksi.tab[i].ID_Buku = input.ID_buku);
		koleksi.tab[i].Jumlah_Buku := koleksi.tab[i].Jumlah_Buku + input.Jumlah_Buku;
	end;
end .