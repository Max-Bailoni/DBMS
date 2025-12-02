<?php

$localhost = "";
$username = "";
$password = "";
$dbname = "";

$con = mysqli_connect($localhost, $username, $password, $dbname);

if (!$con) {
  die("Connection failed");
}