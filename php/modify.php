<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Accounts</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<style>
body{
  background-image: url('https://tipsmake.com/data/images/beautiful-and-professional-powerpoint-backgrounds-picture-24-akrIihaPT.jpeg');
  background-size: cover;
  background-repeat: no-repeat;
  backdrop-filter:blur(5px) ;
   background-color: rgb(220, 227, 230);
}
#heading{
    background-color:transparent;
    backdrop-filter:blur(25px) ;
    padding:30px 20px 30px 20px;
    color:black;
    font-family: 'Times New Roman', serif;
    font-style: oblique;
    letter-spacing: 1.5px;
    word-spacing: 4px;
    text-align: center;
}




a
{color:black}
a:visited,link{
color: black;
}


#Entertainment{
  font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
}
#right{
  margin-left:0.5cm;
}
#right2{
  margin-left:23cm;
}
fieldset.scheduler-border {
    border: 1px double black;
    padding: 0 1.4em 1.4em 1.4em;
    margin: 0 0 1.5em 0;
}

legend.scheduler-border {
    width:auto; /* Or auto */
    padding:0 10px; /* To give a bit of padding on the left and right */
    border-bottom:none;
}
#accountbox{
  font-family: 'Times New Roman', Times, serif;
  font-size: larger;
}


.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}



.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

#sel{
 width:300px;   
}

.navbar{
background-color: transparent;
}
.nav-link1 {
      color:black;
      padding-right: .5rem !important;
      padding-left: .5rem !important;
    }
    
    /* Fixes dropdown menus placed on the right side */
    .ml-auto .dropdown-menu {
      left: auto !important;
      right: 0px;
    }
</style>


<body id="main">
  
<a href="home.html" ><h1 id="heading">CS631-BANK</h1></a>
  <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: transparent;  backdrop-filter:blur(20px) ;;">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto" >
        <li class="nav-item active">
          <a class="nav-link" style="color: black; "href="http://127.0.0.1:5000/accountcreation.html">Create Customer Account <span class="sr-only">(current)</span></a>
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



<?php
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
//echo "Connected successfully<br>";?>


<?php
if (isset($_POST['to'])) {
    $to = $_POST['to'];
}
if (isset($_POST['from'])) {
    $cssn = $_POST['from'];
}

    $search_category = $_POST['searchcategory'];


if ($search_category == "name"){
    $query = "update customer set name = '".$to."' where cssn = '".$cssn."';";   
}
if ($search_category == "apartment"){
    $query = "update customer set apartment = ".$to." where cssn = '".$cssn."';";   
}
if ($search_category == "street"){
    $query = "update customer set street = ".$to." where cssn = '".$cssn."';";   
}
if ($search_category == "city"){
    $query = "update customer set city = '".$to."' where cssn = '".$cssn."';";   
}
if ($search_category == "state"){
    $query = "update customer set state = '".$to."' where cssn = '".$cssn."';";   
}
if ($search_category == "zipcode"){
    $query = "update customer set zipcode = ".$to." where cssn = '".$cssn."';";   
}

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

  


if (mysqli_query($conn, $query)) {
    echo "<br><br><h2 style='text-align:center;'> Record updated successfully<h2>";
  } else {
    echo "<br><br><h2 style='text-align:center;'>Error updating record: " . mysqli_error($conn)."<h2>";
  }

$conn->close();
?>

<body id="main">
<title>Modified successfully</title>