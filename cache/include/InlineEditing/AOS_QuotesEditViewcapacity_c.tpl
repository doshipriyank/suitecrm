
{if strlen($fields.capacity_c.value) <= 0}
{assign var="value" value=$fields.capacity_c.default_value }
{else}
{assign var="value" value=$fields.capacity_c.value }
{/if}  
<input type='text' name='{$fields.capacity_c.name}' 
    id='{$fields.capacity_c.name}' size='30' 
    maxlength='64' 
    value='{$value}' title='eg : 10 m3/hr'  tabindex='1'      >