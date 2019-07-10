unit uRegistry;

interface

uses
  System.Win.Registry,Winapi.Windows;

const
  reg_key = 'Software\Microsoft\Windows NT\CurrentVersion\Network\ProductionSoftware\ProdSWprdv1\';

  procedure RegistryDelete();
  procedure RegistryWrite(reg_string,string_value:string);
  function RegistryRead(read_string:string):string;
  function RegistryCheckKey():boolean;
  function RegistryCheckString(reg_string:string):boolean;

implementation

{$Region 'Registry funkcije'}

procedure RegistryWrite(reg_string,string_value:string);
var
  reg        : TRegistry;
begin
  reg := TRegistry.Create(KEY_READ OR KEY_WRITE OR KEY_WOW64_64KEY);
  reg.RootKey := HKEY_CURRENT_USER;
  reg.OpenKey(reg_key,True);

  reg.WriteString(reg_string, string_value);

  reg.CloseKey();
  reg.Free;
end;

function RegistryCheckKey():boolean;
var
  reg        : TRegistry;
begin
  reg := TRegistry.Create(KEY_READ OR KEY_WRITE OR KEY_WOW64_64KEY);
  reg.RootKey := HKEY_CURRENT_USER;

  Result := reg.KeyExists(reg_key);

  reg.CloseKey();
  reg.Free;
end;

function RegistryCheckString(reg_string:string):boolean;
var
  reg        : TRegistry;
begin
  reg := TRegistry.Create(KEY_READ OR KEY_WRITE OR KEY_WOW64_64KEY);
  reg.RootKey := HKEY_CURRENT_USER;

  Result := False;

  if (reg.KeyExists(reg_key)) then
    begin
      reg.Access := KEY_READ;
      reg.OpenKey(reg_key,True);
      if reg.ValueExists(reg_string) then
        Result := True;
    end;
  reg.CloseKey();
  reg.Free;

end;

function RegistryRead(read_string:string):string;
var
  reg: TRegistry;
  retval: string;
begin
  retval := '';

  reg := TRegistry.Create(KEY_READ OR KEY_WRITE OR KEY_WOW64_64KEY);
  reg.RootKey := HKEY_CURRENT_USER;

  if (reg.KeyExists(reg_key)) then
    begin
      reg.Access := KEY_READ;
      reg.OpenKey(reg_key,True);
      if reg.ValueExists(read_string) then
        retval := reg.ReadString(read_string);
    end;
  reg.CloseKey();
  reg.Free;

  Result := retval;
end;

procedure RegistryDelete();
var
  reg : TRegistry;
begin
  reg := TRegistry.Create(KEY_READ OR KEY_WRITE OR KEY_WOW64_64KEY);
  reg.RootKey := HKEY_CURRENT_USER;
  if (reg.KeyExists(reg_key)) then
  begin
    reg.DeleteKey(reg_key);
  end;
  reg.CloseKey();
  reg.Free;
end;

{$EndRegion}

end.
