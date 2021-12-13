<html>

<script>
  function selectacctype(){
    var sel = document.getElementById("acctype");
    if(sel.options[sel.selectedIndex].value=='s'){
           var cdhtml=`
           <form>
           <label class="control-label input-label" for="mindeposit"> Minimum deposit : $500</label><br>
      <input type="number" name="deposit"  placeholder="In dollars"/><br><br>
      <label class="control-label input-label" for="siaccno"> Saving Account Intrest : 0.2%</label><br>
      <button type="submit">Submit</button>
      </form>
      `;
      document.getElementById("accdiv").innerHTML=cdhtml;
    }

      if(sel.options[sel.selectedIndex].value=='c'){
           var cdhtml=`
           <form>
           <label class="control-label input-label" for="mindeposit"> Minimum deposit : $500</label><br>
      <input type="number" name="deposit"  placeholder="In dollars"/><br><br>
           <label class="control-label input-label" for="coaccno"> Checking overdraft Account : </label><br>
      <input type="number" name="coaccount"  placeholder="Referal account number"/><br><br>
      <button type="submit">Submit</button>
      </form>
      `;
      document.getElementById("accdiv").innerHTML=cdhtml;
    }

      if(sel.options[sel.selectedIndex].value=='m'){
           var cdhtml=`
           <form>
           <label class="control-label input-label" for="mindeposit"> Minimum deposit : $500</label><br>
      <input type="number" name="deposit"  placeholder="In dollars"/><br><br>
           <label class="control-label input-label" for="mi"> Market Account Intrest : 8%</label><br>
           <button type="submit">Submit</button>
      </form>

      `;
      document.getElementById("accdiv").innerHTML=cdhtml;
    }

      if(sel.options[sel.selectedIndex].value=='l'){
           var cdhtml=`
           
           <form>
      <label class="control-label input-label" for="li"> loan Account Intrest : 8.5%</label><br>

<label class="control-label input-label" for="totalloan"> total loan amount :</label><br>
<input type="number" name="totaalloan"  placeholder="In dollars"/><br><br>
<label class="control-label input-label" for="lsa"> linked Savings Account : </label><br>
<input type="number" name="lsa"  placeholder="Referal account number"/><br><br>
<button type="submit">Submit</button>
      </form>

      `;
      document.getElementById("accdiv").innerHTML=cdhtml;

  }
}

</script>
<div class="offset-2 column-2">
    <h2>Account details:</h2>
    <form>        
      <label class="control-label input-label" for="accno"> Account number :</label><br>
      <input type="number" name="accno"  /><br><br>                               
    <label class="control-label input-label" for="accounttype">    Account Type :</label><br>
    <select name="type" id="acctype">
        <option value="s">Savings Account</option>
        <option value="c">Checking Accounr</option>
        <option value="m">Money Market</option>
        <option value="l">Loan Account</option>
      </select>  
      <button type="submit" id="accsub" onclick="selectacctype(); " onsubmit="return false">Submit</button>
    </form>
        
    <div id="accdiv"></div>
  </div>
  </html>