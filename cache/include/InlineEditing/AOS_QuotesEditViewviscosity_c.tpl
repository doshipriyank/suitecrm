
{if strlen($fields.viscosity_c.value) <= 0}
{assign var="value" value=$fields.viscosity_c.default_value }
{else}
{assign var="value" value=$fields.viscosity_c.value }
{/if}  
<input type='text' name='{$fields.viscosity_c.name}' 
    id='{$fields.viscosity_c.name}' size='30' 
    maxlength='64' 
    value='{$value}' title='viscosity'  tabindex='1'      >