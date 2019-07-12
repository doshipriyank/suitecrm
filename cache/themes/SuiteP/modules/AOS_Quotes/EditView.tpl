

<script>
    {literal}
    $(document).ready(function(){
	    $("ul.clickMenu").each(function(index, node){
	        $(node).sugarActionMenu();
	    });

        if($('.edit-view-pagination').children().length == 0) $('.saveAndContinue').remove();
    });
    {/literal}
</script>
<div class="clear"></div>
<form action="index.php" method="POST" name="{$form_name}" id="{$form_id}" {$enctype}>
<div class="edit-view-pagination-mobile-container">
<div class="edit-view-pagination edit-view-mobile-pagination">
{$PAGINATION}
</div>
</div>
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="dcQuickEdit">
<tr>
<td class="buttons">
<input type="hidden" name="module" value="{$module}">
{if isset($smarty.request.isDuplicate) && $smarty.request.isDuplicate eq "true"}
<input type="hidden" name="record" value="">
<input type="hidden" name="duplicateSave" value="true">
<input type="hidden" name="duplicateId" value="{$fields.id.value}">
{else}
<input type="hidden" name="record" value="{$fields.id.value}">
{/if}
<input type="hidden" name="isDuplicate" value="false">
<input type="hidden" name="action">
<input type="hidden" name="return_module" value="{$smarty.request.return_module}">
<input type="hidden" name="return_action" value="{$smarty.request.return_action}">
<input type="hidden" name="return_id" value="{$smarty.request.return_id}">
<input type="hidden" name="module_tab"> 
<input type="hidden" name="contact_role">
{if (!empty($smarty.request.return_module) || !empty($smarty.request.relate_to)) && !(isset($smarty.request.isDuplicate) && $smarty.request.isDuplicate eq "true")}
<input type="hidden" name="relate_to" value="{if $smarty.request.return_relationship}{$smarty.request.return_relationship}{elseif $smarty.request.relate_to && empty($smarty.request.from_dcmenu)}{$smarty.request.relate_to}{elseif empty($isDCForm) && empty($smarty.request.from_dcmenu)}{$smarty.request.return_module}{/if}">
<input type="hidden" name="relate_id" value="{$smarty.request.return_id}">
{/if}
<input type="hidden" name="offset" value="{$offset}">
{assign var='place' value="_HEADER"} <!-- to be used for id for buttons with custom code in def files-->
<div class="buttons">
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="var _form = document.getElementById('EditView'); {if $isDuplicate}_form.return_id.value=''; {/if}_form.action.value='Save'; if(check_form('EditView'))SUGAR.ajaxUI.submitForm(_form);return false;" type="submit" name="button" value="{$APP.LBL_SAVE_BUTTON_LABEL}" id="SAVE">{/if} 
{if !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($smarty.request.return_id))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=DetailView&module={$smarty.request.return_module|escape:"url"}&record={$smarty.request.return_id|escape:"url"}'); return false;" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" type="button" id="CANCEL"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($fields.id.value))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=DetailView&module={$smarty.request.return_module|escape:"url"}&record={$fields.id.value}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && empty($fields.id.value)) && empty($smarty.request.return_id)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=ListView&module={$smarty.request.return_module|escape:"url"}&record={$fields.id.value}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {elseif !empty($smarty.request.return_action) && !empty($smarty.request.return_module)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action={$smarty.request.return_action}&module={$smarty.request.return_module|escape:"url"}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {elseif empty($smarty.request.return_action) || empty($smarty.request.return_id) && !empty($fields.id.value)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=index&module=AOS_Quotes'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=index&module={$smarty.request.return_module|escape:"url"}&record={$smarty.request.return_id|escape:"url"}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {/if}
{if $showVCRControl}
<button type="button" id="save_and_continue" class="button saveAndContinue" title="{$app_strings.LBL_SAVE_AND_CONTINUE}" onClick="SUGAR.saveAndContinue(this);">
{$APP.LBL_SAVE_AND_CONTINUE}
</button>
{/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input id="btn_view_change_log" title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=AOS_Quotes", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="button" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</div>
</td>
<td align='right' class="edit-view-pagination-desktop-container">
<div class="edit-view-pagination edit-view-pagination-desktop">
{$PAGINATION}
</div>
</td>
</tr>
</table>
{sugar_include include=$includes}
<div id="EditView_tabs">

<ul class="nav nav-tabs">


<li role="presentation" class="active">
<a id="tab0" data-toggle="tab" class="hidden-xs">
{sugar_translate label='LBL_EDITVIEW_PANEL3' module='AOS_Quotes'}
</a>


<!-- Counting Tabs 0-->
<a id="xstab0" href="#" class="visible-xs first-tab dropdown-toggle" data-toggle="dropdown">
{sugar_translate label='LBL_EDITVIEW_PANEL3' module='AOS_Quotes'}
</a>
</li>




























</ul>
<div class="clearfix"></div>
<div class="tab-content">

<div class="tab-pane-NOBOOTSTRAPTOGGLER active fade in" id='tab-content-0'>
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-12 edit-view-row-item">


<div class="col-xs-12 col-sm-2 label" data-label="LBL_PRODUCT_TYPE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_PRODUCT_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="enum" field="product_type_c" colspan='3' >
{counter name="panelFieldCount" print=false}

{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.product_type_c.name}" 
id="{$fields.product_type_c.name}" 
title='Choose Product for custom quotation'       
>
{if isset($fields.product_type_c.value) && $fields.product_type_c.value != ''}
{html_options options=$fields.product_type_c.options selected=$fields.product_type_c.value}
{else}
{html_options options=$fields.product_type_c.options selected=$fields.product_type_c.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.product_type_c.options }
{capture name="field_val"}{$fields.product_type_c.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.product_type_c.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.product_type_c.name}" 
id="{$fields.product_type_c.name}" 
title='Choose Product for custom quotation'          
>
{if isset($fields.product_type_c.value) && $fields.product_type_c.value != ''}
{html_options options=$fields.product_type_c.options selected=$fields.product_type_c.value}
{else}
{html_options options=$fields.product_type_c.options selected=$fields.product_type_c.default}
{/if}
</select>
<input
id="{$fields.product_type_c.name}-input"
name="{$fields.product_type_c.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.product_type_c.name}-image"></button><button type="button"
id="btn-clear-{$fields.product_type_c.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.product_type_c.name}-input', '{$fields.product_type_c.name}');sync_{$fields.product_type_c.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
	{/literal}

			{literal}
		(function (){
			var selectElem = document.getElementById("{/literal}{$fields.product_type_c.name}{literal}");
			
			if (typeof select_defaults =="undefined")
				select_defaults = [];
			
			select_defaults[selectElem.id] = {key:selectElem.value,text:''};

			//get default
			for (i=0;i<selectElem.options.length;i++){
				if (selectElem.options[i].value==selectElem.value)
					select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
			}

			//SUGAR.AutoComplete.{$ac_key}.ds = 
			//get options array from vardefs
			var options = SUGAR.AutoComplete.getOptionsArray("");

			YUI().use('datasource', 'datasource-jsonschema',function (Y) {
				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
				    source: function (request) {
				    	var ret = [];
				    	for (i=0;i<selectElem.options.length;i++)
				    		if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
				    			ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
				    	return ret;
				    }
				});
			});
		})();
		{/literal}
	
	{literal}
		YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
	{/literal}
			
	SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.product_type_c.name}-input');
	SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.product_type_c.name}-image');
	SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.product_type_c.name}');
	
			{literal}
			function SyncToHidden(selectme){
				var selectElem = document.getElementById("{/literal}{$fields.product_type_c.name}{literal}");
				var doSimulateChange = false;
				
				if (selectElem.value!=selectme)
					doSimulateChange=true;
				
				selectElem.value=selectme;

				for (i=0;i<selectElem.options.length;i++){
					selectElem.options[i].selected=false;
					if (selectElem.options[i].value==selectme)
						selectElem.options[i].selected=true;
				}

				if (doSimulateChange)
					SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
			}

			//global variable 
			sync_{/literal}{$fields.product_type_c.name}{literal} = function(){
				SyncToHidden();
			}
			function syncFromHiddenToWidget(){

				var selectElem = document.getElementById("{/literal}{$fields.product_type_c.name}{literal}");

				//if select no longer on page, kill timer
				if (selectElem==null || selectElem.options == null)
					return;

				var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

				for (i=0;i<selectElem.options.length;i++){

					if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.product_type_c.name}-input{literal}'))
						SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
				}
			}

            YAHOO.util.Event.onAvailable("{/literal}{$fields.product_type_c.name}{literal}", syncFromHiddenToWidget);
		{/literal}

		SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
		SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
		SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
			{literal}
		}
		{/literal}
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
			{literal}
		}
		{/literal}
		
	SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;
	
	{literal}
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
		activateFirstItem: true,
		{/literal}
		minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
		queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
		zIndex: 99999,

				
		{literal}
		source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,
		
		resultTextLocator: 'text',
		resultHighlighter: 'phraseMatch',
		resultFilters: 'phraseMatch',
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
		var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
		if(hover[0] != null){
			if (ex) {
				var h = '1000px';
				hover[0].style.height = h;
			}
			else{
				hover[0].style.height = '';
			}
		}
	}
		
	if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
		// expand the dropdown options upon focus
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
		});
	}

			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
		});
		
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
			var selectElem = document.getElementById("{/literal}{$fields.product_type_c.name}{literal}");
			//if typed value is a valid option, do nothing
			for (i=0;i<selectElem.options.length;i++)
				if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
					return;
			
			//typed value is invalid, so set the text and the hidden to blank
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
			SyncToHidden(select_defaults[selectElem.id].key);
		});
	
	// when they click on the arrow image, toggle the visibility of the options
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
		if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
		} else {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
		}
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
	});

	// when they select an option, set the hidden input with the KEY, to be saved
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
		SyncToHidden(e.result.raw.key);
	});
 
});
</script> 
{/literal}
{/if}
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
</div>            </div>
</div>

<div class="panel-content">
<div>&nbsp;</div>






<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_ACCOUNT_INFORMATION' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_0" data-id="LBL_ACCOUNT_INFORMATION">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_NAME">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_NAME' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="name" field="name"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.name.value) <= 0}
{assign var="value" value=$fields.name.default_value }
{else}
{assign var="value" value=$fields.name.value }
{/if}  
<input type='text' name='{$fields.name.name}' 
id='{$fields.name.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_OPPORTUNITY">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_OPPORTUNITY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="relate" field="opportunity"  >
{counter name="panelFieldCount" print=false}

<input type="text" name="{$fields.opportunity.name}" class="sqsEnabled" tabindex="0" id="{$fields.opportunity.name}" size="" value="{$fields.opportunity.value}" title='' autocomplete="off"  	 >
<input type="hidden" name="{$fields.opportunity.id_name}" 
id="{$fields.opportunity.id_name}" 
value="{$fields.opportunity_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.opportunity.name}" id="btn_{$fields.opportunity.name}" tabindex="0" title="{sugar_translate label="LBL_SELECT_BUTTON_TITLE"}" class="button firstChild" value="{sugar_translate label="LBL_SELECT_BUTTON_LABEL"}"
onclick='open_popup(
"{$fields.opportunity.module}", 
600, 
400, 
"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"EditView","field_to_name_array":{"id":"opportunity_id","name":"opportunity"}}{/literal}, 
"single", 
true
);' ><span class="suitepicon suitepicon-action-select"></span></button><button type="button" name="btn_clr_{$fields.opportunity.name}" id="btn_clr_{$fields.opportunity.name}" tabindex="0" title="{sugar_translate label="LBL_ACCESSKEY_CLEAR_RELATE_TITLE"}"  class="button lastChild"
onclick="SUGAR.clearRelateField(this.form, '{$fields.opportunity.name}', '{$fields.opportunity.id_name}');"  value="{sugar_translate label="LBL_ACCESSKEY_CLEAR_RELATE_LABEL"}" ><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
<script type="text/javascript">
SUGAR.util.doWhen(
		"typeof(sqs_objects) != 'undefined' && typeof(sqs_objects['{$form_name}_{$fields.opportunity.name}']) != 'undefined'",
		enableQS
);
</script>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_QUOTE_NUMBER">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_QUOTE_NUMBER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="int" field="number"  >
{counter name="panelFieldCount"  print=false}
{$fields.number.value}
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_STAGE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_STAGE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="enum" field="stage"  >
{counter name="panelFieldCount" print=false}

