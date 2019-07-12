
{if strlen($fields.diff_head_c.value) <= 0}
{assign var="value" value=$fields.diff_head_c.default_value }
{else}
{assign var="value" value=$fields.diff_head_c.value }
{/if}  
<input type='text' name='{$fields.diff_head_c.name}' 
    id='{$fields.diff_head_c.name}' size='30' 
    maxlength='64' 
    value='{$value}' title='Differential Head'  tabindex='1'      >