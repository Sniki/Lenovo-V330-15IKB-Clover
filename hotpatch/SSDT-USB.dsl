// USB Port Injector for Lenovo V330-15IKB.
// Injects Fake EC Device.
// Injects USBX Device with USB Power Properties.
// Disables auto restart after shutdown when USB device Plugged In.

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "V330", "_USB", 0)
{
#endif
    External (_SB_.PCI0.XHC_.PMEE, FieldUnitObj)
    External (ZPTS, MethodObj)
    
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            "8086_9d2f", Package()
            {
                "port-count", Buffer() { 18, 0, 0, 0 },
                "ports", Package()
                {
                    "HS01", Package() // USB2 Right Side
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                    "HS02", Package() // USB2 Left Side
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 2, 0, 0, 0 },
                    },
                    "HS03", Package() // USB-C 2.0 (Left Top)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 3, 0, 0, 0 },
                    },
                    "HS04", Package() // USB-C 2.0 (Left Bottom)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 4, 0, 0, 0 },
                    },
                    "HS05", Package() // Integrated Camera
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 5, 0, 0, 0 },
                    },
                    "HS06", Package() // Card Reader
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 6, 0, 0, 0 },
                    },
                    "HS08", Package() // Bluetooth
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 8, 0, 0, 0 },
                    },
                    "SS01", Package() // USB3 Right Side
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 13, 0, 0, 0 },
                    },
                    "SS02", Package() // USB3 Left Side
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 14, 0, 0, 0 },
                    },
                    "SS03", Package() // USB-C 3.0 (Top Left)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 15, 0, 0, 0 },
                    },
                    "SS04", Package() // USB-C 3.0 (Bottom Left)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 16, 0, 0, 0 },
                    },
                },
            },
        })
    }
    // Inject Fake EC device
    Device(_SB.EC)
    {
        Name(_HID, "EC000000")
    }
    // USB Power Properties
    Device(_SB.USBX)
    {
        Name(_ADR, 0)
        Method (_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                // these values from MacBookPro14,3
                "kUSBSleepPortCurrentLimit", 3000,
                "kUSBWakePortCurrentLimit", 3000,
            })
        }
    }
    // Auto Start after Shutdown fix when USB device Plugged In.       
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
