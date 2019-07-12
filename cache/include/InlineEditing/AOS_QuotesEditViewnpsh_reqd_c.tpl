
{if strlen($fields.npsh_reqd_c.value) <= 0}
{assign var="value" value=$fields.npsh_reqd_c.default_value }
{else}
{assign var="value" value=$fields.npsh_reqd_c.value }
{/if}  
<input type='text' name='{$fields.npsh_reqd_c.name}' 
    id='{$fields.npsh_reqd_c.name}' size='30' 
    maxlength='128' 
    value='{$value}' title='eg : 10 mlc'  tabindex='1'      >