unit LibStringUtil;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

procedure SortStrings(strs: TStrings);



implementation


procedure SortStrings(strs: TStrings);
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  sl.Text := strs.Text;
  sl.Sort;
  strs.Text := sl.Text;
  sl.Free;
end;




end.

