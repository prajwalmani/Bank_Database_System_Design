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


.box{
        padding: 20px;
        display: none;
        margin-top: 20px;
        border: 1px solid #000;
    }

   
    .choose{background: #ffffff;}


#head{
  color: white;
}

a:visited,link{
color: black;
}

.red{ background: #ff0000; }
    .green{ background: #00ff00; }
    .blue{ background: #0000ff; }
    .choose{background: #ffffff;}
#right{
  margin-left:0.5cm;
}
#right2{
  margin-left:23cm;
}

</style>
<title>transaction display</title>
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
          <a class="nav-link " style="color: black;" href="#">view my account</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " style="color: black;" href="#">delete customer account</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" style="color: black;" href="#">modify customer account</a>
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




  if (isset($_POST['name'])) {
    $name = $_POST['name'];
}
$ssn = $_POST['SSN'];
$apt = $_POST['aptno'];
$street = $_POST['Streetno'];
$city = $_POST['city'];
$state = $_POST['state'];
$zip = $_POST['zip'];
$essn = $_POST['essn'];
$GLOBALS['ssn'] = $ssn;


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
$query="SELECT account FROM account ORDER BY account DESC LIMIT 1;";
$result = $conn->query($query);
if ($result = $conn->query($query)) {
while($rs = $result->fetch_assoc()){
  $acc = $rs['account'];
}
}




$GLOBALS["acc"] = $acc+1;
echo $GLOBALS['acc'];

$query = "INSERT INTO `customer` (`CSSN`, `Name`, `Apartment`, `Street`, `City`, `State`, `Zipcode`, `PersonalBanker_ESSN`) VALUES ('$ssn', '$name', $apt, $street, '$city', '$state', $zip, '$essn');";

if (mysqli_query($conn, $query)) {
    echo "<br><br><h2 style='text-align:center;'> Customer Record inserted successfully<h2>";
  } else {
    echo "<br><br><h2 style='text-align:center;'> Error insert record: " . mysqli_error($conn)."<h2>";
  }

  
   
?> 

                          
    <label style="text-align:center;" class="control-label input-label" for="accounttype">    Account Type :</label><br>
    <h1 style="text-align:center;"><a href="saving.php"> Savings Account</a></h1>
    <h1 style="text-align:center;"><a href="checking.php"> Checking account</a><h1>
    <h1 style="text-align:center;"><a href="market.php">Money market account</a></h1>
    <h1 style="text-align:center;">  <a href="loan.php"> Loan Account</a> </h1>
