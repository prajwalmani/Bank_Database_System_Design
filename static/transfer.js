function onclicks(){
    var sel=document.getElementById("dropdown");
        if(sel.options[sel.selectedIndex].value=='cd'){
           var cdhtml=`
           <form method="post">
   <label>Account No:</label><br>
   <input type="text" name="toccountno" required/><br>
   <label>Branch Id:</label><br>
   <input type="number" name="tobranchid" required/><br>
   <label>Amount:</label><br>
   <input type="number" name="fromamount" required/><br><br>
   <input class="btn btn-primary" type="submit" value="Submit"><br>
</form>
           `;
           document.getElementById('dv').innerHTML=cdhtml;
        }
        else if(sel.options[sel.selectedIndex].value=='wm'){
            var wmhtml=`
            <form method="post">
        <label for="transcation">Select type of Account:</label><br>
            <select name="adropdown" id="adropdown" required>
                <option value="s">Savings Account</option>
                <option value="c">Checking Account</option>
              </select>
              <br><br>
        <label>Enter the amount:</label><br>
        <input type="number" name="amount" required/><br>
        <br>
        <label >Enter the note(optional)</label><br>
        <input type="text" name="" id=""/><br><br>
        <input class="btn btn-primary" type="submit" value="Submit"><br> <br>
     </form>
            `;
            document.getElementById('dv').innerHTML=wmhtml;

}
       else if(sel.options[sel.selectedIndex].value=='csd'){
        var csdhtml=`
        <form method="post">
        <label >Select the type of account:</label><br>
        <input type="radio" name="raccount" id="rsavings" value="s">
        <label>Savings Account</label>
        <br>
        <input type="radio" name="raccount" id="rchecking" value="c">
        <label>Checking Account</label><br><br>
        <label>Enter the amount:</label><br>
        <input type="number" name="eamount" id="eamount" required/><br>
        <br>
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
