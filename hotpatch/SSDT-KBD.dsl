// Lenovo V330-15IKB Keyboard Map

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "V330", "_KBD", 0)
{
#endif
    External (_SB.PCI0.LPCB.EC0, DeviceObj)
    External (_SB.PCI0.LPCB.KBD0, DeviceObj)

    Scope (_SB.PCI0.LPCB.EC0)
    {
        Method (_Q1C, 0, NotSerialized) // Brightness Up
        {
            Notify (KBD0, 0x0406)
        }
        Method (_Q1D, 0, NotSerialized) // Brightness Down
        {
            Notify (KBD0, 0x0405)
        }
        Method (_Q3D, 0, NotSerialized) // Mic Mute (F4) - "Siri Shortcut"
        {
            Notify (KBD0, 0x033E)
        }
        Method (_Q28, 0, NotSerialized) // Airplane Mode (F17) "Notification Center"
        {
            Notify (KBD0, 0x0368)
        }
        Method (_Q2E, 0, NotSerialized) // Lock (F18) "System Preferences"
        {
            Notify (KBD0, 0x036A)
        }
    }

    Scope (_SB.PCI0.LPCB.KBD0)
    {
        Name (RMCF, Package ()
        {
            "Keyboard", 
            Package ()
            {
                "Breakless PS2", Package()
                {
                    Package(){}, //indicating array
                    "e06a", // Fn+F9
                    "e06b", // Fn+F10
                    "e02e", // Volume Down
                    "e030", // Volume Up

                },
                "MaximumMacroTime", 25000000,
                "Macro Inversion", Package()
                {
                    Package(){},
                    // Fn+F9
                    Buffer() { 0xff, 0xff, 0x02, 0x6a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x5b, 0x01, 0x26 },
                    Buffer() { 0xff, 0xff, 0x02, 0xea, 0x00, 0x00, 0x00, 0x00, 0x01, 0x99, 0x02, 0xdb },
                    // Fn+F10
                    Buffer() { 0xff, 0xff, 0x02, 0x6b, 0x00, 0x00, 0x00, 0x00, 0x02, 0x5b, 0x01, 0x19 },
                    Buffer() { 0xff, 0xff, 0x02, 0xeb, 0x00, 0x00, 0x00, 0x00, 0x01, 0x99, 0x02, 0xdb },
                },
                "Custom ADB Map", Package()
                {
                    Package(){},
                    "e06a=4f", // F18 (Lock) - System Preferences
                    "e06b=70", // Video Mirror
                },
                "Custom PS2 Map", 
                Package ()
                {
                    Package (){}, 
                    "e037=64" // PrtSC (F13) - Save selected area as screenshot
                }
            }
        })
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
