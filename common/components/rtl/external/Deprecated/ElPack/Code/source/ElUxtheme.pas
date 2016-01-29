{====================================================}
{                                                    }
{   EldoS Visual Components                          }
{                                                    }
{   Copyright (c) 2001, Microsoft                    }
{   Delphi Translation (c) 2001, EldoS               }
{   Dynamic linkage (c) 2001, Akzhan Abdulin         }
{                                                    }
{====================================================}

{$include elpack2.inc}
{$ifdef ELPACK_SINGLECOMP}
{$I ElPack.inc}
{$else}
{$ifdef LINUX}
{$I ../ElPack.inc}
{$else}
{$I ..\ElPack.inc}
{$endif}
{$endif}

unit ElUxTheme;

{.$HPPEMIT ''}
{.$HPPEMIT '#include "tmschema.h"'}
{.$HPPEMIT ''}

{$MINENUMSIZE 4}

interface

{$ifdef MSWINDOWS}
uses
  Messages,
  Windows,
  {$ifdef VCL_6_USED}
  Types,
  {$endif}
  ElVCLUtils, // SafeLoadLibrary
  ElTmSchema;

const

// draw a grayed-out string
  DTT_GRAYED         = 1;
//  Theme background segment hit test flag (default). possible return values are:
//  HTCLIENT: hit test succeeded in the middle background segment
//  HTTOP, HTLEFT, HTTOPLEFT, etc:  // hit test succeeded in the the respective theme background segment.
  HTTB_BACKGROUNDSEG = 0;
//  Fixed border hit test option.  possible return values are:
//  HTCLIENT: hit test succeeded in the middle background segment
//  HTBORDER: hit test succeeded in any other background segment
  HTTB_FIXEDBORDER   = 2;
//  Caption hit test option.  Possible return values are:
//  HTCAPTION: hit test succeeded in the top, top left, or top right background segments
//  HTNOWHERE or another return code, depending on absence or presence of accompanying flags, resp.
  HTTB_CAPTION       = 4;

//  Resizing border hit test flags.  Possible return values are:
//  HTCLIENT: hit test succeeded in middle background segment
//  HTTOP, HTTOPLEFT, HTLEFT, HTRIGHT, etc:    hit test succeeded in the respective system resizing zone
//  HTBORDER: hit test failed in middle segment and resizing zones, but succeeded in a background border segment
  HTTB_RESIZINGBORDER_LEFT   = $0010;
  HTTB_RESIZINGBORDER_TOP    = $0020;
  HTTB_RESIZINGBORDER_RIGHT  = $0040;
  HTTB_RESIZINGBORDER_BOTTOM = $0080;
  HTTB_RESIZINGBORDER        = $00F0; // all above constants OR'ed

// Resizing border is specified as a template, not just window edges.
  HTTB_USESIZINGTEMPLATE     = $0100;

  DTL_LEFT   = 1;
  DTL_TOP    = 2;
  DTL_RIGHT  = 4;
  DTL_BOTTOM = 8;

  MAX_INTLIST_COUNT = 10;

  PO_STATE   = 0;       // property was found in the state section
  PO_PART    = 1;       // property was found in the part section
  PO_CLASS   = 2;       // property was found in the class section
  PO_GLOBAL  = 3;       // property was found in [globals] section
  PO_NOTFOUND= 4;       // property was not found

  STAP_ALLOW_NONCLIENT = 1;
  STAP_ALLOW_CONTROLS  = 2;
  STAP_ALLOW_WEBCONTENT= 4;

  SZ_THDOCPROP_DISPLAYNAME   = 'DisplayName';
  SZ_THDOCPROP_CANONICALNAME = 'ThemeName';
  SZ_THDOCPROP_TOOLTIP       = 'ToolTip';
  SZ_THDOCPROP_AUTHOR        = 'author';

  WM_THEMECHANGED = $031A; // this constant get by WinSight.
  WM_ISTHEMEDCONTROL = WM_USER + 2398;
  TS_MIN = 0;
  TS_TRUE = 1;
  TS_DRAW = 2;

  {$ifdef ELPACK_THEME_ENGINE}
  EL_THEMECHANGED = $B528;
  {$else}
  EL_THEMECHANGED = $031A;
  {$endif}

type

{$ifndef BUILDER_USED}
  HDC = Windows.HDC;
{$endif}

  TMargins = record
    cxLeftWidth,
    cxRightWidth,
    cyTopHeight,
    cyBottomHeight : integer
  end;

  PMargins = ^TMargins;

  TIntList = record
    iValueCount : integer;
    iValues : array [0..MAX_INTLIST_COUNT - 1] of integer;
  end;
  PIntList=  ^TIntList;

  (*
  TSize = record
    cx, cy : integer;
  end;
  PSize = ^TSize;
  *)
  TThemeErrorContext = record
    dwSize : DWORD;                      // size of this structure
    hr     : HRESULT;                    // error code from last error
    szMsgParam1 : array[0..MAX_PATH - 1] of WideChar;    // value of first param for msg
    szMsgParam2 : array[0..MAX_PATH - 1] of WideChar;    // value of second param for msg
    szFileName  : array[0..MAX_PATH - 1] of WideChar;    // associated source filename
    szSourceLine: array[0..MAX_PATH - 1] of WideChar;    // source line
    iLineNum    : integer;                              // source line number
  end;
  PThemeErrorContext = ^TThemeErrorContext;

  HTheme     = THandle;
{$ifdef BUILDER_USED}
{$NODEFINE HIMAGELIST}
{$endif}
  HIMAGELIST = THandle;

//---------------------------------------------------------------------------
//  IsThemeActive()     - can be used to test if a theme for the current app
//                        is active.  If so, theme-aware windows should call
//                        "OpenThemeData()" to start using theme drawing
//                        services.  If not, the window doesn't have to
//                        ask again until it receives a EL_THEMECHANGED msg.
//---------------------------------------------------------------------------
  IsThemeActiveProc = function : boolean; stdcall;

  EnableThemingProc = function(fEnable : boolean) : HRESULT; stdcall;

//---------------------------------------------------------------------------
//  OpenThemeData()     - Open the theme data for the specified HWND and
//                        semi-colon separated list of class names.
//
//                        OpenThemeData() will try each class name, one at
//                        a time, and use the first matching theme info
//                        found.  If a match is found, a theme handle
//                        to the data is returned.  If no match is found,
//                        a "NULL" handle is returned.
//
//                        When the window is destroyed or a EL_THEMECHANGED
//                        msg is received, "CloseThemeData()" should be
//                        called to close the theme handle.
//
//  hwnd                - window handle of the control/window to be themed
//
//  pszClassList        - class name (or list of names) to match to theme data
//                        section.  if the list contains more than one name,
//                        the names are tested one at a time for a match.
//                        If a match is found, OpenThemeData() returns a
//                        theme handle associated with the matching class.
//                        This param is a list (instead of just a single
//                        class name) to provide the class an opportunity
//                        to get the "best" match between the class and
//                        the current theme.  For example, a button might
//                        pass L"OkButton, Button" if its ID=ID_OK.  If
//                        the current theme has an entry for OkButton,
//                        that will be used.  Otherwise, we fall back on
//                        the normal Button entry.
//---------------------------------------------------------------------------
  OpenThemeDataProc = function (hwnd : HWND; pszClassList : PWideChar) : HTheme; stdcall;