{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.stage.name}" 
id="{$fields.stage.name}" 
title=''       
>
{if isset($fields.stage.value) && $fields.stage.value != ''}
{html_options options=$fields.stage.options selected=$fields.stage.value}
{else}
{html_options options=$fields.stage.options selected=$fields.stage.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.stage.options }
{capture name="field_val"}{$fields.stage.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.stage.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.stage.name}" 
id="{$fields.stage.name}" 
title=''          
>
{if isset($fields.stage.value) && $fields.stage.value != ''}
{html_options options=$fields.stage.options selected=$fields.stage.value}
{else}
{html_options options=$fields.stage.options selected=$fields.stage.default}
{/if}
</select>
<input
id="{$fields.stage.name}-input"
name="{$fields.stage.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.stage.name}-image"></button><button type="button"
id="btn-clear-{$fields.stage.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.stage.name}-input', '{$fields.stage.name}');sync_{$fields.stage.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
	{/literal}

			{literal}
		(function (){
			var selectElem = document.getElementById("{/literal}{$fields.stage.name}{literal}");
			
			if (typeof select_defaults =="undefined")
				select_defaults = [];
			
			select_defaults[selectElem.id] = {key:selectElem.value,text:''};

			//get default
			for (i=0;i<selectElem.options.length;i++){
				if (selectElem.options[i].value==selectElem.value)
					select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
			}

			//SUGAR.AutoComplete.{$ac_key}.ds = 
			//get options array from vardefs
			var options = SUGAR.AutoComplete.getOptionsArray("");

			YUI().use('datasource', 'datasource-jsonschema',function (Y) {
				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
				    source: function (request) {
				    	var ret = [];
				    	for (i=0;i<selectElem.options.length;i++)
				    		if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
				    			ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
				    	return ret;
				    }
				});
			});
		})();
		{/literal}
	
	{literal}
		YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
	{/literal}
			
	SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.stage.name}-input');
	SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.stage.name}-image');
	SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.stage.name}');
	
			{literal}
			function SyncToHidden(selectme){
				var selectElem = document.getElementById("{/literal}{$fields.stage.name}{literal}");
				var doSimulateChange = false;
				
				if (selectElem.value!=selectme)
					doSimulateChange=true;
				
				selectElem.value=selectme;

				for (i=0;i<selectElem.options.length;i++){
					selectElem.options[i].selected=false;
					if (selectElem.options[i].value==selectme)
						selectElem.options[i].selected=true;
				}

				if (doSimulateChange)
					SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
			}

			//global variable 
			sync_{/literal}{$fields.stage.name}{literal} = function(){
				SyncToHidden();
			}
			function syncFromHiddenToWidget(){

				var selectElem = document.getElementById("{/literal}{$fields.stage.name}{literal}");

				//if select no longer on page, kill timer
				if (selectElem==null || selectElem.options == null)
					return;

				var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

				for (i=0;i<selectElem.options.length;i++){

					if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.stage.name}-input{literal}'))
						SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
				}
			}

            YAHOO.util.Event.onAvailable("{/literal}{$fields.stage.name}{literal}", syncFromHiddenToWidget);
		{/literal}

		SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
		SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
		SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
			{literal}
		}
		{/literal}
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
			{literal}
		}
		{/literal}
		
	SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;
	
	{literal}
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
		activateFirstItem: true,
		{/literal}
		minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
		queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
		zIndex: 99999,

				
		{literal}
		source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,
		
		resultTextLocator: 'text',
		resultHighlighter: 'phraseMatch',
		resultFilters: 'phraseMatch',
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
		var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
		if(hover[0] != null){
			if (ex) {
				var h = '1000px';
				hover[0].style.height = h;
			}
			else{
				hover[0].style.height = '';
			}
		}
	}
		
	if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
		// expand the dropdown options upon focus
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
		});
	}

			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
		});
		
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
			var selectElem = document.getElementById("{/literal}{$fields.stage.name}{literal}");
			//if typed value is a valid option, do nothing
			for (i=0;i<selectElem.options.length;i++)
				if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
					return;
			
			//typed value is invalid, so set the text and the hidden to blank
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
			SyncToHidden(select_defaults[selectElem.id].key);
		});
	
	// when they click on the arrow image, toggle the visibility of the options
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
		if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
		} else {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
		}
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
	});

	// when they select an option, set the hidden input with the KEY, to be saved
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
		SyncToHidden(e.result.raw.key);
	});
 
});
</script> 
{/literal}
{/if}
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_REFERENCE_NO">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_REFERENCE_NO' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="reference_no_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.reference_no_c.value) <= 0}
{assign var="value" value=$fields.reference_no_c.default_value }
{else}
{assign var="value" value=$fields.reference_no_c.value }
{/if}  
<input type='text' name='{$fields.reference_no_c.name}' 
id='{$fields.reference_no_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='format : G/YY/No'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_ASSIGNED_TO_NAME">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_ASSIGNED_TO_NAME' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="relate" field="assigned_user_name"  >
{counter name="panelFieldCount" print=false}

<input type="text" name="{$fields.assigned_user_name.name}" class="sqsEnabled" tabindex="0" id="{$fields.assigned_user_name.name}" size="" value="{$fields.assigned_user_name.value}" title='' autocomplete="off"  	 >
<input type="hidden" name="{$fields.assigned_user_name.id_name}" 
id="{$fields.assigned_user_name.id_name}" 
value="{$fields.assigned_user_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.assigned_user_name.name}" id="btn_{$fields.assigned_user_name.name}" tabindex="0" title="{sugar_translate label="LBL_ACCESSKEY_SELECT_USERS_TITLE"}" class="button firstChild" value="{sugar_translate label="LBL_ACCESSKEY_SELECT_USERS_LABEL"}"
onclick='open_popup(
"{$fields.assigned_user_name.module}", 
600, 
400, 
"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"EditView","field_to_name_array":{"id":"assigned_user_id","user_name":"assigned_user_name"}}{/literal}, 
"single", 
true
);' ><span class="suitepicon suitepicon-action-select"></span></button><button type="button" name="btn_clr_{$fields.assigned_user_name.name}" id="btn_clr_{$fields.assigned_user_name.name}" tabindex="0" title="{sugar_translate label="LBL_ACCESSKEY_CLEAR_USERS_TITLE"}"  class="button lastChild"
onclick="SUGAR.clearRelateField(this.form, '{$fields.assigned_user_name.name}', '{$fields.assigned_user_name.id_name}');"  value="{sugar_translate label="LBL_ACCESSKEY_CLEAR_USERS_LABEL"}" ><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
<script type="text/javascript">
SUGAR.util.doWhen(
		"typeof(sqs_objects) != 'undefined' && typeof(sqs_objects['{$form_name}_{$fields.assigned_user_name.name}']) != 'undefined'",
		enableQS
);
</script>
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_TERM">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_TERM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="enum" field="term"  >
{counter name="panelFieldCount" print=false}

{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.term.name}" 
id="{$fields.term.name}" 
title=''       
>
{if isset($fields.term.value) && $fields.term.value != ''}
{html_options options=$fields.term.options selected=$fields.term.value}
{else}
{html_options options=$fields.term.options selected=$fields.term.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.term.options }
{capture name="field_val"}{$fields.term.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.term.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.term.name}" 
id="{$fields.term.name}" 
title=''          
>
{if isset($fields.term.value) && $fields.term.value != ''}
{html_options options=$fields.term.options selected=$fields.term.value}
{else}
{html_options options=$fields.term.options selected=$fields.term.default}
{/if}
</select>
<input
id="{$fields.term.name}-input"
name="{$fields.term.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.term.name}-image"></button><button type="button"
id="btn-clear-{$fields.term.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.term.name}-input', '{$fields.term.name}');sync_{$fields.term.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
	{/literal}

			{literal}
		(function (){
			var selectElem = document.getElementById("{/literal}{$fields.term.name}{literal}");
			
			if (typeof select_defaults =="undefined")
				select_defaults = [];
			
			select_defaults[selectElem.id] = {key:selectElem.value,text:''};

			//get default
			for (i=0;i<selectElem.options.length;i++){
				if (selectElem.options[i].value==selectElem.value)
					select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
			}

			//SUGAR.AutoComplete.{$ac_key}.ds = 
			//get options array from vardefs
			var options = SUGAR.AutoComplete.getOptionsArray("");

			YUI().use('datasource', 'datasource-jsonschema',function (Y) {
				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
				    source: function (request) {
				    	var ret = [];
				    	for (i=0;i<selectElem.options.length;i++)
				    		if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
				    			ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
				    	return ret;
				    }
				});
			});
		})();
		{/literal}
	
	{literal}
		YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
	{/literal}
			
	SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.term.name}-input');
	SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.term.name}-image');
	SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.term.name}');
	
			{literal}
			function SyncToHidden(selectme){
				var selectElem = document.getElementById("{/literal}{$fields.term.name}{literal}");
				var doSimulateChange = false;
				
				if (selectElem.value!=selectme)
					doSimulateChange=true;
				
				selectElem.value=selectme;

				for (i=0;i<selectElem.options.length;i++){
					selectElem.options[i].selected=false;
					if (selectElem.options[i].value==selectme)
						selectElem.options[i].selected=true;
				}

				if (doSimulateChange)
					SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
			}

			//global variable 
			sync_{/literal}{$fields.term.name}{literal} = function(){
				SyncToHidden();
			}
			function syncFromHiddenToWidget(){

				var selectElem = document.getElementById("{/literal}{$fields.term.name}{literal}");

				//if select no longer on page, kill timer
				if (selectElem==null || selectElem.options == null)
					return;

				var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

				for (i=0;i<selectElem.options.length;i++){

					if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.term.name}-input{literal}'))
						SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
				}
			}

            YAHOO.util.Event.onAvailable("{/literal}{$fields.term.name}{literal}", syncFromHiddenToWidget);
		{/literal}

		SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
		SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
		SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
			{literal}
		}
		{/literal}
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
			{literal}
		}
		{/literal}
		
	SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;
	
	{literal}
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
		activateFirstItem: true,
		{/literal}
		minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
		queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
		zIndex: 99999,

				
		{literal}
		source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,
		
		resultTextLocator: 'text',
		resultHighlighter: 'phraseMatch',
		resultFilters: 'phraseMatch',
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
		var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
		if(hover[0] != null){
			if (ex) {
				var h = '1000px';
				hover[0].style.height = h;
			}
			else{
				hover[0].style.height = '';
			}
		}
	}
		
	if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
		// expand the dropdown options upon focus
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
		});
	}

			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
		});
		
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
			var selectElem = document.getElementById("{/literal}{$fields.term.name}{literal}");
			//if typed value is a valid option, do nothing
			for (i=0;i<selectElem.options.length;i++)
				if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
					return;
			
			//typed value is invalid, so set the text and the hidden to blank
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
			SyncToHidden(select_defaults[selectElem.id].key);
		});
	
	// when they click on the arrow image, toggle the visibility of the options
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
		if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
		} else {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
		}
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
	});

	// when they select an option, set the hidden input with the KEY, to be saved
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
		SyncToHidden(e.result.raw.key);
	});
 
});
</script> 
{/literal}
{/if}
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_APPROVAL_STATUS">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_APPROVAL_STATUS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="enum" field="approval_status"  >
{counter name="panelFieldCount" print=false}

{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.approval_status.name}" 
id="{$fields.approval_status.name}" 
title=''       
>
{if isset($fields.approval_status.value) && $fields.approval_status.value != ''}
{html_options options=$fields.approval_status.options selected=$fields.approval_status.value}
{else}
{html_options options=$fields.approval_status.options selected=$fields.approval_status.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.approval_status.options }
{capture name="field_val"}{$fields.approval_status.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.approval_status.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.approval_status.name}" 
id="{$fields.approval_status.name}" 
title=''          
>
{if isset($fields.approval_status.value) && $fields.approval_status.value != ''}
{html_options options=$fields.approval_status.options selected=$fields.approval_status.value}
{else}
{html_options options=$fields.approval_status.options selected=$fields.approval_status.default}
{/if}
</select>
<input
id="{$fields.approval_status.name}-input"
name="{$fields.approval_status.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.approval_status.name}-image"></button><button type="button"
id="btn-clear-{$fields.approval_status.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.approval_status.name}-input', '{$fields.approval_status.name}');sync_{$fields.approval_status.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
	{/literal}

			{literal}
		(function (){
			var selectElem = document.getElementById("{/literal}{$fields.approval_status.name}{literal}");
			
			if (typeof select_defaults =="undefined")
				select_defaults = [];
			
			select_defaults[selectElem.id] = {key:selectElem.value,text:''};

			//get default
			for (i=0;i<selectElem.options.length;i++){
				if (selectElem.options[i].value==selectElem.value)
					select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
			}

			//SUGAR.AutoComplete.{$ac_key}.ds = 
			//get options array from vardefs
			var options = SUGAR.AutoComplete.getOptionsArray("");

			YUI().use('datasource', 'datasource-jsonschema',function (Y) {
				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
				    source: function (request) {
				    	var ret = [];
				    	for (i=0;i<selectElem.options.length;i++)
				    		if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
				    			ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
				    	return ret;
				    }
				});
			});
		})();
		{/literal}
	
	{literal}
		YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
	{/literal}
			
	SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.approval_status.name}-input');
	SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.approval_status.name}-image');
	SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.approval_status.name}');
	
			{literal}
			function SyncToHidden(selectme){
				var selectElem = document.getElementById("{/literal}{$fields.approval_status.name}{literal}");
				var doSimulateChange = false;
				
				if (selectElem.value!=selectme)
					doSimulateChange=true;
				
				selectElem.value=selectme;

				for (i=0;i<selectElem.options.length;i++){
					selectElem.options[i].selected=false;
					if (selectElem.options[i].value==selectme)
						selectElem.options[i].selected=true;
				}

				if (doSimulateChange)
					SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
			}

			//global variable 
			sync_{/literal}{$fields.approval_status.name}{literal} = function(){
				SyncToHidden();
			}
			function syncFromHiddenToWidget(){

				var selectElem = document.getElementById("{/literal}{$fields.approval_status.name}{literal}");

				//if select no longer on page, kill timer
				if (selectElem==null || selectElem.options == null)
					return;

				var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

				for (i=0;i<selectElem.options.length;i++){

					if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.approval_status.name}-input{literal}'))
						SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
				}
			}

            YAHOO.util.Event.onAvailable("{/literal}{$fields.approval_status.name}{literal}", syncFromHiddenToWidget);
		{/literal}

		SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
		SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
		SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
			{literal}
		}
		{/literal}
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
			{literal}
		}
		{/literal}
		
	SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;
	
	{literal}
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
		activateFirstItem: true,
		{/literal}
		minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
		queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
		zIndex: 99999,

				
		{literal}
		source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,
		
		resultTextLocator: 'text',
		resultHighlighter: 'phraseMatch',
		resultFilters: 'phraseMatch',
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
		var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
		if(hover[0] != null){
			if (ex) {
				var h = '1000px';
				hover[0].style.height = h;
			}
			else{
				hover[0].style.height = '';
			}
		}
	}
		
	if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
		// expand the dropdown options upon focus
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
		});
	}

			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
		});
		
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
			var selectElem = document.getElementById("{/literal}{$fields.approval_status.name}{literal}");
			//if typed value is a valid option, do nothing
			for (i=0;i<selectElem.options.length;i++)
				if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
					return;
			
			//typed value is invalid, so set the text and the hidden to blank
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
			SyncToHidden(select_defaults[selectElem.id].key);
		});
	
	// when they click on the arrow image, toggle the visibility of the options
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
		if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
		} else {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
		}
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
	});

	// when they select an option, set the hidden input with the KEY, to be saved
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
		SyncToHidden(e.result.raw.key);
	});
 
});
</script> 
{/literal}
{/if}
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_APPROVAL_ISSUE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_APPROVAL_ISSUE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="text" field="approval_issue"  >
{counter name="panelFieldCount" print=false}

