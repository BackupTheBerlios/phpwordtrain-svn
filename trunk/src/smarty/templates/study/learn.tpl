{include file="header.tpl"}
<p>Questions to go: {$counter+1}<br/>

{if $today_asked}
    Questions resolved today: {$today} of {$today_asked}</p>
{/if}

{if $checking == true}
    <p align='center'>
    {if $answer == true}
        <font color='green'>Your choice was right</font>
    {else}
        <font color='red'>Your choice was wrong</font>
    {/if}
    
    <br>
    <table border='1' cellspacing='10' width='50%'>
    <tr>
        <td>Translation</td>
        <td>{$last_trans}</td>
    </tr>
    <tr id='$color'>
        <td width='20%'>Word</td>
        <td>{$last_word}</td>
    </tr>
    {if $answer == false}
    <tr>
        <td>You wrote</td>
        <td>{$last_answer}</td>
    </tr>
    {/if}
    <tr>
        <td>Tip</td>
        <td>{$last_tip_word}</td>
    </tr></table></p><br><br>
{/if}            

{if $asking == true}
    <form action='learn.php' method='post'>
    <p align='center'><table border='1' cellspacing='10'>
        <tr>
            <td>Translation</td>
            <td>{$translation}</td>
        </tr><tr>
            <td>Word</td>
            <td><input type='text' name='answer'></td>
        </tr><tr>
            <td>Tip</td>
            <td>{$tip_word}</td>
        </tr>
        </table></p>
    <p align='center'>
        <input type="hidden" name='counter' value='{$counter}'>
        <input type='submit' name='action' value='Check'>
    </p></form>
{/if}

{include file="footer.tpl"}
