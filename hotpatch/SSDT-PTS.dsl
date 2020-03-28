// Fix Auto Start after Shutdown if a USB device is plugged In

DefinitionBlock ("", "SSDT", 2, "V330", "_PTS", 0)
{
    External (_SB.PCI0.XHC.PMEE, FieldUnitObj)
    External (ZPTS, MethodObj)
    
    Method (_PTS, 1, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            If (0x05 == Arg0)
            {
                \_SB.PCI0.XHC.PMEE = 0
            }
        }
        ZPTS (Arg0)
    }
}
