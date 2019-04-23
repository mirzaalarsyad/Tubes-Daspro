unit coba; //unit dengan beberapa prosedur dan function, yaitu extractstring, IntToStr,dan StrToInt
interface
procedure ExtractStrings(var Str: string; var limiter :char; var ArrString : array of String);
Function IntToStr (I : Integer) : String;
function StrToInt(var s: string): Integer;
implementation
procedure ExtractStrings(var Str: string; var limiter :char; var ArrString : array of String);
	var
  	strtemp:string; // string temporary (yang sudah terpisah untuk dimasukkan pada string of array)
  	Arr: array of Char; // array char dari string
  	i: Integer; // index char
  	istring:Integer; // index bagian2 string
  	Len: Integer; // panjang string
	begin
	strtemp:=''; // diawali string temporary kosong
	istring:=0; // diawali index string 0
  	Len := Length(Str); // mengembil nilai panjang string
  	SetLength(arr, Len); // menentukan nilai array
  	for i :=1  to Len do // perulangan mengisi array char dari string
  	Arr[i - 1] := Str[i];      	
	 for i := 0 to Len-1 do // perulangan memisahkan string menjadi beberapa string
	  	begin
	  		if(Arr[i]<>limiter) then //mengecek apakah char merupakan limiter atau bukan
	  		begin
	  		strtemp:=strtemp+Arr[i]; // jika bukan, maka akan dimasukkan ke strtemp
	  		end else
	  		begin
	  		ArrString[istring]:=strtemp; // jika benar, maka strtemp akan dimasukkan ke string
	  		istring:=istring+1; //index string bertambah
	  		strtemp:='';	//strtemp reset menjadi kosong
	  		end;
	  	end; 
	ArrString[istring]:=strtemp; // perrtambahan dari string terakhir yang tidak diakhiri limiter
	istring:=istring+1;
	end;
Function IntToStr (I : Integer) : String; //mengubah integer menjadi string
	Var S : String;
	begin
 	Str (I,S);
 	IntToStr:=S;
	end;
function StrToInt(var s: string): Integer; //mengubah string menjadi integer;
	Var I : Integer;
	begin
 	Val (S,I);
 	StrToInt:=I;
	end;
	
end.




	
