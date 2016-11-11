unit LibFormUtil;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls;

procedure ActivateControl(Form: TForm; Ctrl: TWinControl);
function FindFirstChild(Parent: TWinControl): TWinControl;



implementation


function FindFirstChild(Parent: TWinControl): TWinControl;
var
  chIdx: Cardinal;
begin
  result := NIL;
  for chIdx := 0 to Parent.ControlCount - 1 do begin
    if Parent.Controls[chIdx] is TWinControl then begin
      result := (Parent.Controls[0] as TWinControl);
      Exit;
    end;
  end;
end;


procedure ActivateControl(Form: TForm; Ctrl: TWinControl);
begin
  if Form.ActiveControl <> Ctrl Then Form.ActiveControl := Ctrl;
end;



end.

