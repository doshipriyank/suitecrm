
{if empty($fields.coordinates.value)}
{assign var="value" value=$fields.coordinates.default_value }
{else}
{assign var="value" value=$fields.coordinates.value }
{/if}




<textarea  id='{$fields.coordinates.name}' name='{$fields.coordinates.name}'
rows="2"
cols="32"
title='Coordinates Format: Lng, Lat, Elv' tabindex="1" 
 >{$value}</textarea>


{literal}{/literal}