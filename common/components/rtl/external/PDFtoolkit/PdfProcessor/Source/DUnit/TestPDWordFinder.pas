unit TestPDWordFinder;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, PDElement, PDWordFinder;

type
  // Test methods for class TgtPDWordFinder
  
  TestTgtPDWordFinder = class(TTestCase)
  strict private
    FgtPDWordFinder: TgtPDWordFinder;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  end;

implementation

procedure TestTgtPDWordFinder.SetUp;
begin
  FgtPDWordFinder := TgtPDWordFinder.Create;
end;

procedure TestTgtPDWordFinder.TearDown;
begin
  FgtPDWordFinder.Free;
  FgtPDWordFinder := nil;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTgtPDWordFinder.Suite);
end.

