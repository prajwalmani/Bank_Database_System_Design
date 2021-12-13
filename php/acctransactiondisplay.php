<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Details</title>
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
    color: darkblue;
    font-family:Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
    font-style: oblique;
    letter-spacing: 1.5px;
    word-spacing: 4px;
    
    text-align: center;
}
.center {
  margin-left: auto;
  margin-right: auto;
  border:"1";
}
th, td {
  padding: 15px;
  text-align:center
}

#head{
  color: white;
}

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
#loginbox{
  font-family: 'Times New Roman', Times, serif;
  font-size: larger;
}

</style>
<title>transaction display</title>
<body id="main">
<a href="home.html" ><h1 id="heading">CS631-BANK</h1></a>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#"><b>Accounts</b><span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://127.0.0.1:5000/contactus.html">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://127.0.0.1:5000/transfer.html">Transfer/Deposit</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="#">Invesments</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="#">Security & Privacy</a>
        </li>
      </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
        <a  class="nav-link1" style="float: right;" href="http://127.0.0.1:5000/customerlogin.html">Logout</a>
      </li>
      </ul>
    </div>
  </nav>
  <br>
<br>
<div class="row">
    <div class="offset-2 col-8">
        
          <?php
$servername = "localhost";
$username = "root";
$password = NULL;
$db = "bank";
// Create connection
$conn = mysqli_connect($servername, $username, $password,$db);
// Check connection
if (!$conn) {
   die("Connection failed: " . mysqli_connect_error());
}
//echo "Connected successfully<br>";

$myfile = fopen("C:\Users\prajw\OneDrive\Desktop\dbms project\phpdata.txt", "r") or die("Unable to open file!");
$file = fgets($myfile);

fclose($myfile);

$sql = "SELECT name FROM customer where cssn = '$file'; ";

$result = mysqli_query($conn,$sql);
$row = mysqli_fetch_array($result);
        $user = $row['name'];
echo "<h2>Account user name: $user<h2>";

$sql = "SELECT account,account_type FROM account where cssn = '$file'; ";
$result = $conn->query($sql);
$i=0;
while($rs = $result->fetch_assoc()){
    $data[$i] = array('account'=>$rs['account'],'type'=>$rs['account_type']);
    $i++;
}


$d= count($data);


for ($x = 0; $x < $d; $x++) {
$acc= $data[$x]['account'];
$type = $data[$x]['type'];
if ($type == 's'){
  $type = "SAVINGS ACCOUNT";
}
if ($type == 'c'){
  $type = "CHECKING ACCOUNT";
}
if ($type == 'm'){
  $type = "MONEY MARKET ACCOUNT";
}
if ($type == 'l'){
  $type = "LOAN ACCOUNT";
}
$sql = "SELECT * FROM transct where account = '$acc'; ";
$result = $conn->query($sql);

echo "
<h4>Transaction of Account number : $acc  </h4>
<br>
<h4> Account type : $type</h4>
        <br>
        <br>";
if ($result->num_rows > 0) {
        echo"
        <table class='center' border='2px black'>
          <tr>
            <th>Transaction ID</th>
            <th>Transaction name</th>
            <th>Date</th>
            <th>Type</th>
            <th>credit</th>
            <th>debit</th>
            <th>Balance</th>
            
          </tr>";


while($rs = $result->fetch_assoc()){
    $id = $rs['transactionid'];
    $tname = $rs['tname'];
    $type=$rs['type'];
    $amount = $rs['amount'];
    $balance=$rs['balance'];
    $time=$rs['time'];
    if (($type == 'CSD') or ($type == 'CD')or ($type == 'CDC')){
      $credit = $amount;
      $debit = '-';
    }
    if (($type == 'CDD') or ($type == 'SC')or ($type == 'MW')){
      $debit=$amount;
      $credit = '-';
    }
    echo"<tr>
    <td>$id</td>
    <td>$tname</td>
    <td>$time</td>
  
    <td>$type</td>
    <td>$credit</td>
    <td>$debit</td>
    <td>$balance</td>
  </tr>";
}
echo " </table><br><br><br>";
}
else{
  echo " <h3 style=text-align:center;>NO TRANSACTIONS TO DISPLAY!</h3> ";
}
}

?>

          
       

    </body>
    </html>