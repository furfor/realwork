unit TestASCIIHexEncode;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, Stream, gtObject, Classes, EncodeIntf, ASCIIHexEncode, gtTypes,
  FileStream, ASCIIHexStream, SysUtils, DUnitAssert, Dialogs;

type
  // Test methods for class TgtASCIIHexEncode
  
  TestTgtASCIIHexEncode = class(TAssertTestCase)

  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestWrite;
  end;

implementation
Var
    FgtASCIIHexEncode: TgtASCIIHexEncode;
    FInFile, FOutFile: TFileStream;
    FgtInFile,FgtOutFile: TgtFileStream;
    FOutStream: TgtStream;
    Lbuffer : Bytes;
    OutValue,i : Integer;

procedure TestTgtASCIIHexEncode.SetUp;
begin
  FInFile := TFileStream.Create('Filters\ASCIIHexDecode\HexDecode.txt', fmOpenRead);
  FgtInFile := TgtFileStream.Create(FInFile, 0, 0, False);
  FgtASCIIHexEncode := TgtASCIIHexEncode.create(FgtInFile);

  FOutFile := TFileStream.Create('Filters\ASCIIHexDecode\HexEncode12.txt', fmCreate);
  FgtOutFile := TgtFileStream.Create(FOutFile, 0, 0, False);
end;

procedure TestTgtASCIIHexEncode.TearDown;
begin
  FreeAndNil(FgtASCIIHexEncode);
  FreeAndNil(FgtInFile);
  FreeAndNil(FInFile);
  FreeAndNil(FOutFile);
  FreeAndNil(FgtOutFile);
  FreeAndNil(FOutStream);
end;

procedure TestTgtASCIIHexEncode.TestWrite;
var
  ReturnValue, Count: Cardinal;
  EncFileStream: TFileStream;
  TgtEncFile: TgtFileStream;
begin
  // TODO: Setup method call parameters
  count := 20;
  ReturnValue := FgtASCIIHexEncode.Write(FgtOutFile, Count);

{ **
  EncFileStream is the actual encoded file and comparing it with the generated encoded file,
  in order to check that does the proper encoding being done.
  ** }

  EncFileStream := TFileStream.Create('Filters\ASCIIHexDecode\HexEncode.txt', fmOpenRead);
  TgtEncFile := TgtFileStream.Create(EncFileStream, 0, 0, False);

  TgtEncFile.Reset;
  FgtOutFile.Reset;

  for I := 0 to ReturnValue-2 do
    Assert.AreEqual(TgtEncFile.GetChar, FgtOutFile.GetChar);

  FreeAndNil(EncFileStream);
  FreeAndNil(TgtEncFile);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTgtASCIIHexEncode.Suite);
end.

