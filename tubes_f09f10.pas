unit tubes_f09f10;
interface
	uses  tubes_f03f04;
	type
		tabBook = tubes_f03f04.tabBook;
		buku = tubes_f03f04.buku;

	procedure addBook(var koleksi : tabBook; Neff: integer);
	// tambah buku ke perpustakaan
	procedure addNumBook(var koleksi : tabBook; Neff: integer);
	// tambah jumlah buku

implementation
	procedure addBook(var koleksi : tabBook; Neff : integer);
	var
		input : buku;
	begin
		writeln('Masukkan Informasi buku yang ditambahkan:');
		write('Masukkan id buku:');
		readln(input.id);
		write('Masukkan judul buku:');
		readln(input.judul);
		write('Masukkan pengarang buku:');
		readln(input.auth);
		write('Masukkan jumlah buku:');
		readln(input.jml);
		write('Masukkan tahun terbit buku:');
		readln(input.thn);
		write('Masukkan kategori buku:');
		readln(input.ktg);
		koleksi[Neff+1] := input;
		writeln();
		writeln('Buku berhasil ditambahkan ke dalam sistem!');
	end;

	procedure addNumBook(var koleksi : tabBook; Neff : integer);
	var
		input : buku;
		i 	  : integer;
		cek   : boolean;
	begin
		write('Masukkan ID Buku:');
		readln(input.id);
		write('Masukkan jumlah buku yang ditambahkan:');
		readln(input.jml);
		cek := false;
		i := 0;
		repeat
			i := i+1;
		until (i = Neff) or (koleksi[i].id = input.id);
		koleksi[i].jml := koleksi[i].jml + input.jml;
	end;
end .