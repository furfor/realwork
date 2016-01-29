unit TestFlateStream;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, Classes, Stream, FlateStream, FilterStream;

type
  // Test methods for class TgtFlateStream
  
  TestTgtFlateStream = class(TTestCase)
  strict private
    FgtFlateStream: TgtFlateStream;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  end;

implementation

procedure TestTgtFlateStream.SetUp;
begin
  FgtFlateStream := TgtFlateStream.Create(nil, 0, 0, 0, 0);
end;

procedure TestTgtFlateStream.TearDown;
begin
  FgtFlateStream.Free;
  FgtFlateStream := nil;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTgtFlateStream.Suite);
end.

