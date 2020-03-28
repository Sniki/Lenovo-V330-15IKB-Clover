// Lenovo V330-15IKB Elan Touchpad Fix

DefinitionBlock ("", "SSDT", 2, "V330", "_I2C", 0)
{
    External (SDM0, IntObj)    
    Scope (_SB)
    {
        Method (_INI, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                SDM0 = Zero
            }
        }
    }
}
