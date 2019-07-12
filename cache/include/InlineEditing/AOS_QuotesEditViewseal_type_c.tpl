
{if strlen($fields.seal_type_c.value) <= 0}
{assign var="value" value=$fields.seal_type_c.default_value }
{else}
{assign var="value" value=$fields.seal_type_c.value }
{/if}  
<input type='text' name='{$fields.seal_type_c.name}' 
    id='{$fields.seal_type_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='Double / Single Mechanical Seal'  tabindex='1'      >