
{if strlen($fields.temp_c.value) <= 0}
{assign var="value" value=$fields.temp_c.default_value }
{else}
{assign var="value" value=$fields.temp_c.value }
{/if}  
<input type='text' name='{$fields.temp_c.name}' 
    id='{$fields.temp_c.name}' size='30' 
    maxlength='32' 
    value='{$value}' title='°C or °F'  tabindex='1'      >