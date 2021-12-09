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
    border-width:1px; 
    border-color: black;
    border-style:solid;
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
<a href="home.html" ><h1 id="heading">BANK WITH US!</h1></a>
<br>
<br>
<div class="row">
    <div class="offset-2 col-8">
        <h2>Transaction of Account number : 1111 2222 2222</h2>
        <br>
        <br>
        <table class="center" border="2px black">
          <tr>
            <th>Transaction ID</th>
            <th>Transaction name</th>
            <th>Date</th>
            <th>time</th>
            <th>Account number</th>
            <th>transaction type</th>
            <th>Amount</th>
            <th>charges</th>
          </tr>
          <?php
$servername = "localhost";
$username = "root";
$password = NULL;
$db = "dbms";
// Create connection
$conn = mysqli_connect($servername, $username, $password,$db);
// Check connection
if (!$conn) {
   die("Connection failed: " . mysqli_connect_error());
}
//echo "Connected successfully<br>";

$sql = "SELECT * FROM `transct` ";
$result = $conn->query($sql);
$i=0;
while($rs = $result->fetch_assoc()){
    $data = array('id'=>$rs['tid'],'account#'=>$rs['account#'], 'type'=>$rs['type'], 'amount'=> $rs['amount'],'balance'=>$rs['balance'], 'time'=> $rs['time']);
    echo $data;
    echo"<tr>
    <td>123</td>
    <td>electric bill</td>
    <td>10/02/21</td>
    <td>12:23:33</td>
    <td>1111 3333 3333</td>
    <td>credit</td>
    <td>$ 1000</td>
    <td>$15</td>
  </tr>";
}


?>

          
        </table>

    </body>
    </html>