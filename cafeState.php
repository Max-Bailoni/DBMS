<?php
session_start();
require_once 'db_con.php';

$sql = "select state.StateName from state
join city on city.StateID = state.StateID
join citycafe on citycafe.CityID = city.CityID
where citycafe.CafeName = `Kohi`;";
$result = mysqli_query($con, $sql);
$row = mysqli_fetch_assoc($result);