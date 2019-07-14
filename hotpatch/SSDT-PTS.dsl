// Fix Auto Start after Shutdown when USB device Plugged In

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "V330", "_USB", 0)
{
#endif
    External (_SB_.PCI0.XHC_.PMEE, FieldUnitObj)
    External (ZPTS, MethodObj)
    
    Method(_PTS, 1)
    {
        ZPTS(Arg0)
        If (5 == Arg0)
        {
            \_SB.PCI0.XHC.PMEE = 0
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
