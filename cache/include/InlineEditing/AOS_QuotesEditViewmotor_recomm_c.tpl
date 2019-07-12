
{if strlen($fields.motor_recomm_c.value) <= 0}
{assign var="value" value=$fields.motor_recomm_c.default_value }
{else}
{assign var="value" value=$fields.motor_recomm_c.value }
{/if}  
<input type='text' name='{$fields.motor_recomm_c.name}' 
    id='{$fields.motor_recomm_c.name}' size='30' 
    maxlength='64' 
    value='{$value}' title=''  tabindex='1'      >