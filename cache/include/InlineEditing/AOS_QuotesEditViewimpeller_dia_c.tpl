
{if strlen($fields.impeller_dia_c.value) <= 0}
{assign var="value" value=$fields.impeller_dia_c.default_value }
{else}
{assign var="value" value=$fields.impeller_dia_c.value }
{/if}  
<input type='text' name='{$fields.impeller_dia_c.name}' 
    id='{$fields.impeller_dia_c.name}' size='30' 
    maxlength='128' 
    value='{$value}' title='eg :  160mm Max / 135mm Rated'  tabindex='1'      >