{if empty($fields.approval_issue.value)}
{assign var="value" value=$fields.approval_issue.default_value }
{else}
{assign var="value" value=$fields.approval_issue.value }
{/if}
<textarea  id='{$fields.approval_issue.name}' name='{$fields.approval_issue.name}'
rows="4"
cols="60"
title='' tabindex="0" 
 >{$value}</textarea>
{literal}{/literal}
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_EXPIRATION">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_EXPIRATION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="date" field="expiration"  >
{counter name="panelFieldCount" print=false}

<span class="dateTime">
{assign var=date_value value=$fields.expiration.value }
<input class="date_input" autocomplete="off" type="text" name="{$fields.expiration.name}" id="{$fields.expiration.name}" value="{$date_value}" title=''  tabindex='0'    size="11" maxlength="10" >
<button type="button" id="{$fields.expiration.name}_trigger" class="btn btn-danger" onclick="return false;"><span class="suitepicon suitepicon-module-calendar" alt="{$APP.LBL_ENTER_DATE}"></span></button>
</span>
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.expiration.name}",
form : "EditView",
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
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_INVOICE_STATUS">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_INVOICE_STATUS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="enum" field="invoice_status"  >
{counter name="panelFieldCount" print=false}

{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.invoice_status.name}" 
id="{$fields.invoice_status.name}" 
title=''       
>
{if isset($fields.invoice_status.value) && $fields.invoice_status.value != ''}
{html_options options=$fields.invoice_status.options selected=$fields.invoice_status.value}
{else}
{html_options options=$fields.invoice_status.options selected=$fields.invoice_status.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.invoice_status.options }
{capture name="field_val"}{$fields.invoice_status.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.invoice_status.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.invoice_status.name}" 
id="{$fields.invoice_status.name}" 
title=''          
>
{if isset($fields.invoice_status.value) && $fields.invoice_status.value != ''}
{html_options options=$fields.invoice_status.options selected=$fields.invoice_status.value}
{else}
{html_options options=$fields.invoice_status.options selected=$fields.invoice_status.default}
{/if}
</select>
<input
id="{$fields.invoice_status.name}-input"
name="{$fields.invoice_status.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.invoice_status.name}-image"></button><button type="button"
id="btn-clear-{$fields.invoice_status.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.invoice_status.name}-input', '{$fields.invoice_status.name}');sync_{$fields.invoice_status.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
	{/literal}

			{literal}
		(function (){
			var selectElem = document.getElementById("{/literal}{$fields.invoice_status.name}{literal}");
			
			if (typeof select_defaults =="undefined")
				select_defaults = [];
			
			select_defaults[selectElem.id] = {key:selectElem.value,text:''};

			//get default
			for (i=0;i<selectElem.options.length;i++){
				if (selectElem.options[i].value==selectElem.value)
					select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
			}

			//SUGAR.AutoComplete.{$ac_key}.ds = 
			//get options array from vardefs
			var options = SUGAR.AutoComplete.getOptionsArray("");

			YUI().use('datasource', 'datasource-jsonschema',function (Y) {
				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
				    source: function (request) {
				    	var ret = [];
				    	for (i=0;i<selectElem.options.length;i++)
				    		if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
				    			ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
				    	return ret;
				    }
				});
			});
		})();
		{/literal}
	
	{literal}
		YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
	{/literal}
			
	SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.invoice_status.name}-input');
	SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.invoice_status.name}-image');
	SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.invoice_status.name}');
	
			{literal}
			function SyncToHidden(selectme){
				var selectElem = document.getElementById("{/literal}{$fields.invoice_status.name}{literal}");
				var doSimulateChange = false;
				
				if (selectElem.value!=selectme)
					doSimulateChange=true;
				
				selectElem.value=selectme;

				for (i=0;i<selectElem.options.length;i++){
					selectElem.options[i].selected=false;
					if (selectElem.options[i].value==selectme)
						selectElem.options[i].selected=true;
				}

				if (doSimulateChange)
					SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
			}

			//global variable 
			sync_{/literal}{$fields.invoice_status.name}{literal} = function(){
				SyncToHidden();
			}
			function syncFromHiddenToWidget(){

				var selectElem = document.getElementById("{/literal}{$fields.invoice_status.name}{literal}");

				//if select no longer on page, kill timer
				if (selectElem==null || selectElem.options == null)
					return;

				var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

				for (i=0;i<selectElem.options.length;i++){

					if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.invoice_status.name}-input{literal}'))
						SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
				}
			}

            YAHOO.util.Event.onAvailable("{/literal}{$fields.invoice_status.name}{literal}", syncFromHiddenToWidget);
		{/literal}

		SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
		SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
		SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
			{literal}
		}
		{/literal}
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
			{literal}
		}
		{/literal}
		
	SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;
	
	{literal}
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
		activateFirstItem: true,
		{/literal}
		minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
		queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
		zIndex: 99999,

				
		{literal}
		source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,
		
		resultTextLocator: 'text',
		resultHighlighter: 'phraseMatch',
		resultFilters: 'phraseMatch',
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
		var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
		if(hover[0] != null){
			if (ex) {
				var h = '1000px';
				hover[0].style.height = h;
			}
			else{
				hover[0].style.height = '';
			}
		}
	}
		
	if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
		// expand the dropdown options upon focus
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
		});
	}

			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
		});
		
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
			var selectElem = document.getElementById("{/literal}{$fields.invoice_status.name}{literal}");
			//if typed value is a valid option, do nothing
			for (i=0;i<selectElem.options.length;i++)
				if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
					return;
			
			//typed value is invalid, so set the text and the hidden to blank
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
			SyncToHidden(select_defaults[selectElem.id].key);
		});
	
	// when they click on the arrow image, toggle the visibility of the options
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
		if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
		} else {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
		}
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
	});

	// when they select an option, set the hidden input with the KEY, to be saved
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
		SyncToHidden(e.result.raw.key);
	});
 
});
</script> 
{/literal}
{/if}
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_ADDRESS_INFORMATION' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_1" data-id="LBL_ADDRESS_INFORMATION">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_BILLING_ACCOUNT">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_BILLING_ACCOUNT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="relate" field="billing_account"  >
{counter name="panelFieldCount" print=false}

<input type="text" name="{$fields.billing_account.name}" class="sqsEnabled" tabindex="0" id="{$fields.billing_account.name}" size="" value="{$fields.billing_account.value}" title='' autocomplete="off"  	 >
<input type="hidden" name="{$fields.billing_account.id_name}" 
id="{$fields.billing_account.id_name}" 
value="{$fields.billing_account_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.billing_account.name}" id="btn_{$fields.billing_account.name}" tabindex="0" title="{sugar_translate label="LBL_ACCESSKEY_SELECT_ACCOUNTS_TITLE"}" class="button firstChild" value="{sugar_translate label="LBL_ACCESSKEY_SELECT_ACCOUNTS_LABEL"}"
onclick='open_popup(
"{$fields.billing_account.module}", 
600, 
400, 
"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"EditView","field_to_name_array":{"id":"billing_account_id","name":"billing_account","billing_address_street":"billing_address_street","billing_address_city":"billing_address_city","billing_address_state":"billing_address_state","billing_address_postalcode":"billing_address_postalcode","billing_address_country":"billing_address_country","shipping_address_street":"shipping_address_street","shipping_address_city":"shipping_address_city","shipping_address_state":"shipping_address_state","shipping_address_postalcode":"shipping_address_postalcode","shipping_address_country":"shipping_address_country","phone_office":"phone_work"}}{/literal}, 
"single", 
true
);' ><span class="suitepicon suitepicon-action-select"></span></button><button type="button" name="btn_clr_{$fields.billing_account.name}" id="btn_clr_{$fields.billing_account.name}" tabindex="0" title="{sugar_translate label="LBL_ACCESSKEY_CLEAR_ACCOUNTS_TITLE"}"  class="button lastChild"
onclick="SUGAR.clearRelateField(this.form, '{$fields.billing_account.name}', '{$fields.billing_account.id_name}');"  value="{sugar_translate label="LBL_ACCESSKEY_CLEAR_ACCOUNTS_LABEL"}" ><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
<script type="text/javascript">
SUGAR.util.doWhen(
		"typeof(sqs_objects) != 'undefined' && typeof(sqs_objects['{$form_name}_{$fields.billing_account.name}']) != 'undefined'",
		enableQS
);
</script>
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_BILLING_CONTACT">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_BILLING_CONTACT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="relate" field="billing_contact"  >
{counter name="panelFieldCount" print=false}

<input type="text" name="{$fields.billing_contact.name}" class="sqsEnabled" tabindex="0" id="{$fields.billing_contact.name}" size="" value="{$fields.billing_contact.value}" title='' autocomplete="off"  	 >
<input type="hidden" name="{$fields.billing_contact.id_name}" 
id="{$fields.billing_contact.id_name}" 
value="{$fields.billing_contact_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.billing_contact.name}" id="btn_{$fields.billing_contact.name}" tabindex="0" title="{sugar_translate label="LBL_ACCESSKEY_SELECT_CONTACTS_TITLE"}" class="button firstChild" value="{sugar_translate label="LBL_ACCESSKEY_SELECT_CONTACTS_LABEL"}"
onclick='open_popup(
"{$fields.billing_contact.module}", 
600, 
400, 
"&account_name="+this.form.{$fields.billing_account.name}.value+"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"EditView","field_to_name_array":{"id":"billing_contact_id","name":"billing_contact"}}{/literal}, 
"single", 
true
);' ><span class="suitepicon suitepicon-action-select"></span></button><button type="button" name="btn_clr_{$fields.billing_contact.name}" id="btn_clr_{$fields.billing_contact.name}" tabindex="0" title="{sugar_translate label="LBL_ACCESSKEY_CLEAR_CONTACTS_TITLE"}"  class="button lastChild"
onclick="SUGAR.clearRelateField(this.form, '{$fields.billing_contact.name}', '{$fields.billing_contact.id_name}');"  value="{sugar_translate label="LBL_ACCESSKEY_CLEAR_CONTACTS_LABEL"}" ><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
<script type="text/javascript">
SUGAR.util.doWhen(
		"typeof(sqs_objects) != 'undefined' && typeof(sqs_objects['{$form_name}_{$fields.billing_contact.name}']) != 'undefined'",
		enableQS
);
</script>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">



<div class="col-xs-12 col-sm-12 edit-view-field " type="varchar" field="billing_address_street" colspan='2' >
{counter name="panelFieldCount" print=false}

