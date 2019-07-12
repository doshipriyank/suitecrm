
{if strlen($fields.min_safe_flow_c.value) <= 0}
{assign var="value" value=$fields.min_safe_flow_c.default_value }
{else}
{assign var="value" value=$fields.min_safe_flow_c.value }
{/if}  
<input type='text' name='{$fields.min_safe_flow_c.name}' 
    id='{$fields.min_safe_flow_c.name}' size='30' 
    maxlength='64' 
    value='{$value}' title='eg : 2 m3/hr'  tabindex='1'      >