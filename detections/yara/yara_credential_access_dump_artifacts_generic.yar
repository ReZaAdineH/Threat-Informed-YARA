rule SUSP_Credential_Dump_Artifact_Generic
{
    meta:
        author = "Reza Adineh"
        description = "Generic strings seen in credential access and dumping tooling artifacts"
        status = "experimental"
        severity = "high"
        attack = "T1003"
        date = "2026-06-30"

    strings:
        $s1 = "sekurlsa" ascii wide nocase
        $s2 = "logonpasswords" ascii wide nocase
        $s3 = "lsass" ascii wide nocase
        $s4 = "privilege::debug" ascii wide nocase
        $s5 = "minidump" ascii wide nocase
        $s6 = "kerberos" ascii wide nocase

    condition:
        3 of them
}
