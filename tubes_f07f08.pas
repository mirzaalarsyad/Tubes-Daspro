unit tubes_f07f08;
// author : M Mirza Fathan Al Arsyad
interface
uses tubes_datatypes, coba;

	procedure laporHilang(var user : string; var tabHilang: tablaporanBukuHilang);
	procedure lihatLaporan(var tabHilang : tablaporanBukuHilang; var tabBook : tabBuku);

implementation

	procedure laporHilang(var user : string; var tabHilang: tablaporanBukuHilang);
	var
		idBuku 		: integer;
		judul  		: string;
		temp	    : tanggal;
		inTgl  		: string; // tanggal yang di input
	begin
		write('Masukkan id buku: ');
		readln(idBuku);
		write('Masukkan judul buku: ');
		readln(judul);
		write('Masukkan tanggal pelaporan: ');
		readln(inTgl);

		//ubah string ke type bentukan tanggal
		temp := tabHilang.tab[tabHilang.neff + 1].Tanggal_Pelaporan;
		temp.hari := 0; temp.bulan := 0; temp.tahun := 0;
		temp.hari := 10*CharToInt(inTgl[1]) + CharToInt(inTgl[2]);
		temp.bulan := 10*CharToInt(inTgl[4]) + CharToInt(inTgl[5]);
		temp.tahun := 1000*CharToInt(inTgl[7]) + 100*CharToInt(inTgl[8]) + 10*CharToInt(inTgl[9]) + CharToInt(inTgl[10]);

		tabHilang.tab[tabHilang.neff + 1].Username := user;
		tabHilang.tab[tabHilang.neff + 1].ID_Buku  := idBuku;
		
		writeln('Laporan berhasil diterima');
	end;

	procedure lihatLaporan(var tabHilang : tablaporanBukuHilang; var tabBook : tabBuku);
	var
		i : integer;
		j : integer;
		d : tanggal;
	begin
		writeln('Buku yang hilang :');
		for i:=1 to tabHilang.neff do
		begin
			write(tabHilang.tab[i].ID_Buku, ' | ');
			for j:=1 to tabBook.neff do
			begin
				if(tabBook.tab[j].ID_Buku = tabHilang.tab[i].ID_Buku) then
				begin
					write(tabBook.tab[j].Judul_Buku, ' | ');
				end;
			end;
			d := tabHilang.tab[i].Tanggal_Pelaporan;
			writeln(d.hari, '/', d.bulan, '/', d.tahun);
		end;
	end;
end .