//---------------------------------------------------------------------------
//  CloseTHemeData()    - closes the theme data handle.  This should be done
//                        when the window being themed is destroyed or
//                        whenever a EL_THEMECHANGED msg is received
//                        (followed by an attempt to create a new Theme data
//                        handle).
//
//  hTheme              - open theme data handle (returned from prior call
//                        to OpenThemeData() API).
//---------------------------------------------------------------------------
  CloseThemeDataProc= function (Theme : HTheme) : HRESULT; stdcall;
//---------------------------------------------------------------------------
//    functions for basic drawing support
//---------------------------------------------------------------------------
// The following methods are the theme-aware drawing services.
// Controls/Windows are defined in drawable "parts" by their author: a
// parent part and 0 or more child parts.  Each of the parts can be
// described in "states" (ex: disabled, hot, pressed).
//---------------------------------------------------------------------------
// For the list of all themed classes and the definition of all
// parts and states, see the file "tmschmea.h".
//---------------------------------------------------------------------------
// Each of the below methods takes a "iPartId" param to specify the
// part and a "iStateId" to specify the state of the part.
// "iStateId=0" refers to the root part.  "iPartId" = "0" refers to
// the root class.
//-----------------------------------------------------------------------
// Note: draw operations are always scaled to fit (and not to exceed)
// the specified "Rect".
//-----------------------------------------------------------------------


  DrawThemeParentBackgroundProc = function (hwnd : HWND; hdc : Windows.HDC; const Rect : TRect) : HRESULT; stdcall;

//------------------------------------------------------------------------
//  DrawThemeBackground()
//                      - draws the theme-specified border and fill for
//                        the "iPartId" and "iStateId".  This could be
//                        based on a bitmap file, a border and fill, or
//                        other image description.
//
//  hTheme              - theme data handle
//  hdc                 - HDC to draw into
//  iPartId             - part number to draw
//  iStateId            - state number (of the part) to draw
//  pRect               - defines the size/location of the part
//  pClipRect           - optional clipping rect (don't draw outside it)
//------------------------------------------------------------------------
  DrawThemeBackgroundProc = function (Theme : HTheme; hdc : Windows.HDC;
    iPartId : integer; iStateId : integer; const Rect : TRect; {OPTIONAL} pClipRect : PRect) : HRESULT; stdcall;
//-------------------------------------------------------------------------
//  DrawThemeText()     - draws the text using the theme-specified
//                        color and font for the "iPartId" and
//                        "iStateId".
//
//  hTheme              - theme data handle
//  hdc                 - HDC to draw into
//  iPartId             - part number to draw
//  iStateId            - state number (of the part) to draw
//  pszText             - actual text to draw
//  dwCharCount         - number of chars to draw (-1 for all)
//  dwTextFlags         - same as DrawText() "uFormat" param
//  dwTextFlags2        - additional drawing options
//  pRect               - defines the size/location of the part
//-------------------------------------------------------------------------
  DrawThemeTextProc = function (Theme : HTheme; hdc : HDC; iPartId, iStateId : integer;
    pszText : PWideChar; iCharCount : integer; dwTextFlags : DWORD;
    dwTextFlags2 : DWORD; var Rect : TRect) : HRESULT; stdcall;
//-------------------------------------------------------------------------
//  GetThemeBackgroundContentRect()
//                      - gets the size of the content for the theme-defined
//                        background.  This is usually the area inside
//                        the borders or Margins.
//
//      hTheme          - theme data handle
//      hdc             - (optional) device content to be used for drawing
//      iPartId         - part number to draw
//      iStateId        - state number (of the part) to draw
//      pBoundingRect   - the outer RECT of the part being drawn
//      pContentRect    - RECT to receive the content area
//-------------------------------------------------------------------------
  GetThemeBackgroundContentRectProc = function(Theme : HTheme; {OPTIONAL} hdc : HDC;
    iPartId, iStateId : integer; const pBoundingRect : TRect; var pContentRect : TRect) : HResult; stdcall;

//-------------------------------------------------------------------------
//  GetThemeBackgroundExtent() - calculates the size/location of the theme-
//                               specified background based on the
//                               "pContentRect".
//
//      hTheme          - theme data handle
//      hdc             - (optional) device content to be used for drawing
//      iPartId         - part number to draw
//      iStateId        - state number (of the part) to draw
//      pContentRect    - RECT that defines the content area
//      pBoundingRect   - RECT to receive the overall size/location of part
//-------------------------------------------------------------------------
  GetThemeBackgroundExtentProc = function(Theme : HTheme; {OPTIONAL} hdc : HDC;
    iPartId, iStateId : integer; const pBoundingRect : PRect; var pContentRect : TRect) : HResult; stdcall;

//-------------------------------------------------------------------------
//  GetThemePartSize() - returns the specified size of the theme part
//
//  hTheme              - theme data handle
//  hdc                 - HDC to select font into & measure against
//  iPartId             - part number to retrieve size for
//  iStateId            - state number (of the part)
//  prc                 - (optional) rect for part drawing destination
//  eSize               - the type of size to be retreived
//  psz                 - receives the specified size of the part
//-------------------------------------------------------------------------
  GetThemePartSizeProc = function(Theme : HTheme; hdc : HDC;
    iPartId, iStateId : integer; {OPTIONAL} rect : PRect; eSize : integer; var psz : TSize) : HRESULT; stdcall;

//-------------------------------------------------------------------------
//  GetThemeTextExtent() - calculates the size/location of the specified
//                         text when rendered in the Theme Font.
//
//  hTheme              - theme data handle
//  hdc                 - HDC to select font & measure into
//  iPartId             - part number to draw
//  iStateId            - state number (of the part)
//  pszText             - the text to be measured
//  dwCharCount         - number of chars to draw (-1 for all)
//  dwTextFlags         - same as DrawText() "uFormat" param
//  pszBoundingRect     - optional: to control layout of text
//  pszExtentRect       - receives the RECT for text size/location
//-------------------------------------------------------------------------
  GetThemeTextExtentProc = function(Theme : HTheme; hdc : HDC;
    iPartId, iStateId : integer; pszText : PWideChar; iCharCount : integer;
    dwTextFlags : DWORD; {OPTIONAL} pBoundingRect : PRect;
    var pExtentRect : TRect) : HRESULT; stdcall;

