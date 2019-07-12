
{if strlen($fields.validity_c.value) <= 0}
{assign var="value" value=$fields.validity_c.default_value }
{else}
{assign var="value" value=$fields.validity_c.value }
{/if}  
<input type='text' name='{$fields.validity_c.name}' 
    id='{$fields.validity_c.name}' size='30' 
    maxlength='16' 
    value='{$value}' title=''  tabindex='1'      >