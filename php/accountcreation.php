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

<h2 style="text-align: center;">Create account:
</h2>
<br>

<div class="row" style="padding:3px">
    <div class="offset-2 column-2">
 
    <form method="post" action="custcreate.php">
        <h2>Customer details:</h2>
        <label class="control-label input-label" for="name">    Name :</label><br>
    <input type="text" name="name" placeholder="JOHN SMITH GORGE" /><br><br>

    <label class="control-label input-label" for="SSN">    SSN :</label><br>
    <input type="number" name="SSN" placeholder="111221111" /><br><br>

    <label class="control-label input-label" for="Apartment">   Apartment no :</label><br>
    <input type="number" name="aptno"  /><br><br>

    <label class="control-label input-label" for="Street">    Street number :</label><br>
    <input type="number" name="Streetno" /><br><br>

    <label class="control-label input-label" for="city">    City :</label><br>
    <input type="text" name="city"  /><br><br>

    <label class="control-label input-label" for="State">    state :</label><br>
    <input type="text" name="state" default="New Jersey" /><br><br>

    <label class="control-label input-label" for="zipcode">    Zipcode :</label><br>
    <input type="number" name="zip" default=" 070" /><br><br>

    <h4>Select the personal banker to assign  :  </h4>
<select name="essn"  id="essn" style="width:8cm;height:1cm;"> 
<option value="none" selected disabled hidden> 
          Select a ESSN to change
      </option
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
//echo "Connected successfully<br>";


?>
<?php
		$sql = "SELECT essn FROM employee";
        $result = $conn->query($sql);
        $i=0;
        $rowcount=mysqli_num_rows($result);
        while($rs = $result->fetch_assoc()){
            $data[$i] = $rs['essn'];
            echo "<option> ".$data[$i]."</option>";
            $i++;
        }
	?>
</select>
<br><br><br>
    <button class="btn btn-success"     type="submit">Submit</button><br>
    <br>
    <br>

<br>
</form>
</div>

    </body>
    </html>