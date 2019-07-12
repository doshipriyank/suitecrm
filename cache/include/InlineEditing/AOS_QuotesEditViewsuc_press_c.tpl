
{if strlen($fields.suc_press_c.value) <= 0}
{assign var="value" value=$fields.suc_press_c.default_value }
{else}
{assign var="value" value=$fields.suc_press_c.value }
{/if}  
<input type='text' name='{$fields.suc_press_c.name}' 
    id='{$fields.suc_press_c.name}' size='30' 
    maxlength='32' 
    value='{$value}' title='Positive / Flooded'  tabindex='1'      >