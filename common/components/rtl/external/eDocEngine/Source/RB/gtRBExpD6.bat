REM CommandInterpreter: $(ComSpec)
if defined ProgramFiles(x86) (
copy ..\..\Lib\D6\gtRBExp*.bpl %windir%\SysWow64 > nul
) else (
if not "%OS%"=="Windows_NT" goto win9x
:winNT
copy ..\..\Lib\D6\gtRBExp*.bpl %windir%\System32 > nul
goto finish
:win9x
copy ..\..\Lib\D6\gtRBExp*.bpl %windir%\System > nul
:finish
echo ""
)