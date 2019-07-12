
{if strlen($fields.impeller_c.value) <= 0}
{assign var="value" value=$fields.impeller_c.default_value }
{else}
{assign var="value" value=$fields.impeller_c.value }
{/if}  
<input type='text' name='{$fields.impeller_c.name}' 
    id='{$fields.impeller_c.name}' size='30' 
    maxlength='64' 
    value='{$value}' title='MOC (SS304, SS316, HastAlloy)'  tabindex='1'      >