<script src='{sugar_getjspath file="include/SugarFields/Fields/Address/SugarFieldAddress.js"}'></script>
<fieldset id='BILLING_address_fieldset'>
<legend>{sugar_translate label='LBL_BILLING_ADDRESS' module=''}</legend>
<table border="0" cellspacing="1" cellpadding="0" class="edit" width="100%">
<tr>
<td valign="top" id="billing_address_street_label" width='25%' scope='row'>
<label for="billing_address_street">{sugar_translate label='LBL_BILLING_STREET' module=''}:</label>
{if $fields.billing_address_street.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td width="*">
<textarea id="billing_address_street" name="billing_address_street" title='' maxlength="150"
                          rows="2" cols="30"
                          tabindex="0">{$fields.billing_address_street.value}</textarea>
</td>
</tr>
<tr>
<td id="billing_address_city_label" width='%'
scope='row'>
<label for="billing_address_city">{sugar_translate label='LBL_CITY' module=''}:
{if $fields.billing_address_city.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="billing_address_city" id="billing_address_city" title='{$fields.billing_address_city.help}' size="30"
maxlength='150' value='{$fields.billing_address_city.value}'
tabindex="0">
</td>
</tr>
<tr>
<td id="billing_address_state_label" width='%'
scope='row'>
<label for="billing_address_state">{sugar_translate label='LBL_STATE' module=''}:</label>
{if $fields.billing_address_state.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="billing_address_state" id="billing_address_state" title='{$fields.billing_address_state.help}' size="30"
maxlength='150' value='{$fields.billing_address_state.value}'
tabindex="0">
</td>
</tr>
<tr>
<td id="billing_address_postalcode_label"
width='%' scope='row'>
<label for="billing_address_postalcode">{sugar_translate label='LBL_POSTAL_CODE' module=''}:</label>
{if $fields.billing_address_postalcode.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="billing_address_postalcode" id="billing_address_postalcode" title='{$fields.billing_address_postalcode.help}' size="30"
maxlength='150'                       value='{$fields.billing_address_postalcode.value}' tabindex="0">
</td>
</tr>
<tr>
<td id="billing_address_country_label" width='%'
scope='row'>
<label for="billing_address_country">{sugar_translate label='LBL_COUNTRY' module=''}:</label>
{if $fields.billing_address_country.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="billing_address_country" id="billing_address_country" title='{$fields.billing_address_country.help}' size="30"
maxlength='150' value='{$fields.billing_address_country.value}'
tabindex="0">
</td>
</tr>
<tr>
<td colspan='2' NOWRAP>&nbsp;</td>
</tr>
</table>
</fieldset>
<script type="text/javascript">
  SUGAR.util.doWhen("typeof(SUGAR.AddressField) != 'undefined'", function () {ldelim}
      billing_address = new SUGAR.AddressField("billing_checkbox", '', 'billing');
      {rdelim});
</script>
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">



<div class="col-xs-12 col-sm-12 edit-view-field " type="varchar" field="shipping_address_street" colspan='2' >
{counter name="panelFieldCount" print=false}

<script src='{sugar_getjspath file="include/SugarFields/Fields/Address/SugarFieldAddress.js"}'></script>
<fieldset id='SHIPPING_address_fieldset'>
<legend>{sugar_translate label='LBL_SHIPPING_ADDRESS' module=''}</legend>
<table border="0" cellspacing="1" cellpadding="0" class="edit" width="100%">
<tr>
<td valign="top" id="shipping_address_street_label" width='25%' scope='row'>
<label for="shipping_address_street">{sugar_translate label='LBL_SHIPPING_STREET' module=''}:</label>
{if $fields.shipping_address_street.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td width="*">
<textarea id="shipping_address_street" name="shipping_address_street" title='' maxlength="150"
                          rows="2" cols="30"
                          tabindex="0">{$fields.shipping_address_street.value}</textarea>
</td>
</tr>
<tr>
<td id="shipping_address_city_label" width='%'
scope='row'>
<label for="shipping_address_city">{sugar_translate label='LBL_CITY' module=''}:
{if $fields.shipping_address_city.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="shipping_address_city" id="shipping_address_city" title='{$fields.shipping_address_city.help}' size="30"
maxlength='150' value='{$fields.shipping_address_city.value}'
tabindex="0">
</td>
</tr>
<tr>
<td id="shipping_address_state_label" width='%'
scope='row'>
<label for="shipping_address_state">{sugar_translate label='LBL_STATE' module=''}:</label>
{if $fields.shipping_address_state.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="shipping_address_state" id="shipping_address_state" title='{$fields.shipping_address_state.help}' size="30"
maxlength='150' value='{$fields.shipping_address_state.value}'
tabindex="0">
</td>
</tr>
<tr>
<td id="shipping_address_postalcode_label"
width='%' scope='row'>
<label for="shipping_address_postalcode">{sugar_translate label='LBL_POSTAL_CODE' module=''}:</label>
{if $fields.shipping_address_postalcode.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="shipping_address_postalcode" id="shipping_address_postalcode" title='{$fields.shipping_address_postalcode.help}' size="30"
maxlength='150'                       value='{$fields.shipping_address_postalcode.value}' tabindex="0">
</td>
</tr>
<tr>
<td id="shipping_address_country_label" width='%'
scope='row'>
<label for="shipping_address_country">{sugar_translate label='LBL_COUNTRY' module=''}:</label>
{if $fields.shipping_address_country.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="shipping_address_country" id="shipping_address_country" title='{$fields.shipping_address_country.help}' size="30"
maxlength='150' value='{$fields.shipping_address_country.value}'
tabindex="0">
</td>
</tr>
<tr>
<td scope='row' NOWRAP>
{sugar_translate label='LBL_COPY_ADDRESS_FROM_LEFT' module=''}:
</td>
<td>
<input id="shipping_checkbox" name="shipping_checkbox" type="checkbox"
onclick="shipping_address.syncFields();">
</td>
</tr>
</table>
</fieldset>
<script type="text/javascript">
  SUGAR.util.doWhen("typeof(SUGAR.AddressField) != 'undefined'", function () {ldelim}
      shipping_address = new SUGAR.AddressField("shipping_checkbox", 'billing', 'shipping');
      {rdelim});
</script>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL1' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_2" data-id="LBL_EDITVIEW_PANEL1">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_LIQUID">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_LIQUID' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="liquid_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.liquid_c.value) <= 0}
{assign var="value" value=$fields.liquid_c.default_value }
{else}
{assign var="value" value=$fields.liquid_c.value }
{/if}  
<input type='text' name='{$fields.liquid_c.name}' 
id='{$fields.liquid_c.name}' size='30' 
maxlength='128' 
value='{$value}' title='liquid name'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CAPACITY">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_CAPACITY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="capacity_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.capacity_c.value) <= 0}
{assign var="value" value=$fields.capacity_c.default_value }
{else}
{assign var="value" value=$fields.capacity_c.value }
{/if}  
<input type='text' name='{$fields.capacity_c.name}' 
id='{$fields.capacity_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='eg : 10 m3/hr'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_SOLIDS">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_SOLIDS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="solids_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.solids_c.value) <= 0}
{assign var="value" value=$fields.solids_c.default_value }
{else}
{assign var="value" value=$fields.solids_c.value }
{/if}  
<input type='text' name='{$fields.solids_c.name}' 
id='{$fields.solids_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='NIL or %'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_SUC_PRESS">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_SUC_PRESS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="suc_press_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.suc_press_c.value) <= 0}
{assign var="value" value=$fields.suc_press_c.default_value }
{else}
{assign var="value" value=$fields.suc_press_c.value }
{/if}  
<input type='text' name='{$fields.suc_press_c.name}' 
id='{$fields.suc_press_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='Positive / Flooded'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_TEMP">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_TEMP' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="temp_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.temp_c.value) <= 0}
{assign var="value" value=$fields.temp_c.default_value }
{else}
{assign var="value" value=$fields.temp_c.value }
{/if}  
<input type='text' name='{$fields.temp_c.name}' 
id='{$fields.temp_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='&deg;C or &deg;F'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_DIFF_HEAD">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_DIFF_HEAD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="diff_head_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.diff_head_c.value) <= 0}
{assign var="value" value=$fields.diff_head_c.default_value }
{else}
{assign var="value" value=$fields.diff_head_c.value }
{/if}  
<input type='text' name='{$fields.diff_head_c.name}' 
id='{$fields.diff_head_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='Differential Head'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_SP_GR">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_SP_GR' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="sp_gr_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.sp_gr_c.value) <= 0}
{assign var="value" value=$fields.sp_gr_c.default_value }
{else}
{assign var="value" value=$fields.sp_gr_c.value }
{/if}  
<input type='text' name='{$fields.sp_gr_c.name}' 
id='{$fields.sp_gr_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='specific gravity'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_NPSH_REQD">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_NPSH_REQD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="npsh_reqd_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.npsh_reqd_c.value) <= 0}
{assign var="value" value=$fields.npsh_reqd_c.default_value }
{else}
{assign var="value" value=$fields.npsh_reqd_c.value }
{/if}  
<input type='text' name='{$fields.npsh_reqd_c.name}' 
id='{$fields.npsh_reqd_c.name}' size='30' 
maxlength='128' 
value='{$value}' title='eg : 10 mlc'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_VISCOSITY">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_VISCOSITY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="viscosity_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.viscosity_c.value) <= 0}
{assign var="value" value=$fields.viscosity_c.default_value }
{else}
{assign var="value" value=$fields.viscosity_c.value }
{/if}  
<input type='text' name='{$fields.viscosity_c.name}' 
id='{$fields.viscosity_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='viscosity'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_VAP_PR">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_VAP_PR' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="vap_pr_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.vap_pr_c.value) <= 0}
{assign var="value" value=$fields.vap_pr_c.default_value }
{else}
{assign var="value" value=$fields.vap_pr_c.value }
{/if}  
<input type='text' name='{$fields.vap_pr_c.name}' 
id='{$fields.vap_pr_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='Vapour Pressure'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_DISC_PRESSURE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_DISC_PRESSURE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="disc_pressure_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.disc_pressure_c.value) <= 0}
{assign var="value" value=$fields.disc_pressure_c.default_value }
{else}
{assign var="value" value=$fields.disc_pressure_c.value }
{/if}  
<input type='text' name='{$fields.disc_pressure_c.name}' 
id='{$fields.disc_pressure_c.name}' size='30' 
maxlength='64' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL8' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_3" data-id="LBL_EDITVIEW_PANEL8">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_PUMP_MODEL">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_PUMP_MODEL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="pump_model_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.pump_model_c.value) <= 0}
{assign var="value" value=$fields.pump_model_c.default_value }
{else}
{assign var="value" value=$fields.pump_model_c.value }
{/if}  
<input type='text' name='{$fields.pump_model_c.name}' 
id='{$fields.pump_model_c.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_SUCTION_DELIVERY">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_SUCTION_DELIVERY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="suction_delivery_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.suction_delivery_c.value) <= 0}
{assign var="value" value=$fields.suction_delivery_c.default_value }
{else}
{assign var="value" value=$fields.suction_delivery_c.value }
{/if}  
<input type='text' name='{$fields.suction_delivery_c.name}' 
id='{$fields.suction_delivery_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='1&quot; , 2&quot; , 3&quot;'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_PUMP_TYPE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_PUMP_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="pump_type_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.pump_type_c.value) <= 0}
{assign var="value" value=$fields.pump_type_c.default_value }
{else}
{assign var="value" value=$fields.pump_type_c.value }
{/if}  
<input type='text' name='{$fields.pump_type_c.name}' 
id='{$fields.pump_type_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='eg: Sando Horizontal / Vertical / Hydraulic / Pump'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_PUMP_PERFORMANCE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_PUMP_PERFORMANCE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="pump_performance_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.pump_performance_c.value) <= 0}
{assign var="value" value=$fields.pump_performance_c.default_value }
{else}
{assign var="value" value=$fields.pump_performance_c.value }
{/if}  
<input type='text' name='{$fields.pump_performance_c.name}' 
id='{$fields.pump_performance_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='As per API 675 / ISO 2858 standard'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_VCF_PUMP_LENGTH">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_VCF_PUMP_LENGTH' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="vcf_pump_length_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.vcf_pump_length_c.value) <= 0}
{assign var="value" value=$fields.vcf_pump_length_c.default_value }
{else}
{assign var="value" value=$fields.vcf_pump_length_c.value }
{/if}  
<input type='text' name='{$fields.vcf_pump_length_c.name}' 
id='{$fields.vcf_pump_length_c.name}' size='30' 
maxlength='64' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_VCF_TOTAL_LENGTH">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_VCF_TOTAL_LENGTH' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="vcf_total_length_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.vcf_total_length_c.value) <= 0}
{assign var="value" value=$fields.vcf_total_length_c.default_value }
{else}
{assign var="value" value=$fields.vcf_total_length_c.value }
{/if}  
<input type='text' name='{$fields.vcf_total_length_c.name}' 
id='{$fields.vcf_total_length_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='Total Length incl. strainer'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL2' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_4" data-id="LBL_EDITVIEW_PANEL2">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_INSTALLATION">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_INSTALLATION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="installation_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.installation_c.value) <= 0}
{assign var="value" value=$fields.installation_c.default_value }
{else}
{assign var="value" value=$fields.installation_c.value }
{/if}  
<input type='text' name='{$fields.installation_c.name}' 
id='{$fields.installation_c.name}' size='30' 
maxlength='64' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_IMPELLER_TYPE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_IMPELLER_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="impeller_type_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.impeller_type_c.value) <= 0}
{assign var="value" value=$fields.impeller_type_c.default_value }
{else}
{assign var="value" value=$fields.impeller_type_c.value }
{/if}  
<input type='text' name='{$fields.impeller_type_c.name}' 
id='{$fields.impeller_type_c.name}' size='30' 
maxlength='128' 
value='{$value}' title='Semi-Open / Closed / Open'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_INSTALLATION_DEPTH">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_INSTALLATION_DEPTH' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="installation_depth_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.installation_depth_c.value) <= 0}
{assign var="value" value=$fields.installation_depth_c.default_value }
{else}
{assign var="value" value=$fields.installation_depth_c.value }
{/if}  
<input type='text' name='{$fields.installation_depth_c.name}' 
id='{$fields.installation_depth_c.name}' size='30' 
maxlength='128' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_IMPELLER_DIA">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_IMPELLER_DIA' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="impeller_dia_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.impeller_dia_c.value) <= 0}
{assign var="value" value=$fields.impeller_dia_c.default_value }
{else}
{assign var="value" value=$fields.impeller_dia_c.value }
{/if}  
<input type='text' name='{$fields.impeller_dia_c.name}' 
id='{$fields.impeller_dia_c.name}' size='30' 
maxlength='128' 
value='{$value}' title='eg :  160mm Max / 135mm Rated'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_FLANGE_RATING">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_FLANGE_RATING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="flange_rating_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.flange_rating_c.value) <= 0}
{assign var="value" value=$fields.flange_rating_c.default_value }
{else}
{assign var="value" value=$fields.flange_rating_c.value }
{/if}  
<input type='text' name='{$fields.flange_rating_c.name}' 
id='{$fields.flange_rating_c.name}' size='30' 
maxlength='64' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_SHUT_OFF_HEAD">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_SHUT_OFF_HEAD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="shut_off_head_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.shut_off_head_c.value) <= 0}
{assign var="value" value=$fields.shut_off_head_c.default_value }
{else}
{assign var="value" value=$fields.shut_off_head_c.value }
{/if}  
<input type='text' name='{$fields.shut_off_head_c.name}' 
id='{$fields.shut_off_head_c.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_FLUSHING">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_FLUSHING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="flushing_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.flushing_c.value) <= 0}
{assign var="value" value=$fields.flushing_c.default_value }
{else}
{assign var="value" value=$fields.flushing_c.value }
{/if}  
<input type='text' name='{$fields.flushing_c.name}' 
id='{$fields.flushing_c.name}' size='30' 
maxlength='32' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MIN_SAFE_FLOW">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MIN_SAFE_FLOW' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="min_safe_flow_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.min_safe_flow_c.value) <= 0}
{assign var="value" value=$fields.min_safe_flow_c.default_value }
{else}
{assign var="value" value=$fields.min_safe_flow_c.value }
{/if}  
<input type='text' name='{$fields.min_safe_flow_c.name}' 
id='{$fields.min_safe_flow_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='eg : 2 m3/hr'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_LUBRICATION">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_LUBRICATION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="lubrication_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.lubrication_c.value) <= 0}
{assign var="value" value=$fields.lubrication_c.default_value }
{else}
{assign var="value" value=$fields.lubrication_c.value }
{/if}  
<input type='text' name='{$fields.lubrication_c.name}' 
id='{$fields.lubrication_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='Oil / Grease'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MOTOR_RECOMM">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_RECOMM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="motor_recomm_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_recomm_c.value) <= 0}
{assign var="value" value=$fields.motor_recomm_c.default_value }
{else}
{assign var="value" value=$fields.motor_recomm_c.value }
{/if}  
<input type='text' name='{$fields.motor_recomm_c.name}' 
id='{$fields.motor_recomm_c.name}' size='30' 
maxlength='64' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-12 edit-view-row-item">


