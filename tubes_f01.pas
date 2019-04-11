program tubes;

type
	pengguna = record
			nama  : string; // nama user
			addr  : string; // alamat user
			usrNm : string; // username
			pw	  : string; // password
	end;

var
	user 	: pengguna;
	data 	: array [1..1000] of pengguna;
	Neff 	: integer; //Jumlah pengguna yang tersimpan dalam array data (nilai efektif)
	inp		: integer;
	ada, cek: boolean;	// 'ada' untuk memvalidasi input username dan password, cek untuk pengulangan login
	i    	: integer;

begin
	Neff := 0;
	inp := 0;
	cek := true;
	while not (inp = 3) do
	begin
		writeln('Selamat Datang di Perpustakaan Ba Sing Tse!');
		writeln('Menu utama:');
		writeln('1. Registrasi Akun');
		writeln('2. Login');
		readln(inp);
		if (inp = 1) then
		begin
			write('Masukkan nama pengunjung: ');	// Registrasi
			readln(user.nama);
			write('Masukkan alamat pengunjung: ');
			readln(user.addr);
			write('Masukkan username pengunjung: ');	
			readln(user.usrNm);
			write('Masukkan password pengunjung: ');
			readln(user.pw);
			data[Neff+1] := user; // data pertama setelah nilai efektif atau jumlah pengguna
			Neff:=Neff+1;
			writeln();
			writeln('Pengunjung ', user.nama, ' berhasil terdaftar sebagai user.');
			writeln();
		end else
		begin
			while (cek) do
			begin
				write('Masukkan username: '); // Login
				readln(user.usrNm);
				write('Masukkan password: ');
				readln(user.pw);
				i := 1;
				ada := false;
				while not (ada) and (i = Neff) do // validasi input
				begin
					if(user.usrNm = data[i].usrNm) and (user.pw = data[i].pw) then
					begin
						ada := true;
					end;
					i := i+1;
				end;
				if(ada) then
				begin
					writeln();
					writeln('Selamat datang ', user.nama);
					writeln();
					cek := false; // keluar dari loop
				end else
				begin
					writeln();
					writeln('Username / Password salah! Silahkan coba lagi!');
					writeln();
				end;
			end;
		end;	
	end;
end .

