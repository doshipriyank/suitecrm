
{if strlen($fields.reference_no_c.value) <= 0}
{assign var="value" value=$fields.reference_no_c.default_value }
{else}
{assign var="value" value=$fields.reference_no_c.value }
{/if}  
<input type='text' name='{$fields.reference_no_c.name}' 
    id='{$fields.reference_no_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='format : G/YY/No'  tabindex='1'      >