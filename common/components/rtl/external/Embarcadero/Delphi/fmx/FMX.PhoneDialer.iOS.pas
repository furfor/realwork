{*******************************************************}
{                                                       }
{           Delphi FireMonkey Mobile Services           }
{                                                       }
{     Implementation of interface for phone dialer      }
{                                                       }
{ Copyright(c) 2012-2013 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

// Reference on programm guide in Apple developer center:
// https://developer.apple.com/library/ios/#documentation/NetworkingInternet/Reference/CoreTelephonyFrameworkReference/_index.html#//apple_ref/doc/uid/TP40009603

unit FMX.PhoneDialer.iOS;

interface

procedure RegisterPhoneDialerService;
procedure UnregisterPhoneDialerService;

implementation

uses
  System.SysUtils,
  FMX.Platform, FMX.PhoneDialer,
  Macapi.ObjectiveC,
  iOSapi.CoreTelephony, iOSapi.Foundation, iOSapi.UIKit;

type

{ TCocoaCarrier }

  TCocoaCarrier = class sealed (TCarrier)
  strict private
    FTelephonyNetworkInfo: CTTelephonyNetworkInfo;
    procedure DoOCCarrierChanged(const Data: CTCarrier);
  public
    constructor Create;
    destructor Destroy; override;
    function GetIsoCountryCode: string; override;
    function GetMobileCountryCode: string; override;
    function GetMobileNetwork: string; override;
    function GetCarrierName: string; override;
  end;

{ TCocoaCall }

  TCocoaCall = class sealed (TCall)
  strict private
    FCall: CTCall;
  public
    constructor Create(const ACall: CTCall);
    function GetCallState: TCallState; override;
    function GetCallID: string; override;
  end;

{ TCocoaPhoneDialerService }

  TCocoaPhoneDialerService = class sealed (TPhoneDialerService)
  strict private
    FCarrier: TCocoaCarrier;
    FCallCenter: CTCallCenter;
    procedure DoChangeCallState(const Data: CTCall);
  public
    constructor Create;
    destructor Destroy; override;

    function Call(const APhoneNumber: string): Boolean; override;
    function GetCurrentCalls: TCalls; override;
    function GetCarrier: TCarrier; override;
  end;

{$REGION 'Objective C - Delphi Helpers'}

function SharedApplication: UIApplication;
begin
  Result := TUIApplication.Wrap(TUIApplication.OCClass.sharedApplication);
end;

function StrToNSUrl(const AStr: string): NSUrl;
begin
  Result := TNSUrl.Wrap(TNSUrl.OCClass.URLWithString(NSSTR(AStr)));
end;

function CTCallStateToTCallState(const ACallState: NSString): TCallState;
begin
  Result := csNone;
  if ACallState.compare(CTCallStateDialing) = NSOrderedSame then
    Result := TCallState.csDialing;

  if ACallState.compare(CTCallStateIncoming) = NSOrderedSame then
    Result := TCallState.csIncoming;

  if ACallState.compare(CTCallStateConnected) = NSOrderedSame then
    Result := TCallState.csConnected;

  if ACallState.compare(CTCallStateDisconnected) = NSOrderedSame then
    Result := TCallState.csDisconnected;
end;

function IsPhone: Boolean;
begin
  Result := UTF8ToString(TUIDevice.Wrap(TUIDevice.OCClass.currentDevice).model.UTF8String) = 'iPhone';
end;

{$ENDREGION}

procedure RegisterPhoneDialerService;
begin
  if TOSVersion.Check(4, 0) and IsPhone then
    TPlatformServices.Current.AddPlatformService(IFMXPhoneDialerService, TCocoaPhoneDialerService.Create);
end;

procedure UnregisterPhoneDialerService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXPhoneDialerService);
end;

{$REGION 'TPhoneDialerIOS'}

function TCocoaPhoneDialerService.Call(const APhoneNumber: string): Boolean;
var
  URL: string;
begin
  URL := Format('tel:%s', [APhoneNumber]);
  Result := SharedApplication.openURL(StrToNSUrl(URL));
end;

