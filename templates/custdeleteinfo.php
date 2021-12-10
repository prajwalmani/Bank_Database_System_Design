<html>
<body>
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
<script>
	function foo(){
		var selected = document.getElementById("sel").selectedIndex;
		//alert(document.getElementsByTagName("option")[selected].value);
		var input = document.getElementsByTagName("input");
		var att = document.createAttribute("list");
		if (document.getElementsByTagName("option")[selected].value == "cssn" )
			att.value = "cssn";
		else if (document.getElementsByTagName("option")[selected].value == "name" )
			att.value = "name";
		input.setAttributeNode(att);
	}
	</script>
<div class="contaier-fluid" id="searchpage">
<div class="row">
<div class="offset-3 col-3">
<form action='custdelete.php' method='POST'>
    <select name="searchcategory" onchange="foo()" id="sel" style="width:5cm;height:1cm;"> 
    <option value="none" selected disabled hidden> 
          Select a Category
      </option>
	<option value = "cssn"> Social Security Number
	</option>  
	<option value = "Name"> Name 
	</option>  
	 
</div>

<div class="col-3">
<input type="text" name="input" id="input" list="" />
    <button  type="submit" id="okButton"  class="btn btn-primary">Delete</button>
</form> 
</div>
</div>
</div>

<datalist id="ssn" >
	<?php
		$sql = "SELECT ssn FROM customer";
        $result = $conn->query($sql);
        $i=0;
        while($rs = $result->fetch_assoc()){
            $data[$i] = $rs['cssn'];
            echo "<option> ".$data[$i]."</option>";
            $i++;
        }
	?>
	
</datalist>
<datalist id="name" >
	<?php
		$sql = "SELECT name FROM customer";
        $result = $conn->query($sql);
        $i=0;
        while($rs = $result->fetch_assoc()){
            $data[$i] = $rs['name'];
            echo "<option> ".$data[$i]."</option>";
            $i++;
        }
	?>
</datalist>
</body>
</html>
