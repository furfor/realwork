unit vtShockwaveFlashEx;

interface

{$If not defined(NoFlash)}
uses
  vtShockwaveEx
  ;

type
  TvtShockwaveFlashEx = vtShockwaveEx.TvtShockwaveFlashEx;
{$IfEnd}

implementation

  {$If not defined(NoScripts)}
  uses
   vtFlashWordsPack
  ;
  {$IfEnd} //not NoScripts

end.