//-------------------------------------------------------------------------
//  GetThemeTextMetrics()
//                      - returns info about the theme-specified font
//                        for the part/state passed in.
//
//  hTheme              - theme data handle
//  hdc                 - optional: HDC for screen context
//  iPartId             - part number to draw
//  iStateId            - state number (of the part)
//  ptm                 - receives the font info
//-------------------------------------------------------------------------
  GetThemeTextMetricsProc = function(Theme : HTheme; {OPTIONAL} hdc : HDC;
    iPartId, iStateId : integer; var ptm : TTextMetricW) : HRESULT; stdcall;

//-------------------------------------------------------------------------
//  GetThemeBackgroundRegion()
//                      - computes the region for a regular or partially
//                        transparent theme-specified background that is
//                        bound by the specified "pRect".
//                        If the rectangle is empty, sets the HRGN to NULL
//                        and return S_FALSE.
//
//  hTheme              - theme data handle
//  iPartId             - part number to draw
//  iStateId            - state number (of the part)
//  pRect               - the RECT used to draw the part
//  pRegion             - receives handle to calculated region
//-------------------------------------------------------------------------
  GetThemeBackgroundRegionProc = function(Theme : HTheme; DC: HDC;
    iPartId, iStateId : Integer; pRect : PRect;
    var pRegion : HRGN) : HRESULT; stdcall;

//-------------------------------------------------------------------------
//  HitTestThemeBackground()
//                      - returns a HitTestCode (a subset of the values
//                        returned by WM_NCHITTEST) for the point "ptTest"
//                        within the theme-specified background
//                        (bound by pRect).  "pRect" and "ptTest" should
//                        both be in the same coordinate system
//                        (client, screen, etc).
//
//      hTheme          - theme data handle
//      hdc             - HDC to draw into
//      iPartId         - part number to test against
//      iStateId        - state number (of the part)
//      pRect           - the RECT used to draw the part
//      hrgn            - optional region to use; must be in same coordinates as
//                      -    pRect and pTest.
//      ptTest          - the hit point to be tested
//      dwOptions       - HTTB_xxx constants
//      pwHitTestCode   - receives the returned hit test code - one of:
//
//                        HTNOWHERE, HTLEFT, HTTOPLEFT, HTBOTTOMLEFT,
//                        HTRIGHT, HTTOPRIGHT, HTBOTTOMRIGHT,
//                        HTTOP, HTBOTTOM, HTCLIENT
//-------------------------------------------------------------------------
  HitTestThemeBackgroundProc = function(Theme : HTheme; {OPTIONAL} hdc : HDC;
    iPartId, iStateId : Integer; dwOptions : DWORD; pRect : PRect; {OPTIONAL} hrgn : HRGN;
    ptTest : TPoint; var pwHitTestCode : word) : HRESULT; stdcall;

(*
//------------------------------------------------------------------------
//  DrawThemeLine()     - draws the theme-defined line within the
//                        specified "pRect".  "iStateId" selects the line
//                        type (flat, raised, lowered).  "dwDtlFlags"
//                        selects which line(s) to draw around the rect
//                        (left, top, right, bottom).
//
//  hTheme              - theme data handle
//  hdc                 - HDC to draw into
//  iStateId            - style of line to draw (LVS_XXX or LHS_XXX)
//  pRect               - the RECT used to draw the line(s)
//  dwDtlFlags          - which parts of rect to draw (DTL_XXX flags)
//------------------------------------------------------------------------
  DrawThemeLineProc = function(Theme : HTheme; hdc : HDC;
    iStateId : Integer; pRect : PRect; dwDtlFlags : DWORD) : HRESULT; stdcall;
*)

//------------------------------------------------------------------------
//  DrawThemeEdge()     - Similar to the DrawEdge() API, but uses part colors
//                        and is high-DPI aware
//  hTheme              - theme data handle
//  hdc                 - HDC to draw into
//  iPartId             - part number to draw
//  iStateId            - state number of part
//  pDestRect           - the RECT used to draw the line(s)
//  uEdge               - Same as DrawEdge() API
//  uFlags              - Same as DrawEdge() API
//  pContentRect        - Receives the interior rect if (uFlags & BF_ADJUST)
//------------------------------------------------------------------------
  DrawThemeEdgeProc = function(Theme : HTheme; hdc : HDC;
    iPartId, iStateId: Integer; const pDestRect: TRect; uEdge, uFlags: UINT;
    {OPTIONAL} pContentRect: PRect): HRESULT; stdcall;

(*
//------------------------------------------------------------------------
//  DrawThemeBorder()   - draws the theme-defined border within the
//                        specified "pRect".  "iStateId" selects the
//                        border type (flat, raised, lowered).
//
//  hTheme              - theme data handle
//  hdc                 - HDC to draw into
//  iStateId            - style of border to draw (BSS_XXX enums)
//  pRect               - the RECT used to draw the border
//------------------------------------------------------------------------
  DrawThemeBorderProc = function (Theme : HTheme; hdc : HDC;
    iStateId : Integer; pRect : PRect) : HRESULT; stdcall;
*)
//------------------------------------------------------------------------
//  DrawThemeIcon()     - draws an image within an imagelist based on
//                        a (possible) theme-defined effect.
//
//  hTheme              - theme data handle
//  hdc                 - HDC to draw into
//  iPartId             - part number to draw
//  iStateId            - state number of part
//  pRect               - the RECT to draw the image within
//  himl                - handle to IMAGELIST
//  iImageIndex         - index into IMAGELIST (which icon to draw)
//------------------------------------------------------------------------
  DrawThemeIconProc = function(Theme : HTheme; hdc : HDC;
    iPartId, iStateId: Integer; pRect : PRect;
    himl : HIMAGELIST; iImageIndex : integer) : HRESULT; stdcall;

//---------------------------------------------------------------------------
//  IsThemePartDefined() - returns TRUE if the theme has defined parameters
//                         for the specified "iPartId" and "iStateId".
//
//  hTheme              - theme data handle
//  iPartId             - part number to find definition for
//  iStateId            - state number of part
//---------------------------------------------------------------------------
  IsThemePartDefinedProc = function(Theme : HTheme;
    iPartId, iStateId: Integer) : boolean; stdcall;

//---------------------------------------------------------------------------
//  IsThemeBackgroundPartiallyTransparent()
//                      - returns TRUE if the theme specified background for
//                        the part/state has transparent pieces or
//                        alpha-blended pieces.
//
//  hTheme              - theme data handle
//  iPartId             - part number
//  iStateId            - state number of part
//---------------------------------------------------------------------------
  IsThemeBackgroundPartiallyTransparentProc = function(Theme : HTheme;
    iPartId, iStateId: Integer) : boolean; stdcall;

