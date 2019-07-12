
{if strlen($fields.liquid_c.value) <= 0}
{assign var="value" value=$fields.liquid_c.default_value }
{else}
{assign var="value" value=$fields.liquid_c.value }
{/if}  
<input type='text' name='{$fields.liquid_c.name}' 
    id='{$fields.liquid_c.name}' size='30' 
    maxlength='128' 
    value='{$value}' title='liquid name'  tabindex='1'      >