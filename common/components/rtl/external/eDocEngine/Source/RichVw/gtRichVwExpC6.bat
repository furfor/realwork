REM CommandInterpreter: $(COMSPEC)
if defined ProgramFiles(x86) (
copy ..\..\Lib\C5\gtRichVwExp*.bpl %windir%\SysWow64 > nul
) else (
if not "%OS%"=="Windows_NT" goto win9x
:winNT
copy ..\..\Lib\C5\gtRichVwExp*.bpl %windir%\System32 > nul
goto finish
:win9x
copy ..\..\Lib\C5\gtRichVwExp*.bpl %windir%\System > nul
:finish
echo ""
)