// Lenovo V330-15IKB Auto Star after Shutdown Fix when a USB is plugged in

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "V330", "_PTS", 0)
{
#endif
    External (_SB_.PCI0.XHC_.PMEE, FieldUnitObj)
    External (ZPTS, MethodObj)
    Method(_PTS, 1)
    {
        ZPTS(Arg0)
        If (5 == Arg0)
        {
            \_SB.PCI0.XHC.PMEE = Zero
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