<div class="col-xs-12 col-sm-2 label" data-label="LBL_STRAINER">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_STRAINER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="strainer_c" colspan='3' >
{counter name="panelFieldCount" print=false}

{if strlen($fields.strainer_c.value) <= 0}
{assign var="value" value=$fields.strainer_c.default_value }
{else}
{assign var="value" value=$fields.strainer_c.value }
{/if}  
<input type='text' name='{$fields.strainer_c.name}' 
id='{$fields.strainer_c.name}' size='30' 
maxlength='16' 
value='{$value}' title='type &amp; moc'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL4' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_5" data-id="LBL_EDITVIEW_PANEL4">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CASING">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_CASING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="casing_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.casing_c.value) <= 0}
{assign var="value" value=$fields.casing_c.default_value }
{else}
{assign var="value" value=$fields.casing_c.value }
{/if}  
<input type='text' name='{$fields.casing_c.name}' 
id='{$fields.casing_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='MOC (SS304, SS316, HastAlloy)'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_BEARING_HOUSING">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_BEARING_HOUSING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="bearing_housing_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.bearing_housing_c.value) <= 0}
{assign var="value" value=$fields.bearing_housing_c.default_value }
{else}
{assign var="value" value=$fields.bearing_housing_c.value }
{/if}  
<input type='text' name='{$fields.bearing_housing_c.name}' 
id='{$fields.bearing_housing_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='Cast Iron'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_IMPELLER">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_IMPELLER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="impeller_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.impeller_c.value) <= 0}
{assign var="value" value=$fields.impeller_c.default_value }
{else}
{assign var="value" value=$fields.impeller_c.value }
{/if}  
<input type='text' name='{$fields.impeller_c.name}' 
id='{$fields.impeller_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='MOC (SS304, SS316, HastAlloy)'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_PACKING_TYPE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_PACKING_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="packing_type_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.packing_type_c.value) <= 0}
{assign var="value" value=$fields.packing_type_c.default_value }
{else}
{assign var="value" value=$fields.packing_type_c.value }
{/if}  
<input type='text' name='{$fields.packing_type_c.name}' 
id='{$fields.packing_type_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='Mechanical Seal / Gland Packing Type'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_BACK_PLATE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_BACK_PLATE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="back_plate_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.back_plate_c.value) <= 0}
{assign var="value" value=$fields.back_plate_c.default_value }
{else}
{assign var="value" value=$fields.back_plate_c.value }
{/if}  
<input type='text' name='{$fields.back_plate_c.name}' 
id='{$fields.back_plate_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='MOC (SS304, SS316, HastAlloy etc...)'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_SHAFT_SLEEVE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_SHAFT_SLEEVE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="shaft_sleeve_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.shaft_sleeve_c.value) <= 0}
{assign var="value" value=$fields.shaft_sleeve_c.default_value }
{else}
{assign var="value" value=$fields.shaft_sleeve_c.value }
{/if}  
<input type='text' name='{$fields.shaft_sleeve_c.name}' 
id='{$fields.shaft_sleeve_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='MOC (SS304, SS316, HastAlloy etc...)'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_SHAFT">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_SHAFT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="shaft_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.shaft_c.value) <= 0}
{assign var="value" value=$fields.shaft_c.default_value }
{else}
{assign var="value" value=$fields.shaft_c.value }
{/if}  
<input type='text' name='{$fields.shaft_c.name}' 
id='{$fields.shaft_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='MOC (SS304, SS316, HastAlloy etc...)'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_BASE_FRAME">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_BASE_FRAME' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="base_frame_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.base_frame_c.value) <= 0}
{assign var="value" value=$fields.base_frame_c.default_value }
{else}
{assign var="value" value=$fields.base_frame_c.value }
{/if}  
<input type='text' name='{$fields.base_frame_c.name}' 
id='{$fields.base_frame_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='MS Fabricated'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_SEAL_TYPE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_SEAL_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="seal_type_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.seal_type_c.value) <= 0}
{assign var="value" value=$fields.seal_type_c.default_value }
{else}
{assign var="value" value=$fields.seal_type_c.value }
{/if}  
<input type='text' name='{$fields.seal_type_c.name}' 
id='{$fields.seal_type_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='Double / Single Mechanical Seal'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_STUFFING_BOX">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_STUFFING_BOX' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="stuffing_box_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.stuffing_box_c.value) <= 0}
{assign var="value" value=$fields.stuffing_box_c.default_value }
{else}
{assign var="value" value=$fields.stuffing_box_c.value }
{/if}  
<input type='text' name='{$fields.stuffing_box_c.name}' 
id='{$fields.stuffing_box_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='moc'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_DELIVERY_PIPE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_DELIVERY_PIPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="delivery_pipe_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.delivery_pipe_c.value) <= 0}
{assign var="value" value=$fields.delivery_pipe_c.default_value }
{else}
{assign var="value" value=$fields.delivery_pipe_c.value }
{/if}  
<input type='text' name='{$fields.delivery_pipe_c.name}' 
id='{$fields.delivery_pipe_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='moc of delivery pipe'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_COLUMN_PIPE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_COLUMN_PIPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="column_pipe_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.column_pipe_c.value) <= 0}
{assign var="value" value=$fields.column_pipe_c.default_value }
{else}
{assign var="value" value=$fields.column_pipe_c.value }
{/if}  
<input type='text' name='{$fields.column_pipe_c.name}' 
id='{$fields.column_pipe_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='moc of column pipe'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MOTOR_STOOL">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_STOOL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="motor_stool_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_stool_c.value) <= 0}
{assign var="value" value=$fields.motor_stool_c.default_value }
{else}
{assign var="value" value=$fields.motor_stool_c.value }
{/if}  
<input type='text' name='{$fields.motor_stool_c.name}' 
id='{$fields.motor_stool_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='moc'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MOUNTING_PLATE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MOUNTING_PLATE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="mounting_plate_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.mounting_plate_c.value) <= 0}
{assign var="value" value=$fields.mounting_plate_c.default_value }
{else}
{assign var="value" value=$fields.mounting_plate_c.value }
{/if}  
<input type='text' name='{$fields.mounting_plate_c.name}' 
id='{$fields.mounting_plate_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='moc '      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL13' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_6" data-id="LBL_EDITVIEW_PANEL13">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MDP_CASING">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_CASING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="mdp_casing_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_casing_c.value) <= 0}
{assign var="value" value=$fields.mdp_casing_c.default_value }
{else}
{assign var="value" value=$fields.mdp_casing_c.value }
{/if}  
<input type='text' name='{$fields.mdp_casing_c.name}' 
id='{$fields.mdp_casing_c.name}' size='30' 
maxlength='32' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_ISOLATION_SHELL">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_ISOLATION_SHELL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="isolation_shell_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.isolation_shell_c.value) <= 0}
{assign var="value" value=$fields.isolation_shell_c.default_value }
{else}
{assign var="value" value=$fields.isolation_shell_c.value }
{/if}  
<input type='text' name='{$fields.isolation_shell_c.name}' 
id='{$fields.isolation_shell_c.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MDP_IMPELLER">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_IMPELLER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="mdp_impeller_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_impeller_c.value) <= 0}
{assign var="value" value=$fields.mdp_impeller_c.default_value }
{else}
{assign var="value" value=$fields.mdp_impeller_c.value }
{/if}  
<input type='text' name='{$fields.mdp_impeller_c.name}' 
id='{$fields.mdp_impeller_c.name}' size='30' 
maxlength='32' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_FASTNER">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_FASTNER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="fastner_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.fastner_c.value) <= 0}
{assign var="value" value=$fields.fastner_c.default_value }
{else}
{assign var="value" value=$fields.fastner_c.value }
{/if}  
<input type='text' name='{$fields.fastner_c.name}' 
id='{$fields.fastner_c.name}' size='30' 
maxlength='32' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MDP_SHAFT">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_SHAFT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="mdp_shaft_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_shaft_c.value) <= 0}
{assign var="value" value=$fields.mdp_shaft_c.default_value }
{else}
{assign var="value" value=$fields.mdp_shaft_c.value }
{/if}  
<input type='text' name='{$fields.mdp_shaft_c.name}' 
id='{$fields.mdp_shaft_c.name}' size='30' 
maxlength='32' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_THRUST_BEARING">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_THRUST_BEARING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="thrust_bearing_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.thrust_bearing_c.value) <= 0}
{assign var="value" value=$fields.thrust_bearing_c.default_value }
{else}
{assign var="value" value=$fields.thrust_bearing_c.value }
{/if}  
<input type='text' name='{$fields.thrust_bearing_c.name}' 
id='{$fields.thrust_bearing_c.name}' size='30' 
maxlength='32' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MDP_PUMP_BODY">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_PUMP_BODY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="mdp_pump_body_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_pump_body_c.value) <= 0}
{assign var="value" value=$fields.mdp_pump_body_c.default_value }
{else}
{assign var="value" value=$fields.mdp_pump_body_c.value }
{/if}  
<input type='text' name='{$fields.mdp_pump_body_c.name}' 
id='{$fields.mdp_pump_body_c.name}' size='30' 
maxlength='32' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MDP_BASE_FRAME">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_BASE_FRAME' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="mdp_base_frame_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_base_frame_c.value) <= 0}
{assign var="value" value=$fields.mdp_base_frame_c.default_value }
{else}
{assign var="value" value=$fields.mdp_base_frame_c.value }
{/if}  
<input type='text' name='{$fields.mdp_base_frame_c.name}' 
id='{$fields.mdp_base_frame_c.name}' size='30' 
maxlength='32' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL7' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_7" data-id="LBL_EDITVIEW_PANEL7">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MAX_AIR_INLET_PRESSURE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MAX_AIR_INLET_PRESSURE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="max_air_inlet_pressure_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.max_air_inlet_pressure_c.value) <= 0}
{assign var="value" value=$fields.max_air_inlet_pressure_c.default_value }
{else}
{assign var="value" value=$fields.max_air_inlet_pressure_c.value }
{/if}  
<input type='text' name='{$fields.max_air_inlet_pressure_c.name}' 
id='{$fields.max_air_inlet_pressure_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='bar (PSI)'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MAX_AIR_CONSUMPTION">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MAX_AIR_CONSUMPTION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="max_air_consumption_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.max_air_consumption_c.value) <= 0}
{assign var="value" value=$fields.max_air_consumption_c.default_value }
{else}
{assign var="value" value=$fields.max_air_consumption_c.value }
{/if}  
<input type='text' name='{$fields.max_air_consumption_c.name}' 
id='{$fields.max_air_consumption_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='eg : 80 cmph / 48 scfm'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_AIR_INLET">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_AIR_INLET' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="air_inlet_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.air_inlet_c.value) <= 0}
{assign var="value" value=$fields.air_inlet_c.default_value }
{else}
{assign var="value" value=$fields.air_inlet_c.value }
{/if}  
<input type='text' name='{$fields.air_inlet_c.name}' 
id='{$fields.air_inlet_c.name}' size='30' 
maxlength='16' 
value='{$value}' title='1/4&quot; BSP'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_AIR_EXHAUST">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_AIR_EXHAUST' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="air_exhaust_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.air_exhaust_c.value) <= 0}
{assign var="value" value=$fields.air_exhaust_c.default_value }
{else}
{assign var="value" value=$fields.air_exhaust_c.value }
{/if}  
<input type='text' name='{$fields.air_exhaust_c.name}' 
id='{$fields.air_exhaust_c.name}' size='30' 
maxlength='16' 
value='{$value}' title='eg : 19.5 mm'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_PARTICLE_SIZE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_PARTICLE_SIZE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="particle_size_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.particle_size_c.value) <= 0}
{assign var="value" value=$fields.particle_size_c.default_value }
{else}
{assign var="value" value=$fields.particle_size_c.value }
{/if}  
<input type='text' name='{$fields.particle_size_c.name}' 
id='{$fields.particle_size_c.name}' size='30' 
maxlength='128' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL5' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_8" data-id="LBL_EDITVIEW_PANEL5">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_WETTED_PARTS">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_WETTED_PARTS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="wetted_parts_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.wetted_parts_c.value) <= 0}
{assign var="value" value=$fields.wetted_parts_c.default_value }
{else}
{assign var="value" value=$fields.wetted_parts_c.value }
{/if}  
<input type='text' name='{$fields.wetted_parts_c.name}' 
id='{$fields.wetted_parts_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='eg : PP, Kynar PVDF'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_VALVE_BALL">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_VALVE_BALL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="valve_ball_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.valve_ball_c.value) <= 0}
{assign var="value" value=$fields.valve_ball_c.default_value }
{else}
{assign var="value" value=$fields.valve_ball_c.value }
{/if}  
<input type='text' name='{$fields.valve_ball_c.name}' 
id='{$fields.valve_ball_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='MOC of Valve Ball'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_NON_WETTED_PARTS">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_NON_WETTED_PARTS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="non_wetted_parts_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.non_wetted_parts_c.value) <= 0}
{assign var="value" value=$fields.non_wetted_parts_c.default_value }
{else}
{assign var="value" value=$fields.non_wetted_parts_c.value }
{/if}  
<input type='text' name='{$fields.non_wetted_parts_c.name}' 
id='{$fields.non_wetted_parts_c.name}' size='30' 
maxlength='128' 
value='{$value}' title='MOC for Non Wetted Parts'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_VALVE_SEAT_O_RING">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_VALVE_SEAT_O_RING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="valve_seat_o_ring_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.valve_seat_o_ring_c.value) <= 0}
{assign var="value" value=$fields.valve_seat_o_ring_c.default_value }
{else}
{assign var="value" value=$fields.valve_seat_o_ring_c.value }
{/if}  
<input type='text' name='{$fields.valve_seat_o_ring_c.name}' 
id='{$fields.valve_seat_o_ring_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='moc of valve seat o ring'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_DIAPHRAGM">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_DIAPHRAGM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="diaphragm_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.diaphragm_c.value) <= 0}
{assign var="value" value=$fields.diaphragm_c.default_value }
{else}
{assign var="value" value=$fields.diaphragm_c.value }
{/if}  
<input type='text' name='{$fields.diaphragm_c.name}' 
id='{$fields.diaphragm_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='MOC Diaphragm'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_VALVE_TYPE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_VALVE_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="valve_type_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.valve_type_c.value) <= 0}
{assign var="value" value=$fields.valve_type_c.default_value }
{else}
{assign var="value" value=$fields.valve_type_c.value }
{/if}  
<input type='text' name='{$fields.valve_type_c.name}' 
id='{$fields.valve_type_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='Non-Stalling, Anti Icing, Lubrication Free, Air Valve Assembly'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL9' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_9" data-id="LBL_EDITVIEW_PANEL9">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_TESTING_PRESSURE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_TESTING_PRESSURE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="testing_pressure_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.testing_pressure_c.value) <= 0}
{assign var="value" value=$fields.testing_pressure_c.default_value }
{else}
{assign var="value" value=$fields.testing_pressure_c.value }
{/if}  
<input type='text' name='{$fields.testing_pressure_c.name}' 
id='{$fields.testing_pressure_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='Kg/cm2'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_HYDRO_PRESSURE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_HYDRO_PRESSURE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="hydro_pressure_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.hydro_pressure_c.value) <= 0}
{assign var="value" value=$fields.hydro_pressure_c.default_value }
{else}
{assign var="value" value=$fields.hydro_pressure_c.value }
{/if}  
<input type='text' name='{$fields.hydro_pressure_c.name}' 
id='{$fields.hydro_pressure_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='eg : kg/cm2'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_SPM">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_SPM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="spm_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.spm_c.value) <= 0}
{assign var="value" value=$fields.spm_c.default_value }
{else}
{assign var="value" value=$fields.spm_c.value }
{/if}  
<input type='text' name='{$fields.spm_c.name}' 
id='{$fields.spm_c.name}' size='30' 
maxlength='8' 
value='{$value}' title='Strokes per minute'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_GEAR_RATIO">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_GEAR_RATIO' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="gear_ratio_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.gear_ratio_c.value) <= 0}
{assign var="value" value=$fields.gear_ratio_c.default_value }
{else}
{assign var="value" value=$fields.gear_ratio_c.value }
{/if}  
<input type='text' name='{$fields.gear_ratio_c.name}' 
id='{$fields.gear_ratio_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='eg : 15:1'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_PLUNGER_DIA">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_PLUNGER_DIA' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="plunger_dia_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.plunger_dia_c.value) <= 0}
{assign var="value" value=$fields.plunger_dia_c.default_value }
{else}
{assign var="value" value=$fields.plunger_dia_c.value }
{/if}  
<input type='text' name='{$fields.plunger_dia_c.name}' 
id='{$fields.plunger_dia_c.name}' size='30' 
maxlength='32' 
value='{$value}' title='68mm'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL10' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_10" data-id="LBL_EDITVIEW_PANEL10">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_LIQUID_END">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_LIQUID_END' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="liquid_end_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.liquid_end_c.value) <= 0}
{assign var="value" value=$fields.liquid_end_c.default_value }
{else}
{assign var="value" value=$fields.liquid_end_c.value }
{/if}  
<input type='text' name='{$fields.liquid_end_c.name}' 
id='{$fields.liquid_end_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='eg : MOC (SS316, SS304)'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_DOSING_METERING_DIAPHRAGM">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_DOSING_METERING_DIAPHRAGM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="dosing_metering_diaphragm_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.dosing_metering_diaphragm_c.value) <= 0}
{assign var="value" value=$fields.dosing_metering_diaphragm_c.default_value }
{else}
{assign var="value" value=$fields.dosing_metering_diaphragm_c.value }
{/if}  
<input type='text' name='{$fields.dosing_metering_diaphragm_c.name}' 
id='{$fields.dosing_metering_diaphragm_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='eg: MOC(SS304, SS316)'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_DM_NRV">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_DM_NRV' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="dm_nrv_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.dm_nrv_c.value) <= 0}
{assign var="value" value=$fields.dm_nrv_c.default_value }
{else}
{assign var="value" value=$fields.dm_nrv_c.value }
{/if}  
<input type='text' name='{$fields.dm_nrv_c.name}' 
id='{$fields.dm_nrv_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='eg: MOC (SS304, SS316)'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_WORM_WHEEL">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_WORM_WHEEL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="worm_wheel_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.worm_wheel_c.value) <= 0}
{assign var="value" value=$fields.worm_wheel_c.default_value }
{else}
{assign var="value" value=$fields.worm_wheel_c.value }
{/if}  
<input type='text' name='{$fields.worm_wheel_c.name}' 
id='{$fields.worm_wheel_c.name}' size='30' 
maxlength='128' 
value='{$value}' title='eg: MOC (Phosphorous Bronze)'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_GEAR_HOUSING">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_GEAR_HOUSING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="gear_housing_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.gear_housing_c.value) <= 0}
{assign var="value" value=$fields.gear_housing_c.default_value }
{else}
{assign var="value" value=$fields.gear_housing_c.value }
{/if}  
<input type='text' name='{$fields.gear_housing_c.name}' 
id='{$fields.gear_housing_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='eg : MOC (CI)'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_COUPLING_GUARD">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_COUPLING_GUARD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="coupling_guard_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.coupling_guard_c.value) <= 0}
{assign var="value" value=$fields.coupling_guard_c.default_value }
{else}
{assign var="value" value=$fields.coupling_guard_c.value }
{/if}  
<input type='text' name='{$fields.coupling_guard_c.name}' 
id='{$fields.coupling_guard_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='eg : MOC (SS304)'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-12 edit-view-row-item">


