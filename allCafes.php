<?php
session_start();
require_once 'db_con.php';

$sql = "select * from `citycafe`";
$result = mysqli_query($con, $sql);
$layout = "";

if(mysqli_num_rows($results) == 0) {
    $layout .= "No cafes found!";
} else {
    $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);
    foreach($rows as $row) {
        $layout .=  "<div>
        <p>" . $row['CafeName'] . "</p>
        <p>" . $row['CafeZIP'] . "</p>
                    </div>";
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cafes</title>
</head>
<body>
    <div>
        <?= $layout?>
    </div>
</body>
</html>