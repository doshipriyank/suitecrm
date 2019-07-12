
{if strlen($fields.impeller_type_c.value) <= 0}
{assign var="value" value=$fields.impeller_type_c.default_value }
{else}
{assign var="value" value=$fields.impeller_type_c.value }
{/if}  
<input type='text' name='{$fields.impeller_type_c.name}' 
    id='{$fields.impeller_type_c.name}' size='30' 
    maxlength='128' 
    value='{$value}' title='Semi-Open / Closed / Open'  tabindex='1'      >