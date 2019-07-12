
{if strlen($fields.casing_c.value) <= 0}
{assign var="value" value=$fields.casing_c.default_value }
{else}
{assign var="value" value=$fields.casing_c.value }
{/if}  
<input type='text' name='{$fields.casing_c.name}' 
    id='{$fields.casing_c.name}' size='30' 
    maxlength='32' 
    value='{$value}' title='MOC (SS304, SS316, HastAlloy)'  tabindex='1'      >