<div class="col-xs-12 col-sm-2 label" data-label="LBL_PUMP_DRIVE_MOUNTING_BASE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_PUMP_DRIVE_MOUNTING_BASE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="pump_drive_mounting_base_c" colspan='3' >
{counter name="panelFieldCount" print=false}

{if strlen($fields.pump_drive_mounting_base_c.value) <= 0}
{assign var="value" value=$fields.pump_drive_mounting_base_c.default_value }
{else}
{assign var="value" value=$fields.pump_drive_mounting_base_c.value }
{/if}  
<input type='text' name='{$fields.pump_drive_mounting_base_c.name}' 
id='{$fields.pump_drive_mounting_base_c.name}' size='30' 
maxlength='64' 
value='{$value}' title='eg: MOC (MS)'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_LINE_ITEMS' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_11" data-id="LBL_LINE_ITEMS">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CURRENCY">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_CURRENCY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="id" field="currency_id"  >
{counter name="panelFieldCount" print=false}
<span id='currency_id_span'>
{$fields.currency_id.value}</span>
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-12 edit-view-row-item">


<div class="col-xs-12 col-sm-2 label" data-label="LBL_LINE_ITEMS">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_LINE_ITEMS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="function" field="line_items" colspan='3' >
{counter name="panelFieldCount" print=false}
<span id='line_items_span'>
{$fields.line_items.value}</span>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-12 edit-view-row-item">


<div class="col-xs-12 col-sm-2 label" data-label="LBL_TOTAL_AMT">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_TOTAL_AMT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="currency" field="total_amt" colspan='3' >
{counter name="panelFieldCount" print=false}

{if strlen($fields.total_amt.value) <= 0}
{assign var="value" value=$fields.total_amt.default_value }
{else}
{assign var="value" value=$fields.total_amt.value }
{/if}  
<input type='text' name='{$fields.total_amt.name}' 
id='{$fields.total_amt.name}' size='30' maxlength='26,6' value='{sugar_number_format var=$value}' title='' tabindex='0'
>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-12 edit-view-row-item">


<div class="col-xs-12 col-sm-2 label" data-label="LBL_DISCOUNT_AMOUNT">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_DISCOUNT_AMOUNT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="currency" field="discount_amount" colspan='3' >
{counter name="panelFieldCount" print=false}

{if strlen($fields.discount_amount.value) <= 0}
{assign var="value" value=$fields.discount_amount.default_value }
{else}
{assign var="value" value=$fields.discount_amount.value }
{/if}  
<input type='text' name='{$fields.discount_amount.name}' 
id='{$fields.discount_amount.name}' size='30' maxlength='26,6' value='{sugar_number_format var=$value}' title='' tabindex='0'
>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-12 edit-view-row-item">


<div class="col-xs-12 col-sm-2 label" data-label="LBL_SUBTOTAL_AMOUNT">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_SUBTOTAL_AMOUNT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="currency" field="subtotal_amount" colspan='3' >
{counter name="panelFieldCount" print=false}

{if strlen($fields.subtotal_amount.value) <= 0}
{assign var="value" value=$fields.subtotal_amount.default_value }
{else}
{assign var="value" value=$fields.subtotal_amount.value }
{/if}  
<input type='text' name='{$fields.subtotal_amount.name}' 
id='{$fields.subtotal_amount.name}' size='30' maxlength='26,6' value='{sugar_number_format var=$value}' title='' tabindex='0'
>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-12 edit-view-row-item">


<div class="col-xs-12 col-sm-2 label" data-label="LBL_TAX_AMOUNT">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_TAX_AMOUNT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="currency" field="tax_amount" colspan='3' >
{counter name="panelFieldCount" print=false}

{if strlen($fields.tax_amount.value) <= 0}
{assign var="value" value=$fields.tax_amount.default_value }
{else}
{assign var="value" value=$fields.tax_amount.value }
{/if}  
<input type='text' name='{$fields.tax_amount.name}' 
id='{$fields.tax_amount.name}' size='30' maxlength='26,6' value='{sugar_number_format var=$value}' title='' tabindex='0'
>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-12 edit-view-row-item">


<div class="col-xs-12 col-sm-2 label" data-label="LBL_GRAND_TOTAL">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_GRAND_TOTAL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="currency" field="total_amount" colspan='3' >
{counter name="panelFieldCount" print=false}

{if strlen($fields.total_amount.value) <= 0}
{assign var="value" value=$fields.total_amount.default_value }
{else}
{assign var="value" value=$fields.total_amount.value }
{/if}  
<input type='text' name='{$fields.total_amount.name}' 
id='{$fields.total_amount.name}' size='30' maxlength='26,6' value='{sugar_number_format var=$value}' title='' tabindex='0'
>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL12' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_12" data-id="LBL_EDITVIEW_PANEL12">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MOTOR_MAKE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_MAKE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="motor_make_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_make_c.value) <= 0}
{assign var="value" value=$fields.motor_make_c.default_value }
{else}
{assign var="value" value=$fields.motor_make_c.value }
{/if}  
<input type='text' name='{$fields.motor_make_c.name}' 
id='{$fields.motor_make_c.name}' size='30' 
maxlength='128' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MOTOR_TEMP">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_TEMP' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="motor_temp_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_temp_c.value) <= 0}
{assign var="value" value=$fields.motor_temp_c.default_value }
{else}
{assign var="value" value=$fields.motor_temp_c.value }
{/if}  
<input type='text' name='{$fields.motor_temp_c.name}' 
id='{$fields.motor_temp_c.name}' size='30' 
maxlength='8' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MOTOR_MOUNT_TYPE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_MOUNT_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="motor_mount_type_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_mount_type_c.value) <= 0}
{assign var="value" value=$fields.motor_mount_type_c.default_value }
{else}
{assign var="value" value=$fields.motor_mount_type_c.value }
{/if}  
<input type='text' name='{$fields.motor_mount_type_c.name}' 
id='{$fields.motor_mount_type_c.name}' size='30' 
maxlength='32' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MOTOR_PHASE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_PHASE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="motor_phase_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_phase_c.value) <= 0}
{assign var="value" value=$fields.motor_phase_c.default_value }
{else}
{assign var="value" value=$fields.motor_phase_c.value }
{/if}  
<input type='text' name='{$fields.motor_phase_c.name}' 
id='{$fields.motor_phase_c.name}' size='30' 
maxlength='8' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MOTOR_PROTECTION">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_PROTECTION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="motor_protection_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_protection_c.value) <= 0}
{assign var="value" value=$fields.motor_protection_c.default_value }
{else}
{assign var="value" value=$fields.motor_protection_c.value }
{/if}  
<input type='text' name='{$fields.motor_protection_c.name}' 
id='{$fields.motor_protection_c.name}' size='30' 
maxlength='64' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MOTOR_VOLTAGE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_VOLTAGE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="motor_voltage_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_voltage_c.value) <= 0}
{assign var="value" value=$fields.motor_voltage_c.default_value }
{else}
{assign var="value" value=$fields.motor_voltage_c.value }
{/if}  
<input type='text' name='{$fields.motor_voltage_c.name}' 
id='{$fields.motor_voltage_c.name}' size='30' 
maxlength='64' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MOTOR_STANDARD">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_STANDARD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="motor_standard_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_standard_c.value) <= 0}
{assign var="value" value=$fields.motor_standard_c.default_value }
{else}
{assign var="value" value=$fields.motor_standard_c.value }
{/if}  
<input type='text' name='{$fields.motor_standard_c.name}' 
id='{$fields.motor_standard_c.name}' size='30' 
maxlength='64' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MOTOR_TYPE">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="motor_type_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_type_c.value) <= 0}
{assign var="value" value=$fields.motor_type_c.default_value }
{else}
{assign var="value" value=$fields.motor_type_c.value }
{/if}  
<input type='text' name='{$fields.motor_type_c.name}' 
id='{$fields.motor_type_c.name}' size='30' 
maxlength='32' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL11' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_13" data-id="LBL_EDITVIEW_PANEL11">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-12 edit-view-row-item">


