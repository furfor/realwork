{
  $Project$
  $Workfile$
  $Revision: 1.3 $
  $DateUTC$
  $Id: IdMessageCoderXXE.pas,v 1.3 2015/06/16 12:31:45 lukyanets Exp $

  This file is part of the Indy (Internet Direct) project, and is offered
  under the dual-licensing agreement described on the Indy website.
  (http://www.indyproject.org/)

  Copyright:
   (c) 1993-2005, Chad Z. Hower and the Indy Pit Crew. All rights reserved.
}
{
  $Log: IdMessageCoderXXE.pas,v $
  Revision 1.3  2015/06/16 12:31:45  lukyanets
  ����� Indy 10

}
{
  Rev 1.2    2004.01.22 5:41:50 PM  czhower
  Fixed visibility

  Rev 1.1    1/21/2004 2:20:24 PM  JPMugaas
  InitComponent

  Rev 1.0    11/13/2002 07:57:18 AM  JPMugaas
}

unit IdMessageCoderXXE;

interface
{$i IdCompilerDefines.inc}

uses
  IdMessageCoderUUE, IdMessageCoder, IdMessage;

type
  // No Decoder - UUE handles XXE decoding

  TIdMessageEncoderXXE = class(TIdMessageEncoderUUEBase)
  protected
    procedure InitComponent; override;
  end;

  TIdMessageEncoderInfoXXE = class(TIdMessageEncoderInfo)
  public
    constructor Create; override;
  end;

implementation

uses
  IdCoderXXE;

{ TIdMessageEncoderInfoXXE }

constructor TIdMessageEncoderInfoXXE.Create;
begin
  inherited;
  FMessageEncoderClass := TIdMessageEncoderXXE;
end;

{ TIdMessageEncoderXXE }

procedure TIdMessageEncoderXXE.InitComponent;
begin
  inherited;
  FEncoderClass := TIdEncoderXXE;
end;

initialization
  TIdMessageEncoderList.RegisterEncoder('XXE', TIdMessageEncoderInfoXXE.Create);    {Do not Localize}
end.
