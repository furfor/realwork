{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.Input;

interface

uses Posix.SysTypes, Posix.StdDef, Androidapi.Looper, Androidapi.KeyCodes;

(*$HPPEMIT '#include <android/input.h>' *)

{$I Androidapi.inc}

{ IMPORTANT NOTICE:
  
  This file is part of Android's set of stable system headers
  exposed by the Android NDK (Native Development Kit).
  
  Third-party source AND binary code relies on the definitions
  here to be FROZEN ON ALL UPCOMING PLATFORM RELEASES.
  
  - DO NOT MODIFY ENUMS (EXCEPT IF YOU ADD NEW 32-BIT VALUES)
  - DO NOT MODIFY CONSTANTS OR FUNCTIONAL MACROS
  - DO NOT CHANGE THE SIGNATURE OF FUNCTIONS IN ANY WAY
  - DO NOT CHANGE THE LAYOUT OR SIZE OF STRUCTURES
}

{ Structures and functions to receive and process input events in
  native code.
  
  NOTE: These functions MUST be implemented by /system/lib/libui.so
}

{ Key states (may be returned by queries about the current state of a
  particular key code, scan code or switch).
}

const
  { The key state is unknown or the requested key itself is not supported.}
  AKEY_STATE_UNKNOWN = - 1;
  {$EXTERNALSYM AKEY_STATE_UNKNOWN}
  
  { The key is up.}
  AKEY_STATE_UP = 0;
  {$EXTERNALSYM AKEY_STATE_UP}
  
  { The key is down.}
  AKEY_STATE_DOWN = 1;
  {$EXTERNALSYM AKEY_STATE_DOWN}
  
  { The key is down but is a virtual key press that is being emulated by the system.}
  AKEY_STATE_VIRTUAL = 2;
  {$EXTERNALSYM AKEY_STATE_VIRTUAL}

{ Meta key / modifer state.
}
const
  { No meta keys are pressed.}
  AMETA_NONE = 0;
  {$EXTERNALSYM AMETA_NONE}
  
  { This mask is used to check whether one of the ALT meta keys is pressed.}
  AMETA_ALT_ON = $02;
  {$EXTERNALSYM AMETA_ALT_ON}
  
  { This mask is used to check whether the left ALT meta key is pressed.}
  AMETA_ALT_LEFT_ON = $10;
  {$EXTERNALSYM AMETA_ALT_LEFT_ON}
  
  { This mask is used to check whether the right ALT meta key is pressed.}
  AMETA_ALT_RIGHT_ON = $20;
  {$EXTERNALSYM AMETA_ALT_RIGHT_ON}
  
  { This mask is used to check whether one of the SHIFT meta keys is pressed.}
  AMETA_SHIFT_ON = $01;
  {$EXTERNALSYM AMETA_SHIFT_ON}
  
  { This mask is used to check whether the left SHIFT meta key is pressed.}
  AMETA_SHIFT_LEFT_ON = $40;
  {$EXTERNALSYM AMETA_SHIFT_LEFT_ON}
  
  { This mask is used to check whether the right SHIFT meta key is pressed.}
  AMETA_SHIFT_RIGHT_ON = $80;
  {$EXTERNALSYM AMETA_SHIFT_RIGHT_ON}
  
  { This mask is used to check whether the SYM meta key is pressed.}
  AMETA_SYM_ON = $04;
  {$EXTERNALSYM AMETA_SYM_ON}
  

{ Input event types.
}
const
  { Indicates that the input event is a key event.}
  AINPUT_EVENT_TYPE_KEY = 1;
  {$EXTERNALSYM AINPUT_EVENT_TYPE_KEY}
  
  { Indicates that the input event is a motion event.}
  AINPUT_EVENT_TYPE_MOTION = 2;
  {$EXTERNALSYM AINPUT_EVENT_TYPE_MOTION}

{ Key event actions.
}
const
  { The key has been pressed down.}
  AKEY_EVENT_ACTION_DOWN = 0;
  {$EXTERNALSYM AKEY_EVENT_ACTION_DOWN}
  
  { The key has been released.}
  AKEY_EVENT_ACTION_UP = 1;
  {$EXTERNALSYM AKEY_EVENT_ACTION_UP}
  
  { Multiple duplicate key events have occurred in a row, or a complex string is
    being delivered.  The repeat_count property of the key event contains the number
    of times the given key code should be executed.
  }
  AKEY_EVENT_ACTION_MULTIPLE = 2;
  {$EXTERNALSYM AKEY_EVENT_ACTION_MULTIPLE}
  

{ Key event flags.
}
const
  { This mask is set if the device woke because of this key event.}
  AKEY_EVENT_FLAG_WOKE_HERE = $1;
  {$EXTERNALSYM AKEY_EVENT_FLAG_WOKE_HERE}
  
  { This mask is set if the key event was generated by a software keyboard.}
  AKEY_EVENT_FLAG_SOFT_KEYBOARD = $2;
  {$EXTERNALSYM AKEY_EVENT_FLAG_SOFT_KEYBOARD}
  
  { This mask is set if we don't want the key event to cause us to leave touch mode.}
  AKEY_EVENT_FLAG_KEEP_TOUCH_MODE = $4;
  {$EXTERNALSYM AKEY_EVENT_FLAG_KEEP_TOUCH_MODE}
  
  { This mask is set if an event was known to come from a trusted part
    of the system.  That is, the event is known to come from the user,
    and could not have been spoofed by a third party component.}
  AKEY_EVENT_FLAG_FROM_SYSTEM = $8;
  {$EXTERNALSYM AKEY_EVENT_FLAG_FROM_SYSTEM}
  
  { This mask is used for compatibility, to identify enter keys that are
    coming from an IME whose enter key has been auto-labelled "next" or
    "done".  This allows TextView to dispatch these as normal enter keys
    for old applications, but still do the appropriate action when
    receiving them.}
  AKEY_EVENT_FLAG_EDITOR_ACTION = $10;
  {$EXTERNALSYM AKEY_EVENT_FLAG_EDITOR_ACTION}
  
  { When associated with up key events, this indicates that the key press
    has been canceled.  Typically this is used with virtual touch screen
    keys, where the user can slide from the virtual key area on to the
    display: in that case, the application will receive a canceled up
    event and should not perform the action normally associated with the
    key.  Note that for this to work, the application can not perform an
    action for a key until it receives an up or the long press timeout has
    expired.}
  AKEY_EVENT_FLAG_CANCELED = $20;
  {$EXTERNALSYM AKEY_EVENT_FLAG_CANCELED}
  
  { This key event was generated by a virtual (on-screen) hard key area.
    Typically this is an area of the touchscreen, outside of the regular
    display, dedicated to "hardware" buttons.}
  AKEY_EVENT_FLAG_VIRTUAL_HARD_KEY = $40;
  {$EXTERNALSYM AKEY_EVENT_FLAG_VIRTUAL_HARD_KEY}
  
  { This flag is set for the first key repeat that occurs after the
    long press timeout.}
  AKEY_EVENT_FLAG_LONG_PRESS = $80;
  {$EXTERNALSYM AKEY_EVENT_FLAG_LONG_PRESS}
  
  { Set when a key event has AKEY_EVENT_FLAG_CANCELED set because a long
    press action was executed while it was down.}
  AKEY_EVENT_FLAG_CANCELED_LONG_PRESS = $100;
  {$EXTERNALSYM AKEY_EVENT_FLAG_CANCELED_LONG_PRESS}
  
  { Set for AKEY_EVENT_ACTION_UP when this event's key code is still being
    tracked from its initial down.  That is, somebody requested that tracking
    started on the key down and a long press has not caused
    the tracking to be canceled.}
  AKEY_EVENT_FLAG_TRACKING = $200;
  {$EXTERNALSYM AKEY_EVENT_FLAG_TRACKING}
  


{ Motion event actions.
}

{ Bit shift for the action bits holding the pointer index as
  defined by AMOTION_EVENT_ACTION_PointerIndex_MASK.
}
const
  AMOTION_EVENT_ACTION_PointerIndex_SHIFT = 8;
  {$EXTERNALSYM AMOTION_EVENT_ACTION_PointerIndex_SHIFT}

const
  { Bit mask of the parts of the action code that are the action itself.
  }
  AMOTION_EVENT_ACTION_MASK = $ff;
  {$EXTERNALSYM AMOTION_EVENT_ACTION_MASK}

  { Bits in the action code that represent a pointer index, used with
    AMOTION_EVENT_ACTION_POINTER_DOWN and AMOTION_EVENT_ACTION_POINTER_UP.  Shifting
    down by AMOTION_EVENT_ACTION_PointerIndex_SHIFT provides the actual pointer
    index where the data for the pointer going up or down can be found.
  }
  AMOTION_EVENT_ACTION_PointerIndex_MASK = $ff00;
  {$EXTERNALSYM AMOTION_EVENT_ACTION_PointerIndex_MASK}

  { A pressed gesture has started, the motion contains the initial starting location.
  }
  AMOTION_EVENT_ACTION_DOWN = 0;
  {$EXTERNALSYM AMOTION_EVENT_ACTION_DOWN}

  { A pressed gesture has finished, the motion contains the final release location
    as well as any intermediate points since the last down or move event.
  }
  AMOTION_EVENT_ACTION_UP = 1;
  {$EXTERNALSYM AMOTION_EVENT_ACTION_UP}

  { A change has happened during a press gesture (between AMOTION_EVENT_ACTION_DOWN and
    AMOTION_EVENT_ACTION_UP).  The motion contains the most recent point, as well as
    any intermediate points since the last down or move event.
  }
  AMOTION_EVENT_ACTION_MOVE = 2;
  {$EXTERNALSYM AMOTION_EVENT_ACTION_MOVE}

  { The current gesture has been aborted.
    You will not receive any more points in it.  You should treat this as
    an up event, but not perform any action that you normally would.
  }
  AMOTION_EVENT_ACTION_CANCEL = 3;
  {$EXTERNALSYM AMOTION_EVENT_ACTION_CANCEL}

  { A movement has happened outside of the normal bounds of the UI element.
    This does not provide a full gesture, but only the initial location of the movement/touch.
  }
  AMOTION_EVENT_ACTION_OUTSIDE = 4;
  {$EXTERNALSYM AMOTION_EVENT_ACTION_OUTSIDE}

  { A non-primary pointer has gone down.
    The bits in AMOTION_EVENT_ACTION_PointerIndex_MASK indicate which pointer changed.
  }
  AMOTION_EVENT_ACTION_POINTER_DOWN = 5;
  {$EXTERNALSYM AMOTION_EVENT_ACTION_POINTER_DOWN}

  { A non-primary pointer has gone up.
    The bits in AMOTION_EVENT_ACTION_PointerIndex_MASK indicate which pointer changed.
  }
  AMOTION_EVENT_ACTION_POINTER_UP = 6;
  {$EXTERNALSYM AMOTION_EVENT_ACTION_POINTER_UP}


{ Motion event flags.
}

const
  { This flag indicates that the window that received this motion event is partly
    or wholly obscured by another visible window above it.  This flag is set to true
    even if the event did not directly pass through the obscured area.
    A security sensitive application can check this flag to identify situations in which
    a malicious application may have covered up part of its content for the purpose
    of misleading the user or hijacking touches.  An appropriate response might be
    to drop the suspect touches or to take additional precautions to confirm the user's
    actual intent.
  }
  AMOTION_EVENT_FLAG_WINDOW_IS_OBSCURED = $1;
  {$EXTERNALSYM AMOTION_EVENT_FLAG_WINDOW_IS_OBSCURED}

{ Motion event edge touch flags.
}

const
  { No edges intersected}
  AMOTION_EVENT_EDGE_FLAG_NONE = 0;
  {$EXTERNALSYM AMOTION_EVENT_EDGE_FLAG_NONE}

  { Flag indicating the motion event intersected the top edge of the screen.}
  AMOTION_EVENT_EDGE_FLAG_TOP = $01;
  {$EXTERNALSYM AMOTION_EVENT_EDGE_FLAG_TOP}

  { Flag indicating the motion event intersected the bottom edge of the screen.}
  AMOTION_EVENT_EDGE_FLAG_BOTTOM = $02;
  {$EXTERNALSYM AMOTION_EVENT_EDGE_FLAG_BOTTOM}

  { Flag indicating the motion event intersected the left edge of the screen.}
  AMOTION_EVENT_EDGE_FLAG_LEFT = $04;
  {$EXTERNALSYM AMOTION_EVENT_EDGE_FLAG_LEFT}

  { Flag indicating the motion event intersected the right edge of the screen.}
  AMOTION_EVENT_EDGE_FLAG_RIGHT = $08;
  {$EXTERNALSYM AMOTION_EVENT_EDGE_FLAG_RIGHT}


{ Input sources.
  
  Refer to the documentation on Androidapi.view.InputDevice for more details about input sources
  and their correct interpretation.
}

const
  AINPUT_SOURCE_CLASS_MASK = $000000ff;
  {$EXTERNALSYM AINPUT_SOURCE_CLASS_MASK}

  AINPUT_SOURCE_CLASS_BUTTON = $00000001;
  {$EXTERNALSYM AINPUT_SOURCE_CLASS_BUTTON}

  AINPUT_SOURCE_CLASS_POINTER = $00000002;
  {$EXTERNALSYM AINPUT_SOURCE_CLASS_POINTER}

  AINPUT_SOURCE_CLASS_NAVIGATION = $00000004;
  {$EXTERNALSYM AINPUT_SOURCE_CLASS_NAVIGATION}

  AINPUT_SOURCE_CLASS_POSITION = $00000008;
  {$EXTERNALSYM AINPUT_SOURCE_CLASS_POSITION}


const
  AINPUT_SOURCE_UNKNOWN = $00000000;
  {$EXTERNALSYM AINPUT_SOURCE_UNKNOWN}

  AINPUT_SOURCE_KEYBOARD = $00000100 or AINPUT_SOURCE_CLASS_BUTTON;
  {$EXTERNALSYM AINPUT_SOURCE_KEYBOARD}

  AINPUT_SOURCE_DPAD = $00000200 or AINPUT_SOURCE_CLASS_BUTTON;
  {$EXTERNALSYM AINPUT_SOURCE_DPAD}

  AINPUT_SOURCE_TOUCHSCREEN = $00001000 or AINPUT_SOURCE_CLASS_POINTER;
  {$EXTERNALSYM AINPUT_SOURCE_TOUCHSCREEN}

  AINPUT_SOURCE_MOUSE = $00002000 or AINPUT_SOURCE_CLASS_POINTER;
  {$EXTERNALSYM AINPUT_SOURCE_MOUSE}

  AINPUT_SOURCE_TRACKBALL = $00010000 or AINPUT_SOURCE_CLASS_NAVIGATION;
  {$EXTERNALSYM AINPUT_SOURCE_TRACKBALL}

  AINPUT_SOURCE_TOUCHPAD = $00100000 or AINPUT_SOURCE_CLASS_POSITION;
  {$EXTERNALSYM AINPUT_SOURCE_TOUCHPAD}

  AINPUT_SOURCE_ANY = $ffffff00;
  {$EXTERNALSYM AINPUT_SOURCE_ANY}


{ Keyboard types.
  
  Refer to the documentation on Androidapi.view.InputDevice for more details.
}

const
  AINPUT_KEYBOARD_TYPE_NONE = 0;
  {$EXTERNALSYM AINPUT_KEYBOARD_TYPE_NONE}

  AINPUT_KEYBOARD_TYPE_NON_ALPHABETIC = 1;
  {$EXTERNALSYM AINPUT_KEYBOARD_TYPE_NON_ALPHABETIC}

  AINPUT_KEYBOARD_TYPE_ALPHABETIC = 2;
  {$EXTERNALSYM AINPUT_KEYBOARD_TYPE_ALPHABETIC}


{ Constants used to retrieve information about the range of motion for a particular
  coordinate of a motion event.
  
  Refer to the documentation on Androidapi.view.InputDevice for more details about input sources
  and their correct interpretation.
}

const
  AINPUT_MOTION_RANGE_X = 0;
  {$EXTERNALSYM AINPUT_MOTION_RANGE_X}

  AINPUT_MOTION_RANGE_Y = 1;
  {$EXTERNALSYM AINPUT_MOTION_RANGE_Y}

  AINPUT_MOTION_RANGE_PRESSURE = 2;
  {$EXTERNALSYM AINPUT_MOTION_RANGE_PRESSURE}

  AINPUT_MOTION_RANGE_SIZE = 3;
  {$EXTERNALSYM AINPUT_MOTION_RANGE_SIZE}

  AINPUT_MOTION_RANGE_TOUCH_MAJOR = 4;
  {$EXTERNALSYM AINPUT_MOTION_RANGE_TOUCH_MAJOR}

  AINPUT_MOTION_RANGE_TOUCH_MINOR = 5;
  {$EXTERNALSYM AINPUT_MOTION_RANGE_TOUCH_MINOR}

  AINPUT_MOTION_RANGE_TOOL_MAJOR = 6;
  {$EXTERNALSYM AINPUT_MOTION_RANGE_TOOL_MAJOR}

  AINPUT_MOTION_RANGE_TOOL_MINOR = 7;
  {$EXTERNALSYM AINPUT_MOTION_RANGE_TOOL_MINOR}

  AINPUT_MOTION_RANGE_ORIENTATION = 8;
  {$EXTERNALSYM AINPUT_MOTION_RANGE_ORIENTATION}


type
  { An input queue is the facility through which you retrieve input
    events.
  }
  AInputQueue = record end;
  {$EXTERNALSYM AInputQueue}

  PAInputQueue = ^AInputQueue;

  { Input events are opaque structures.  Use the provided accessors functions to
    read their properties.
  }
  AInputEvent = record end;
  {$EXTERNALSYM AInputEvent}

  PAInputEvent = ^AInputEvent;
  PPAInputEvent = ^PAInputEvent;


{ Input event accessors.
  
  Note that most functions can only be used on input events that are of a given type.
  Calling these functions on input events of other types will yield undefined behavior.
}

{ Accessors for all input events. }

{ Get the input event type.}

function AInputEvent_getType(Event: PAinputEvent): Int32; cdecl;
  external AndroidLib name 'AInputEvent_getType';
{$EXTERNALSYM AInputEvent_getType}

{ Get the id for the device that an input event came from.

  Input events can be generated by multiple different input devices.
  Use the input device id to obtain information about the input
  device that was responsible for generating a particular event.
  
  An input device id of 0 indicates that the event didn't come from a physical device;
  other numbers are arbitrary and you shouldn't depend on the values.
  Use the provided input device query API to obtain information about input devices.
}
function AInputEvent_getDeviceId(Event: PAinputEvent): Int32; cdecl;
  external AndroidLib name 'AInputEvent_getDeviceId';
{$EXTERNALSYM AInputEvent_getDeviceId}

{ Get the input event source.}
function AInputEvent_getSource(Event: PAinputEvent): Int32; cdecl;
  external AndroidLib name 'AInputEvent_getSource';
{$EXTERNALSYM AInputEvent_getSource}

{ Accessors for key events only. }

{ Get the key event action.}

function AKeyEvent_getAction(KeyEvent: PAInputEvent): Int32; cdecl;
  external AndroidLib name 'AKeyEvent_getAction';
{$EXTERNALSYM AKeyEvent_getAction}

{ Get the key event flags.}

function AKeyEvent_getFlags(KeyEvent: PAInputEvent): Int32; cdecl;
  external AndroidLib name 'AKeyEvent_getFlags';
{$EXTERNALSYM AKeyEvent_getFlags}

{ Get the key code of the key event.
  This is the physical key that was pressed, not the Unicode character.}

function AKeyEvent_getKeyCode(KeyEvent: PAInputEvent): Int32; cdecl;
  external AndroidLib name 'AKeyEvent_getKeyCode';
{$EXTERNALSYM AKeyEvent_getKeyCode}

{ Get the hardware key id of this key event.
  These values are not reliable and vary from device to device.}

function AKeyEvent_getScanCode(KeyEvent: PAInputEvent): Int32; cdecl;
  external AndroidLib name 'AKeyEvent_getScanCode';
{$EXTERNALSYM AKeyEvent_getScanCode}

{ Get the meta key state.}

function AKeyEvent_getMetaState(KeyEvent: PAInputEvent): Int32; cdecl;
  external AndroidLib name 'AKeyEvent_getMetaState';
{$EXTERNALSYM AKeyEvent_getMetaState}

{ Get the repeat count of the event.
  For both key up an key down events, this is the number of times the key has
  repeated with the first down starting at 0 and counting up from there.  For
  multiple key events, this is the number of down/up pairs that have occurred.}

function AKeyEvent_getRepeatCount(KeyEvent: PAInputEvent): Int32; cdecl;
  external AndroidLib name 'AKeyEvent_getRepeatCount';
{$EXTERNALSYM AKeyEvent_getRepeatCount}

{ Get the time of the most recent key down event, in the
  java.lang.System.nanoTime() time base.  If this is a down event,
  this will be the same as eventTime.
  Note that when chording keys, this value is the down time of the most recently
  pressed key, which may not be the same physical key of this event.}

function AKeyEvent_getDownTime(KeyEvent: PAInputEvent): Int64; cdecl;
  external AndroidLib name 'AKeyEvent_getDownTime';
{$EXTERNALSYM AKeyEvent_getDownTime}

{ Get the time this event occurred, in the
  java.lang.System.nanoTime() time base.}

function AKeyEvent_getEventTime(KeyEvent: PAInputEvent): Int64; cdecl;
  external AndroidLib name 'AKeyEvent_getEventTime';
{$EXTERNALSYM AKeyEvent_getEventTime}

{ Accessors for motion events only. }

{ Get the combined motion event action code and pointer index.}

function AMotionEvent_getAction(MotionEvent: PAInputEvent): Int32; cdecl;
  external AndroidLib name 'AMotionEvent_getAction';
{$EXTERNALSYM AMotionEvent_getAction}

{ Get the motion event flags.}

function AMotionEvent_getFlags(MotionEvent: PAInputEvent): Int32; cdecl;
  external AndroidLib name 'AMotionEvent_getFlags';
{$EXTERNALSYM AMotionEvent_getFlags}

{ Get the state of any meta / modifier keys that were in effect when the
  event was generated.}

function AMotionEvent_getMetaState(MotionEvent: PAInputEvent): Int32; cdecl;
  external AndroidLib name 'AMotionEvent_getMetaState';
{$EXTERNALSYM AMotionEvent_getMetaState}

{ Get a bitfield indicating which edges, if any, were touched by this motion event.
  For touch events, clients can use this to determine if the user's finger was
  touching the edge of the display.}

function AMotionEvent_getEdgeFlags(MotionEvent: PAInputEvent): Int32; cdecl;
  external AndroidLib name 'AMotionEvent_getEdgeFlags';
{$EXTERNALSYM AMotionEvent_getEdgeFlags}

{ Get the time when the user originally pressed down to start a stream of
  position events, in the java.lang.System.nanoTime() time base.}

function AMotionEvent_getDownTime(MotionEvent: PAInputEvent): Int64; cdecl;
  external AndroidLib name 'AMotionEvent_getDownTime';
{$EXTERNALSYM AMotionEvent_getDownTime}

{ Get the time when this specific event was generated,
  in the java.lang.System.nanoTime() time base.}

function AMotionEvent_getEventTime(MotionEvent: PAInputEvent): Int64; cdecl;
  external AndroidLib name 'AMotionEvent_getEventTime';
{$EXTERNALSYM AMotionEvent_getEventTime}

{ Get the X coordinate offset.
  For touch events on the screen, this is the delta that was added to the raw
  screen coordinates to adjust for the absolute position of the containing windows
  and views.}

function AMotionEvent_getXOffset(MotionEvent: PAInputEvent): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getXOffset';
{$EXTERNALSYM AMotionEvent_getXOffset}

{ Get the precision of the Y coordinates being reported.
  For touch events on the screen, this is the delta that was added to the raw
  screen coordinates to adjust for the absolute position of the containing windows
  and views.}

function AMotionEvent_getYOffset(MotionEvent: PAInputEvent): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getYOffset';
{$EXTERNALSYM AMotionEvent_getYOffset}

{ Get the precision of the X coordinates being reported.
  You can multiply this number with an X coordinate sample to find the
  actual hardware value of the X coordinate.}

function AMotionEvent_getXPrecision(MotionEvent: PAInputEvent): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getXPrecision';
{$EXTERNALSYM AMotionEvent_getXPrecision}

{ Get the precision of the Y coordinates being reported.
  You can multiply this number with a Y coordinate sample to find the
  actual hardware value of the Y coordinate.}

function AMotionEvent_getYPrecision(MotionEvent: PAInputEvent): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getYPrecision';
{$EXTERNALSYM AMotionEvent_getYPrecision}

{ Get the number of pointers of data contained in this event.
  Always >= 1.}

function AMotionEvent_getPointerCount(MotionEvent: PAInputEvent): size_t; cdecl;
  external AndroidLib name 'AMotionEvent_getPointerCount';
{$EXTERNALSYM AMotionEvent_getPointerCount}

{ Get the pointer identifier associated with a particular pointer
  data index is this event.  The identifier tells you the actual pointer
  number associated with the data, accounting for individual pointers
  going up and down since the start of the current gesture.}

function AMotionEvent_getPointerId(MotionEvent: PAInputEvent; PointerIndex: size_t): Int32; cdecl;
  external AndroidLib name 'AMotionEvent_getPointerId';
{$EXTERNALSYM AMotionEvent_getPointerId}

{ Get the original raw X coordinate of this event.
  For touch events on the screen, this is the original location of the event
  on the screen, before it had been adjusted for the containing window
  and views.}

function AMotionEvent_getRawX(MotionEvent: PAInputEvent; PointerIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getRawX';
{$EXTERNALSYM AMotionEvent_getRawX}

{ Get the original raw X coordinate of this event.
  For touch events on the screen, this is the original location of the event
  on the screen, before it had been adjusted for the containing window
  and views.}

function AMotionEvent_getRawY(MotionEvent: PAInputEvent; PointerIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getRawY';
{$EXTERNALSYM AMotionEvent_getRawY}

{ Get the current X coordinate of this event for the given pointer index.
  Whole numbers are pixels; the value may have a fraction for input devices
  that are sub-pixel precise.}

function AMotionEvent_getX(MotionEvent: PAInputEvent; PointerIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getX';
{$EXTERNALSYM AMotionEvent_getX}

{ Get the current Y coordinate of this event for the given pointer index.
  Whole numbers are pixels; the value may have a fraction for input devices
  that are sub-pixel precise.}

function AMotionEvent_getY(MotionEvent: PAInputEvent; PointerIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getY';
{$EXTERNALSYM AMotionEvent_getY}

{ Get the current pressure of this event for the given pointer index.
  The pressure generally ranges from 0 (no pressure at all) to 1 (normal pressure),
  however values higher than 1 may be generated depending on the calibration of
  the input device.}

function AMotionEvent_getPressure(MotionEvent: PAInputEvent; PointerIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getPressure';
{$EXTERNALSYM AMotionEvent_getPressure}

{ Get the current scaled value of the approximate size for the given pointer index.
  This represents some approximation of the area of the screen being
  pressed; the actual value in pixels corresponding to the
  touch is normalized with the device specific range of values
  and scaled to a value between 0 and 1.  The value of size can be used to
  determine fat touch events.}

function AMotionEvent_getSize(MotionEvent: PAInputEvent; PointerIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getSize';
{$EXTERNALSYM AMotionEvent_getSize}

{ Get the current length of the major axis of an ellipse that describes the touch area
  at the point of contact for the given pointer index.}

function AMotionEvent_getTouchMajor(MotionEvent: PAInputEvent; PointerIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getTouchMajor';
{$EXTERNALSYM AMotionEvent_getTouchMajor}

{ Get the current length of the minor axis of an ellipse that describes the touch area
  at the point of contact for the given pointer index.}

function AMotionEvent_getTouchMinor(MotionEvent: PAInputEvent; PointerIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getTouchMinor';
{$EXTERNALSYM AMotionEvent_getTouchMinor}

{ Get the current length of the major axis of an ellipse that describes the size
  of the approaching tool for the given pointer index.
  The tool area represents the estimated size of the finger or pen that is
  touching the device independent of its actual touch area at the point of contact.}

function AMotionEvent_getToolMajor(MotionEvent: PAInputEvent; PointerIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getToolMajor';
{$EXTERNALSYM AMotionEvent_getToolMajor}

{ Get the current length of the minor axis of an ellipse that describes the size
  of the approaching tool for the given pointer index.
  The tool area represents the estimated size of the finger or pen that is
  touching the device independent of its actual touch area at the point of contact.}

function AMotionEvent_getToolMinor(MotionEvent: PAInputEvent; PointerIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getToolMinor';
{$EXTERNALSYM AMotionEvent_getToolMinor}

{ Get the current orientation of the touch area and tool area in radians clockwise from
  vertical for the given pointer index.
  An angle of 0 degrees indicates that the major axis of contact is oriented
  upwards, is perfectly circular or is of unknown orientation.  A positive angle
  indicates that the major axis of contact is oriented to the right.  A negative angle
  indicates that the major axis of contact is oriented to the left.
  The full range is from -PI/2 radians (finger pointing fully left) to PI/2 radians
  (finger pointing fully right).}

function AMotionEvent_getOrientation(MotionEvent: PAInputEvent; PointerIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getOrientation';
{$EXTERNALSYM AMotionEvent_getOrientation}

{ Get the number of historical points in this event.  These are movements that
  have occurred between this event and the previous event.  This only applies
  to AMOTION_EVENT_ACTION_MOVE events -- all other actions will have a size of 0.
  Historical samples are indexed from oldest to newest.}

function AMotionEvent_getHistorySize(MotionEvent: PAInputEvent): size_t; cdecl;
  external AndroidLib name 'AMotionEvent_getHistorySize';
{$EXTERNALSYM AMotionEvent_getHistorySize}

{ Get the time that a historical movement occurred between this event and
  the previous event, in the java.lang.System.nanoTime() time base.}

function AMotionEvent_getHistoricalEventTime(MotionEvent: PAInputEvent; HistoryIndex: size_t): Int64; cdecl;
  external AndroidLib name 'AMotionEvent_getHistoricalEventTime';
{$EXTERNALSYM AMotionEvent_getHistoricalEventTime}

                                                                           
{ Get the historical raw X coordinate of this event for the given pointer index that
  occurred between this event and the previous motion event.
  For touch events on the screen, this is the original location of the event
  on the screen, before it had been adjusted for the containing window
  and views.
  Whole numbers are pixels; the value may have a fraction for input devices
  that are sub-pixel precise.}
  
{
function AMotionEvent_getHistoricalRawX(MotionEvent: PAInputEvent; PointerIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getHistoricalRawX';
{$EXTERNALSYM AMotionEvent_getHistoricalRawX}


                                                                           
{ Get the historical raw Y coordinate of this event for the given pointer index that
  occurred between this event and the previous motion event.
  For touch events on the screen, this is the original location of the event
  on the screen, before it had been adjusted for the containing window
  and views.
  Whole numbers are pixels; the value may have a fraction for input devices
  that are sub-pixel precise.}
{
function AMotionEvent_getHistoricalRawY(MotionEvent: PAInputEvent; PointerIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getHistoricalRawY';
{$EXTERNALSYM AMotionEvent_getHistoricalRawY}

{ Get the historical X coordinate of this event for the given pointer index that
  occurred between this event and the previous motion event.
  Whole numbers are pixels; the value may have a fraction for input devices
  that are sub-pixel precise.}

function AMotionEvent_getHistoricalX(MotionEvent: PAInputEvent; PointerIndex, HistoryIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getHistoricalX';
{$EXTERNALSYM AMotionEvent_getHistoricalX}

{ Get the historical Y coordinate of this event for the given pointer index that
  occurred between this event and the previous motion event.
  Whole numbers are pixels; the value may have a fraction for input devices
  that are sub-pixel precise.}

function AMotionEvent_getHistoricalY(MotionEvent: PAInputEvent; PointerIndex, HistoryIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getHistoricalY';
{$EXTERNALSYM AMotionEvent_getHistoricalY}

{ Get the historical pressure of this event for the given pointer index that
  occurred between this event and the previous motion event.
  The pressure generally ranges from 0 (no pressure at all) to 1 (normal pressure),
  however values higher than 1 may be generated depending on the calibration of
  the input device.}

function AMotionEvent_getHistoricalPressure(MotionEvent: PAInputEvent; PointerIndex, HistoryIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getHistoricalPressure';
{$EXTERNALSYM AMotionEvent_getHistoricalPressure}

{ Get the current scaled value of the approximate size for the given pointer index that
  occurred between this event and the previous motion event.
  This represents some approximation of the area of the screen being
  pressed; the actual value in pixels corresponding to the
  touch is normalized with the device specific range of values
  and scaled to a value between 0 and 1.  The value of size can be used to
  determine fat touch events.}

function AMotionEvent_getHistoricalSize(MotionEvent: PAInputEvent; PointerIndex, HistoryIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getHistoricalSize';
{$EXTERNALSYM AMotionEvent_getHistoricalSize}

                                                                           
{ Get the historical length of the major axis of an ellipse that describes the touch area
  at the point of contact for the given pointer index that
  occurred between this event and the previous motion event.}
{
function AMotionEvent_getHistoricalTouchMajor(MotionEvent: PAInputEvent; PointerIndex, HistoryIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getHistoricalTouchMajor';
{$EXTERNALSYM AMotionEvent_getHistoricalTouchMajor}


                                                                           
{ Get the historical length of the minor axis of an ellipse that describes the touch area
  at the point of contact for the given pointer index that
  occurred between this event and the previous motion event.}
{
function AMotionEvent_getHistoricalTouchMinor(MotionEvent: PAInputEvent; PointerIndex, HistoryIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getHistoricalTouchMinor';
{$EXTERNALSYM AMotionEvent_getHistoricalTouchMinor}


                                                                           
{ Get the historical length of the major axis of an ellipse that describes the size
  of the approaching tool for the given pointer index that
  occurred between this event and the previous motion event.
  The tool area represents the estimated size of the finger or pen that is
  touching the device independent of its actual touch area at the point of contact.}
{
function AMotionEvent_getHistoricalToolMajor(MotionEvent: PAInputEvent; PointerIndex, HistoryIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getHistoricalToolMajor';
{$EXTERNALSYM AMotionEvent_getHistoricalToolMajor}


                                                                           
{ Get the historical length of the minor axis of an ellipse that describes the size
  of the approaching tool for the given pointer index that
  occurred between this event and the previous motion event.
  The tool area represents the estimated size of the finger or pen that is
  touching the device independent of its actual touch area at the point of contact.}
{
function AMotionEvent_getHistoricalToolMinor(MotionEvent: PAInputEvent; PointerIndex, HistoryIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getHistoricalToolMinor';
{$EXTERNALSYM AMotionEvent_getHistoricalToolMinor}


                                                                           
{ Get the historical orientation of the touch area and tool area in radians clockwise from
  vertical for the given pointer index that
  occurred between this event and the previous motion event.
  An angle of 0 degrees indicates that the major axis of contact is oriented
  upwards, is perfectly circular or is of unknown orientation.  A positive angle
  indicates that the major axis of contact is oriented to the right.  A negative angle
  indicates that the major axis of contact is oriented to the left.
  The full range is from -PI/2 radians (finger pointing fully left) to PI/2 radians
  (finger pointing fully right).}
{
function AMotionEvent_getHistoricalOrientation(MotionEvent: PAInputEvent; PointerIndex, HistoryIndex: size_t): Single; cdecl;
  external AndroidLib name 'AMotionEvent_getHistoricalOrientation';
{$EXTERNALSYM AMotionEvent_getHistoricalOrientation}



  { Add this input queue to a looper for processing.  See
  ALooper_addFd() for information on the ident, callback, and data params.
}
procedure AInputQueue_attachLooper(const Queue: PAInputQueue; Looper: PALooper; Ident: Integer; Callback: ALooper_callbackFunc; Data: Pointer); cdecl;
  external AndroidLib name 'AInputQueue_attachLooper';
{$EXTERNALSYM AInputQueue_attachLooper}

{ Remove the input queue from the looper it is currently attached to.
}

procedure AInputQueue_detachLooper(const Queue: PAInputQueue); cdecl;
  external AndroidLib name 'AInputQueue_detachLooper';
{$EXTERNALSYM AInputQueue_detachLooper}

{ Returns true if there are one or more events available in the
  input queue.  Returns 1 if the queue has events; 0 if
  it does not have events; and a negative value if there is an error.
}

function AInputQueue_hasEvents(const Queue: PAInputQueue): Int32; cdecl;
  external AndroidLib name 'AInputQueue_hasEvents';
{$EXTERNALSYM AInputQueue_hasEvents}

{ Returns the next available event from the queue.  Returns a negative
  value if no events are available or an error has occurred.
}
function AInputQueue_getEvent(const Queue: PAInputQueue; OutEvent: PPAInputEvent): Int32; cdecl;
  external AndroidLib name 'AInputQueue_getEvent';
{$EXTERNALSYM AInputQueue_getEvent}

{ Sends the key for standard pre-dispatching -- that is, possibly deliver
  it to the current IME to be consumed before the app.  Returns 0 if it
  was not pre-dispatched, meaning you can process it right now.  If non-zero
  is returned, you must abandon the current event processing and allow the
  event to appear again in the event queue (if it does not get consumed during
  pre-dispatching).
}
function AInputQueue_preDispatchEvent(const Queue: PAInputQueue; Event: PAinputEvent): Int32; cdecl;
  external AndroidLib name 'AInputQueue_preDispatchEvent';
{$EXTERNALSYM AInputQueue_preDispatchEvent}

{ Report that dispatching has finished with the given event.
  This must be called after receiving an event with AInputQueue_get_event().
}

procedure AInputQueue_finishEvent(const Queue: PAInputQueue; Event: PAinputEvent; Handled: Integer); cdecl;
  external AndroidLib name 'AInputQueue_finishEvent';
{$EXTERNALSYM AInputQueue_finishEvent}

implementation

end.
