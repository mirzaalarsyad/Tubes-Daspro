unit tubes_f15;
interface
uses tubes_datatypes, tubes_f01f02;
procedure CariAnggota(var tUser: tabUsr; var Nef: integer);
implementation
procedure CariAnggota(var tUser: tabUsr; var Nef: integer);
	var
	username	: String;
	i,ifound	: Integer;
	found		: Boolean;
	begin
		write('masukkan username: '); readln(username);
		username := '"'+username+'"';
		found:=false;//awal bermula dengan tidak ditemukan
		for i:=1 to Nef Do //perulangan dari awal hingga akhir
			if (username=tUser[i].usrNm) then //jika sama, maka found akan sama, sehingga menghasilkan nilai found menjadi true, dan mengetahui indeks dimana username sama;
				begin
					found:=true;
					ifound:=i;	
				end;
		if(found) then 
			begin
				writeln ('Nama Anggota: ',tUser[ifound].nama);
				writeln ('Alamat anggota: ',tUser[ifound].addr);
			end else writeln ('Anggota tidak ditemukan');
	end;

end.