unit TestPDCharProc;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, PDCharProc, gtObject, PDElement, PDBaseObject;

type
  // Test methods for class TgtPDCharProc
  
  TestTgtPDCharProc = class(TTestCase)
  strict private
    FgtPDCharProc: TgtPDCharProc;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestUpdate;
  end;

implementation

procedure TestTgtPDCharProc.SetUp;
begin
  FgtPDCharProc := TgtPDCharProc.Create(nil, nil, nil);
end;

procedure TestTgtPDCharProc.TearDown;
begin
  FgtPDCharProc.Free;
  FgtPDCharProc := nil;
end;

procedure TestTgtPDCharProc.TestUpdate;
begin
  FgtPDCharProc.Update;
  // TODO: Validate method results
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTgtPDCharProc.Suite);
end.

