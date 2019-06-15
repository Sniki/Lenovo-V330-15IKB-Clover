// VoodooI2C (TPD0) Patch for Lenovo V330-15IKB with ELAN I2C Precision TouchPad.

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "V330", "_I2C", 0)
{
#endif
    External(_SB.PCI0.I2C0, DeviceObj)
    External(_SB.PCI0.I2C0.TPD0, DeviceObj)
    External(HIDG, FieldUnitObj)
    External(HID2, FieldUnitObj)
    External(HIDD, MethodObj)
    External(TP7G, FieldUnitObj)
    External(TP7D, MethodObj)
    External(SBFB, FieldUnitObj)
    Scope(_SB.PCI0.I2C0)
    {
         Scope(TPD0)
         {
            // SBFX is modified SBFG
            Name (SBFX, ResourceTemplate ()
            {
                GpioInt(Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                   )
                   {   // Pin list
                       0x001B
                   }
            })
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg0, HIDG))
                {
                    Return (HIDD (Arg0, Arg1, Arg2, Arg3, HID2))
                }

                If (LEqual (Arg0, TP7G))
                {
                    Return (TP7D (Arg0, Arg1, Arg2, Arg3, SBFB, SBFX))
                }

                Return (Buffer (One)
                {
                     0x00                                          
                })
            }
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (ConcatenateResTemplate (SBFB, SBFX))
            }
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
