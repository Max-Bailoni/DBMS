<?php
session_start();
require_once 'db_con.php';

$sql = "select continent.ContinentName from continent 
join country on country.ContinentID = continent.ContinentID
join state on state.CountryID = country.CountryID
join city on city.StateID = state.StateID AND city.CountryID = state.CountryID
join citycafe on citycafe.CityID = city.CityID
where citycafe.CafeName = `Kohi`";";
";

$result = mysqli_query($con, $sql);
$row = mysqli_fetch_assoc($result);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div>
        <p><?= $row['ContinentName'] ?></p>
    </div>
</body>
</html>