unit Uconexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.IBBase, Dialogs ;

type
  Tconecxao = class
   private
     FUsuario: String;
     FSenha:string;
     FServidor: string;
     FPorta: Integer;
     fDataBase: String;
     FCharacterSet: String;
     FDConnection: TFDConnection;
     FDTransaction: TFDTransaction;
     procedure CarregarIni;
     procedure IniciarConexao;
   public
     constructor Create;
     procedure CarregarParemtrosDeConexao;
     property Connection : TFDConnection read FDConnection write FDConnection;
  end;

implementation
uses
  System.IOUtils, System.IniFiles;

{ Tconecxao }

procedure Tconecxao.CarregarIni;
var
  IniFile: TIniFile;
begin
   inherited Create;
   IniciarConexao;
   try
     if TFile.Exists('D:\Sistema Clientes\config\database.ini') then
     begin
       try
         IniFile := TIniFile.Create('D:\Sistema Clientes\config\database.ini');
         fDataBase := IniFile.ReadString('DATABASE', 'Path', '');
         FUsuario := IniFile.ReadString('DATABASE', 'User', '');
         FSenha :=  IniFile.ReadString('DATABASE', 'Password', '');
         FServidor := IniFile.ReadString('DATABASE', 'Server', '');
         FPorta := IniFile.ReadInteger('DATABASE', 'Port', 0);
         FCharacterSet := IniFile.ReadString('DATABASE', 'CharacterSet', '');
       finally
         FreeAndNil(IniFile);
       end;
     end;
   Except
     on E: Exception do
     begin
        MessageDlg('Conexão do banco de dados falhou!'+ E.Message, TMsgDlgType.mtError,[TMsgDlgBtn.mbOK],0 );
     end;

   end;

end;

procedure Tconecxao.CarregarParemtrosDeConexao;
begin
  FDConnection.LoginPrompt := False;
  FDConnection.DriverName :='FB';
  FDConnection.Params.DriverID := 'FB';
  FDConnection.Params.Database := fDataBase;
  FDConnection.Params.UserName := FUsuario;
  FDConnection.Params.Password := FSenha;
  FDConnection.Params.Add('Server= localhost');
  FDConnection.Params.Add('Port=' + IntToStr(FPorta));
  FDConnection.Params.Add('CharacterSet=UTF8');
  FDConnection.Params.Add('Protocol=TCPIP');
  FDConnection.Transaction := FDTransaction;
  FDTransaction.Connection := FDConnection;
  FDConnection.Connected := true;
end;

constructor Tconecxao.Create;
begin
  CarregarIni;
end;


procedure Tconecxao.IniciarConexao;
begin
  FDConnection := TFDConnection.Create(nil);
  FDTransaction := TFDTransaction.Create(nil);
  FDConnection.Connected := false;
end;

end.
