unit TestPDOCG;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, PDOCG, PDElement;

type
  // Test methods for class TgtPDOCG
  
  TestTgtPDOCG = class(TTestCase)
  strict private
    FgtPDOCG: TgtPDOCG;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  end;

implementation

procedure TestTgtPDOCG.SetUp;
begin
  FgtPDOCG := TgtPDOCG.Create;
end;

procedure TestTgtPDOCG.TearDown;
begin
  FgtPDOCG.Free;
  FgtPDOCG := nil;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTgtPDOCG.Suite);
end.

