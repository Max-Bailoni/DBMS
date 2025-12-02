<?php
session_start();
require_once 'db_con.php';

$sql = "select country.CountryName from country
join city on city.CountryID = country.CountryID
join citycafe on citycafe.CityID = city.CityID
where citycafe.CafeName = `Kohi`;";
$result = mysqli_query($con, $sql);
$row = mysqli_fetch_assoc($result);