constructor TCocoaPhoneDialerService.Create;
begin
  FCallCenter := TCTCallCenter.Create;
  FCallCenter.retain;
  FCallCenter.setCallEventHandler(DoChangeCallState);
end;

destructor TCocoaPhoneDialerService.Destroy;
begin
  if Assigned(FCarrier) then
    FreeAndNil(FCarrier);
  FCallCenter.release;
  inherited Destroy;
end;

procedure TCocoaPhoneDialerService.DoChangeCallState(const Data: CTCall);
var
  CallState: TCallState;
  CallID: string;
begin
  CallState := CTCallStateToTCallState(Data.callState);
  CallID := UTF8ToString(Data.callID.UTF8String);
  DoCallStateChanged(CallID, CallState);
end;

function TCocoaPhoneDialerService.GetCurrentCalls: TCalls;
var
  Calls: NSSet;
  Call: CTCall;
  CallsArray: NSArray;
  I: Integer;
  CallsTmp: TCalls;
begin
  Calls := FCallCenter.currentCalls;
  if Assigned(Calls) then
  begin
    CallsArray := Calls.allObjects;
    SetLength(CallsTmp, Calls.count);
    for I := 0 to Calls.count - 1 do
    begin
      Call := TCTCall.Wrap(CallsArray.objectAtIndex(0));
      CallsTmp[I] := TCocoaCall.Create(Call);
    end;
  end;
  Result := CallsTmp;
end;

function TCocoaPhoneDialerService.GetCarrier: TCarrier;
begin
  if not Assigned(FCarrier) then
    FCarrier := TCocoaCarrier.Create;
  Result := FCarrier;
end;

{$ENDREGION}

{$REGION 'TCocoaCarrier'}

constructor TCocoaCarrier.Create;
begin
  FTelephonyNetworkInfo := TCTTelephonyNetworkInfo.Create;
  FTelephonyNetworkInfo.retain;
  FTelephonyNetworkInfo.setSubscriberCellularProviderDidUpdateNotifier(DoOCCarrierChanged);
end;

destructor TCocoaCarrier.Destroy;
begin
  FTelephonyNetworkInfo.release;
  inherited Destroy;
end;

procedure TCocoaCarrier.DoOCCarrierChanged(const Data: CTCarrier);
begin
  DoCarrierChanged(Self);
end;

function TCocoaCarrier.GetCarrierName: string;
begin
  if Assigned(FTelephonyNetworkInfo.subscriberCellularProvider) and
     Assigned(FTelephonyNetworkInfo.subscriberCellularProvider.carrierName) then
    Result := UTF8ToString(FTelephonyNetworkInfo.subscriberCellularProvider.carrierName.UTF8String)
  else
    Result := '';
end;

function TCocoaCarrier.GetIsoCountryCode: string;
begin
  if Assigned(FTelephonyNetworkInfo.subscriberCellularProvider) then
    Result := UTF8ToString(FTelephonyNetworkInfo.subscriberCellularProvider.isoCountryCode.UTF8String)
  else
    Result := '';
end;

function TCocoaCarrier.GetMobileCountryCode: string;
begin
  if Assigned(FTelephonyNetworkInfo.subscriberCellularProvider) then
    Result := UTF8ToString(FTelephonyNetworkInfo.subscriberCellularProvider.mobileCountryCode.UTF8String)
  else
    Result := '';
end;

function TCocoaCarrier.GetMobileNetwork: string;
begin
  if Assigned(FTelephonyNetworkInfo.subscriberCellularProvider) then
    Result := UTF8ToString(FTelephonyNetworkInfo.subscriberCellularProvider.mobileNetworkCode.UTF8String)
  else
    Result := '';
end;

{$ENDREGION}

{ TCocoaCall }

constructor TCocoaCall.Create(const ACall: CTCall);
begin
  Assert(Assigned(ACall));
  FCall := ACall;
end;

function TCocoaCall.GetCallID: string;
begin
  Result := UTF8ToString(FCall.callID.UTF8String);
end;

function TCocoaCall.GetCallState: TCallState;
begin
  Result := CTCallStateToTCallState(FCall.CallState);
end;

end.