//---------------------------------------------------------------------------
//    lower-level theme information services
//---------------------------------------------------------------------------
// The following methods are getter routines for each of the Theme Data types.
// Controls/Windows are defined in drawable "parts" by their author: a
// parent part and 0 or more child parts.  Each of the parts can be
// described in "states" (ex: disabled, hot, pressed).
//---------------------------------------------------------------------------
// Each of the below methods takes a "iPartId" param to specify the
// part and a "iStateId" to specify the state of the part.
// "iStateId=0" refers to the root part.  "iPartId" = "0" refers to
// the root class.
//-----------------------------------------------------------------------
// Each method also take a "iPropId" param because multiple instances of
// the same primitive type can be defined in the theme schema.
//-----------------------------------------------------------------------


//-----------------------------------------------------------------------
//  GetThemeColor()     - Get the value for the specified COLOR property
//
//  hTheme              - theme data handle
//  iPartId             - part number
//  iStateId            - state number of part
//  iPropId             - the property number to get the value for
//  pColor              - receives the value of the property
//-----------------------------------------------------------------------
  GetThemeColorProc = function(Theme : HTheme; iPartId, iStateId,
    iPropId : Integer; var Color : COLORREF) : HRESULT; stdcall;

//-----------------------------------------------------------------------
//  GetThemeMetric()    - Get the value for the specified metric/size
//                        property
//
//  hTheme              - theme data handle
//  iPartId             - part number
//  iStateId            - state number of part
//  iPropId             - the property number to get the value for
//  piVal               - receives the value of the property
//-----------------------------------------------------------------------
  GetThemeMetricProc = function(Theme : HTheme; DC: HDC; iPartId, iStateId,
    iPropId : Integer; var piVal : integer) : HRESULT; stdcall;

//-----------------------------------------------------------------------
//  GetThemeString()    - Get the value for the specified string property
//
//  hTheme              - theme data handle
//  iPartId             - part number
//  iStateId            - state number of part
//  iPropId             - the property number to get the value for
//  pszBuff             - receives the string property value
//  cchMaxBuffChars     - max. number of chars allowed in pszBuff
//-----------------------------------------------------------------------
  GetThemeStringProc = function(Theme : HTheme; iPartId, iStateId,
    iPropId : Integer; {OUT} pszBuff : PWideChar; cchMaxBuffChars : integer) : HRESULT; stdcall;

//-----------------------------------------------------------------------
//  GetThemeBool()      - Get the value for the specified BOOL property
//
//  hTheme              - theme data handle
//  iPartId             - part number
//  iStateId            - state number of part
//  iPropId             - the property number to get the value for
//  pfVal               - receives the value of the property
//-----------------------------------------------------------------------
  GetThemeBoolProc = function(Theme : HTheme; iPartId, iStateId,
    iPropId : Integer; {OUT} var pfVal : BOOL) : HRESULT; stdcall;

//-----------------------------------------------------------------------
//  GetThemeInt()       - Get the value for the specified int property
//
//  hTheme              - theme data handle
//  iPartId             - part number
//  iStateId            - state number of part
//  iPropId             - the property number to get the value for
//  piVal               - receives the value of the property
//-----------------------------------------------------------------------
  GetThemeIntProc = function(Theme : HTheme; iPartId, iStateId,
    iPropId : Integer; {OUT} var pfVal : integer) : HRESULT; stdcall;

//-----------------------------------------------------------------------
//  GetThemeEnumValue() - Get the value for the specified ENUM property
//
//  hTheme              - theme data handle
//  iPartId             - part number
//  iStateId            - state number of part
//  iPropId             - the property number to get the value for
//  piVal               - receives the value of the enum (cast to int*)
//-----------------------------------------------------------------------
  GetThemeEnumValueProc = function(Theme : HTheme; iPartId, iStateId,
    iPropId : Integer; {OUT} var pfVal : integer) : HRESULT; stdcall;

//-----------------------------------------------------------------------
//  GetThemePosition()  - Get the value for the specified position
//                        property
//
//  hTheme              - theme data handle
//  iPartId             - part number
//  iStateId            - state number of part
//  iPropId             - the property number to get the value for
//  pPoint              - receives the value of the position property
//-----------------------------------------------------------------------
  GetThemePositionProc = function(Theme : HTheme; iPartId, iStateId,
    iPropId : Integer; {OUT} var pPoint : TPoint) : HRESULT; stdcall;

//-----------------------------------------------------------------------
//  GetThemeFont()      - Get the value for the specified font property
//
//  hTheme              - theme data handle
//  iPartId             - part number
//  iStateId            - state number of part
//  iPropId             - the property number to get the value for
//  pFont               - receives the value of the LOGFONT property
//-----------------------------------------------------------------------
  GetThemeFontProc = function(Theme : HTheme; DC: HDC; iPartId, iStateId,
    iPropId : Integer; {OUT} var pPoint : TLogFontW) : HRESULT; stdcall;

//-----------------------------------------------------------------------
//  GetThemeRect()      - Get the value for the specified RECT property
//
//  hTheme              - theme data handle
//  iPartId             - part number
//  iStateId            - state number of part
//  iPropId             - the property number to get the value for
//  pRect               - receives the value of the RECT property
//-----------------------------------------------------------------------
  GetThemeRectProc = function(Theme : HTheme; iPartId, iStateId,
    iPropId : Integer; {OUT} var pRect : TRect) : HRESULT; stdcall;

//-----------------------------------------------------------------------
//  GetThemeMargins()   - Get the value for the specified MARGINS property
//
//      hTheme          - theme data handle
//      iPartId         - part number
//      iStateId        - state number of part
//      iPropId         - the property number to get the value for
//      pMargins        - receives the value of the MARGINS property
//-----------------------------------------------------------------------
  GetThemeMarginsProc = function(Theme : HTheme; DC: HDC; iPartId, iStateId,
    iPropId : Integer; {OUT} var Margins : TMargins) : HRESULT; stdcall;

//-----------------------------------------------------------------------
//  GetThemeIntList()   - Get the value for the specified INTLIST struct
//
//      hTheme          - theme data handle
//      iPartId         - part number
//      iStateId        - state number of part
//      iPropId         - the property number to get the value for
//      pIntList        - receives the value of the INTLIST property
//-----------------------------------------------------------------------
GetThemeIntListProc= function(Theme : HTheme; iPartId, iStateId,
    iPropId : Integer; {OUT} var pIntList : TIntList) : HRESULT; stdcall;

//-----------------------------------------------------------------------
//  GetThemePropertyOrigin()
//                      - searches for the specified theme property
//                        and sets "pOrigin" to indicate where it was
//                        found (or not found)
//
//  hTheme              - theme data handle
//  iPartId             - part number
//  iStateId            - state number of part
//  iPropId             - the property number to search for
//  pOrigin             - receives the value of the property origin
//-----------------------------------------------------------------------
  GetThemePropertyOriginProc = function(Theme : HTheme; iPartId, iStateId,
    iPropId : Integer; {OUT} var pOrigin : integer) : HRESULT; stdcall;

