
{if strlen($fields.motor_mount_type_c.value) <= 0}
{assign var="value" value=$fields.motor_mount_type_c.default_value }
{else}
{assign var="value" value=$fields.motor_mount_type_c.value }
{/if}  
<input type='text' name='{$fields.motor_mount_type_c.name}' 
    id='{$fields.motor_mount_type_c.name}' size='30' 
    maxlength='32' 
    value='{$value}' title=''  tabindex='1'      >