unit TestBaseStream;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, Classes, Stream, BaseStream;

type
  // Test methods for class TgtBaseStream
  
  TestTgtBaseStream = class(TTestCase)
  strict private
    FgtBaseStream: TgtBaseStream;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestMakeSubStream;
    procedure TestGetBaseStream;
    procedure TestGetUndecodedStream;
    procedure TestGetStart;
    procedure TestMoveStart;
  end;

implementation

procedure TestTgtBaseStream.SetUp;
begin
  FgtBaseStream := TgtBaseStream.Create;
end;

procedure TestTgtBaseStream.TearDown;
begin
  FgtBaseStream.Free;
  FgtBaseStream := nil;
end;

procedure TestTgtBaseStream.TestMakeSubStream;
var
  ReturnValue: TgtStream;
  ALimited: Boolean;
  ALength: System.Integer;
  AStart: System.Integer;
begin
  // TODO: Setup method call parameters
  ReturnValue := FgtBaseStream.MakeSubStream(AStart, ALength, ALimited);
  // TODO: Validate method results
end;

procedure TestTgtBaseStream.TestGetBaseStream;
var
  ReturnValue: TgtStream;
begin
  ReturnValue := TgtStream(FgtBaseStream.GetBaseStream);
  // TODO: Validate method results
end;

procedure TestTgtBaseStream.TestGetUndecodedStream;
var
  ReturnValue: TgtStream;
begin
  ReturnValue := TgtStream(FgtBaseStream.GetUndecodedStream);
  // TODO: Validate method results
end;

procedure TestTgtBaseStream.TestGetStart;
var
  ReturnValue: System.Integer;
begin
  ReturnValue := FgtBaseStream.GetStart;
  // TODO: Validate method results
end;

procedure TestTgtBaseStream.TestMoveStart;
var
  Delta: Int64;
begin
  // TODO: Setup method call parameters
  FgtBaseStream.MoveStart(Delta);
  // TODO: Validate method results
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTgtBaseStream.Suite);
end.