//---------------------------------------------------------------------------
//  SetWindowTheme()
//                      - redirects an existing Window to use a different
//                        section of the current theme information than its
//                        class normally asks for.
//
//  hwnd                - the handle of the window (cannot be NULL)
//
//  pszSubAppName       - app (group) name to use in place of the calling
//                        app's name.  If NULL, the actual calling app
//                        name will be used.
//
//  pszSubIdList        - semicolon separated list of class Id names to
//                        use in place of actual list passed by the
//                        window's class.  if NULL, the id list from the
//                        calling class is used.
//---------------------------------------------------------------------------
// The Theme Manager will remember the "pszSubAppName" and the
// "pszSubIdList" associations thru the lifetime of the window (even
// if themes are subsequently changed).  The window is sent a
// "EL_THEMECHANGED" msg at the end of this call, so that the new
// theme can be found and applied.
//---------------------------------------------------------------------------
// When "pszSubAppName" or "pszSubIdList" are NULL, the Theme Manager
// removes the previously remember association.  To turn off theme-ing for
// the specified window, you can pass an empty string (L"") so it
// won't match any section entries.
//---------------------------------------------------------------------------
  SetWindowThemeProc = function(hwnd : HWND; pszSubAppName, pszSubIdList : PWideChar) : HRESULT; stdcall;

//---------------------------------------------------------------------------
//  GetThemeFilename()  - Get the value for the specified FILENAME property.
//
//  hTheme              - theme data handle
//  iPartId             - part number
//  iStateId            - state number of part
//  iPropId             - the property number to search for
//  pszThemeFileName    - output buffer to receive the filename
//  cchMaxBuffChars     - the size of the return buffer, in chars
//---------------------------------------------------------------------------
  GetThemeFilenameProc = function(Theme : HTheme; iPartId, iStateId,
    iPropId : Integer; {OUT} pszThemeFileName : PWideChar; cchMaxBuffChars : integer) : HRESULT; stdcall;

//---------------------------------------------------------------------------
//  GetThemeSysColor()  - Get the value of the specified System color.
//
//  hTheme              - the theme data handle.  if non-NULL, will return
//                        color from [SysMetrics] section of theme.
//                        if NULL, will return the global system color.
//
//  iColorId            - the system color index defined in winuser.h
//---------------------------------------------------------------------------
  GetThemeSysColorProc = function(Theme : HTheme; iColorId : integer) : COLORREF; stdcall;

//---------------------------------------------------------------------------
//  GetThemeSysColorBrush()
//                      - Get the brush for the specified System color.
//
//  hTheme              - the theme data handle.  if non-NULL, will return
//                        brush matching color from [SysMetrics] section of
//                        theme.  if NULL, will return the brush matching
//                        global system color.
//
//  iColorId            - the system color index defined in winuser.h
//---------------------------------------------------------------------------
  GetThemeSysColorBrushProc = function(Theme : HTheme; iColorId : integer) : HBRUSH; stdcall;

//---------------------------------------------------------------------------
//  GetThemeSysSize()   - Get the value of the specified System size metric.
//
//  hTheme              - the theme data handle.  if non-NULL, will return
//                        size from [SysMetrics] section of theme.
//                        if NULL, will return the global system metric.
//
//  iSizeId             - the following values are searched for in the
//                        theme [SysMetrics] section:
//
//                          SM_CXBORDER   (border width)
//                          SM_CXVSCROLL  (scrollbar width)
//                          SM_CYHSCROLL  (scrollbar height)
//                          SM_CXSIZE     (caption width)
//                          SM_CYSIZE     (caption height)
//                          SM_CXSMSIZE   (small caption width)
//                          SM_CYSMSIZE   (small caption height)
//                          SM_CXMENUSIZE (menubar width)
//                          SM_CYMENUSIZE (menubar height)
//
//                        any other iSizeId values will be passed directly
//                        to the system GetSystemMetrics() function
//---------------------------------------------------------------------------
  GetThemeSysSizeProc = function(Theme : HTheme; iSizeId : integer) : integer; stdcall;

//---------------------------------------------------------------------------
//  GetThemeSysBool()   - Get the boolean value of specified System metric.
//
//  hTheme              - the theme data handle.  if non-NULL, will return
//                        BOOL from [SysMetrics] section of theme.
//                        if NULL, will return the specified system boolean.
//
//  iBoolId             - the TMT_XXX BOOL number (first BOOL
//                        is TMT_FLATMENUS)
//---------------------------------------------------------------------------
  GetThemeSysBoolProc = function(Theme : HTheme; iBoolId : integer) : BOOL; stdcall;

//---------------------------------------------------------------------------
//  GetThemeSysFont()   - Get the LOGFONT for the specified System font.
//
//  hTheme              - the theme data handle.  if non-NULL, will return
//                        font from [SysMetrics] section of theme.
//                        if NULL, will return the specified system font.
//
//  iFontId             - the TMT_XXX font number (first font
//                        is TMT_CAPTIONFONT)
//
//  plf                 - ptr to LOGFONT to receive the font value.
//---------------------------------------------------------------------------
  GetThemeSysFontProc = function(Theme : HTheme; iFontId : integer; var plf : TLogFont) : HRESULT; stdcall;

//---------------------------------------------------------------------------
//  GetThemeSysString() - Get the value of specified System string metric.
//
//  hTheme              - the theme data handle (required)
//
//  iStringId           - must be one of the following values:
//
//                          TMT_CSSNAME
//                          TMT_XMLNAME
//
//  pszStringBuff       - the buffer to receive the string value
//
//  cchMaxStringChars   - max. number of chars that pszStringBuff can hold
//---------------------------------------------------------------------------
  GetThemeSysStringProc = function(Theme : HTheme; iStringId : integer;
    {OUT} pszStringBuff : PWideChar; cchMaxStringChars : integer) : HRESULT; stdcall;

//---------------------------------------------------------------------------
//  GetThemeSysInt() - Get the value of specified System int.
//
//  hTheme              - the theme data handle (required)
//
//  iIntId              - must be one of the following values:
//
//                          TMT_DPIX
//                          TMT_DPIY
//                          TMT_MINCOLORDEPTH
//
//  piValue             - ptr to int to receive value
//---------------------------------------------------------------------------
  GetThemeSysIntProc  = function(Theme : HTheme; iIntId : integer; var piValue : integer) : HRESULT; stdcall;

//---------------------------------------------------------------------------
//  IsAppThemed()       - returns TRUE if current app is themed
//---------------------------------------------------------------------------
  IsAppThemedProc = function : boolean; stdcall;

//---------------------------------------------------------------------------
//  GetWindowTheme()    - if window is themed, returns its most recent
//                        HTHEME from OpenThemeData() - otherwise, returns
//                        NULL.
//
//      hwnd            - the window to get the HTHEME of
//---------------------------------------------------------------------------
  GetWindowThemeProc = function(hwnd : HWND) : HTheme; stdcall;

