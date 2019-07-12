
{if strlen($fields.pnf_charges_c.value) <= 0}
{assign var="value" value=$fields.pnf_charges_c.default_value }
{else}
{assign var="value" value=$fields.pnf_charges_c.value }
{/if}  
<input type='text' name='{$fields.pnf_charges_c.name}' 
    id='{$fields.pnf_charges_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title=''  tabindex='1'      >