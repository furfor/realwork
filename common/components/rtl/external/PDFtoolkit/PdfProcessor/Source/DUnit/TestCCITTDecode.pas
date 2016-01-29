unit TestCCITTDecode;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, Classes, CCITTDecode, Stream, gtObject, DecodeIntf,
  gtTypes, FileStream, SysUtils, DUnitAssert, Dialogs;

type
  // Test methods for class TgtCCITTDecode
  
  TestTgtCCITTDecode = class(TAssertTestCase)
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestReset;
    procedure TestGetChar;
    procedure TestLookChar;
  end;

implementation
var
    FgtCCITTDecode: TgtCCITTDecode;
    FInFile, FOutFile: TFileStream;
    FgtInFile,FgtOutFile: TgtFileStream;
    FOutStream: TgtStream;
    Lbuffer : Bytes;
    OutValue,i : Integer;

procedure TestTgtCCITTDecode.SetUp;
begin
//  FgtCCITTDecode := TgtCCITTDecode.Create(nil, 0, False, False, 0, 0, False, False);
 FInFile := TFileStream.Create('Filters\CCITTFaxDecode\CCITTDecodeIn.txt', fmOpenRead);
 FgtInFile := TgtFileStream.Create(FInFile, 0, 0, False);
 FgtCCITTDecode := TgtCCITTDecode.create(FgtInFile, -1, False, False, 1296, 0, True, False);

 FOutFile := TFileStream.Create('Filters\CCITTFaxDecode\CCITTDecodeOut.txt', fmOpenRead);
 FgtOutFile := TgtFileStream.Create(FOutFile, 0, 0, False);
end;

procedure TestTgtCCITTDecode.TearDown;
begin
  FreeAndNil(FgtCCITTDecode);
  FreeAndNil(FgtInFile);
  FreeAndNil(FInFile);
  FreeAndNil(FOutFile);
  FreeAndNil(FgtOutFile);
  FreeAndNil(FOutStream);
end;

procedure TestTgtCCITTDecode.TestReset;
begin
  FgtCCITTDecode.Reset;
  // TODO: Validate method results
end;

procedure TestTgtCCITTDecode.TestGetChar;
var
  LSin, LSout: string;
  LI: Integer;
begin
  LSin := '';
  LSout := '';
  //FgtASCII85Decode.Reset;
  for LI := 0 to 10 do
  begin
    LSin := LSin + Char(FgtCCITTDecode.GetChar);
    LSout := LSout + Char(FgtOutFile.GetChar);
  end;

  Assert.AreEqualString(LSin, LSout);
end;

procedure TestTgtCCITTDecode.TestLookChar;
var
  ReturnValue: Integer;
  OutValue : Integer;
begin
   FgtCCITTDecode.Reset;
   ReturnValue:= FgtCCITTDecode.LookChar;
   OutValue := FgtOutFile.LookChar;
   Assert.AreEqual(ReturnValue, OutValue);
  // TODO: Validate method results
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTgtCCITTDecode.Suite);

end.

