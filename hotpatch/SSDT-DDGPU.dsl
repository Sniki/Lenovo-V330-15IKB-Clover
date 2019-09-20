// Disable the Discrete GPU (AMD Radeon 530)

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "V330", "_DDGPU", 0)
{
#endif
    
    External (_SB_.PCI0.RP01.PEGP.HGOF, MethodObj)
    Device(RMD1)
    {
        Name(_HID, "RMD10000")
        Method(_INI)
        {
            If (CondRefOf (\_SB.PCI0.RP01.PEGP.HGOF))
            {
                \_SB.PCI0.RP01.PEGP.HGOF (Zero)
            }
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
