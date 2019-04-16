unit tubes_f01f02; //unit menyimpan fungsi login dan registrasi, (f01 dan f02)
interface
	uses blowfish; //unit algoritma enkripsi blowfish
	type
	pengguna = record
			nama  : string; // nama user
			addr  : string; // alamat user
			usrNm : string; // username
			pw	  : string; // password
			role  : string; // role, admin atau pengunjung
			end;
	tabUsr = array [1..10000] of pengguna;

	
	procedure Login(var dataUsr : tabUsr; var Neff : integer; var isAdmin: boolean);
	//prosedur menjalankan login dan kemudian memeriksa role pengguna
	procedure Register(var dataUsr : tabUsr; var Neff : integer);
	//prosedur menjalankan registrasi yang akan dijalankan jika isAdmin pada prosedur login bernilai true

implementation                                                  

	procedure Login(var dataUsr : tabUsr; var Neff : integer; var isAdmin: boolean);
	var
		cek : boolean; //untuk validasi masukan username
		user: pengguna;
		i   : integer;
		ada : boolean; //jika username/pass benar, ada bernilai true
	begin	
		cek := true; //jika cek false, input sudah benar
		while (cek) do
		begin
			isAdmin := false;
			writeln('Login ke Akun Perpustakaan Ba Sing Tse');
			write('Masukkan username: '); // Login
			readln(user.usrNm);
			write('Masukkan password: ');
			readln(user.pw);
			i := 1;
			ada := false;

			while not (ada) and (i <= Neff) do // validasi input
			begin
				if(user.usrNm = dataUsr[i].usrNm) and (user.pw = dataUsr[i].pw) then
				begin
					if(dataUsr[i].role = 'Admin') then
					begin
						isAdmin := true;
					end;
					ada := true; //keluar dari while
				end;
				i := i+1;
			end;

			if(ada) then
			begin
				writeln();
				writeln('Selamat datang ', dataUsr[i].nama);
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

	procedure Register(var dataUsr : tabUsr; var Neff : integer);
	var
		user: pengguna;
	begin
		write('Masukkan nama pengunjung: ');	// Registrasi
		readln(user.nama);
		write('Masukkan alamat pengunjung: ');
		readln(user.addr);
		write('Masukkan username pengunjung: ');	
		readln(user.usrNm);
		write('Masukkan password pengunjung: ');
		readln(user.pw);
		user.role := 'Visitor';
		dataUsr[Neff+1] := user; // data pertama setelah nilai efektif atau jumlah pengguna
		Neff:=Neff+1;
		writeln();
		writeln('Pengunjung ', user.nama, ' berhasil terdaftar sebagai user.');
		writeln();
	end;
end .