//---------------------------------------------------------------------------
//  EnableThemeDialogTexture()
//
//  - Enables/disables dialog background theme.  This method can be used to
//    tailor dialog compatibility with child windows and controls that
//    may or may not coordinate the rendering of their client area backgrounds
//    with that of their parent dialog in a manner that supports seamless
//    background texturing.
//
//      hdlg         - the window handle of the target dialog
//      fEnable      - TRUE to enable the theme-defined background texturing,
//                     FALSE to disable background texturing.
//---------------------------------------------------------------------------
  EnableThemeDialogTextureProc = function(hwnd : HWND; fEnable : DWORD) : HRESULT; stdcall;

//---------------------------------------------------------------------------
//  IsThemeDialogTextureEnabled()
//
//  - Reports whether the dialog supports background texturing.
//
//      hdlg         - the window handle of the target dialog
//---------------------------------------------------------------------------
  IsThemeDialogTextureEnabledProc = function: BOOL; stdcall;

//---------------------------------------------------------------------------
//  GetThemeAppProperties()
//                      - returns the app property flags that control theming
//---------------------------------------------------------------------------
  GetThemeAppPropertiesProc = function : DWORD; stdcall;

//---------------------------------------------------------------------------
//  SetThemeAppProperties()
//                      - sets the flags that control theming within the app
//
//      dwFlags         - the flag values to be set
//---------------------------------------------------------------------------
  SetThemeAppPropertiesProc = procedure(dwFlags : DWORD); stdcall;

//---------------------------------------------------------------------------
//  GetCurrentThemeName()
//                      - Get the name of the current theme in-use.
//                        Optionally, return the ColorScheme name and the
//                        Size name of the theme.
//
//  pszThemeFileName    - receives the theme path & filename
//  cchMaxNameChars     - max chars allowed in pszNameBuff
//
//  pszColorBuff        - (optional) receives the canonical color scheme name
//                        (not the display name)
//  cchMaxColorChars    - max chars allowed in pszColorBuff
//
//  pszSizeBuff         - (optional) receives the canonical size name
//                        (not the display name)
//  cchMaxSizeChars     - max chars allowed in pszSizeBuff
//---------------------------------------------------------------------------
  GetCurrentThemeNameProc = function(
    {OUT} pszThemeFileName : PWideChar; cchMaxNameChars : integer;
    {OUT} {OPTIONAL} pszColorBuff : PWideChar; cchMaxColorChars : integer;
    {OUT} {OPTIONAL} pszSizeBuff : PWideChar; cchMaxSizeChars : integer) : HRESULT; stdcall;

//---------------------------------------------------------------------------
//  GetThemeDocumentationProperty()
//                      - Get the value for the specified property name from
//                        the [documentation] section of the themes.ini file
//                        for the specified theme.  If the property has been
//                        localized in the theme files string table, the
//                        localized version of the property value is returned.
//
//  pszThemeFileName    - filename of the theme file to query
//  pszPropertyName     - name of the string property to retreive a value for
//  pszValueBuff        - receives the property string value
//  cchMaxValChars      - max chars allowed in pszValueBuff
//---------------------------------------------------------------------------

  GetThemeDocumentationPropertyProc = function(pszThemeName : PWideChar;
    pszPropertyName : PWideChar; {OUT} pszValueBuff : PWideChar; cchMaxValChars : integer) : HRESULT; stdcall;

(*
//---------------------------------------------------------------------------
//  Theme API Error Handling
//
//      All functions in the Theme API use the WIN32 function
//      "SetLastError()" to record any call failures.
//
//      To retreive the simple error code of the last failure on the
//      current thread, use the WIN32 function "GetLastError()".
//
//      To retreive the full error context information for the last
//      theme API failure on the current thread, use the
//      function "GetThemeLastErrorContext()".
//
//      To format a theme error and context into a msg, use the
//      function "FormatThemeMessage()".
//---------------------------------------------------------------------------

  GetThemeLastErrorContextProc = function ({OUT}pContext : TThemeErrorContext) : HRESULT; stdcall;

//---------------------------------------------------------------------------
//  FormatThemeMessage()
//                      - use the supplied theme error context
//                        to format an error message in the specified
//                        language.
//
//  dwLanguageId        - the language to format the error msg into
//
//  pContext            - ptr to theme context structure (see above)
//                        that supplies the HRESULT and string params
//
//  pszMessageBuff      - where to write the formatted msg.  If the
//                        message is too long, it is truncated.
//
//  cchMaxMessageChars  - maximum number of chars to write to buff
//---------------------------------------------------------------------------
  FormatThemeMessageProc = function(dwLanguageId : DWORD;
    pContext : PThemeErrorContext; {OUT} pszMessageBuff : PWideChar;
    cchMaxMessageChars : integer) : HRESULT; stdcall;

//---------------------------------------------------------------------------
// GetThemeImageFromWindow
//---------------------------------------------------------------------------

  GetThemeImageFromParentProc = function (hwnd : HWND; hdc : HDC; var prc : TRect) : HRESULT; stdcall;
*)

  function DrawThemeBackgroundTo(pszClassList: LPCWSTR; hdc: Windows.HDC; iPartId, iStateId: Integer;
    const pRect: TRect; pClipRect: PRect): HRESULT;

  function DrawThemeTextTo(pszClassList: LPCWSTR; hdc : HDC; iPartId, iStateId : integer;
    pszText : PWideChar; iCharCount : integer; dwTextFlags : DWORD;
    dwTextFlags2 : DWORD; var Rect : TRect) : HRESULT;

  function GetThemePartSizeTo(pszClassList: LPCWSTR; hdc : HDC;
    iPartId, iStateId : integer; {OPTIONAL} rect : PRect; eSize : integer; var psz : TSize) : HRESULT;

  // for internal use only; don't call these routines directly
  procedure InitializeUxTheme;
  procedure FinalizeUxTheme;

