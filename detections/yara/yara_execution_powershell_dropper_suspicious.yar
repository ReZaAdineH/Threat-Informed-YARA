rule SUSP_PowerShell_Dropper_Strings
{
    meta:
        author = "Reza Adineh"
        description = "Detects script artifacts containing common suspicious PowerShell downloader and obfuscation strings"
        status = "experimental"
        severity = "medium"
        attack = "T1059.001, T1105, T1027"
        date = "2026-06-30"

    strings:
        $a1 = "FromBase64String" ascii wide nocase
        $a2 = "IEX" ascii wide nocase
        $a3 = "Invoke-Expression" ascii wide nocase
        $a4 = "DownloadString" ascii wide nocase
        $a5 = "DownloadFile" ascii wide nocase
        $a6 = "System.Net.WebClient" ascii wide nocase
        $a7 = "-EncodedCommand" ascii wide nocase

    condition:
        4 of them
}
