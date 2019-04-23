unit tubes_datatypes;

interface

const
		arrMin=1;
		arrMax=9999;
type
	tanggal = record
		hari 	: integer;
		bulan 	: integer;
		tahun 	: integer;
	end;
	
	buku = record
		ID_Buku			: Integer;
		Judul_Buku		: string;
		Author 			: string;
		Jumlah_Buku 	: Integer;
		Tahun_Penerbit 	: Integer;
		Kategori 		: string;
	end;
	
	tabBuku = record
		tab 	: array [arrMin..arrMax] of buku;
		neff 	: integer;
	end;

	user = record
		Nama 				: string;
		Alamat 				: string;
		Username 			: string;
		Password 			: string;
		Role 				: string;
	end;
	
	tabUSer = record
		tab 	: array [arrMin..arrMax] of user;
		neff 	: integer;
	end;
	
	HistoryPeminjaman = record
		Username 			: string;
		ID_Buku 			: integer;
		Tanggal_Peminjaman 	: tanggal;
		Tanggal_Batas 		: tanggal;
		Status_Pengembalian : Boolean;
	end;
	
	tabHistoryPeminjaman = record
		tab 	: array [arrMin..arrMax] of HistoryPeminjaman;
		neff 	: integer;
	end;

	HistoryPengembalian = record
		Username 			: string;
		ID_Buku 			: integer;
		Tanggal_Pengembalian: tanggal;
	end;
	
	tabHistoryPengembalian = record
		tab 	: array [arrMin..arrMax] of HistoryPengembalian;
		neff 	: integer;
	end;
	
	laporanBukuHilang = record
		Username 			: string;
		ID_Buku 			: integer;
		Tanggal_Pelaporan 	: tanggal;
	end;
	
	tablaporanBukuHilang = record
		tab 	: array [arrMin..arrMax] of laporanBukuHilang;
		neff 	: integer;
	end;

implementation

	
end.