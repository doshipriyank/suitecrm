
{if empty($fields.pdffooter.value)}
{assign var="value" value=$fields.pdffooter.default_value }
{else}
{assign var="value" value=$fields.pdffooter.value }
{/if}




<textarea  id='{$fields.pdffooter.name}' name='{$fields.pdffooter.name}'
rows="2"
cols="32"
title='' tabindex="1" 
 >{$value}</textarea>


{literal}{/literal}