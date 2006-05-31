{assign var="focus" value="question.answer"}

{include file="header.tpl"}

{if $msg}<p>{$msg}</p>{/if}
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
    <table id='Question'>
    <tr>
        <td id="QuestionLast">Translation</td>
        <td>{$last_trans}</td>
    </tr>
    <tr id='$color'>
        <td id="QuestionLast">Word</td>
        <td>{$last_word}</td>
    </tr>
    {if $answer == false}
    <tr>
        <td id="QuestionLast">You wrote</td>
        <td><font id="Soft">{$last_answer}</font></td>
    </tr>
    {/if}
    <tr>
        <td id="QuestionLast">Tip</td>
        <td>{$last_tip_word}</td>
    </tr></table></p><br><br>
{/if}            

<form name='question' action='learn.php' method='post'>
{if $asking == true}
    <p align='center'><table id='Question'>
        <tr>
            <td id="QuestionNow">Translation</td>
            <td>{$translation}</td>
        </tr><tr>
            <td id="QuestionNow">Word</td>
            <td><input type='text' name='answer' size='30' ></td>
        </tr><tr>
            <td id="QuestionNow">Tip</td>
            <td>{$tip_word}&nbsp;</td>
        </tr>
        </table></p>
    <p align='center'>
        <input type="hidden" name='counter' value='{$counter}'>
        <input type='submit' name='action' value='Check'>
    </p>
{else}
  <input type='hidden' name='answer' size='30' >
{/if}
</form>
{include file="footer.tpl"}
