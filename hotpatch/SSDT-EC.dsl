// Inject Fake EC Device

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "V330", "_EC", 0)
{
#endif
    External (_SB_.PCI0.LPCB, DeviceObj)

    Scope (\_SB.PCI0.LPCB)
    {
        Device (EC)
        {
            Name (_HID, "ACID0001")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