var

  IsThemeActive                 : IsThemeActiveProc;
  EnableTheming                 : EnableThemingProc;
  OpenThemeData                 : OpenThemeDataProc;
  CloseThemeData                : CloseThemeDataProc;
  DrawThemeParentBackground     : DrawThemeParentBackgroundProc;
  DrawThemeBackground           : DrawThemeBackgroundProc;
  DrawThemeText                 : DrawThemeTextProc;
  GetThemeBackgroundContentRect : GetThemeBackgroundContentRectProc;
  GetThemeBackgroundExtent      : GetThemeBackgroundExtentProc;
  GetThemePartSize              : GetThemePartSizeProc;
  GetThemeTextExtent            : GetThemeTextExtentProc;
  GetThemeTextMetrics           : GetThemeTextMetricsProc;
  GetThemeBackgroundRegion      : GetThemeBackgroundRegionProc;
  HitTestThemeBackground        : HitTestThemeBackgroundProc;
  //DrawThemeLine                 : DrawThemeLineProc;
  DrawThemeEdge                 : DrawThemeEdgeProc;
  //DrawThemeBorder               : DrawThemeBorderProc;
  DrawThemeIcon                 : DrawThemeIconProc;
  IsThemePartDefined            : IsThemePartDefinedProc;
  IsThemeBackgroundPartiallyTransparent : IsThemeBackgroundPartiallyTransparentProc;
  GetThemeColor                 : GetThemeColorProc;
  GetThemeMetric                : GetThemeMetricProc;
  GetThemeString                : GetThemeStringProc;
  GetThemeBool                  : GetThemeBoolProc;
  GetThemeInt                   : GetThemeIntProc;
  GetThemeEnumValue             : GetThemeEnumValueProc;
  GetThemePosition              : GetThemePositionProc;
  GetThemeFont                  : GetThemeFontProc;
  GetThemeRect                  : GetThemeRectProc;
  GetThemeMargins               : GetThemeMarginsProc;
  GetThemeIntList               : GetThemeIntListProc;
  GetThemePropertyOrigin        : GetThemePropertyOriginProc;
  SetWindowTheme                : SetWindowThemeProc;
  GetThemeFilename              : GetThemeFilenameProc;
  GetThemeSysColor              : GetThemeSysColorProc;
  GetThemeSysColorBrush         : GetThemeSysColorBrushProc;
  GetThemeSysSize               : GetThemeSysSizeProc;
  GetThemeSysBool               : GetThemeSysBoolProc;
  GetThemeSysFont               : GetThemeSysFontProc;
  GetThemeSysString             : GetThemeSysStringProc;
  GetThemeSysInt                : GetThemeSysIntProc;
  IsAppThemed                   : IsAppThemedProc;
  GetWindowTheme                : GetWindowThemeProc;
  EnableThemeDialogTexture      : EnableThemeDialogTextureProc;
  IsThemeDialogTextureEnabled   : IsThemeDialogTextureEnabledProc;
  GetThemeAppProperties         : GetThemeAppPropertiesProc;
  SetThemeAppProperties         : SetThemeAppPropertiesProc;
  GetCurrentThemeName           : GetCurrentThemeNameProc;
  GetThemeDocumentationProperty : GetThemeDocumentationPropertyProc;
  //GetThemeLastErrorContext      : GetThemeLastErrorContextProc;
  //FormatThemeMessage            : FormatThemeMessageProc;
  //GetThemeImageFromParent       : GetThemeImageFromParentProc;

{$endif}

var
  ThemesAvailable : Boolean;
  // QueryThemeData  : Boolean;

{$ifndef MSWINDOWS}
type
  HTheme = Cardinal;
{$endif}

implementation

{$ifdef MSWINDOWS}
uses
  SysUtils{$ifdef ELPACK_THEME_ENGINE}, ElThemes{$endif};

const
  themelib = 'uxtheme.dll';

var
  hThemeLib: HINST;

function GetThemePartSizeTo(pszClassList: LPCWSTR; hdc : HDC;
    iPartId, iStateId : integer; {OPTIONAL} rect : PRect; eSize : integer; var psz : TSize) : HRESULT;
var
  ATheme: HTheme;
begin
  Result := E_NOTIMPL;
  ATheme := OpenThemeData(0, pszClassList);
  if ATheme <> 0 then
  try
    Result := GetThemePartSize(ATheme, hdc, iPartId, iStateId, rect, eSize, psz);
  finally
    CloseThemeData(ATheme);
  end;
end;

function DrawThemeTextTo(pszClassList: LPCWSTR; hdc : HDC; iPartId, iStateId : integer;
    pszText : PWideChar; iCharCount : integer; dwTextFlags : DWORD;
    dwTextFlags2 : DWORD; var Rect : TRect) : HRESULT;
var
  ATheme: HTheme;
begin
  Result := E_NOTIMPL;
  ATheme := OpenThemeData(0, pszClassList);
  if ATheme <> 0 then
  try
    Result := DrawThemeText(ATheme, hdc, iPartId, iStateId, pszText, iCharCount, dwTextFlags, dwTextFlags2, Rect);
  finally
    CloseThemeData(ATheme);
  end;
end;

function DrawThemeBackgroundTo(pszClassList: LPCWSTR; hdc: Windows.HDC; iPartId, iStateId: Integer;
  const pRect: TRect; pClipRect: PRect): HRESULT;
var
  ATheme: HTheme;
begin
  Result := E_NOTIMPL;
  ATheme := OpenThemeData(0, pszClassList);
  if ATheme <> 0 then
  try

    Result := DrawThemeBackground(ATheme, hdc, iPartId, iStateId, pRect, pClipRect);
  finally
    CloseThemeData(ATheme);
  end;
end;

{$ifdef D_2}
var
  Win32Platform: Integer = 0;
  Win32MajorVersion: Integer = 0;
  Win32MinorVersion: Integer = 0;
  Win32BuildNumber: Integer = 0;

procedure InitPlatformId;
var
  OSVersionInfo: TOSVersionInfo;
begin
  OSVersionInfo.dwOSVersionInfoSize := SizeOf(OSVersionInfo);
  if GetVersionEx(OSVersionInfo) then
    with OSVersionInfo do
    begin
      Win32Platform := dwPlatformId;
      Win32MajorVersion := dwMajorVersion;
      Win32MinorVersion := dwMinorVersion;
      Win32BuildNumber := dwBuildNumber;
    end;
end;
{$endif}

{$endif}

{$ifdef MSWINDOWS}
var
  UxThemeInited: boolean;

