<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>

<style>
body{
  background-image: url('https://img.wallpapersafari.com/desktop/1680/1050/42/12/w3xlib.jpg');
  background-size: cover;
  background-repeat: no-repeat;
   background-color: rgb(220, 227, 230);
   
}
#heading{
    background-color: transparent;
    padding:30px 20px 30px 20px;
    color: black;
    font-family: 'Times New Roman', serif;
    font-style: oblique;
    letter-spacing: 1.5px;
    word-spacing: 4px;

    text-align: center;
}



#head{
  color: white;
}

a:visited,link{
color: black;
}


#right{
  margin-left:0.5cm;
}
#right2{
  margin-left:23cm;
}

</style>
<title>Account creation</title>
<body id="main">
<a href="home.html" ><h1 id="heading">CS631-BANK</h1></a>
  <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: transparent;  backdrop-filter:blur(20px) ;;">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto" >
        <li class="nav-item active">
          <a class="nav-link" style="color: black; "href="accountcreation.php">Create Customer Account <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" style="color: black;" href="http://127.0.0.1:5000/contactus.hrml">Create Employee Account</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " style="color: black;" href="http://127.0.0.1:5000/emphomedisplay.html">view my account</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " style="color: black;" href="custdeleteinfo.php">delete customer account</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" style="color: black;" href="modifyinfo.php">modify customer account</a>
        </li>
      </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
        <a  class="nav-link1" style="float: right;" href="{{ url_for('customerauth')}}">Logout</a>
      </li>
      </ul>
    </div>
  </nav>

<br><br>
<div class="row">
    <div class="offset-2 col-5">

<?php
$accno = $_POST['acc'];
$c_overdraft = $_POST['coaccount'];
$ssn = 1235;
$d = date("Y/m/d");
$deposit = $_POST['deposit'];
$servername = "localhost";
$username = "root";
$password = "";
$db = "bank";
// Create connection
$conn = mysqli_connect($servername, $username, $password,$db);
// Check connection
if (!$conn) {
   die("Connection failed: " . mysqli_connect_error());
}
//echo "Connected successfully";

  
$query = "INSERT INTO `account` (`account`, `balance`, `last_accessed_date`, `account_type`, `intereset_overdraft`, `cssn`, `Branch_id`) VALUES ('$accno', $deposit, '$d', 'c', '0', '$ssn', '1');";

$query2 = $query2 = "INSERT INTO `checking` (`checkingaccount`,`overdrafted_amount`,`overdrafted_account`,`date`) VALUES ('$accno','0','$c_overdraft', '$d');";
if (mysqli_query($conn, $query)) {
    echo "<br><br><h2 style='text-align:center;'> Record inserted successfully<h2>";
  } else {
    echo "<br><br><h2 style='text-align:center;'>Error inserting record: " . mysqli_error($conn)."<h2>";
  }

  if (mysqli_query($conn, $query2)) {
    echo "<br><br><h2 style='text-align:center;'> Record inserted successfully<h2>";
  } else {
    echo "<br><br><h2 style='text-align:center;'>Error inserting record: " . mysqli_error($conn)."<h2>";
  }
  ?>