
{if strlen($fields.total_amount.value) <= 0}
{assign var="value" value=$fields.total_amount.default_value }
{else}
{assign var="value" value=$fields.total_amount.value }
{/if}  
<input type='text' name='{$fields.total_amount.name}' 
id='{$fields.total_amount.name}' size='30' maxlength='26,6' value='{sugar_number_format var=$value}' title='' tabindex='1'
 >