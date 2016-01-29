unit TestFilterStream;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, Stream, FilterStream, DecodeIntf, Classes, EncodeIntf, gtTypes;

type
  // Test methods for class TgtFilterStream
  
  TestTgtFilterStream = class(TTestCase)
  strict private
    FgtFilterStream: TgtFilterStream;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestClose;
    procedure TestGetPosition;
    procedure TestSetPosition;
    procedure TestGetBaseStream;
    procedure TestGetNextStream;
    procedure TestGetUndecodedStream;
    procedure TestGetTStream;
    procedure TestReset;
    procedure TestGetChar;
    procedure TestLookChar;
    procedure TestReadRawChar;
    procedure TestWrite;
    procedure TestWrite1;
  end;

implementation

procedure TestTgtFilterStream.SetUp;
begin
  FgtFilterStream := TgtFilterStream.Create;
end;

procedure TestTgtFilterStream.TearDown;
begin
  FgtFilterStream.Free;
  FgtFilterStream := nil;
end;

procedure TestTgtFilterStream.TestClose;
begin
  FgtFilterStream.Close;
  // TODO: Validate method results
end;

procedure TestTgtFilterStream.TestGetPosition;
var
  ReturnValue: Int64;
begin
  ReturnValue := FgtFilterStream.GetPosition;
  // TODO: Validate method results
end;

procedure TestTgtFilterStream.TestSetPosition;
var
  ADirection: TSeekOrigin;
  APosition: System.Integer;
begin
  // TODO: Setup method call parameters
  FgtFilterStream.SetPosition(APosition, ADirection);
  // TODO: Validate method results
end;

procedure TestTgtFilterStream.TestGetBaseStream;
var
  ReturnValue: TgtStream;
begin
  ReturnValue := TgtStream(FgtFilterStream.GetBaseStream);
  // TODO: Validate method results
end;

procedure TestTgtFilterStream.TestGetNextStream;
var
  ReturnValue: TgtStream;
begin
  ReturnValue := TgtStream(FgtFilterStream.GetNextStream);
  // TODO: Validate method results
end;

procedure TestTgtFilterStream.TestGetUndecodedStream;
var
  ReturnValue: TgtStream;
begin
  ReturnValue := TgtStream(FgtFilterStream.GetUndecodedStream);
  // TODO: Validate method results
end;

procedure TestTgtFilterStream.TestGetTStream;
var
  ReturnValue: TStream;
begin
  ReturnValue := FgtFilterStream.GetTStream;
  // TODO: Validate method results
end;

procedure TestTgtFilterStream.TestReset;
begin
  FgtFilterStream.Reset;
  // TODO: Validate method results
end;

procedure TestTgtFilterStream.TestGetChar;
var
  ReturnValue: Integer;
begin
  ReturnValue := FgtFilterStream.GetChar;
  // TODO: Validate method results
end;

procedure TestTgtFilterStream.TestLookChar;
var
  ReturnValue: Integer;
begin
  ReturnValue := FgtFilterStream.LookChar;
  // TODO: Validate method results
end;

procedure TestTgtFilterStream.TestReadRawChar;
var
  ReturnValue: Integer;
begin
  ReturnValue := FgtFilterStream.ReadRawChar;
  // TODO: Validate method results
end;

procedure TestTgtFilterStream.TestWrite;
var
  ReturnValue: Cardinal;
  Count: Cardinal;
  OutStream: TgtStream;
  InStream: TgtStream;
begin
  // TODO: Setup method call parameters
  ReturnValue := FgtFilterStream.Write(OutStream, Count);
  // TODO: Validate method results
end;

procedure TestTgtFilterStream.TestWrite1;
var
  ReturnValue: Cardinal;
  Buffer: string;
begin
  // TODO: Setup method call parameters
  ReturnValue := FgtFilterStream.Write(Buffer);
  // TODO: Validate method results
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTgtFilterStream.Suite);
end.

