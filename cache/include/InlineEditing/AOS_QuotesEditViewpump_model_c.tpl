
{if strlen($fields.pump_model_c.value) <= 0}
{assign var="value" value=$fields.pump_model_c.default_value }
{else}
{assign var="value" value=$fields.pump_model_c.value }
{/if}  
<input type='text' name='{$fields.pump_model_c.name}' 
    id='{$fields.pump_model_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title=''  tabindex='1'      >