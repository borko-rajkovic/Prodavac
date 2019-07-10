unit Enkripcija;

interface

uses SysUtils;

function Enkript(s:string):string;
function Dekript(s:string):string;

implementation

function Enkript(s:string):string;
var
  n:string;
  i,k:integer;
begin
  n:='';
  for i := 1 to length(s) do
  begin
      k:=Integer(s[i]);
      Inc(k);
      n:=n+Chr(k);
  end;
  Result := n;
end;

function Dekript(s:string):string;
var
  n:string;
  i,k:integer;
begin
  n:='';
  for i := 1 to length(s) do
  begin
      k:=Integer(s[i]);
      Dec(k);
      n:=n+Chr(k);
  end;
  Result := n;
end;

end.

