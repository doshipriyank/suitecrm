
{if strlen($fields.sp_gr_c.value) <= 0}
{assign var="value" value=$fields.sp_gr_c.default_value }
{else}
{assign var="value" value=$fields.sp_gr_c.value }
{/if}  
<input type='text' name='{$fields.sp_gr_c.name}' 
    id='{$fields.sp_gr_c.name}' size='30' 
    maxlength='32' 
    value='{$value}' title='specific gravity'  tabindex='1'      >