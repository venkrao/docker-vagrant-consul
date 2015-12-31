<!doctype html>
<html>
<head>
<style type="text/css">
tr {
        text-align:center;
}
h3 {
        font-weight:normal;
}
</style>
<title>Simple webapp with database configuration resolved by service discovery, Consul</title>
</head>
<body style="width:50%;margin:0 auto;">
<div style="width:100%; margin: 0 auto; background-color:#F1F1F1; padding:4%;">
<?php
$h = "mysql.service.consul";
$u = "readonly";
$p = "password";
$db = "telephone_dictionary";

$mysqli = new mysqli($h, $u, $p, $db);

if(!$mysqli->connect_errno) {
printf('<h3>Connected to database on <b>%s</b>, service discovered by <a href="%s">Consul by Hashicorp</a></h3>', $h, "https://www.consul.io/");
} else {
printf('<h3>DB service discovery failed. Cannot connect database on <b>%s</b>', $h);
goto eerr;
}


if ($stmt = $mysqli->prepare("SELECT country_name, dialing_code from dialing_code")) {
    $stmt->execute();

    /* bind variables to prepared statement */
    $stmt->bind_result($col1, $col2);
    echo '<table style="width:100%;">';
    /* fetch values */
   echo "<tr><th>Country</th><th>Dialing code</th></tr>";
    while ($stmt->fetch()) {
        printf("<tr><td>%s </td><td>%s</td></tr>", $col1, $col2);
    }
    echo "</table>";

    /* close statement */
    $stmt->close();
}

eerr:
?>
</div>
<body>
</html>
