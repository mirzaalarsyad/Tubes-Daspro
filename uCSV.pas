unit uCSV;

interface
	function sizeData(fileName : string) : integer;

implementation
	function sizeData(fileName : string) : integer;

	var
		int: integer;
		txt: text;

	begin
		int:=0;
		assign(txt, fileName);

		reset(txt);
		while not eof(txt) do
		begin
			readln(txt);
			int:= int+1;
		end;

		close(txt);
		sizeData:= int;
	end;
end .