<div class="col-xs-12 col-sm-2 label" data-label="LBL_SELECT_TERMS">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_SELECT_TERMS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="dynamicenum" field="select_terms_c" colspan='3' >
{counter name="panelFieldCount" print=false}

<script type="text/javascript" src='{sugar_getjspath file="include/SugarFields/Fields/Dynamicenum/SugarFieldDynamicenum.js"}'></script>
{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.select_terms_c.name}"
id="{$fields.select_terms_c.name}"
title=''           
>
{if isset($fields.select_terms_c.value) && $fields.select_terms_c.value != ''}
{html_options options=$fields.select_terms_c.options selected=$fields.select_terms_c.value}
{else}
{html_options options=$fields.select_terms_c.options selected=$fields.select_terms_c.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.select_terms_c.options }
{capture name="field_val"}{$fields.select_terms_c.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.select_terms_c.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.select_terms_c.name}"
id="{$fields.select_terms_c.name}"
title=''          
>
{if isset($fields.select_terms_c.value) && $fields.select_terms_c.value != ''}
{html_options options=$fields.select_terms_c.options selected=$fields.select_terms_c.value}
{else}
{html_options options=$fields.select_terms_c.options selected=$fields.select_terms_c.default}
{/if}
</select>
<input
id="{$fields.select_terms_c.name}-input"
name="{$fields.select_terms_c.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.select_terms_c.name}-image"></button><button type="button"
id="btn-clear-{$fields.select_terms_c.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.select_terms_c.name}-input', '{$fields.select_terms_c.name}');sync_{$fields.select_terms_c.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
{/literal}

{literal}
(function (){
    var selectElem = document.getElementById("{/literal}{$fields.select_terms_c.name}{literal}");

    if (typeof select_defaults =="undefined")
        select_defaults = [];

    select_defaults[selectElem.id] = {key:selectElem.value,text:''};

    //get default
    for (i=0;i<selectElem.options.length;i++){
        if (selectElem.options[i].value==selectElem.value)
            select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
    }

    //SUGAR.AutoComplete.{$ac_key}.ds =
    //get options array from vardefs
    var options = SUGAR.AutoComplete.getOptionsArray("");

    YUI().use('datasource', 'datasource-jsonschema',function (Y) {
        SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
            source: function (request) {
                var ret = [];
                for (i=0;i<selectElem.options.length;i++)
                    if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
                        ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
                return ret;
            }
        });
    });
})();
{/literal}

{literal}
YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
    {/literal}

    SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.select_terms_c.name}-input');
    SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.select_terms_c.name}-image');
    SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.select_terms_c.name}');

        {literal}
    function SyncToHidden(selectme){
        var selectElem = document.getElementById("{/literal}{$fields.select_terms_c.name}{literal}");
        var doSimulateChange = false;

        if (selectElem.value!=selectme)
            doSimulateChange=true;

        selectElem.value=selectme;

        for (i=0;i<selectElem.options.length;i++){
            selectElem.options[i].selected=false;
            if (selectElem.options[i].value==selectme)
                selectElem.options[i].selected=true;
        }

        if (doSimulateChange)
            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
    }

    //global variable
    sync_{/literal}{$fields.select_terms_c.name}{literal} = function(){
        SyncToHidden();
    }
    function syncFromHiddenToWidget(){

        var selectElem = document.getElementById("{/literal}{$fields.select_terms_c.name}{literal}");

        //if select no longer on page, kill timer
        if (selectElem==null || selectElem.options == null)
            return;

        var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

        SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

        for (i=0;i<selectElem.options.length;i++){

            if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.select_terms_c.name}-input{literal}'))
                SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
        }
    }

    YAHOO.util.Event.onAvailable("{/literal}{$fields.select_terms_c.name}{literal}", syncFromHiddenToWidget);
    {/literal}

    SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
    SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
    SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
    if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
        {/literal}
        SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
        SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
        {literal}
    }
    {/literal}
    if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
        {/literal}
        SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
        SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
        {literal}
    }
    {/literal}
    
    SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;

    {literal}
    SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
        activateFirstItem: true,
        {/literal}
        minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
        queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
        zIndex: 99999,

        
        {literal}
        source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,

        resultTextLocator: 'text',
        resultHighlighter: 'phraseMatch',
        resultFilters: 'phraseMatch',
    });

    SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
        var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
        if(hover[0] != null){
            if (ex) {
                var h = '1000px';
                hover[0].style.height = h;
            }
            else{
                hover[0].style.height = '';
            }
        }
    }

    if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
        // expand the dropdown options upon focus
        SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
        });
    }

            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
        });

        SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
        });

        SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
        });

        SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
        });

        SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
        });

        SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
            var selectElem = document.getElementById("{/literal}{$fields.select_terms_c.name}{literal}");
            //if typed value is a valid option, do nothing
            for (i=0;i<selectElem.options.length;i++)
                if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
                    return;

            //typed value is invalid, so set the text and the hidden to blank
            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
            SyncToHidden(select_defaults[selectElem.id].key);
        });
        
            // when they click on the arrow image, toggle the visibility of the options
            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
                if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
                    SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
                } else {
                    SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
                }
            });

            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
                SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
            });

            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
                SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
            });

            // when they select an option, set the hidden input with the KEY, to be saved
            SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
                SyncToHidden(e.result.raw.key);
            });

        });
</script>
{/literal}
{/if}
<script type="text/javascript">
    if(typeof de_entries == 'undefined'){literal}{var de_entries = new Array;}{/literal}
    var el = document.getElementById("");
    addLoadEvent(function(){literal}{loadDynamicEnum({/literal}"","{$fields.select_terms_c.name}"{literal})}{/literal});
    if (SUGAR.ajaxUI && SUGAR.ajaxUI.hist_loaded) {literal}{loadDynamicEnum({/literal}"","{$fields.select_terms_c.name}"{literal})}{/literal}
</script>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-12 edit-view-row-item">


<div class="col-xs-12 col-sm-2 label" data-label="LBL_INCOTERMS">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_INCOTERMS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="incoterms_c" colspan='3' >
{counter name="panelFieldCount" print=false}

{if strlen($fields.incoterms_c.value) <= 0}
{assign var="value" value=$fields.incoterms_c.default_value }
{else}
{assign var="value" value=$fields.incoterms_c.value }
{/if}  
<input type='text' name='{$fields.incoterms_c.name}' 
id='{$fields.incoterms_c.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_DELIVERY">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_DELIVERY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="delivery_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.delivery_c.value) <= 0}
{assign var="value" value=$fields.delivery_c.default_value }
{else}
{assign var="value" value=$fields.delivery_c.value }
{/if}  
<input type='text' name='{$fields.delivery_c.name}' 
id='{$fields.delivery_c.name}' size='30' 
maxlength='64' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_SHIPMENT">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_SHIPMENT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="shipment_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.shipment_c.value) <= 0}
{assign var="value" value=$fields.shipment_c.default_value }
{else}
{assign var="value" value=$fields.shipment_c.value }
{/if}  
<input type='text' name='{$fields.shipment_c.name}' 
id='{$fields.shipment_c.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_FREIGHT_INS">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_FREIGHT_INS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="freight_ins_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.freight_ins_c.value) <= 0}
{assign var="value" value=$fields.freight_ins_c.default_value }
{else}
{assign var="value" value=$fields.freight_ins_c.value }
{/if}  
<input type='text' name='{$fields.freight_ins_c.name}' 
id='{$fields.freight_ins_c.name}' size='30' 
maxlength='64' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_PAYMENT">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_PAYMENT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="payment_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.payment_c.value) <= 0}
{assign var="value" value=$fields.payment_c.default_value }
{else}
{assign var="value" value=$fields.payment_c.value }
{/if}  
<input type='text' name='{$fields.payment_c.name}' 
id='{$fields.payment_c.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_GST">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_GST' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="gst_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.gst_c.value) <= 0}
{assign var="value" value=$fields.gst_c.default_value }
{else}
{assign var="value" value=$fields.gst_c.value }
{/if}  
<input type='text' name='{$fields.gst_c.name}' 
id='{$fields.gst_c.name}' size='30' 
maxlength='64' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_PNF_CHARGES">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_PNF_CHARGES' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="pnf_charges_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.pnf_charges_c.value) <= 0}
{assign var="value" value=$fields.pnf_charges_c.default_value }
{else}
{assign var="value" value=$fields.pnf_charges_c.value }
{/if}  
<input type='text' name='{$fields.pnf_charges_c.name}' 
id='{$fields.pnf_charges_c.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-12 edit-view-row-item">


<div class="col-xs-12 col-sm-2 label" data-label="LBL_VALIDITY">

