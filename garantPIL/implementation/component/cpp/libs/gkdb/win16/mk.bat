@Echo Off
set DEBUG=1
set DEMO=0
set TOOLROOTDIR=D:\MSVC
set INIT=D:\MSVC
set path=c:\bin;d:\msvc\bin
set INCLUDE=D:\MSVC\INCLUDE;D:\MSVC\MFC\INCLUDE
set LIB=D:\MSVC\LIB;D:\MSVC\MFC\LIB
make %1

