unit TestPDWord;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, PDElement, PDWord;

type
  // Test methods for class TgtPDWord
  
  TestTgtPDWord = class(TTestCase)
  strict private
    FgtPDWord: TgtPDWord;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  end;

implementation

procedure TestTgtPDWord.SetUp;
begin
  FgtPDWord := TgtPDWord.Create;
end;

procedure TestTgtPDWord.TearDown;
begin
  FgtPDWord.Free;
  FgtPDWord := nil;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTgtPDWord.Suite);
end.