procedure InitializeUxTheme;
begin
  if UxThemeInited then
    exit;
  {$ifdef D_2}
  InitPlatformId;
  {$endif}
  if (Win32Platform  = VER_PLATFORM_WIN32_NT) and
     (((Win32MajorVersion = 5) and (Win32MinorVersion >= 1)) or
      (Win32MajorVersion > 5)) then
  begin
    hThemeLib := SafeLoadLibrary(themelib);
    if hThemeLib <> 0 then
    begin
      IsThemeActive := GetProcAddress(hThemeLib, 'IsThemeActive');
      EnableTheming := GetProcAddress(hThemeLib, 'EnableTheming');
      OpenThemeData := GetProcAddress(hThemeLib, 'OpenThemeData');
      CloseThemeData := GetProcAddress(hThemeLib, 'CloseThemeData');
      DrawThemeParentBackground := GetProcAddress(hThemeLib, 'DrawThemeParentBackground');
      DrawThemeBackground := GetProcAddress(hThemeLib, 'DrawThemeBackground');
      DrawThemeText := GetProcAddress(hThemeLib, 'DrawThemeText');
      GetThemeBackgroundContentRect := GetProcAddress(hThemeLib, 'GetThemeBackgroundContentRect');
      GetThemeBackgroundExtent := GetProcAddress(hThemeLib, 'GetThemeBackgroundExtent');
      GetThemePartSize := GetProcAddress(hThemeLib, 'GetThemePartSize');
      GetThemeTextExtent := GetProcAddress(hThemeLib, 'GetThemeTextExtent');
      GetThemeTextMetrics := GetProcAddress(hThemeLib, 'GetThemeTextMetrics');
      GetThemeBackgroundRegion := GetProcAddress(hThemeLib, 'GetThemeBackgroundRegion');
      HitTestThemeBackground := GetProcAddress(hThemeLib, 'HitTestThemeBackground');
      DrawThemeEdge := GetProcAddress(hThemeLib, 'DrawThemeEdge');
      DrawThemeIcon := GetProcAddress(hThemeLib, 'DrawThemeIcon');
      IsThemePartDefined := GetProcAddress(hThemeLib, 'IsThemePartDefined');
      IsThemeBackgroundPartiallyTransparent := GetProcAddress(hThemeLib, 'IsThemeBackgroundPartiallyTransparent');
      GetThemeColor  := GetProcAddress(hThemeLib, 'GetThemeColor');
      GetThemeMetric := GetProcAddress(hThemeLib, 'GetThemeMetric');
      GetThemeString := GetProcAddress(hThemeLib, 'GetThemeString');
      GetThemeBool   := GetProcAddress(hThemeLib, 'GetThemeBool');
      GetThemeInt    := GetProcAddress(hThemeLib, 'GetThemeInt');
      GetThemeEnumValue := GetProcAddress(hThemeLib, 'GetThemeEnumValue');
      GetThemeFilename  := GetProcAddress(hThemeLib, 'GetThemeFileName');

      GetThemePosition  := GetProcAddress(hThemeLib, 'GetThemePosition');
      GetThemeFont  := GetProcAddress(hThemeLib, 'GetThemeFont');
      GetThemeRect  := GetProcAddress(hThemeLib, 'GetThemeRect');
      GetThemeMargins  := GetProcAddress(hThemeLib, 'GetThemeMargins');
      GetThemeIntList  := GetProcAddress(hThemeLib, 'GetThemeIntList');
      GetThemePropertyOrigin  := GetProcAddress(hThemeLib, 'GetThemePropertyOrigin');
      SetWindowTheme  := GetProcAddress(hThemeLib, 'SetWindowTheme');

      GetThemeSysColor  := GetProcAddress(hThemeLib, 'GetThemeSysColor');
      GetThemeSysColorBrush  := GetProcAddress(hThemeLib, 'GetThemeSysColorBrush');
      GetThemeSysSize  := GetProcAddress(hThemeLib, 'GetThemeSysSize');
      GetThemeSysBool  := GetProcAddress(hThemeLib, 'GetThemeSysBool');
      GetThemeSysFont  := GetProcAddress(hThemeLib, 'GetThemeSysFont');
      GetThemeSysString  := GetProcAddress(hThemeLib, 'GetThemeSysString');
      GetThemeSysInt  := GetProcAddress(hThemeLib, 'GetThemeSysInt');
      IsAppThemed  := GetProcAddress(hThemeLib, 'IsAppThemed');
      GetWindowTheme   := GetProcAddress(hThemeLib, 'GetWindowTheme');

      EnableThemeDialogTexture := GetProcAddress(hThemeLib, 'EnableThemeDialogTexture');
      IsThemeDialogTextureEnabled := GetProcAddress(hThemeLib, 'IsThemeDialogTextureEnabled');
      GetThemeAppProperties := GetProcAddress(hThemeLib, 'GetThemeAppProperties');
      SetThemeAppProperties := GetProcAddress(hThemeLib, 'SetThemeAppProperties');
      GetThemeDocumentationProperty := GetProcAddress(hThemeLib, 'GetThemeDocumentationProperty');
      GetCurrentThemeName  := GetProcAddress(hThemeLib, 'GetCurrentThemeName');

      ThemesAvailable := True;
      UxThemeInited := True;
    end;
  end;
end;

procedure FinalizeUxTheme;
begin
  if UxThemeInited and (hThemeLib <> 0) then
  begin
    IsThemeActive := nil;
    EnableTheming := nil;
    OpenThemeData := nil;
    CloseThemeData := nil;
    DrawThemeParentBackground := nil;
    DrawThemeBackground := nil;
    DrawThemeText := nil;
    GetThemeBackgroundContentRect := nil;
    GetThemeBackgroundExtent := nil;
    GetThemePartSize := nil;
    GetThemeTextExtent := nil;
    GetThemeTextMetrics := nil;
    GetThemeBackgroundRegion := nil;
    HitTestThemeBackground := nil;
    DrawThemeEdge := nil;
    DrawThemeIcon := nil;
    IsThemePartDefined := nil;
    IsThemeBackgroundPartiallyTransparent := nil;
    GetThemeColor  := nil;
    GetThemeMetric := nil;
    GetThemeString := nil;
    GetThemeBool   := nil;
    GetThemeInt    := nil;
    GetThemeEnumValue := nil;
    GetThemeFilename  := nil;
    GetThemePosition  := nil;
    GetThemeFont  := nil;
    GetThemeRect  := nil;
    GetThemeMargins  := nil;
    GetThemeIntList  := nil;
    GetThemePropertyOrigin  := nil;
    SetWindowTheme  := nil;

    GetThemeSysColor  := nil;
    GetThemeSysColorBrush  := nil;
    GetThemeSysSize  := nil;
    GetThemeSysBool  := nil;
    GetThemeSysFont  := nil;
    GetThemeSysString  := nil;
    GetThemeSysInt  := nil;
    IsAppThemed  := nil;
    GetWindowTheme   := nil;

    EnableThemeDialogTexture := GetProcAddress(hThemeLib, 'EnableThemeDialogTexture');
    IsThemeDialogTextureEnabled := GetProcAddress(hThemeLib, 'IsThemeDialogTextureEnabled');
    GetThemeAppProperties := GetProcAddress(hThemeLib, 'GetThemeAppProperties');
    SetThemeAppProperties := GetProcAddress(hThemeLib, 'SetThemeAppProperties');
    GetThemeDocumentationProperty := GetProcAddress(hThemeLib, 'GetThemeDocumentationProperty');
    GetCurrentThemeName  := GetProcAddress(hThemeLib, 'GetCurrentThemeName');

    FreeLibrary(hThemeLib);
    hThemeLib := 0;
  end;
  ThemesAvailable := False;
  UxThemeInited := False;
end;
{$endif}

initialization
{$ifdef MSWINDOWS}
  InitializeUxTheme;
{$endif}

finalization
{$ifdef MSWINDOWS}
  FinalizeUxTheme;
{$endif}

end.
