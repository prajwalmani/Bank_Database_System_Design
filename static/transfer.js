function onclicks(){
    var sel=document.getElementById("dropdown");
        if(sel.options[sel.selectedIndex].value=='cd'){
           var cdhtml=`
           <form method="post">
   <label>Account No:</label>
   <input type="text" name="toccountno" required/>
   <label>Branch Id:</label>
   <input type="number" name="tobranchid" required/>
   <label>Amount:</label>
   <input type="number" name="fromamount" required/>
   <input class="btn btn-primary" type="submit" value="Submit"><br>
</form>
           `;
           document.getElementById('dv').innerHTML=cdhtml;
        }
        else if(sel.options[sel.selectedIndex].value=='wm'){
            var wmhtml=`
            <form method="post">
   <label for="transcation">Select type of Account:</label>
       <select name="adropdown" id="adropdown" required>
           <option value="s">Savings Account</option>
           <option value="c">Checking Account</option>
         </select>
         <br><br>
   <label>Enter the amount:</label>
   <input type="number" name="amount" required/><br>
   <label >Enter the note(optional)</label>
   <input type="text" name="" id=""/><br>
   <input class="btn btn-primary" type="submit" value="Submit"><br> 
</form>
            `;
            document.getElementById('dv').innerHTML=wmhtml;

}
       else if(sel.options[sel.selectedIndex].value=='csd'){
        var csdhtml=`
        <form method="post">
    <label >Select the type of account:</label>
    <input type="radio" name="raccount" id="rsavings" value="s">
    <label>Savings Account</label>
    <input type="radio" name="raccount" id="rchecking" value="c">
    <label>Checking Account</label>
    <label>Enter the amount:</label>
    <input type="number" name="eamount" id="eamount" required/>
    <button type="submit" name="waitsubmit" value="waitsubmit">Submit</button>
</form>
        `;   
        document.getElementById('dv').innerHTML=csdhtml;
       }
       else{
    document.getElementById('dv').innerHTML=`
        <h3><span style="color:red">Please select the type of transaction</span></h3>
        `;
       }
   }

window.onclicks= onclicks;
