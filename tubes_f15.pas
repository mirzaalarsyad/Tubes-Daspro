unit tubes_f15;
interface
uses tubes_datatypes;
procedure CariAnggota(var tUser: tabUser);
implementation
procedure CariAnggota(var tUser: tabUser);
	var
	username	: String;
	i,ifound	: Integer;
	found		: Boolean;
	begin
		write('masukkan username: '); readln(username);
		found:=false;//awal bermula dengan tidak ditemukan
		for i:=1 to tUser.neff Do //perulangan dari awal hingga akhir
			if (username=tUser.tab[i].Username) then //jika sama, maka found akan sama, sehingga menghasilkan nilai found menjadi true, dan mengetahui indeks dimana username sama;
				begin
					found:=true;
					ifound:=i;	
				end;
		if(found) then 
			begin
				writeln ('Nama Anggota: ',tUser.tab[ifound].Nama);
				writeln ('Alamat anggota: ',tUser.tab[ifound].Alamat);
			end else writeln ('Anggota tidak ditemukan');
	end;

end.