{minify}
{capture name="label" assign="label"}{sugar_translate label='LBL_VALIDITY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:

{/minify}
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="validity_c" colspan='3' >
{counter name="panelFieldCount" print=false}

{if strlen($fields.validity_c.value) <= 0}
{assign var="value" value=$fields.validity_c.default_value }
{else}
{assign var="value" value=$fields.validity_c.value }
{/if}  
<input type='text' name='{$fields.validity_c.name}' 
id='{$fields.validity_c.name}' size='30' 
maxlength='16' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>
</div>
</div>

<script language="javascript">
    var _form_id = '{$form_id}';
    {literal}
    SUGAR.util.doWhen(function(){
        _form_id = (_form_id == '') ? 'EditView' : _form_id;
        return document.getElementById(_form_id) != null;
    }, SUGAR.themes.actionMenu);
    {/literal}
</script>
{assign var='place' value="_FOOTER"} <!-- to be used for id for buttons with custom code in def files-->
<div class="buttons">
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="var _form = document.getElementById('EditView'); {if $isDuplicate}_form.return_id.value=''; {/if}_form.action.value='Save'; if(check_form('EditView'))SUGAR.ajaxUI.submitForm(_form);return false;" type="submit" name="button" value="{$APP.LBL_SAVE_BUTTON_LABEL}" id="SAVE">{/if} 
{if !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($smarty.request.return_id))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=DetailView&module={$smarty.request.return_module|escape:"url"}&record={$smarty.request.return_id|escape:"url"}'); return false;" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" type="button" id="CANCEL"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($fields.id.value))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=DetailView&module={$smarty.request.return_module|escape:"url"}&record={$fields.id.value}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && empty($fields.id.value)) && empty($smarty.request.return_id)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=ListView&module={$smarty.request.return_module|escape:"url"}&record={$fields.id.value}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {elseif !empty($smarty.request.return_action) && !empty($smarty.request.return_module)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action={$smarty.request.return_action}&module={$smarty.request.return_module|escape:"url"}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {elseif empty($smarty.request.return_action) || empty($smarty.request.return_id) && !empty($fields.id.value)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=index&module=AOS_Quotes'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=index&module={$smarty.request.return_module|escape:"url"}&record={$smarty.request.return_id|escape:"url"}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {/if}
{if $showVCRControl}
<button type="button" id="save_and_continue" class="button saveAndContinue" title="{$app_strings.LBL_SAVE_AND_CONTINUE}" onClick="SUGAR.saveAndContinue(this);">
{$APP.LBL_SAVE_AND_CONTINUE}
</button>
{/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input id="btn_view_change_log" title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=AOS_Quotes", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="button" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</div>
</form>
{$set_focus_block}
<script>SUGAR.util.doWhen("document.getElementById('EditView') != null",
        function(){ldelim}SUGAR.util.buildAccessKeyLabels();{rdelim});
</script>
{sugar_getscript file="cache/include/javascript/sugar_grp_yui_widgets.js"}
<script type="text/javascript">
var EditView_tabs = new YAHOO.widget.TabView("EditView_tabs");
EditView_tabs.selectTab(0);
</script>
<script type="text/javascript">
YAHOO.util.Event.onContentReady("EditView",
    function () {ldelim} initEditView(document.forms.EditView) {rdelim});
//window.setTimeout(, 100);
window.onbeforeunload = function () {ldelim} return onUnloadEditView(); {rdelim};
// bug 55468 -- IE is too aggressive with onUnload event
if ($.browser.msie) {ldelim}
$(document).ready(function() {ldelim}
    $(".collapseLink,.expandLink").click(function (e) {ldelim} e.preventDefault(); {rdelim});
  {rdelim});
{rdelim}
</script>
{literal}
<script type="text/javascript">

    var selectTab = function(tab) {
        $('#EditView_tabs div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER').hide();
        $('#EditView_tabs div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER').eq(tab).show().addClass('active').addClass('in');
        $('#EditView_tabs div.panel-content div.panel').hide();
        $('#EditView_tabs div.panel-content div.panel.tab-panel-' + tab).show()
    };

    var selectTabOnError = function(tab) {
        selectTab(tab);
        $('#EditView_tabs ul.nav.nav-tabs li').removeClass('active');
        $('#EditView_tabs ul.nav.nav-tabs li a').css('color', '');

        $('#EditView_tabs ul.nav.nav-tabs li').eq(tab).find('a').first().css('color', 'red');
        $('#EditView_tabs ul.nav.nav-tabs li').eq(tab).addClass('active');

    };

    var selectTabOnErrorInputHandle = function(inputHandle) {
        var tab = $(inputHandle).closest('.tab-pane-NOBOOTSTRAPTOGGLER').attr('id').match(/^detailpanel_(.*)$/)[1];
        selectTabOnError(tab);
    };


    $(function(){
        $('#EditView_tabs ul.nav.nav-tabs li > a[data-toggle="tab"]').click(function(e){
            if(typeof $(this).parent().find('a').first().attr('id') != 'undefined') {
                var tab = parseInt($(this).parent().find('a').first().attr('id').match(/^tab(.)*$/)[1]);
                selectTab(tab);
            }
        });

        $('a[data-toggle="collapse-edit"]').click(function(e){
            if($(this).hasClass('collapsed')) {
              // Expand panel
                // Change style of .panel-header
                $(this).removeClass('collapsed');
                // Expand .panel-body
                $(this).parents('.panel').find('.panel-body').removeClass('in').addClass('in');
            } else {
              // Collapse panel
                // Change style of .panel-header
                $(this).addClass('collapsed');
                // Collapse .panel-body
                $(this).parents('.panel').find('.panel-body').removeClass('in').removeClass('in');
            }
        });
    });

    </script>
{/literal}{literal}
<script type="text/javascript">
addForm('EditView');addToValidate('EditView', 'name', 'name', true,'{/literal}{sugar_translate label='LBL_NAME' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'date_entered_date', 'date', false,'Date Created' );
addToValidate('EditView', 'date_modified_date', 'date', false,'Date Modified' );
addToValidate('EditView', 'modified_user_id', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_MODIFIED' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'modified_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_MODIFIED_NAME' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'created_by', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_CREATED' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'created_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_CREATED' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'description', 'text', false,'{/literal}{sugar_translate label='LBL_DESCRIPTION' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'deleted', 'bool', false,'{/literal}{sugar_translate label='LBL_DELETED' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'assigned_user_id', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_ID' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'assigned_user_name', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_NAME' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'approval_issue', 'text', false,'{/literal}{sugar_translate label='LBL_APPROVAL_ISSUE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'billing_account_id', 'id', false,'{/literal}{sugar_translate label='' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'billing_account', 'relate', false,'{/literal}{sugar_translate label='LBL_BILLING_ACCOUNT' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'billing_contact_id', 'id', false,'{/literal}{sugar_translate label='' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'billing_contact', 'relate', false,'{/literal}{sugar_translate label='LBL_BILLING_CONTACT' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'billing_address_street', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_STREET' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'billing_address_city', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_CITY' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'billing_address_state', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_STATE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'billing_address_postalcode', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_POSTALCODE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'billing_address_country', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_COUNTRY' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shipping_address_street', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_STREET' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shipping_address_city', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_CITY' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shipping_address_state', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_STATE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shipping_address_postalcode', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_POSTALCODE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shipping_address_country', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_COUNTRY' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'expiration', 'date', true,'{/literal}{sugar_translate label='LBL_EXPIRATION' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'number', 'int', false,'{/literal}{sugar_translate label='LBL_QUOTE_NUMBER' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'opportunity_id', 'id', false,'{/literal}{sugar_translate label='' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'opportunity', 'relate', false,'{/literal}{sugar_translate label='LBL_OPPORTUNITY' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'template_ddown_c[]', 'multienum', false,'{/literal}{sugar_translate label='LBL_TEMPLATE_DDOWN_C' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'line_items', 'function', false,'{/literal}{sugar_translate label='LBL_LINE_ITEMS' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'total_amt', 'currency', false,'{/literal}{sugar_translate label='LBL_TOTAL_AMT' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'total_amt_usdollar', 'currency', false,'{/literal}{sugar_translate label='LBL_TOTAL_AMT_USDOLLAR' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'subtotal_amount', 'currency', false,'{/literal}{sugar_translate label='LBL_SUBTOTAL_AMOUNT' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'subtotal_amount_usdollar', 'currency', false,'{/literal}{sugar_translate label='LBL_SUBTOTAL_AMOUNT_USDOLLAR' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'discount_amount', 'currency', false,'{/literal}{sugar_translate label='LBL_DISCOUNT_AMOUNT' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'discount_amount_usdollar', 'currency', false,'{/literal}{sugar_translate label='LBL_DISCOUNT_AMOUNT_USDOLLAR' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'tax_amount', 'currency', false,'{/literal}{sugar_translate label='LBL_TAX_AMOUNT' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'tax_amount_usdollar', 'currency', false,'{/literal}{sugar_translate label='LBL_TAX_AMOUNT_USDOLLAR' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shipping_amount', 'currency', false,'{/literal}{sugar_translate label='LBL_SHIPPING_AMOUNT' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shipping_amount_usdollar', 'currency', false,'{/literal}{sugar_translate label='LBL_SHIPPING_AMOUNT_USDOLLAR' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shipping_tax', 'enum', false,'{/literal}{sugar_translate label='LBL_SHIPPING_TAX' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shipping_tax_amt', 'currency', false,'{/literal}{sugar_translate label='LBL_SHIPPING_TAX_AMT' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shipping_tax_amt_usdollar', 'currency', false,'{/literal}{sugar_translate label='LBL_SHIPPING_TAX_AMT_USDOLLAR' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'total_amount', 'currency', false,'{/literal}{sugar_translate label='LBL_GRAND_TOTAL' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'total_amount_usdollar', 'currency', false,'{/literal}{sugar_translate label='LBL_GRAND_TOTAL_USDOLLAR' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'currency_id', 'id', false,'{/literal}{sugar_translate label='LBL_CURRENCY' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'stage', 'enum', true,'{/literal}{sugar_translate label='LBL_STAGE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'term', 'enum', false,'{/literal}{sugar_translate label='LBL_TERM' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'terms_c', 'text', false,'{/literal}{sugar_translate label='LBL_TERMS_C' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'approval_status', 'enum', false,'{/literal}{sugar_translate label='LBL_APPROVAL_STATUS' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'invoice_status', 'enum', false,'{/literal}{sugar_translate label='LBL_INVOICE_STATUS' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'subtotal_tax_amount', 'currency', false,'{/literal}{sugar_translate label='LBL_SUBTOTAL_TAX_AMOUNT' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'subtotal_tax_amount_usdollar', 'currency', false,'{/literal}{sugar_translate label='LBL_SUBTOTAL_TAX_AMOUNT_USDOLLAR' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'valve_type_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_VALVE_TYPE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'motor_type_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MOTOR_TYPE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'air_exhaust_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_AIR_EXHAUST' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'motor_phase_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MOTOR_PHASE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'worm_wheel_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_WORM_WHEEL' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'motor_standard_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MOTOR_STANDARD' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'lubrication_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_LUBRICATION' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'motor_make_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MOTOR_MAKE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'pnf_charges_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_PNF_CHARGES' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'gasket_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_GASKET' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shipment_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPMENT' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'flushing_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_FLUSHING' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'vcf_total_length_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_VCF_TOTAL_LENGTH' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'liquid_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_LIQUID' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'base_frame_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_BASE_FRAME' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'npsh_reqd_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_NPSH_REQD' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'motor_energy_eff_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MOTOR_ENERGY_EFF' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'capacity_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CAPACITY' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'delivery_pipe_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_DELIVERY_PIPE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'pump_performance_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_PUMP_PERFORMANCE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'freight_ins_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_FREIGHT_INS' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'diaphragm_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_DIAPHRAGM' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'motor_protection_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MOTOR_PROTECTION' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'hydro_pressure_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_HYDRO_PRESSURE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'impeller_type_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_IMPELLER_TYPE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'diff_head_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_DIFF_HEAD' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'disc_pressure_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_DISC_PRESSURE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shaft_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHAFT' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'flange_rating_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_FLANGE_RATING' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'mdp_casing_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MDP_CASING' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'vcf_pump_length_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_VCF_PUMP_LENGTH' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'column_pipe_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_COLUMN_PIPE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'motor_temp_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MOTOR_TEMP' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'bearing_housing_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_BEARING_HOUSING' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'casing_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CASING' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'installation_depth_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_INSTALLATION_DEPTH' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'particle_size_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_PARTICLE_SIZE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'liquid_end_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_LIQUID_END' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'vap_pr_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_VAP_PR' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'impeller_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_IMPELLER' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'select_terms_c', 'dynamicenum', false,'{/literal}{sugar_translate label='LBL_SELECT_TERMS' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'sp_gr_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_SP_GR' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'max_pow_rated_impeller_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MAX_POW_RATED_IMPELLER' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'motor_voltage_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MOTOR_VOLTAGE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'gst_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_GST' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'strainer_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_STRAINER' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'stuffing_box_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_STUFFING_BOX' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'enquiry_type_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_ENQUIRY_TYPE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'max_air_consumption_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MAX_AIR_CONSUMPTION' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'mdp_base_frame_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MDP_BASE_FRAME' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'installation_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_INSTALLATION' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'mdp_impeller_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MDP_IMPELLER' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'suction_delivery_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_SUCTION_DELIVERY' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'suc_press_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_SUC_PRESS' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'product_type_c', 'enum', false,'{/literal}{sugar_translate label='LBL_PRODUCT_TYPE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'incoterms_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_INCOTERMS' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'temp_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_TEMP' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'testing_pressure_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_TESTING_PRESSURE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shaft_sleeve_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHAFT_SLEEVE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'bush_bearing_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_BUSH_BEARING' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'non_wetted_parts_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_NON_WETTED_PARTS' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'pump_drive_mounting_base_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_PUMP_DRIVE_MOUNTING_BASE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'isolation_shell_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_ISOLATION_SHELL' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'coupling_guard_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_COUPLING_GUARD' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'mounting_plate_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MOUNTING_PLATE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'pump_type_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_PUMP_TYPE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'enquiry_date_c_date', 'date', false,'Enquiry Date' );
addToValidate('EditView', 'mdp_pump_body_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MDP_PUMP_BODY' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'pump_model_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_PUMP_MODEL' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'impeller_dia_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_IMPELLER_DIA' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'bkw_water_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_BKW_WATER' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'air_inlet_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_AIR_INLET' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'mdp_shaft_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MDP_SHAFT' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'payment_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_PAYMENT' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'reference_no_c', 'varchar', true,'{/literal}{sugar_translate label='LBL_REFERENCE_NO' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'valve_ball_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_VALVE_BALL' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'motor_herts_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MOTOR_HERTS' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'seal_type_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_SEAL_TYPE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'gear_housing_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_GEAR_HOUSING' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'validity_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_VALIDITY' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'wetted_parts_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_WETTED_PARTS' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shipping_terms_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_TERMS' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'insulation_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_INSULATION' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'delivery_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_DELIVERY' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'min_safe_flow_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MIN_SAFE_FLOW' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'shut_off_head_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHUT_OFF_HEAD' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'max_air_inlet_pressure_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MAX_AIR_INLET_PRESSURE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'dm_nrv_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_DM_NRV' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'motor_stool_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MOTOR_STOOL' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'motor_recomm_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MOTOR_RECOMM' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'dosing_metering_diaphragm_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_DOSING_METERING_DIAPHRAGM' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'spm_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_SPM' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'bkw_liquid_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_BKW_LIQUID' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'gear_ratio_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_GEAR_RATIO' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'back_plate_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_BACK_PLATE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'solids_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_SOLIDS' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'valve_seat_o_ring_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_VALVE_SEAT_O_RING' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'motor_mount_type_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_MOTOR_MOUNT_TYPE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'packing_type_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_PACKING_TYPE' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'viscosity_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_VISCOSITY' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'kw_rpm_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_KW_RPM' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'plunger_dia_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_PLUNGER_DIA' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'thrust_bearing_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_THRUST_BEARING' module='AOS_Quotes' for_js=true}{literal}' );
addToValidate('EditView', 'fastner_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_FASTNER' module='AOS_Quotes' for_js=true}{literal}' );
addToValidateBinaryDependency('EditView', 'assigned_user_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='AOS_Quotes' for_js=true}{literal}: {/literal}{sugar_translate label='LBL_ASSIGNED_TO' module='AOS_Quotes' for_js=true}{literal}', 'assigned_user_id' );
addToValidateBinaryDependency('EditView', 'billing_account', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='AOS_Quotes' for_js=true}{literal}: {/literal}{sugar_translate label='LBL_BILLING_ACCOUNT' module='AOS_Quotes' for_js=true}{literal}', 'billing_account_id' );
addToValidateBinaryDependency('EditView', 'billing_contact', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='AOS_Quotes' for_js=true}{literal}: {/literal}{sugar_translate label='LBL_BILLING_CONTACT' module='AOS_Quotes' for_js=true}{literal}', 'billing_contact_id' );
addToValidateBinaryDependency('EditView', 'opportunity', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='AOS_Quotes' for_js=true}{literal}: {/literal}{sugar_translate label='LBL_OPPORTUNITY' module='AOS_Quotes' for_js=true}{literal}', 'opportunity_id' );
</script><script language="javascript">if(typeof sqs_objects == 'undefined'){var sqs_objects = new Array;}sqs_objects['EditView_opportunity']={"form":"EditView","method":"query","modules":["Opportunities"],"group":"or","field_list":["name","id"],"populate_list":["opportunity","opportunity_id"],"required_list":["parent_id"],"conditions":[{"name":"name","op":"like_custom","end":"%","value":""}],"order":"name","limit":"30","no_match_text":"No Match"};sqs_objects['EditView_assigned_user_name']={"form":"EditView","method":"get_user_array","field_list":["user_name","id"],"populate_list":["assigned_user_name","assigned_user_id"],"required_list":["assigned_user_id"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};sqs_objects['EditView_billing_account']={"form":"EditView","method":"query","modules":["Accounts"],"group":"or","field_list":["name","id","billing_address_street","billing_address_city","billing_address_state","billing_address_postalcode","billing_address_country","shipping_address_street","shipping_address_city","shipping_address_state","shipping_address_postalcode","shipping_address_country"],"populate_list":["EditView_billing_account","billing_account_id","billing_address_street","billing_address_city","billing_address_state","billing_address_postalcode","billing_address_country","shipping_address_street","shipping_address_city","shipping_address_state","shipping_address_postalcode","shipping_address_country"],"conditions":[{"name":"name","op":"like_custom","end":"%","value":""}],"required_list":["billing_account_id"],"order":"name","limit":"30","no_match_text":"No Match"};sqs_objects['EditView_billing_contact']={"form":"EditView","method":"get_contact_array","modules":["Contacts"],"field_list":["salutation","first_name","last_name","id"],"populate_list":["billing_contact","billing_contact_id","billing_contact_id","billing_contact_id"],"required_list":["billing_contact_id"],"group":"or","conditions":[{"name":"first_name","op":"like_custom","end":"%","value":""},{"name":"last_name","op":"like_custom","end":"%","value":""}],"order":"last_name","limit":"30","no_match_text":"No Match"};</script>{/literal}
