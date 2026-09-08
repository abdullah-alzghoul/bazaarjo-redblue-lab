rule Detect_Bazaarjo_PHP_Webshell {
    meta:
        description = "Detects malicious PHP webshells uploaded to VM1 target"
        author = "Osama - Blue Team"
        date = "2026-09-08"
        severity = "HIGH"

    strings:
        $php_tag = "<?php" ascii
        $func1 = "system(" ascii
        $func2 = "exec(" ascii
        $func3 = "passthru(" ascii
        $param = "$_REQUEST" ascii

    condition:
        $php_tag and $param and 1 of ($func1, $func2, $func3)
}
