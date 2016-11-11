unit WinMain_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, StdCtrls, ExtCtrls;

type

  { TWinMain }

  TWinMain = class(TForm)
    BtnSortVars: TButton;
    EdtScript: TMemo;
    GrpVars: TGroupBox;
    EdtVars: TMemo;
    GrpScript: TGroupBox;
    LstInternalCfg: TListBox;
    TmrPanic: TTimer;
    procedure BtnSortVarsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActivateFirstChild(Sender: TObject);
    procedure TmrPanicTimer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  WinMain: TWinMain;

implementation

uses LibStringUtil, LibFormUtil;

{$R *.lfm}

{ TWinMain }


procedure ReadAppVars(vars: TStrings);
var
  idx, AppNameLen: Cardinal;
  BinNameOrig, BinNameFext, BinNameNoFext: String;
begin
  AppNameLen := Length(Application.ExeName);
  vars.Add('bin.path=' + Application.ExeName);

  idx := LastDelimiter('/\', Application.ExeName);
  vars.Add('bin.dir=' + Copy(Application.ExeName, 0, idx - 1));
  BinNameOrig := Copy(Application.ExeName, idx + 1, AppNameLen) + '.Bin';
  vars.Add('bin.name=' + BinNameOrig);
  vars.Add('bin.name.lc=' + LowerCase(BinNameOrig));
  idx := LastDelimiter('.', BinNameOrig);
  if idx > 0 then begin
    BinNameNoFext := Copy(BinNameOrig, 0, idx - 1);
    BinNameFext := Copy(BinNameOrig, idx, AppNameLen);
  end else begin
    BinNameNoFext := BinNameOrig;
    BinNameFext := '';
  end;
  vars.Add('bin.name.base=' + BinNameNoFext);
  vars.Add('bin.name.base.lc=' + LowerCase(BinNameNoFext));
  vars.Add('bin.name.ext=' + BinNameFext);
  vars.Add('bin.name.ext.lc=' + LowerCase(BinNameFext));

  vars.Add('app.argc=' + IntToStr(Application.ParamCount));
  for idx := 1 to Application.ParamCount do begin
    vars.Add('app.argv.' + IntToStr(idx) + '=' + Application.Params[idx - 1]);
  end;
end;

procedure ReadAppScripts(dest: TStrings);
var
  ExeFh: Text;
  NxChr: Char;
  LnBuf: String;
begin
  Assign(ExeFh, Application.ExeName);
  Reset(ExeFh);
  while not EoF(ExeFh) do begin
    Read(ExeFh, NxChr);
  end;
  Close(ExeFh);
end;

procedure TWinMain.FormCreate(Sender: TObject);
begin
  WinMain.Caption := Application.Title;
  WinMain.Height := (Screen.Height * 70) div 100;
  GrpVars.Height := WinMain.ClientHeight div 2;
  GrpScript.Align := alClient;

  ReadAppVars(EdtVars.Lines);
  BtnSortVarsClick(NIL);
end;

procedure TWinMain.ActivateFirstChild(Sender: TObject);
begin
  LibFormUtil.ActivateControl(WinMain, LibFormUtil.FindFirstChild(
    Sender as TWinControl));
end;

procedure TWinMain.BtnSortVarsClick(Sender: TObject);
begin
  LibStringUtil.SortStrings(EdtVars.Lines);
end;

procedure TWinMain.TmrPanicTimer(Sender: TObject);
begin
  TmrPanic.Enabled := False;
  WinMain.Show;
  // ShowMessage('Timeout while executing launch script.');
end;

end.

