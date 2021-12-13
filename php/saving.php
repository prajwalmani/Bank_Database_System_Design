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
<?php
$acc = $GLOBALS["accno"];
echo $acc;
?>

</style>
<title>Account creation</title>
<body id="main">
<a href="home.html" ><h1 id="heading">CS631-BANK</h1></a>
<br><br>
<div class="row">
    <div class="offset-2 col-5">

<h2>Saving Account</h2>
<form action="sav.php" method="post">
<input type="hidden"  name="cssn" value="123">
    <label class="control-label input-label" for="accno"> Account number :</label><br>
    <input type="number" name="acc" id="acc"  /><br><br>
           <label class="control-label input-label" for="mindeposit"> Minimum deposit : $500</label><br>
      <input type="number" name="deposit" id="depositamount" onchange="errormsg();"  placeholder="In dollars"/><br><br>
      <div id="errordivmsg"></div>
      <label class="control-label input-label" for="siaccno"> Saving Account Intrest : 0.01%</label><br>
      <button type="submit">Submit</button>
      </form>
</div>
</div>
<script>
  function errormsg(){
    console.log("here")
    var val=document.getElementById("depositamount").innerHTMl
    if (val<500){
      divhtml=` <p style="text-color:red">Minimum deposit should be atleast $500</p>
      `;

      document.getElementById("errordivmsg").innerHTMl=divhtml; 
    }

  }
</script>
</html>