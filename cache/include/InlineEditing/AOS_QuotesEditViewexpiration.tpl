
<span class="dateTime">
{assign var=date_value value=$fields.expiration.value }
<input class="date_input" autocomplete="off" type="text" name="{$fields.expiration.name}" id="{$fields.expiration.name}" value="{$date_value}" title=''  tabindex='1'    size="11" maxlength="10" >
    <button type="button" id="{$fields.expiration.name}_trigger" class="btn btn-danger" onclick="return false;"><span class="suitepicon suitepicon-module-calendar" alt="{$APP.LBL_ENTER_DATE}"></span></button>
</span>
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.expiration.name}",
form : "",
ifFormat : "{$CALENDAR_FORMAT}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.expiration.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
startWeekday: {$CALENDAR_FDOW|default:'0'},
step : 1,
weekNumbers:false
{rdelim}
);
</script>
