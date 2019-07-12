
{if strlen($fields.pump_performance_c.value) <= 0}
{assign var="value" value=$fields.pump_performance_c.default_value }
{else}
{assign var="value" value=$fields.pump_performance_c.value }
{/if}  
<input type='text' name='{$fields.pump_performance_c.name}' 
    id='{$fields.pump_performance_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='As per API 675 / ISO 2858 standard'  tabindex='1'      >