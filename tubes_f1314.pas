unit tubes_f1314; //unit ini mengandung prosedur loadcsv untuk menginput data csv ke array dan writecsv yang menuliskan data dari array ke csv
interface
uses tubes_f01f02, tubes_datatypes,coba;
procedure Loadcsv(
var	tBuku					: tabBuku;
var	tUser					: tubes_f01f02.tabUsr;
var	tHistoryPeminjaman		: tabHistoryPeminjaman;
var	tHistoryPengembalian	: tabHistoryPengembalian;
var	tlaporanBukuHilang		: tablaporanBukuHilang;
var Neff                    : integer);
procedure Writecsv(
var	tBuku					: tabBuku;
var	tUser					: tubes_f01f02.tabUsr;
var	tHistoryPeminjaman		: tabHistoryPeminjaman;
var	tHistoryPengembalian	: tabHistoryPengembalian;
var	tlaporanBukuHilang		: tablaporanBukuHilang;
var Neff:integer);


implementation

procedure Loadcsv(
	var	tBuku					: tabBuku;
	var	tUser					: tubes_f01f02.tabUsr;
	var	tHistoryPeminjaman		: tabHistoryPeminjaman;
	var	tHistoryPengembalian	: tabHistoryPengembalian;
	var	tlaporanBukuHilang		: tablaporanBukuHilang;
	var Neff: integer);

	var	
	namafile		 		: String; //nama file yang akan diload
	ctemp					: string; //string temporary yang digunakan untuk mengambil satu line csv
	List,TglList,TglList2	: array[0..10] of String; //array temporary untuk mengambil bagian2 dari csv yang dipisahkan oleh char comma
	filecsv 				: text; //file csv yang diload
	comma,slash				:Char; // ',' untuk penanda limiter csv dan '/' untuk penanda limiter tanggal
	
	begin
	comma:=','; //set comma
	slash:='/'; // set slash

	write('Masukkan nama File Buku : ');readln(namafile);
		assign(filecsv, namafile);
		reset(filecsv);
		tBuku.neff :=0;
		 		while (not(EOF(filecsv))) do
		 		begin
		 			tBuku.neff := tBuku.neff + 1;	
		 			readln(filecsv,ctemp);
  					ExtractStrings(ctemp,comma,List); //pemecahan string ctemps menjadi array, prosedur ada pada coba.pas
  					tBuku.tab[tBuku.neff].ID_Buku:= StrtoInt(List[0]); //pengisian array sesuai bagian, StrtoInt ada pada coba.pas
  					tBuku.tab[tBuku.neff].Judul_Buku:= (List[1]);
  					tBuku.tab[tBuku.neff].Author:= (List[2]);
  					tBuku.tab[tBuku.neff].Jumlah_Buku:= StrtoInt(List[3]);
  					tBuku.tab[tBuku.neff].Tahun_Penerbit:= StrtoInt(List[4]);
  					tBuku.tab[tBuku.neff].Kategori:= (List[5]);
		 		end; 			
		close(filecsv);
		//diulangi untuk file file selanjutnya//
	write('Masukkan nama File User : ');readln(namafile);
		assign(filecsv, namafile);
		reset(filecsv);
		Neff :=0;
		 		while (not(EOF(filecsv))) do
		 		begin
		 			Neff := Neff + 1;	
		 			readln(filecsv,ctemp);
  					ExtractStrings(ctemp,comma,List);
  					tUser[Neff].nama:= (List[0]);
  					tUser[Neff].addr:= (List[1]);
  					tUser[Neff].usrNm:= (List[2]);
  					tUser[Neff].pw:= (List[3]);
  					tUser[Neff].role:= (List[4]);
		 		end; 			
		close(filecsv);
	write('Masukkan nama File Peminjaman : ');readln(namafile);
		assign(filecsv, namafile);
		reset(filecsv);
		tHistoryPeminjaman.neff :=0;
		 		while (not(EOF(filecsv))) do
		 		begin
		 			tHistoryPeminjaman.neff := tHistoryPeminjaman.neff+1;	
		 			readln(filecsv,ctemp);
  					ExtractStrings(ctemp,comma,List);
  					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Username:= (List[0]);
  					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].ID_Buku := StrtoInt(List[1]); // StrToInt berfungsi untuk mengubah string menjadi integer agar dapat dimasukkan ke ID Buku
  						ExtractStrings(List[2],slash, TglList); //pemisahan tanggal, menjadi tiga string 
  					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Tanggal_Peminjaman.hari:= StrtoInt(TglList[0]);
  					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Tanggal_Peminjaman.bulan:= StrtoInt(TglList[1]);
  					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Tanggal_Peminjaman.tahun:= StrtoInt(TglList[2]); 
  						ExtractStrings(List[3],slash, TglList2); //pemisahan tanggal 2;
  					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Tanggal_Batas.hari:= StrtoInt(TglList2[0]);
  					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Tanggal_Batas.bulan:= StrtoInt(TglList2[1]);
  					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Tanggal_Batas.tahun:= StrtoInt(TglList2[2]); 
  					tHistoryPeminjaman.tab[tHistoryPeminjaman.neff].Status_Pengembalian:= (StrtoInt(List[4])=1);
		 		end; 			
		close(filecsv);
	write('Masukkan nama File Pengembalian : ');readln(namafile);
		assign(filecsv, namafile);
		reset(filecsv);
		tHistoryPengembalian.neff :=0;
		 		while (not(EOF(filecsv))) do
		 		begin
		 			tHistoryPengembalian.neff := tHistoryPengembalian.neff + 1;	
		 			readln(filecsv,ctemp);
  					ExtractStrings(ctemp,comma, List);
  					tHistoryPengembalian.tab[tHistoryPengembalian.neff].Username:= (List[0]);
  					tHistoryPengembalian.tab[tHistoryPengembalian.neff].ID_Buku := StrtoInt(List[1]);
  						ExtractStrings(List[2],slash, TglList); {Pemecahan dari string hh/bb/tt menjadi 3 bagian, dengan limiter '/', sc :https://stackoverflow.com/questions/2625707/split-a-string-into-an-array-of-strings-based-on-a-delimiter}
  					tHistoryPengembalian.tab[tHistoryPengembalian.neff].Tanggal_Pengembalian.hari:= StrtoInt(TglList[0]);
  					tHistoryPengembalian.tab[tHistoryPengembalian.neff].Tanggal_Pengembalian.bulan:= StrtoInt(TglList[1]);
  					tHistoryPengembalian.tab[tHistoryPengembalian.neff].Tanggal_Pengembalian.tahun:= StrtoInt(TglList[2]); 
		 		end; 			
		close(filecsv);
	write('Masukkan nama File Buku Hilang : ');readln(namafile);
		assign(filecsv, namafile);
		reset(filecsv);
		tlaporanBukuHilang.neff :=0;
		 		while (not(EOF(filecsv))) do
		 		begin
		 			tlaporanBukuHilang.neff := tlaporanBukuHilang.neff + 1;	
		 			readln(filecsv,ctemp);
  					ExtractStrings(ctemp,comma, List);
  					tlaporanBukuHilang.tab[tlaporanBukuHilang.neff].Username:= (List[0]);
  					tlaporanBukuHilang.tab[tlaporanBukuHilang.neff].ID_Buku := StrtoInt(List[1]);
  						ExtractStrings(List[2],slash, TglList);
  					tlaporanBukuHilang.tab[tlaporanBukuHilang.neff].Tanggal_Pelaporan.hari:= StrtoInt(TglList[0]);
  					tlaporanBukuHilang.tab[tlaporanBukuHilang.neff].Tanggal_Pelaporan.bulan:= StrtoInt(TglList[1]);
  					tlaporanBukuHilang.tab[tlaporanBukuHilang.neff].Tanggal_Pelaporan.tahun:= StrtoInt(TglList[2]); 
		 		end; 			
		close(filecsv);
	writeLN('Data perpustakaan berhasil dimuat');
		end;

procedure Writecsv(
	var	tBuku					: tabBuku;
	var	tUser					: tubes_f01f02.tabUsr;
	var	tHistoryPeminjaman		: tabHistoryPeminjaman;
	var	tHistoryPengembalian	: tabHistoryPengembalian;
	var	tlaporanBukuHilang		: tablaporanBukuHilang;
	var Neff                    : integer);
	
	var	
	namafile		 			: String; //nama fule yang di load 
	ctemps,tgl1,tgl2,boolcheck	: string; //string temporary yang akan digunakan, ctemps adalah string satu line csv, tgl1,tgl2 adalah string tanggal, dan boolcheck adalah string boolean
	filecsv 					: text; //file csv 
	i 							: Integer; // index

	begin
		write('Masukkan nama File Buku : ');readln(namafile);
			assign (filecsv, namafile);
			rewrite(filecsv);
			for i:=1 to tBuku.neff do
			begin
				ctemps:= IntToStr(tBuku.tab[i].ID_Buku) +','+ tBuku.tab[i].Judul_Buku +','+ tBuku.tab[i].Author +','+ IntToStr(tBuku.tab[i].Jumlah_Buku) +','+ IntToStr(tBuku.tab[i].Tahun_Penerbit) +','+ tBuku.tab[i].Kategori;
				//menjadikan ctemps sebagai string panjang yang terdiri dari isi array, yang dipisahkan oleh comma, yang akan dituliskan ke file csv;
				writeln(filecsv,ctemps);
			end;
		
			close (filecsv);
		write('Masukkan nama File User : ');readln(namafile);//diulang untuk file yang lain;
			assign (filecsv, namafile);
			rewrite(filecsv);
			for i:=1 to Neff do
			begin
				ctemps:= tUser[i].nama +','+ tUser[i].addr +','+ tUser[i].usrNm +','+ tUser[i].pw +','+ tUser[i].role;
				writeln(filecsv,ctemps);
			end;
		
			close (filecsv);
		write('Masukkan nama File Peminjaman : ');readln(namafile);
			assign (filecsv, namafile);
			rewrite(filecsv);
			for i:=1 to tHistoryPeminjaman.neff do
			begin
				if(tHistoryPeminjaman.tab[i].Tanggal_Peminjaman.hari<10) then tgl1:='0'+IntToStr(tHistoryPeminjaman.tab[i].Tanggal_Peminjaman.hari) else tgl1:=IntToStr(tHistoryPeminjaman.tab[i].Tanggal_Peminjaman.hari);
				if(tHistoryPeminjaman.tab[i].Tanggal_Peminjaman.bulan<10) then tgl1:=tgl1+'/'+'0'+IntToStr(tHistoryPeminjaman.tab[i].Tanggal_Peminjaman.bulan) else tgl1:=tgl1+'/'+IntToStr(tHistoryPeminjaman.tab[i].Tanggal_Peminjaman.bulan);
					tgl1:= tgl1+'/'+ IntToStr(tHistoryPeminjaman.tab[i].Tanggal_Peminjaman.tahun); // mengatur kembali tanggal untuk ditulis menjadi string
				if(tHistoryPeminjaman.tab[i].Tanggal_Batas.hari<10) then tgl2:='0'+IntToStr(tHistoryPeminjaman.tab[i].Tanggal_Batas.hari) else tgl2:=IntToStr(tHistoryPeminjaman.tab[i].Tanggal_Batas.hari);
				if(tHistoryPeminjaman.tab[i].Tanggal_Batas.bulan<10) then tgl2:=tgl2+'/'+'0'+IntToStr(tHistoryPeminjaman.tab[i].Tanggal_Batas.bulan) else tgl2:=tgl2+'/'+IntToStr(tHistoryPeminjaman.tab[i].Tanggal_Batas.bulan);
					tgl2:= tgl2+'/'+ IntToStr(tHistoryPeminjaman.tab[i].Tanggal_Batas.tahun);
				if(tHistoryPeminjaman.tab[i].Status_Pengembalian) then boolcheck:='1' else boolcheck:='0'; 
				ctemps:= tHistoryPeminjaman.tab[i].Username +','+ IntToStr(tHistoryPeminjaman.tab[i].ID_Buku) +','+ tgl1 +','+ tgl2 +','+ boolcheck;
				writeln(filecsv,ctemps);
			end;
		
			close (filecsv);
		write('Masukkan nama File Pengembalian: ');readln(namafile);
			assign (filecsv, namafile);
			rewrite(filecsv);
			for i:=1 to tHistoryPengembalian.neff do
			begin
				if(tHistoryPengembalian.tab[i].Tanggal_Pengembalian.hari<10) then tgl1:='0'+IntToStr(tHistoryPengembalian.tab[i].Tanggal_Pengembalian.hari) else tgl1:=IntToStr(tHistoryPengembalian.tab[i].Tanggal_Pengembalian.hari);
				if(tHistoryPengembalian.tab[i].Tanggal_Pengembalian.bulan<10) then tgl1:=tgl1+'/'+'0'+IntToStr(tHistoryPengembalian.tab[i].Tanggal_Pengembalian.bulan) else tgl1:=tgl1+'/'+IntToStr(tHistoryPengembalian.tab[i].Tanggal_Pengembalian.bulan);
					tgl1:= tgl1+'/'+ IntToStr(tHistoryPengembalian.tab[i].Tanggal_Pengembalian.tahun);
				ctemps:= tHistoryPengembalian.tab[i].Username +','+ IntToStr(tHistoryPengembalian.tab[i].ID_Buku) +','+ tgl1 ;
				writeln(filecsv,ctemps);
			end;
		
			close (filecsv);
		write('Masukkan nama File Buku Hilang: ');readln(namafile);
			assign (filecsv, namafile);
			rewrite(filecsv);
			for i:=1 to tlaporanBukuHilang.neff do
			begin
				if(tlaporanBukuHilang.tab[i].Tanggal_Pelaporan.hari<10) then tgl1:='0'+IntToStr(tlaporanBukuHilang.tab[i].Tanggal_Pelaporan.hari) else tgl1:=IntToStr(tlaporanBukuHilang.tab[i].Tanggal_Pelaporan.hari);
				if(tlaporanBukuHilang.tab[i].Tanggal_Pelaporan.bulan<10) then tgl1:=tgl1+'/'+'0'+IntToStr(tlaporanBukuHilang.tab[i].Tanggal_Pelaporan.bulan) else tgl1:=tgl1+'/'+IntToStr(tlaporanBukuHilang.tab[i].Tanggal_Pelaporan.bulan);
					tgl1:= tgl1+'/'+ IntToStr(tlaporanBukuHilang.tab[i].Tanggal_Pelaporan.tahun);
				ctemps:= tlaporanBukuHilang.tab[i].Username +','+ IntToStr(tlaporanBukuHilang.tab[i].ID_Buku) +','+ tgl1 ;
				writeln(filecsv,ctemps);
			end;
		
			close (filecsv)
	end;

end.