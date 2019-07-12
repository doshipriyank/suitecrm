
{if strlen($fields.base_frame_c.value) <= 0}
{assign var="value" value=$fields.base_frame_c.default_value }
{else}
{assign var="value" value=$fields.base_frame_c.value }
{/if}  
<input type='text' name='{$fields.base_frame_c.name}' 
    id='{$fields.base_frame_c.name}' size='30' 
    maxlength='32' 
    value='{$value}' title='MS Fabricated'  tabindex='1'      >