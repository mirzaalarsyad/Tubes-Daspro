unit tubes_f12;
interface
uses tubes_datatypes;
procedure Statistik(var tUser: tabUser; var tBuku:tabBuku);
implementation
procedure Statistik(var tUser: tabUser; var tBuku:tabBuku);
var
	i 					: Integer; //index
	adminCount			: Integer; // banyak admin,pengunjung, dan kategori buku	
	pengunjungCount		: Integer; 
	mangaCount			: Integer; 
	sejarahCount		: Integer;  
	programmingCount	: Integer;
	sainsCount			: Integer;
	sastraCount			: Integer;

begin
	adminCount:=0; pengunjungCount:=0; //permulaan awal jumlah =0;
	mangaCount:=0; sejarahCount:=0; programmingCount:=0; sainsCount:=0; sastraCount:=0; //permulaan awal jumlah =0;
	for i:=1 to tUser.neff Do //perulangan menghitung user
	begin
		case tUser.tab[i].Role of 	'Admin' : adminCount:=adminCount+1; //jika admin, maka nilai admin count akan bertambah, begitupulan dengan pengunjung dan kategori buku
								'Pengunjung' : pengunjungCount:=pengunjungCount+1;
								end;
	end;
	for i := 1 to tBuku.neff do
	begin
		case tBuku.tab[i].Kategori of 		'manga' 		: mangaCount:=mangaCount+1;
											'sejarah' 		: sejarahCount:=sejarahCount+1;
											'pemrograman'	: programmingCount:=programmingCount+1;
											'sains'			: sainsCount:=sainsCount+1;
											'sastra'		: sastraCount:=sastraCount+1;
		end;
	end;
	writeln('Pengguna:'); //menampilkan hasil penghitungan
	writeln('Admin 			| ',adminCount);
	writeln('Pengunjung 	| ',pengunjungCount);
	writeln('Total			|',adminCount+pengunjungCount);
	writeln('Buku:');
	writeln('sastra			|',sastraCount);
	writeln('sains 			|',sainsCount);
	writeln('manga  		|',mangaCount);
	writeln('sejarah 		|',sejarahCount);
	writeln('programming 	|',programmingCount);
	writeln('Total			|',sainsCount+sastraCount+mangaCount+sejarahCount+programmingCount);


end;
end.