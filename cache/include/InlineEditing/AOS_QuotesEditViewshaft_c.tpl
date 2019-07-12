
{if strlen($fields.shaft_c.value) <= 0}
{assign var="value" value=$fields.shaft_c.default_value }
{else}
{assign var="value" value=$fields.shaft_c.value }
{/if}  
<input type='text' name='{$fields.shaft_c.name}' 
    id='{$fields.shaft_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='MOC (SS304, SS316, HastAlloy etc...)'  tabindex='1'      >