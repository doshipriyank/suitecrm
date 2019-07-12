
{if strlen($fields.suction_delivery_c.value) <= 0}
{assign var="value" value=$fields.suction_delivery_c.default_value }
{else}
{assign var="value" value=$fields.suction_delivery_c.value }
{/if}  
<input type='text' name='{$fields.suction_delivery_c.name}' 
    id='{$fields.suction_delivery_c.name}' size='30' 
    maxlength='32' 
    value='{$value}' title='1" , 2" , 3"'  tabindex='1'      >