// USB power properties via USBX device

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "V330", "_USBX", 0)
{
#endif
    Device(_SB.USBX)
    {
        Name(_ADR, 0)
        Method (_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                // these values from MacBookPro14,1
                "kUSBSleepPortCurrentLimit", 3000,
                "kUSBWakePortCurrentLimit", 3000,
            })
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF