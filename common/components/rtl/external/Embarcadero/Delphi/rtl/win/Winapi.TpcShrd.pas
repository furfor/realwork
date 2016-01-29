{*******************************************************}
{                                                       }
{                Delphi Runtime Library                 }
{                                                       }
{          File: TpcShrd.h                              }
{          Copyright (c) Microsoft Corporation          }
{                                                       }
{       Translator: Embarcadero Technologies, Inc.      }
{ Copyright(c) 1995-2013 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Winapi.TpcShrd;

{$ALIGN ON}
{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT}

{$HPPEMIT ''}
{$HPPEMIT '#include "tpcshrd.h"'}
{$HPPEMIT ''}

interface

uses Winapi.Windows;

const
  MICROSOFT_TABLETPENSERVICE_PROPERTY = 'MicrosoftTabletPenServiceProperty';
  {$EXTERNALSYM MICROSOFT_TABLETPENSERVICE_PROPERTY}
  TABLET_DISABLE_PRESSANDHOLD = $00000001;
  {$EXTERNALSYM TABLET_DISABLE_PRESSANDHOLD}
  TABLET_DISABLE_PENTAPFEEDBACK = $00000008;
  {$EXTERNALSYM TABLET_DISABLE_PENTAPFEEDBACK}
  TABLET_DISABLE_PENBARRELFEEDBACK = $00000010;
  {$EXTERNALSYM TABLET_DISABLE_PENBARRELFEEDBACK}
  TABLET_DISABLE_TOUCHUIFORCEON = $00000100;
  {$EXTERNALSYM TABLET_DISABLE_TOUCHUIFORCEON}
  TABLET_DISABLE_TOUCHUIFORCEOFF = $00000200;
  {$EXTERNALSYM TABLET_DISABLE_TOUCHUIFORCEOFF}
  TABLET_DISABLE_TOUCHSWITCH = $00008000;
  {$EXTERNALSYM TABLET_DISABLE_TOUCHSWITCH}
  TABLET_DISABLE_FLICKS = $00010000;
  {$EXTERNALSYM TABLET_DISABLE_FLICKS}
  TABLET_ENABLE_FLICKSONCONTEXT = $00020000;
  {$EXTERNALSYM TABLET_ENABLE_FLICKSONCONTEXT}
  TABLET_ENABLE_FLICKLEARNINGMODE = $00040000; 
  {$EXTERNALSYM TABLET_ENABLE_FLICKLEARNINGMODE}
  TABLET_DISABLE_SMOOTHSCROLLING = $00080000; 
  {$EXTERNALSYM TABLET_DISABLE_SMOOTHSCROLLING}
  TABLET_DISABLE_FLICKFALLBACKKEYS = $00100000; 
  {$EXTERNALSYM TABLET_DISABLE_FLICKFALLBACKKEYS}
  TABLET_ENABLE_MULTITOUCHDATA = $01000000;
  {$EXTERNALSYM TABLET_ENABLE_MULTITOUCHDATA}
  MAX_PACKET_PROPERTY_COUNT = 32;
  {$EXTERNALSYM MAX_PACKET_PROPERTY_COUNT}
  MAX_PACKET_BUTTON_COUNT = 32;
  {$EXTERNALSYM MAX_PACKET_BUTTON_COUNT}
  IP_CURSOR_DOWN = $00000001;
  {$EXTERNALSYM IP_CURSOR_DOWN}
  IP_INVERTED = $00000002;
  {$EXTERNALSYM IP_INVERTED}
  IP_MARGIN = $00000004;
  {$EXTERNALSYM IP_MARGIN}

type
  CURSOR_ID = DWORD;
  {$EXTERNALSYM CURSOR_ID}

  SYSTEM_EVENT = USHORT;
  {$EXTERNALSYM SYSTEM_EVENT}

  PTABLET_CONTEXT_ID = ^TABLET_CONTEXT_ID;
  TABLET_CONTEXT_ID = DWORD;
  {$EXTERNALSYM TABLET_CONTEXT_ID}

type
  PROPERTY_UNITS = type Integer;
  {$EXTERNALSYM PROPERTY_UNITS}

const
  PROPERTY_UNITS_DEFAULT     = 0;
  {$EXTERNALSYM PROPERTY_UNITS_DEFAULT}
  PROPERTY_UNITS_INCHES      = 1;
  {$EXTERNALSYM PROPERTY_UNITS_INCHES}
  PROPERTY_UNITS_CENTIMETERS = 2;
  {$EXTERNALSYM PROPERTY_UNITS_CENTIMETERS}
  PROPERTY_UNITS_DEGREES     = 3;
  {$EXTERNALSYM PROPERTY_UNITS_DEGREES}
  PROPERTY_UNITS_RADIANS     = 4;
  {$EXTERNALSYM PROPERTY_UNITS_RADIANS}
  PROPERTY_UNITS_SECONDS     = 5;
  {$EXTERNALSYM PROPERTY_UNITS_SECONDS}
  PROPERTY_UNITS_POUNDS      = 6;
  {$EXTERNALSYM PROPERTY_UNITS_POUNDS}
  PROPERTY_UNITS_GRAMS       = 7;
  {$EXTERNALSYM PROPERTY_UNITS_GRAMS}
  PROPERTY_UNITS_SILINEAR    = 8;
  {$EXTERNALSYM PROPERTY_UNITS_SILINEAR}
  PROPERTY_UNITS_SIROTATION  = 9;
  {$EXTERNALSYM PROPERTY_UNITS_SIROTATION}
  PROPERTY_UNITS_ENGLINEAR   = 10;
  {$EXTERNALSYM PROPERTY_UNITS_ENGLINEAR}
  PROPERTY_UNITS_ENGROTATION = 11;
  {$EXTERNALSYM PROPERTY_UNITS_ENGROTATION}
  PROPERTY_UNITS_SLUGS       = 12;
  {$EXTERNALSYM PROPERTY_UNITS_SLUGS}
  PROPERTY_UNITS_KELVIN      = 13;
  {$EXTERNALSYM PROPERTY_UNITS_KELVIN}
  PROPERTY_UNITS_FAHRENHEIT  = 14;
  {$EXTERNALSYM PROPERTY_UNITS_FAHRENHEIT}
  PROPERTY_UNITS_AMPERE      = 15;
  {$EXTERNALSYM PROPERTY_UNITS_AMPERE}
  PROPERTY_UNITS_CANDELA     = 16;
  {$EXTERNALSYM PROPERTY_UNITS_CANDELA}


type
  tagXFORM = record
    eM11: Single;
    eM12: Single;
    eM21: Single;
    eM22: Single;
    eDx: Single;
    eDy: Single;
  end;
  {$EXTERNALSYM tagXFORM}
  XFORM = tagXFORM;
  {$EXTERNALSYM XFORM}
  TXForm = tagXFORM;
  PXForm = ^TXForm;

  SYSTEM_EVENT_DATA = record
    bModifier: Byte;
    wKey: WCHAR;
    xPos: Integer;
    yPos: Integer;
    bCursorMode: Byte;
    dwButtonState: DWORD;
  end;
  {$EXTERNALSYM SYSTEM_EVENT_DATA}
  tagSYSTEM_EVENT_DATA = SYSTEM_EVENT_DATA;
  {$EXTERNALSYM tagSYSTEM_EVENT_DATA}
  TSystemEventData = SYSTEM_EVENT_DATA;
  PSystemEventData = ^TSystemEventData;

  STROKE_RANGE = record
    iStrokeBegin: Cardinal;
    iStrokeEnd: Cardinal;
  end;
  {$EXTERNALSYM STROKE_RANGE}
  tagSTROKE_RANGE = STROKE_RANGE;
  {$EXTERNALSYM tagSTROKE_RANGE}
  TStrokeRange = STROKE_RANGE;
  PStrokeRange = ^TStrokeRange;

  PROPERTY_METRICS = record
    nLogicalMin: Integer;
    nLogicalMax: Integer;
    Units: PROPERTY_UNITS;
    fResolution: Single;
  end;
  {$EXTERNALSYM PROPERTY_METRICS}
  _PROPERTY_METRICS = PROPERTY_METRICS;
  {$EXTERNALSYM _PROPERTY_METRICS}
  TPropertyMetrics = PROPERTY_METRICS;
  PPropertyMetrics = ^TPropertyMetrics;


  PACKET_PROPERTY = record
    guid: TGUID;
    PropertyMetrics: TPropertyMetrics;
  end;
  {$EXTERNALSYM PACKET_PROPERTY}
  _PACKET_PROPERTY = PACKET_PROPERTY;
  {$EXTERNALSYM _PACKET_PROPERTY}
  TPacketProperty = PACKET_PROPERTY;
  PPacketProperty = ^TPacketProperty;


  PACKET_DESCRIPTION = record
    cbPacketSize: Cardinal;
    cPacketProperties: Cardinal;
    pPacketProperties: PPacketProperty;
    cButtons: Cardinal;
    pguidButtons: PGUID;
  end;
  {$EXTERNALSYM PACKET_DESCRIPTION}
  _PACKET_DESCRIPTION = PACKET_DESCRIPTION;
  {$EXTERNALSYM _PACKET_DESCRIPTION}
  TPacketDescription = PACKET_DESCRIPTION;
  PPacketDescription = ^TPacketDescription;


implementation

end.
