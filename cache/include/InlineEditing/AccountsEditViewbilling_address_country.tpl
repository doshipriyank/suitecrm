
{if strlen($fields.billing_address_country.value) <= 0}
{assign var="value" value=$fields.billing_address_country.default_value }
{else}
{assign var="value" value=$fields.billing_address_country.value }
{/if}  
<input type='text' name='{$fields.billing_address_country.name}' 
    id='{$fields.billing_address_country.name}' size='30' 
     
    value='{$value}' title=''  tabindex='1'      >