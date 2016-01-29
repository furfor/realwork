{
  $Project$
  $Workfile$
  $Revision: 1.3 $
  $DateUTC$
  $Id: IdSSH.pas,v 1.3 2015/06/16 12:31:45 lukyanets Exp $

  This file is part of the Indy (Internet Direct) project, and is offered
  under the dual-licensing agreement described on the Indy website.
  (http://www.indyproject.org/)

  Copyright:
   (c) 1993-2005, Chad Z. Hower and the Indy Pit Crew. All rights reserved.
}
{
  $Log: IdSSH.pas,v $
  Revision 1.3  2015/06/16 12:31:45  lukyanets
  ����� Indy 10

}
{
  Rev 1.0    4/6/2003 04:35:12 PM  JPMugaas
}
{
  Note that this unit is for defining Base classes for SSH implementers.

  Much of this is a Cut and Paste job from Indy 10's Base SSL classes.  We make
  this separate in case we have to treat SSH far differently than SSL.
}

unit IdSSH;

interface
{$i IdCompilerDefines.inc}
uses
  Classes,
  IdContainers,
  IdGlobalCore,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdScheduler,
  IdServerIOHandler;

type
  //client
   TIdSSHIOHandlerSocketBase = class(TIdIOHandlerStack)
   protected
      fPassThrough: Boolean;
      fIsPeer : Boolean;
     procedure SetPassThrough(const AValue: Boolean); virtual;
   public
     function Clone :  TIdSSHIOHandlerSocketBase; virtual; abstract;
     procedure StartSSH; virtual; abstract;
     property PassThrough: Boolean read fPassThrough write SetPassThrough;
     property IsPeer : Boolean read fIsPeer write fIsPeer;
   end;

   //server
   TIdServerIOHandlerSSHBase = class(TIdServerIOHandler)
   protected
   public
     //this is for the FTP Server to make a client IOHandler for it's data connection's IOHandler
     function MakeClientIOHandler(ATheThread:TIdThreadHandle ): TIdIOHandler; overload; override;
     function MakeClientIOHandler : TIdSSHIOHandlerSocketBase; reintroduce; overload; virtual; abstract;
     function MakeFTPSvrPort : TIdSSHIOHandlerSocketBase; virtual; abstract;
     function MakeFTPSvrPasv : TIdSSHIOHandlerSocketBase; virtual; abstract;
   end;

type
  TIdClientSSHClass = class of TIdSSHIOHandlerSocketBase;
  TIdServerSSHClass = class of TIdServerIOHandlerSSHBase;

Procedure RegisterSSH(const AProduct, AVendor, ACopyright,
  ADescription, AURL : String;
  const AClientClass : TIdClientSSHClass; const AServerClass : TIdServerSSHClass);

type
  TIdSSHRegEntry = class(TCollectionItem)
  protected
    FProductName : String;
    FVendor : String;
    FCopyright : String;
    FDescription : String;
    FURL : String;
    FClientClass : TIdClientSSHClass;
    FServerClass : TIdServerSSHClass;
  public
    property ProductName : String read FProductName write FProductName;
    property Vendor : String read FVendor write FVendor;
    property Copyright : String read  FCopyright write  FCopyright;
    property Description : String read FDescription write FDescription;
    property URL : String read FURL write FURL;
    property ClientClass : TIdClientSSHClass read FClientClass write FClientClass;
    property ServerClass : TIdServerSSHClass read FServerClass write FServerClass;
  end;
  TIdSSHRegistry = class(TCollection)
  protected
    function GetItem ( Index: Integer ) : TIdSSHRegEntry;
    procedure SetItem ( Index: Integer; const Value: TIdSSHRegEntry );
  public
    constructor Create; reintroduce;
    function Add: TIdSSHRegEntry;
    property Items [ Index: Integer ] : TIdSSHRegEntry read GetItem
      write SetItem; default;
  end;

var
  GSSHRegistry : TIdSSHRegistry;

implementation

uses SysUtils;

Procedure RegisterSSH(const AProduct, AVendor, ACopyright,
  ADescription, AURL : String;
  const AClientClass : TIdClientSSHClass; const AServerClass : TIdServerSSHClass);
var LR : TIdSSHRegEntry;
begin
  LR := GSSHRegistry.Add;
  LR.ProductName := AProduct;
  LR.Vendor := AVendor;
  LR.Copyright := ACopyRight;
  LR.Description := ADescription;
  LR.URL := AURL;
  LR.ClientClass := AClientClass;
  LR.ServerClass := AServerClass;
end;

{ TIdSSHIOHandlerSocketBase }

procedure TIdSSHIOHandlerSocketBase.SetPassThrough(const AValue: Boolean);
begin
  fPassThrough := AValue;
end;

{ TIdServerIOHandlerSSHBase }

function TIdServerIOHandlerSSHBase.MakeClientIOHandler(ATheThread:TIdThreadHandle ): TIdIOHandler;
begin
  result:=MakeClientIOHandler;
end;

{ TIdSSHRegistry }

function TIdSSHRegistry.Add: TIdSSHRegEntry;
begin
  Result := TIdSSHRegEntry( inherited Add );
end;

constructor TIdSSHRegistry.Create;
begin
  inherited Create(TIdSSHRegEntry);
end;

function TIdSSHRegistry.GetItem(Index: Integer): TIdSSHRegEntry;
begin
  Result := TIdSSHRegEntry ( inherited GetItem(Index) );
end;

procedure TIdSSHRegistry.SetItem(Index: Integer;
  const Value: TIdSSHRegEntry);
begin
  inherited SetItem(Index,Value);
end;

initialization
  GSSHRegistry := TIdSSHRegistry.Create;
finalization
  FreeAndNil(GSSHRegistry);
end.
