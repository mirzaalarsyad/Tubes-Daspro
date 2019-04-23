unit tubes_f01f02; //unit menyimpan fungsi login dan registrasi, (f01 dan f02)

interface
	uses uCSV; //unit algoritma untuk pengolahan csv
	
	type
		pengguna = record
			nama  : string; // nama user
			addr  : string; // alamat user
			usrNm : string; // username
			pw	  : string; // password
			role  : string; // role, admin atau pengunjung
			end;
		tabUsr = array [1..10000] of pengguna;

	
	procedure InitTabUsr(var dataUsr : tabUsr; var Neff : integer; var fileName : string);
	//inisiasi array
	function Encrypt(var pw: string): string;
	//Enkripsi password
	procedure Login(var dataUsr : tabUsr; var Neff : integer; var isAdmin: boolean);
	//prosedur menjalankan login dan kemudian memeriksa role pengguna
	procedure Register(var dataUsr : tabUsr; var Neff : integer);
	//prosedur menjalankan registrasi yang akan dijalankan jika isAdmin pada prosedur login bernilai true

implementation                                                  

	procedure InitTabUsr(var dataUsr : tabUsr; var Neff : integer; var fileName : string);
	var
		f    	: text;
		s, cc	: string;
		i,j,k,l : integer;
	begin
		assign(f, fileName);
		reset(f);
		Neff := sizeData(fileName) - 1;

		j:= 0;
		for i:= 1 to sizeData(fileName) do
		begin
			//data pada baris ke-i
			while j <> i do
			begin
				readln(f);
				j:= j+1;
			end;
			read(f, cc);

			//data persel pada baris ke-i
			k:= 1;
			for l:= 1 to 5 do
			begin
				s:= '';
				while(cc[k] <> ',') and (k <= length(cc)) do
				begin
					s:= s + cc[k];
					k:= k + 1;
				end;

				case l of
					1 : dataUsr[i-1].nama   := s;
					2 : dataUsr[i-1].addr	:= s;
					3 : dataUsr[i-1].usrNm  := s;
					4 : dataUsr[i-1].pw     := s;
					5 : dataUsr[i-1].role   := s;
				end;
				k:= k+1;
			end;
		end;
		close(f);
	end;

	function Encrypt(var pw: string) : string; 
	var
		encryptedPw: string;
		i, j: integer;
	begin
		j:= 1;
		for i:= 1 to length(pw) do
		begin
			j:= j*j + ord(pw[i]);
		end;
		str(j, encryptedPw);
		Encrypt:= encryptedPw;
	end;

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
				if(user.usrNm = dataUsr[i].usrNm) and (Encrypt(user.pw) = dataUsr[i].pw) then
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
				writeln('Selamat datang ', dataUsr[i-1].nama); //i terakhir menghasilkan nilai yang lebih sebanyak satu
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
		user.pw := Encrypt(user.pw);
		user.role := 'Visitor';
		dataUsr[Neff+1] := user; // data pertama setelah nilai efektif atau jumlah pengguna
		Neff:=Neff+1;
		writeln();
		writeln('Pengunjung ', user.nama, ' berhasil terdaftar sebagai user.');
		writeln();
	end;
end .