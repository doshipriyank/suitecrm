
{if strlen($fields.vcf_pump_length_c.value) <= 0}
{assign var="value" value=$fields.vcf_pump_length_c.default_value }
{else}
{assign var="value" value=$fields.vcf_pump_length_c.value }
{/if}  
<input type='text' name='{$fields.vcf_pump_length_c.name}' 
    id='{$fields.vcf_pump_length_c.name}' size='30' 
    maxlength='64' 
    value='{$value}' title=''  tabindex='1'      >