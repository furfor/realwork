#--------------------------------------------------------------------------------------------------#
#                                                                                                  #
# JCL Debug extension tools                                                                        #
#                                                                                                  #
#--------------------------------------------------------------------------------------------------#

!ifndef ROOT
ROOT = $(MAKEDIR)\..
!endif

!ifndef JCL
JCL = ..\..\..\..
!endif

#---------------------------------------------------------------------------------------------------
INC = $(JCL)\source
LIB = $(JCL)\lib\d7;$(JCL)\lib\d6;$(JCL)\lib\d5
RES =
BIN = $(JCL)\bin
MAP = $(BIN)\$&.map
DRC = $&.drc
#---------------------------------------------------------------------------------------------------
MAKE = $(ROOT)\bin\make.exe -$(MAKEFLAGS) -f$**
DCC = $(ROOT)\bin\dcc32.exe -e$(BIN) -i$(INC) -q -r$(RES) -u$(LIB) -w $<
BRCC = $(ROOT)\bin\brcc32.exe $**
#---------------------------------------------------------------------------------------------------
default: \
  FramesTrackExample.exe
#---------------------------------------------------------------------------------------------------
.dpr.exe:
  $(DCC)
