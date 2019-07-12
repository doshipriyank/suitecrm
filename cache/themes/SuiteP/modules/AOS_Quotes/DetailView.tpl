

<script language="javascript">
    {literal}
    SUGAR.util.doWhen(function () {
        return $("#contentTable").length == 0;
    }, SUGAR.themes.actionMenu);
    {/literal}
</script>
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="">
<tr>
<td class="buttons" align="left" NOWRAP width="80%">
<div class="actionsContainer">
<form action="index.php" method="post" name="DetailView" id="formDetailView">
<input type="hidden" name="module" value="{$module}">
<input type="hidden" name="record" value="{$fields.id.value}">
<input type="hidden" name="return_action">
<input type="hidden" name="return_module">
<input type="hidden" name="return_id">
<input type="hidden" name="module_tab">
<input type="hidden" name="isDuplicate" value="false">
<input type="hidden" name="offset" value="{$offset}">
<input type="hidden" name="action" value="EditView">
<input type="hidden" name="sugar_body_only">
{if !$config.enable_action_menu}
<div class="buttons">
{if $bean->aclAccess("edit")}<input title="{$APP.LBL_EDIT_BUTTON_TITLE}" accessKey="{$APP.LBL_EDIT_BUTTON_KEY}" class="button primary" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='AOS_Quotes'; _form.return_action.value='DetailView'; _form.return_id.value='{$id}'; _form.action.value='EditView';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Edit" id="edit_button" value="{$APP.LBL_EDIT_BUTTON_LABEL}">{/if} 
{if $bean->aclAccess("edit")}<input title="{$APP.LBL_DUPLICATE_BUTTON_TITLE}" accessKey="{$APP.LBL_DUPLICATE_BUTTON_KEY}" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='AOS_Quotes'; _form.return_action.value='DetailView'; _form.isDuplicate.value=true; _form.action.value='EditView'; _form.return_id.value='{$id}';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Duplicate" value="{$APP.LBL_DUPLICATE_BUTTON_LABEL}" id="duplicate_button">{/if} 
{if $bean->aclAccess("delete")}<input title="{$APP.LBL_DELETE_BUTTON_TITLE}" accessKey="{$APP.LBL_DELETE_BUTTON_KEY}" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='AOS_Quotes'; _form.return_action.value='ListView'; _form.action.value='Delete'; if(confirm('{$APP.NTC_DELETE_CONFIRMATION}')) SUGAR.ajaxUI.submitForm(_form); return false;" type="submit" name="Delete" value="{$APP.LBL_DELETE_BUTTON_LABEL}" id="delete_button">{/if} 
{if $bean->aclAccess("edit") && $bean->aclAccess("delete")}<input title="{$APP.LBL_DUP_MERGE}" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='AOS_Quotes'; _form.return_action.value='DetailView'; _form.return_id.value='{$id}'; _form.action.value='Step1'; _form.module.value='MergeRecords';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Merge" value="{$APP.LBL_DUP_MERGE}" id="merge_duplicate_button">{/if} 
<input type="button" class="button" onClick="showPopup('pdf');" value="{$MOD.LBL_PRINT_AS_PDF}"/>
<input type="button" class="button" onClick="showPopup('emailpdf');" value="{$MOD.LBL_EMAIL_PDF}"/>
<input type="button" class="button" onClick="showPopup('email');return false;" value="{$MOD.LBL_EMAIL_QUOTE}"/>
<input class="button" id="create_contract_button" title="{$MOD.LBL_CREATE_OPPORTUNITY}" onclick="var _form = document.getElementById('formDetailView');_form.action.value='createOpportunity';_form.submit();" name="Create Opportunity" type="button" value="{$MOD.LBL_CREATE_OPPORTUNITY}"/>
<input class="button" id="create_contract_button" title="{$MOD.LBL_CREATE_CONTRACT}" onclick="var _form = document.getElementById('formDetailView');_form.action.value='createContract';_form.submit();" name="Create Contract" type="button" value="{$MOD.LBL_CREATE_CONTRACT}"/>
<input class="button" id="convert_to_invoice_button" title="{$MOD.LBL_CONVERT_TO_INVOICE}" onclick="var _form = document.getElementById('formDetailView');_form.action.value='converToInvoice';_form.submit();" name="Convert to Invoice" type="button" value="{$MOD.LBL_CONVERT_TO_INVOICE}"/>
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input id="btn_view_change_log" title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=AOS_Quotes", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="button" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</div>                    {/if}
</form>
</div>
</td>
<td align="right" width="20%" class="buttons">{$ADMIN_EDIT}
</td>
</tr>
</table>
{sugar_include include=$includes}
<div class="detail-view">
<div class="mobile-pagination">{$PAGINATION}</div>

<ul class="nav nav-tabs">


<li role="presentation" class="active">
<a id="tab0" data-toggle="tab" class="hidden-xs">
{sugar_translate label='LBL_EDITVIEW_PANEL3' module='AOS_Quotes'}
</a>


<a id="xstab0" href="#" class="visible-xs first-tab dropdown-toggle" data-toggle="dropdown">
{sugar_translate label='LBL_EDITVIEW_PANEL3' module='AOS_Quotes'}
</a>
</li>




























{if $config.enable_action_menu and $config.enable_action_menu != false}
<li id="tab-actions" class="dropdown">
<a class="dropdown-toggle" data-toggle="dropdown" href="#">ACTIONS<span class="suitepicon suitepicon-action-caret"></span></a>
<ul class="dropdown-menu">
<li>{if $bean->aclAccess("edit")}<input title="{$APP.LBL_EDIT_BUTTON_TITLE}" accessKey="{$APP.LBL_EDIT_BUTTON_KEY}" class="button primary" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='AOS_Quotes'; _form.return_action.value='DetailView'; _form.return_id.value='{$id}'; _form.action.value='EditView';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Edit" id="edit_button" value="{$APP.LBL_EDIT_BUTTON_LABEL}">{/if} </li>
<li>{if $bean->aclAccess("edit")}<input title="{$APP.LBL_DUPLICATE_BUTTON_TITLE}" accessKey="{$APP.LBL_DUPLICATE_BUTTON_KEY}" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='AOS_Quotes'; _form.return_action.value='DetailView'; _form.isDuplicate.value=true; _form.action.value='EditView'; _form.return_id.value='{$id}';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Duplicate" value="{$APP.LBL_DUPLICATE_BUTTON_LABEL}" id="duplicate_button">{/if} </li>
<li>{if $bean->aclAccess("delete")}<input title="{$APP.LBL_DELETE_BUTTON_TITLE}" accessKey="{$APP.LBL_DELETE_BUTTON_KEY}" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='AOS_Quotes'; _form.return_action.value='ListView'; _form.action.value='Delete'; if(confirm('{$APP.NTC_DELETE_CONFIRMATION}')) SUGAR.ajaxUI.submitForm(_form); return false;" type="submit" name="Delete" value="{$APP.LBL_DELETE_BUTTON_LABEL}" id="delete_button">{/if} </li>
<li>{if $bean->aclAccess("edit") && $bean->aclAccess("delete")}<input title="{$APP.LBL_DUP_MERGE}" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='AOS_Quotes'; _form.return_action.value='DetailView'; _form.return_id.value='{$id}'; _form.action.value='Step1'; _form.module.value='MergeRecords';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Merge" value="{$APP.LBL_DUP_MERGE}" id="merge_duplicate_button">{/if} </li>
<li><input type="button" class="button" onClick="showPopup('pdf');" value="{$MOD.LBL_PRINT_AS_PDF}"/></li>
<li><input type="button" class="button" onClick="showPopup('emailpdf');" value="{$MOD.LBL_EMAIL_PDF}"/></li>
<li><input type="button" class="button" onClick="showPopup('email');return false;" value="{$MOD.LBL_EMAIL_QUOTE}"/></li>
<li><input class="button" id="create_contract_button" title="{$MOD.LBL_CREATE_OPPORTUNITY}" onclick="var _form = document.getElementById('formDetailView');_form.action.value='createOpportunity';_form.submit();" name="Create Opportunity" type="button" value="{$MOD.LBL_CREATE_OPPORTUNITY}"/></li>
<li><input class="button" id="create_contract_button" title="{$MOD.LBL_CREATE_CONTRACT}" onclick="var _form = document.getElementById('formDetailView');_form.action.value='createContract';_form.submit();" name="Create Contract" type="button" value="{$MOD.LBL_CREATE_CONTRACT}"/></li>
<li><input class="button" id="convert_to_invoice_button" title="{$MOD.LBL_CONVERT_TO_INVOICE}" onclick="var _form = document.getElementById('formDetailView');_form.action.value='converToInvoice';_form.submit();" name="Convert to Invoice" type="button" value="{$MOD.LBL_CONVERT_TO_INVOICE}"/></li>
<li>{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input id="btn_view_change_log" title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=AOS_Quotes", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="button" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}</li>
</ul>        </li>
<li class="tab-inline-pagination">
{$PAGINATION}
</li>
{/if}
</ul>
<div class="clearfix"></div>

<div class="tab-content">

<div class="tab-pane-NOBOOTSTRAPTOGGLER active fade in" id='tab-content-0'>





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PRODUCT_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="enum" field="product_type_c" colspan='3' >

{if !$fields.product_type_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.product_type_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.product_type_c.name}" value="{ $fields.product_type_c.options }">
{ $fields.product_type_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.product_type_c.name}" value="{ $fields.product_type_c.value }">
{ $fields.product_type_c.options[$fields.product_type_c.value]}
{/if}
{/if}

</div>


</div>

</div>
                    </div>
</div>

<div class="panel-content">
<div>&nbsp;</div>







{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-0" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_ACCOUNT_INFORMATION' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-0"  data-id="LBL_ACCOUNT_INFORMATION">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_NAME' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="name" field="name"  >

{if !$fields.name.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.name.value) <= 0}
{assign var="value" value=$fields.name.default_value }
{else}
{assign var="value" value=$fields.name.value }
{/if} 
<span class="sugar_field" id="{$fields.name.name}">{$fields.name.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_OPPORTUNITY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="relate" field="opportunity"  >

{if !$fields.opportunity.hidden}
{counter name="panelFieldCount" print=false}

{if !empty($fields.opportunity_id.value)}
{capture assign="detail_url"}index.php?module=Opportunities&action=DetailView&record={$fields.opportunity_id.value}{/capture}
<a href="{sugar_ajax_url url=$detail_url}">{/if}
<span id="opportunity_id" class="sugar_field" data-id-value="{$fields.opportunity_id.value}">{$fields.opportunity.value}</span>
{if !empty($fields.opportunity_id.value)}</a>{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_QUOTE_NUMBER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="int" field="number"  >

{if !$fields.number.hidden}
{counter name="panelFieldCount" print=false}

<span class="sugar_field" id="{$fields.number.name}">
{assign var="value" value=$fields.number.value }
{$value}
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_STAGE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="stage"  >

{if !$fields.stage.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.stage.options)}
<input type="hidden" class="sugar_field" id="{$fields.stage.name}" value="{ $fields.stage.options }">
{ $fields.stage.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.stage.name}" value="{ $fields.stage.value }">
{ $fields.stage.options[$fields.stage.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_REFERENCE_NO' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="reference_no_c"  >

{if !$fields.reference_no_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.reference_no_c.value) <= 0}
{assign var="value" value=$fields.reference_no_c.default_value }
{else}
{assign var="value" value=$fields.reference_no_c.value }
{/if} 
<span class="sugar_field" id="{$fields.reference_no_c.name}">{$fields.reference_no_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_ASSIGNED_TO' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="relate" field="assigned_user_name"  >

{if !$fields.assigned_user_name.hidden}
{counter name="panelFieldCount" print=false}

<span id="assigned_user_id" class="sugar_field" data-id-value="{$fields.assigned_user_id.value}">{$fields.assigned_user_name.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_TERM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="term"  >

{if !$fields.term.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.term.options)}
<input type="hidden" class="sugar_field" id="{$fields.term.name}" value="{ $fields.term.options }">
{ $fields.term.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.term.name}" value="{ $fields.term.value }">
{ $fields.term.options[$fields.term.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_APPROVAL_STATUS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="approval_status"  >

{if !$fields.approval_status.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.approval_status.options)}
<input type="hidden" class="sugar_field" id="{$fields.approval_status.name}" value="{ $fields.approval_status.options }">
{ $fields.approval_status.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.approval_status.name}" value="{ $fields.approval_status.value }">
{ $fields.approval_status.options[$fields.approval_status.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_APPROVAL_ISSUE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="text" field="approval_issue"  >

{if !$fields.approval_issue.hidden}
{counter name="panelFieldCount" print=false}

<span class="sugar_field" id="{$fields.approval_issue.name|escape:'html'|url2html|nl2br}">{$fields.approval_issue.value|escape:'html'|escape:'html_entity_decode'|url2html|nl2br}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_EXPIRATION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="date" field="expiration"  >

{if !$fields.expiration.hidden}
{counter name="panelFieldCount" print=false}


{if strlen($fields.expiration.value) <= 0}
{assign var="value" value=$fields.expiration.default_value }
{else}
{assign var="value" value=$fields.expiration.value }
{/if}
<span class="sugar_field" id="{$fields.expiration.name}">{$value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_INVOICE_STATUS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="invoice_status"  >

{if !$fields.invoice_status.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.invoice_status.options)}
<input type="hidden" class="sugar_field" id="{$fields.invoice_status.name}" value="{ $fields.invoice_status.options }">
{ $fields.invoice_status.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.invoice_status.name}" value="{ $fields.invoice_status.value }">
{ $fields.invoice_status.options[$fields.invoice_status.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-0" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_ACCOUNT_INFORMATION' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-0" data-id="LBL_ACCOUNT_INFORMATION">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_NAME' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="name" field="name"  >

{if !$fields.name.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.name.value) <= 0}
{assign var="value" value=$fields.name.default_value }
{else}
{assign var="value" value=$fields.name.value }
{/if} 
<span class="sugar_field" id="{$fields.name.name}">{$fields.name.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_OPPORTUNITY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="relate" field="opportunity"  >

{if !$fields.opportunity.hidden}
{counter name="panelFieldCount" print=false}

{if !empty($fields.opportunity_id.value)}
{capture assign="detail_url"}index.php?module=Opportunities&action=DetailView&record={$fields.opportunity_id.value}{/capture}
<a href="{sugar_ajax_url url=$detail_url}">{/if}
<span id="opportunity_id" class="sugar_field" data-id-value="{$fields.opportunity_id.value}">{$fields.opportunity.value}</span>
{if !empty($fields.opportunity_id.value)}</a>{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_QUOTE_NUMBER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="int" field="number"  >

{if !$fields.number.hidden}
{counter name="panelFieldCount" print=false}

<span class="sugar_field" id="{$fields.number.name}">
{assign var="value" value=$fields.number.value }
{$value}
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_STAGE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="stage"  >

{if !$fields.stage.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.stage.options)}
<input type="hidden" class="sugar_field" id="{$fields.stage.name}" value="{ $fields.stage.options }">
{ $fields.stage.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.stage.name}" value="{ $fields.stage.value }">
{ $fields.stage.options[$fields.stage.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_REFERENCE_NO' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="reference_no_c"  >

{if !$fields.reference_no_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.reference_no_c.value) <= 0}
{assign var="value" value=$fields.reference_no_c.default_value }
{else}
{assign var="value" value=$fields.reference_no_c.value }
{/if} 
<span class="sugar_field" id="{$fields.reference_no_c.name}">{$fields.reference_no_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_ASSIGNED_TO' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="relate" field="assigned_user_name"  >

{if !$fields.assigned_user_name.hidden}
{counter name="panelFieldCount" print=false}

<span id="assigned_user_id" class="sugar_field" data-id-value="{$fields.assigned_user_id.value}">{$fields.assigned_user_name.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_TERM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="term"  >

{if !$fields.term.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.term.options)}
<input type="hidden" class="sugar_field" id="{$fields.term.name}" value="{ $fields.term.options }">
{ $fields.term.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.term.name}" value="{ $fields.term.value }">
{ $fields.term.options[$fields.term.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_APPROVAL_STATUS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="approval_status"  >

{if !$fields.approval_status.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.approval_status.options)}
<input type="hidden" class="sugar_field" id="{$fields.approval_status.name}" value="{ $fields.approval_status.options }">
{ $fields.approval_status.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.approval_status.name}" value="{ $fields.approval_status.value }">
{ $fields.approval_status.options[$fields.approval_status.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_APPROVAL_ISSUE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="text" field="approval_issue"  >

{if !$fields.approval_issue.hidden}
{counter name="panelFieldCount" print=false}

<span class="sugar_field" id="{$fields.approval_issue.name|escape:'html'|url2html|nl2br}">{$fields.approval_issue.value|escape:'html'|escape:'html_entity_decode'|url2html|nl2br}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_EXPIRATION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="date" field="expiration"  >

{if !$fields.expiration.hidden}
{counter name="panelFieldCount" print=false}


{if strlen($fields.expiration.value) <= 0}
{assign var="value" value=$fields.expiration.default_value }
{else}
{assign var="value" value=$fields.expiration.value }
{/if}
<span class="sugar_field" id="{$fields.expiration.name}">{$value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_INVOICE_STATUS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="invoice_status"  >

{if !$fields.invoice_status.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.invoice_status.options)}
<input type="hidden" class="sugar_field" id="{$fields.invoice_status.name}" value="{ $fields.invoice_status.options }">
{ $fields.invoice_status.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.invoice_status.name}" value="{ $fields.invoice_status.value }">
{ $fields.invoice_status.options[$fields.invoice_status.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-1" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_ADDRESS_INFORMATION' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-1"  data-id="LBL_ADDRESS_INFORMATION">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_BILLING_ACCOUNT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="relate" field="billing_account"  >

{if !$fields.billing_account.hidden}
{counter name="panelFieldCount" print=false}

{if !empty($fields.billing_account_id.value)}
{capture assign="detail_url"}index.php?module=Accounts&action=DetailView&record={$fields.billing_account_id.value}{/capture}
<a href="{sugar_ajax_url url=$detail_url}">{/if}
<span id="billing_account_id" class="sugar_field" data-id-value="{$fields.billing_account_id.value}">{$fields.billing_account.value}</span>
{if !empty($fields.billing_account_id.value)}</a>{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_BILLING_CONTACT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="relate" field="billing_contact"  >

{if !$fields.billing_contact.hidden}
{counter name="panelFieldCount" print=false}

{if !empty($fields.billing_contact_id.value)}
{capture assign="detail_url"}index.php?module=Contacts&action=DetailView&record={$fields.billing_contact_id.value}{/capture}
<a href="{sugar_ajax_url url=$detail_url}">{/if}
<span id="billing_contact_id" class="sugar_field" data-id-value="{$fields.billing_contact_id.value}">{$fields.billing_contact.value}</span>
{if !empty($fields.billing_contact_id.value)}</a>{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_BILLING_ADDRESS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="billing_address_street"  >

{if !$fields.billing_address_street.hidden}
{counter name="panelFieldCount" print=false}

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td width='99%'>
<input type="hidden" class="sugar_field" id="billing_address_street"
value="{$fields.billing_address_street.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="billing_address_city"
value="{$fields.billing_address_city.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="billing_address_state"
value="{$fields.billing_address_state.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="billing_address_country"
value="{$fields.billing_address_country.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="billing_address_postalcode"
value="{$fields.billing_address_postalcode.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
{$fields.billing_address_street.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}
<br>
{$fields.billing_address_city.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br} {$fields.billing_address_state.value|escape:'html_entity_decode'|strip_tags|url2html|nl2br}
&nbsp;&nbsp;{$fields.billing_address_postalcode.value|escape:'html_entity_decode'|strip_tags|url2html|nl2br}
<br>
{$fields.billing_address_country.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}
</td>
<td class='dataField' width='1%'>
{$custom_code_billing}
</td>
</tr>
</table>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SHIPPING_ADDRESS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="shipping_address_street"  >

{if !$fields.shipping_address_street.hidden}
{counter name="panelFieldCount" print=false}

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td width='99%'>
<input type="hidden" class="sugar_field" id="shipping_address_street"
value="{$fields.shipping_address_street.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="shipping_address_city"
value="{$fields.shipping_address_city.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="shipping_address_state"
value="{$fields.shipping_address_state.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="shipping_address_country"
value="{$fields.shipping_address_country.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="shipping_address_postalcode"
value="{$fields.shipping_address_postalcode.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
{$fields.shipping_address_street.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}
<br>
{$fields.shipping_address_city.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br} {$fields.shipping_address_state.value|escape:'html_entity_decode'|strip_tags|url2html|nl2br}
&nbsp;&nbsp;{$fields.shipping_address_postalcode.value|escape:'html_entity_decode'|strip_tags|url2html|nl2br}
<br>
{$fields.shipping_address_country.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}
</td>
<td class='dataField' width='1%'>
{$custom_code_shipping}
</td>
</tr>
</table>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-1" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_ADDRESS_INFORMATION' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-1" data-id="LBL_ADDRESS_INFORMATION">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_BILLING_ACCOUNT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="relate" field="billing_account"  >

{if !$fields.billing_account.hidden}
{counter name="panelFieldCount" print=false}

{if !empty($fields.billing_account_id.value)}
{capture assign="detail_url"}index.php?module=Accounts&action=DetailView&record={$fields.billing_account_id.value}{/capture}
<a href="{sugar_ajax_url url=$detail_url}">{/if}
<span id="billing_account_id" class="sugar_field" data-id-value="{$fields.billing_account_id.value}">{$fields.billing_account.value}</span>
{if !empty($fields.billing_account_id.value)}</a>{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_BILLING_CONTACT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="relate" field="billing_contact"  >

{if !$fields.billing_contact.hidden}
{counter name="panelFieldCount" print=false}

{if !empty($fields.billing_contact_id.value)}
{capture assign="detail_url"}index.php?module=Contacts&action=DetailView&record={$fields.billing_contact_id.value}{/capture}
<a href="{sugar_ajax_url url=$detail_url}">{/if}
<span id="billing_contact_id" class="sugar_field" data-id-value="{$fields.billing_contact_id.value}">{$fields.billing_contact.value}</span>
{if !empty($fields.billing_contact_id.value)}</a>{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_BILLING_ADDRESS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="billing_address_street"  >

{if !$fields.billing_address_street.hidden}
{counter name="panelFieldCount" print=false}

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td width='99%'>
<input type="hidden" class="sugar_field" id="billing_address_street"
value="{$fields.billing_address_street.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="billing_address_city"
value="{$fields.billing_address_city.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="billing_address_state"
value="{$fields.billing_address_state.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="billing_address_country"
value="{$fields.billing_address_country.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="billing_address_postalcode"
value="{$fields.billing_address_postalcode.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
{$fields.billing_address_street.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}
<br>
{$fields.billing_address_city.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br} {$fields.billing_address_state.value|escape:'html_entity_decode'|strip_tags|url2html|nl2br}
&nbsp;&nbsp;{$fields.billing_address_postalcode.value|escape:'html_entity_decode'|strip_tags|url2html|nl2br}
<br>
{$fields.billing_address_country.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}
</td>
<td class='dataField' width='1%'>
{$custom_code_billing}
</td>
</tr>
</table>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SHIPPING_ADDRESS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="shipping_address_street"  >

{if !$fields.shipping_address_street.hidden}
{counter name="panelFieldCount" print=false}

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td width='99%'>
<input type="hidden" class="sugar_field" id="shipping_address_street"
value="{$fields.shipping_address_street.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="shipping_address_city"
value="{$fields.shipping_address_city.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="shipping_address_state"
value="{$fields.shipping_address_state.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="shipping_address_country"
value="{$fields.shipping_address_country.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="shipping_address_postalcode"
value="{$fields.shipping_address_postalcode.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
{$fields.shipping_address_street.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}
<br>
{$fields.shipping_address_city.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br} {$fields.shipping_address_state.value|escape:'html_entity_decode'|strip_tags|url2html|nl2br}
&nbsp;&nbsp;{$fields.shipping_address_postalcode.value|escape:'html_entity_decode'|strip_tags|url2html|nl2br}
<br>
{$fields.shipping_address_country.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}
</td>
<td class='dataField' width='1%'>
{$custom_code_shipping}
</td>
</tr>
</table>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-2" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL1' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-2"  data-id="LBL_EDITVIEW_PANEL1">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_LIQUID' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="liquid_c"  >

{if !$fields.liquid_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.liquid_c.value) <= 0}
{assign var="value" value=$fields.liquid_c.default_value }
{else}
{assign var="value" value=$fields.liquid_c.value }
{/if} 
<span class="sugar_field" id="{$fields.liquid_c.name}">{$fields.liquid_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CAPACITY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="capacity_c"  >

{if !$fields.capacity_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.capacity_c.value) <= 0}
{assign var="value" value=$fields.capacity_c.default_value }
{else}
{assign var="value" value=$fields.capacity_c.value }
{/if} 
<span class="sugar_field" id="{$fields.capacity_c.name}">{$fields.capacity_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SOLIDS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="solids_c"  >

{if !$fields.solids_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.solids_c.value) <= 0}
{assign var="value" value=$fields.solids_c.default_value }
{else}
{assign var="value" value=$fields.solids_c.value }
{/if} 
<span class="sugar_field" id="{$fields.solids_c.name}">{$fields.solids_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SUC_PRESS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="suc_press_c"  >

{if !$fields.suc_press_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.suc_press_c.value) <= 0}
{assign var="value" value=$fields.suc_press_c.default_value }
{else}
{assign var="value" value=$fields.suc_press_c.value }
{/if} 
<span class="sugar_field" id="{$fields.suc_press_c.name}">{$fields.suc_press_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_TEMP' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="temp_c"  >

{if !$fields.temp_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.temp_c.value) <= 0}
{assign var="value" value=$fields.temp_c.default_value }
{else}
{assign var="value" value=$fields.temp_c.value }
{/if} 
<span class="sugar_field" id="{$fields.temp_c.name}">{$fields.temp_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DIFF_HEAD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="diff_head_c"  >

{if !$fields.diff_head_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.diff_head_c.value) <= 0}
{assign var="value" value=$fields.diff_head_c.default_value }
{else}
{assign var="value" value=$fields.diff_head_c.value }
{/if} 
<span class="sugar_field" id="{$fields.diff_head_c.name}">{$fields.diff_head_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SP_GR' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="sp_gr_c"  >

{if !$fields.sp_gr_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.sp_gr_c.value) <= 0}
{assign var="value" value=$fields.sp_gr_c.default_value }
{else}
{assign var="value" value=$fields.sp_gr_c.value }
{/if} 
<span class="sugar_field" id="{$fields.sp_gr_c.name}">{$fields.sp_gr_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_NPSH_REQD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="npsh_reqd_c"  >

{if !$fields.npsh_reqd_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.npsh_reqd_c.value) <= 0}
{assign var="value" value=$fields.npsh_reqd_c.default_value }
{else}
{assign var="value" value=$fields.npsh_reqd_c.value }
{/if} 
<span class="sugar_field" id="{$fields.npsh_reqd_c.name}">{$fields.npsh_reqd_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VISCOSITY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="viscosity_c"  >

{if !$fields.viscosity_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.viscosity_c.value) <= 0}
{assign var="value" value=$fields.viscosity_c.default_value }
{else}
{assign var="value" value=$fields.viscosity_c.value }
{/if} 
<span class="sugar_field" id="{$fields.viscosity_c.name}">{$fields.viscosity_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VAP_PR' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="vap_pr_c"  >

{if !$fields.vap_pr_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.vap_pr_c.value) <= 0}
{assign var="value" value=$fields.vap_pr_c.default_value }
{else}
{assign var="value" value=$fields.vap_pr_c.value }
{/if} 
<span class="sugar_field" id="{$fields.vap_pr_c.name}">{$fields.vap_pr_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DISC_PRESSURE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="disc_pressure_c"  >

{if !$fields.disc_pressure_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.disc_pressure_c.value) <= 0}
{assign var="value" value=$fields.disc_pressure_c.default_value }
{else}
{assign var="value" value=$fields.disc_pressure_c.value }
{/if} 
<span class="sugar_field" id="{$fields.disc_pressure_c.name}">{$fields.disc_pressure_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-2" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL1' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-2" data-id="LBL_EDITVIEW_PANEL1">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_LIQUID' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="liquid_c"  >

{if !$fields.liquid_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.liquid_c.value) <= 0}
{assign var="value" value=$fields.liquid_c.default_value }
{else}
{assign var="value" value=$fields.liquid_c.value }
{/if} 
<span class="sugar_field" id="{$fields.liquid_c.name}">{$fields.liquid_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CAPACITY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="capacity_c"  >

{if !$fields.capacity_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.capacity_c.value) <= 0}
{assign var="value" value=$fields.capacity_c.default_value }
{else}
{assign var="value" value=$fields.capacity_c.value }
{/if} 
<span class="sugar_field" id="{$fields.capacity_c.name}">{$fields.capacity_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SOLIDS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="solids_c"  >

{if !$fields.solids_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.solids_c.value) <= 0}
{assign var="value" value=$fields.solids_c.default_value }
{else}
{assign var="value" value=$fields.solids_c.value }
{/if} 
<span class="sugar_field" id="{$fields.solids_c.name}">{$fields.solids_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SUC_PRESS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="suc_press_c"  >

{if !$fields.suc_press_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.suc_press_c.value) <= 0}
{assign var="value" value=$fields.suc_press_c.default_value }
{else}
{assign var="value" value=$fields.suc_press_c.value }
{/if} 
<span class="sugar_field" id="{$fields.suc_press_c.name}">{$fields.suc_press_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_TEMP' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="temp_c"  >

{if !$fields.temp_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.temp_c.value) <= 0}
{assign var="value" value=$fields.temp_c.default_value }
{else}
{assign var="value" value=$fields.temp_c.value }
{/if} 
<span class="sugar_field" id="{$fields.temp_c.name}">{$fields.temp_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DIFF_HEAD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="diff_head_c"  >

{if !$fields.diff_head_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.diff_head_c.value) <= 0}
{assign var="value" value=$fields.diff_head_c.default_value }
{else}
{assign var="value" value=$fields.diff_head_c.value }
{/if} 
<span class="sugar_field" id="{$fields.diff_head_c.name}">{$fields.diff_head_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SP_GR' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="sp_gr_c"  >

{if !$fields.sp_gr_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.sp_gr_c.value) <= 0}
{assign var="value" value=$fields.sp_gr_c.default_value }
{else}
{assign var="value" value=$fields.sp_gr_c.value }
{/if} 
<span class="sugar_field" id="{$fields.sp_gr_c.name}">{$fields.sp_gr_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_NPSH_REQD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="npsh_reqd_c"  >

{if !$fields.npsh_reqd_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.npsh_reqd_c.value) <= 0}
{assign var="value" value=$fields.npsh_reqd_c.default_value }
{else}
{assign var="value" value=$fields.npsh_reqd_c.value }
{/if} 
<span class="sugar_field" id="{$fields.npsh_reqd_c.name}">{$fields.npsh_reqd_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VISCOSITY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="viscosity_c"  >

{if !$fields.viscosity_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.viscosity_c.value) <= 0}
{assign var="value" value=$fields.viscosity_c.default_value }
{else}
{assign var="value" value=$fields.viscosity_c.value }
{/if} 
<span class="sugar_field" id="{$fields.viscosity_c.name}">{$fields.viscosity_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VAP_PR' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="vap_pr_c"  >

{if !$fields.vap_pr_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.vap_pr_c.value) <= 0}
{assign var="value" value=$fields.vap_pr_c.default_value }
{else}
{assign var="value" value=$fields.vap_pr_c.value }
{/if} 
<span class="sugar_field" id="{$fields.vap_pr_c.name}">{$fields.vap_pr_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DISC_PRESSURE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="disc_pressure_c"  >

{if !$fields.disc_pressure_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.disc_pressure_c.value) <= 0}
{assign var="value" value=$fields.disc_pressure_c.default_value }
{else}
{assign var="value" value=$fields.disc_pressure_c.value }
{/if} 
<span class="sugar_field" id="{$fields.disc_pressure_c.name}">{$fields.disc_pressure_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-3" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL8' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-3"  data-id="LBL_EDITVIEW_PANEL8">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PUMP_MODEL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="pump_model_c"  >

{if !$fields.pump_model_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.pump_model_c.value) <= 0}
{assign var="value" value=$fields.pump_model_c.default_value }
{else}
{assign var="value" value=$fields.pump_model_c.value }
{/if} 
<span class="sugar_field" id="{$fields.pump_model_c.name}">{$fields.pump_model_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SUCTION_DELIVERY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="suction_delivery_c"  >

{if !$fields.suction_delivery_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.suction_delivery_c.value) <= 0}
{assign var="value" value=$fields.suction_delivery_c.default_value }
{else}
{assign var="value" value=$fields.suction_delivery_c.value }
{/if} 
<span class="sugar_field" id="{$fields.suction_delivery_c.name}">{$fields.suction_delivery_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PUMP_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="pump_type_c"  >

{if !$fields.pump_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.pump_type_c.value) <= 0}
{assign var="value" value=$fields.pump_type_c.default_value }
{else}
{assign var="value" value=$fields.pump_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.pump_type_c.name}">{$fields.pump_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PUMP_PERFORMANCE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="pump_performance_c"  >

{if !$fields.pump_performance_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.pump_performance_c.value) <= 0}
{assign var="value" value=$fields.pump_performance_c.default_value }
{else}
{assign var="value" value=$fields.pump_performance_c.value }
{/if} 
<span class="sugar_field" id="{$fields.pump_performance_c.name}">{$fields.pump_performance_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VCF_PUMP_LENGTH' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="vcf_pump_length_c"  >

{if !$fields.vcf_pump_length_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.vcf_pump_length_c.value) <= 0}
{assign var="value" value=$fields.vcf_pump_length_c.default_value }
{else}
{assign var="value" value=$fields.vcf_pump_length_c.value }
{/if} 
<span class="sugar_field" id="{$fields.vcf_pump_length_c.name}">{$fields.vcf_pump_length_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VCF_TOTAL_LENGTH' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="vcf_total_length_c"  >

{if !$fields.vcf_total_length_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.vcf_total_length_c.value) <= 0}
{assign var="value" value=$fields.vcf_total_length_c.default_value }
{else}
{assign var="value" value=$fields.vcf_total_length_c.value }
{/if} 
<span class="sugar_field" id="{$fields.vcf_total_length_c.name}">{$fields.vcf_total_length_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-3" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL8' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-3" data-id="LBL_EDITVIEW_PANEL8">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PUMP_MODEL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="pump_model_c"  >

{if !$fields.pump_model_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.pump_model_c.value) <= 0}
{assign var="value" value=$fields.pump_model_c.default_value }
{else}
{assign var="value" value=$fields.pump_model_c.value }
{/if} 
<span class="sugar_field" id="{$fields.pump_model_c.name}">{$fields.pump_model_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SUCTION_DELIVERY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="suction_delivery_c"  >

{if !$fields.suction_delivery_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.suction_delivery_c.value) <= 0}
{assign var="value" value=$fields.suction_delivery_c.default_value }
{else}
{assign var="value" value=$fields.suction_delivery_c.value }
{/if} 
<span class="sugar_field" id="{$fields.suction_delivery_c.name}">{$fields.suction_delivery_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PUMP_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="pump_type_c"  >

{if !$fields.pump_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.pump_type_c.value) <= 0}
{assign var="value" value=$fields.pump_type_c.default_value }
{else}
{assign var="value" value=$fields.pump_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.pump_type_c.name}">{$fields.pump_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PUMP_PERFORMANCE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="pump_performance_c"  >

{if !$fields.pump_performance_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.pump_performance_c.value) <= 0}
{assign var="value" value=$fields.pump_performance_c.default_value }
{else}
{assign var="value" value=$fields.pump_performance_c.value }
{/if} 
<span class="sugar_field" id="{$fields.pump_performance_c.name}">{$fields.pump_performance_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VCF_PUMP_LENGTH' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="vcf_pump_length_c"  >

{if !$fields.vcf_pump_length_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.vcf_pump_length_c.value) <= 0}
{assign var="value" value=$fields.vcf_pump_length_c.default_value }
{else}
{assign var="value" value=$fields.vcf_pump_length_c.value }
{/if} 
<span class="sugar_field" id="{$fields.vcf_pump_length_c.name}">{$fields.vcf_pump_length_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VCF_TOTAL_LENGTH' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="vcf_total_length_c"  >

{if !$fields.vcf_total_length_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.vcf_total_length_c.value) <= 0}
{assign var="value" value=$fields.vcf_total_length_c.default_value }
{else}
{assign var="value" value=$fields.vcf_total_length_c.value }
{/if} 
<span class="sugar_field" id="{$fields.vcf_total_length_c.name}">{$fields.vcf_total_length_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-4" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL2' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-4"  data-id="LBL_EDITVIEW_PANEL2">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_INSTALLATION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="installation_c"  >

{if !$fields.installation_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.installation_c.value) <= 0}
{assign var="value" value=$fields.installation_c.default_value }
{else}
{assign var="value" value=$fields.installation_c.value }
{/if} 
<span class="sugar_field" id="{$fields.installation_c.name}">{$fields.installation_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_IMPELLER_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="impeller_type_c"  >

{if !$fields.impeller_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.impeller_type_c.value) <= 0}
{assign var="value" value=$fields.impeller_type_c.default_value }
{else}
{assign var="value" value=$fields.impeller_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.impeller_type_c.name}">{$fields.impeller_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_INSTALLATION_DEPTH' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="installation_depth_c"  >

{if !$fields.installation_depth_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.installation_depth_c.value) <= 0}
{assign var="value" value=$fields.installation_depth_c.default_value }
{else}
{assign var="value" value=$fields.installation_depth_c.value }
{/if} 
<span class="sugar_field" id="{$fields.installation_depth_c.name}">{$fields.installation_depth_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_IMPELLER_DIA' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="impeller_dia_c"  >

{if !$fields.impeller_dia_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.impeller_dia_c.value) <= 0}
{assign var="value" value=$fields.impeller_dia_c.default_value }
{else}
{assign var="value" value=$fields.impeller_dia_c.value }
{/if} 
<span class="sugar_field" id="{$fields.impeller_dia_c.name}">{$fields.impeller_dia_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_FLANGE_RATING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="flange_rating_c"  >

{if !$fields.flange_rating_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.flange_rating_c.value) <= 0}
{assign var="value" value=$fields.flange_rating_c.default_value }
{else}
{assign var="value" value=$fields.flange_rating_c.value }
{/if} 
<span class="sugar_field" id="{$fields.flange_rating_c.name}">{$fields.flange_rating_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SHUT_OFF_HEAD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="shut_off_head_c"  >

{if !$fields.shut_off_head_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.shut_off_head_c.value) <= 0}
{assign var="value" value=$fields.shut_off_head_c.default_value }
{else}
{assign var="value" value=$fields.shut_off_head_c.value }
{/if} 
<span class="sugar_field" id="{$fields.shut_off_head_c.name}">{$fields.shut_off_head_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_FLUSHING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="flushing_c"  >

{if !$fields.flushing_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.flushing_c.value) <= 0}
{assign var="value" value=$fields.flushing_c.default_value }
{else}
{assign var="value" value=$fields.flushing_c.value }
{/if} 
<span class="sugar_field" id="{$fields.flushing_c.name}">{$fields.flushing_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MIN_SAFE_FLOW' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="min_safe_flow_c"  >

{if !$fields.min_safe_flow_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.min_safe_flow_c.value) <= 0}
{assign var="value" value=$fields.min_safe_flow_c.default_value }
{else}
{assign var="value" value=$fields.min_safe_flow_c.value }
{/if} 
<span class="sugar_field" id="{$fields.min_safe_flow_c.name}">{$fields.min_safe_flow_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_LUBRICATION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="lubrication_c"  >

{if !$fields.lubrication_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.lubrication_c.value) <= 0}
{assign var="value" value=$fields.lubrication_c.default_value }
{else}
{assign var="value" value=$fields.lubrication_c.value }
{/if} 
<span class="sugar_field" id="{$fields.lubrication_c.name}">{$fields.lubrication_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_RECOMM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_recomm_c"  >

{if !$fields.motor_recomm_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_recomm_c.value) <= 0}
{assign var="value" value=$fields.motor_recomm_c.default_value }
{else}
{assign var="value" value=$fields.motor_recomm_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_recomm_c.name}">{$fields.motor_recomm_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_STRAINER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="varchar" field="strainer_c" colspan='3' >

{if !$fields.strainer_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.strainer_c.value) <= 0}
{assign var="value" value=$fields.strainer_c.default_value }
{else}
{assign var="value" value=$fields.strainer_c.value }
{/if} 
<span class="sugar_field" id="{$fields.strainer_c.name}">{$fields.strainer_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-4" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL2' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-4" data-id="LBL_EDITVIEW_PANEL2">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_INSTALLATION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="installation_c"  >

{if !$fields.installation_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.installation_c.value) <= 0}
{assign var="value" value=$fields.installation_c.default_value }
{else}
{assign var="value" value=$fields.installation_c.value }
{/if} 
<span class="sugar_field" id="{$fields.installation_c.name}">{$fields.installation_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_IMPELLER_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="impeller_type_c"  >

{if !$fields.impeller_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.impeller_type_c.value) <= 0}
{assign var="value" value=$fields.impeller_type_c.default_value }
{else}
{assign var="value" value=$fields.impeller_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.impeller_type_c.name}">{$fields.impeller_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_INSTALLATION_DEPTH' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="installation_depth_c"  >

{if !$fields.installation_depth_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.installation_depth_c.value) <= 0}
{assign var="value" value=$fields.installation_depth_c.default_value }
{else}
{assign var="value" value=$fields.installation_depth_c.value }
{/if} 
<span class="sugar_field" id="{$fields.installation_depth_c.name}">{$fields.installation_depth_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_IMPELLER_DIA' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="impeller_dia_c"  >

{if !$fields.impeller_dia_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.impeller_dia_c.value) <= 0}
{assign var="value" value=$fields.impeller_dia_c.default_value }
{else}
{assign var="value" value=$fields.impeller_dia_c.value }
{/if} 
<span class="sugar_field" id="{$fields.impeller_dia_c.name}">{$fields.impeller_dia_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_FLANGE_RATING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="flange_rating_c"  >

{if !$fields.flange_rating_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.flange_rating_c.value) <= 0}
{assign var="value" value=$fields.flange_rating_c.default_value }
{else}
{assign var="value" value=$fields.flange_rating_c.value }
{/if} 
<span class="sugar_field" id="{$fields.flange_rating_c.name}">{$fields.flange_rating_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SHUT_OFF_HEAD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="shut_off_head_c"  >

{if !$fields.shut_off_head_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.shut_off_head_c.value) <= 0}
{assign var="value" value=$fields.shut_off_head_c.default_value }
{else}
{assign var="value" value=$fields.shut_off_head_c.value }
{/if} 
<span class="sugar_field" id="{$fields.shut_off_head_c.name}">{$fields.shut_off_head_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_FLUSHING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="flushing_c"  >

{if !$fields.flushing_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.flushing_c.value) <= 0}
{assign var="value" value=$fields.flushing_c.default_value }
{else}
{assign var="value" value=$fields.flushing_c.value }
{/if} 
<span class="sugar_field" id="{$fields.flushing_c.name}">{$fields.flushing_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MIN_SAFE_FLOW' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="min_safe_flow_c"  >

{if !$fields.min_safe_flow_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.min_safe_flow_c.value) <= 0}
{assign var="value" value=$fields.min_safe_flow_c.default_value }
{else}
{assign var="value" value=$fields.min_safe_flow_c.value }
{/if} 
<span class="sugar_field" id="{$fields.min_safe_flow_c.name}">{$fields.min_safe_flow_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_LUBRICATION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="lubrication_c"  >

{if !$fields.lubrication_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.lubrication_c.value) <= 0}
{assign var="value" value=$fields.lubrication_c.default_value }
{else}
{assign var="value" value=$fields.lubrication_c.value }
{/if} 
<span class="sugar_field" id="{$fields.lubrication_c.name}">{$fields.lubrication_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_RECOMM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_recomm_c"  >

{if !$fields.motor_recomm_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_recomm_c.value) <= 0}
{assign var="value" value=$fields.motor_recomm_c.default_value }
{else}
{assign var="value" value=$fields.motor_recomm_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_recomm_c.name}">{$fields.motor_recomm_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_STRAINER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="varchar" field="strainer_c" colspan='3' >

{if !$fields.strainer_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.strainer_c.value) <= 0}
{assign var="value" value=$fields.strainer_c.default_value }
{else}
{assign var="value" value=$fields.strainer_c.value }
{/if} 
<span class="sugar_field" id="{$fields.strainer_c.name}">{$fields.strainer_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-5" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL4' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-5"  data-id="LBL_EDITVIEW_PANEL4">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CASING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="casing_c"  >

{if !$fields.casing_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.casing_c.value) <= 0}
{assign var="value" value=$fields.casing_c.default_value }
{else}
{assign var="value" value=$fields.casing_c.value }
{/if} 
<span class="sugar_field" id="{$fields.casing_c.name}">{$fields.casing_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_BEARING_HOUSING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="bearing_housing_c"  >

{if !$fields.bearing_housing_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.bearing_housing_c.value) <= 0}
{assign var="value" value=$fields.bearing_housing_c.default_value }
{else}
{assign var="value" value=$fields.bearing_housing_c.value }
{/if} 
<span class="sugar_field" id="{$fields.bearing_housing_c.name}">{$fields.bearing_housing_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_IMPELLER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="impeller_c"  >

{if !$fields.impeller_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.impeller_c.value) <= 0}
{assign var="value" value=$fields.impeller_c.default_value }
{else}
{assign var="value" value=$fields.impeller_c.value }
{/if} 
<span class="sugar_field" id="{$fields.impeller_c.name}">{$fields.impeller_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PACKING_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="packing_type_c"  >

{if !$fields.packing_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.packing_type_c.value) <= 0}
{assign var="value" value=$fields.packing_type_c.default_value }
{else}
{assign var="value" value=$fields.packing_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.packing_type_c.name}">{$fields.packing_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_BACK_PLATE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="back_plate_c"  >

{if !$fields.back_plate_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.back_plate_c.value) <= 0}
{assign var="value" value=$fields.back_plate_c.default_value }
{else}
{assign var="value" value=$fields.back_plate_c.value }
{/if} 
<span class="sugar_field" id="{$fields.back_plate_c.name}">{$fields.back_plate_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SHAFT_SLEEVE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="shaft_sleeve_c"  >

{if !$fields.shaft_sleeve_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.shaft_sleeve_c.value) <= 0}
{assign var="value" value=$fields.shaft_sleeve_c.default_value }
{else}
{assign var="value" value=$fields.shaft_sleeve_c.value }
{/if} 
<span class="sugar_field" id="{$fields.shaft_sleeve_c.name}">{$fields.shaft_sleeve_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SHAFT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="shaft_c"  >

{if !$fields.shaft_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.shaft_c.value) <= 0}
{assign var="value" value=$fields.shaft_c.default_value }
{else}
{assign var="value" value=$fields.shaft_c.value }
{/if} 
<span class="sugar_field" id="{$fields.shaft_c.name}">{$fields.shaft_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_BASE_FRAME' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="base_frame_c"  >

{if !$fields.base_frame_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.base_frame_c.value) <= 0}
{assign var="value" value=$fields.base_frame_c.default_value }
{else}
{assign var="value" value=$fields.base_frame_c.value }
{/if} 
<span class="sugar_field" id="{$fields.base_frame_c.name}">{$fields.base_frame_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SEAL_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="seal_type_c"  >

{if !$fields.seal_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.seal_type_c.value) <= 0}
{assign var="value" value=$fields.seal_type_c.default_value }
{else}
{assign var="value" value=$fields.seal_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.seal_type_c.name}">{$fields.seal_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_STUFFING_BOX' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="stuffing_box_c"  >

{if !$fields.stuffing_box_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.stuffing_box_c.value) <= 0}
{assign var="value" value=$fields.stuffing_box_c.default_value }
{else}
{assign var="value" value=$fields.stuffing_box_c.value }
{/if} 
<span class="sugar_field" id="{$fields.stuffing_box_c.name}">{$fields.stuffing_box_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DELIVERY_PIPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="delivery_pipe_c"  >

{if !$fields.delivery_pipe_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.delivery_pipe_c.value) <= 0}
{assign var="value" value=$fields.delivery_pipe_c.default_value }
{else}
{assign var="value" value=$fields.delivery_pipe_c.value }
{/if} 
<span class="sugar_field" id="{$fields.delivery_pipe_c.name}">{$fields.delivery_pipe_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_COLUMN_PIPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="column_pipe_c"  >

{if !$fields.column_pipe_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.column_pipe_c.value) <= 0}
{assign var="value" value=$fields.column_pipe_c.default_value }
{else}
{assign var="value" value=$fields.column_pipe_c.value }
{/if} 
<span class="sugar_field" id="{$fields.column_pipe_c.name}">{$fields.column_pipe_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_STOOL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_stool_c"  >

{if !$fields.motor_stool_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_stool_c.value) <= 0}
{assign var="value" value=$fields.motor_stool_c.default_value }
{else}
{assign var="value" value=$fields.motor_stool_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_stool_c.name}">{$fields.motor_stool_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOUNTING_PLATE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="mounting_plate_c"  >

{if !$fields.mounting_plate_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.mounting_plate_c.value) <= 0}
{assign var="value" value=$fields.mounting_plate_c.default_value }
{else}
{assign var="value" value=$fields.mounting_plate_c.value }
{/if} 
<span class="sugar_field" id="{$fields.mounting_plate_c.name}">{$fields.mounting_plate_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-5" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL4' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-5" data-id="LBL_EDITVIEW_PANEL4">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CASING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="casing_c"  >

{if !$fields.casing_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.casing_c.value) <= 0}
{assign var="value" value=$fields.casing_c.default_value }
{else}
{assign var="value" value=$fields.casing_c.value }
{/if} 
<span class="sugar_field" id="{$fields.casing_c.name}">{$fields.casing_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_BEARING_HOUSING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="bearing_housing_c"  >

{if !$fields.bearing_housing_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.bearing_housing_c.value) <= 0}
{assign var="value" value=$fields.bearing_housing_c.default_value }
{else}
{assign var="value" value=$fields.bearing_housing_c.value }
{/if} 
<span class="sugar_field" id="{$fields.bearing_housing_c.name}">{$fields.bearing_housing_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_IMPELLER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="impeller_c"  >

{if !$fields.impeller_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.impeller_c.value) <= 0}
{assign var="value" value=$fields.impeller_c.default_value }
{else}
{assign var="value" value=$fields.impeller_c.value }
{/if} 
<span class="sugar_field" id="{$fields.impeller_c.name}">{$fields.impeller_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PACKING_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="packing_type_c"  >

{if !$fields.packing_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.packing_type_c.value) <= 0}
{assign var="value" value=$fields.packing_type_c.default_value }
{else}
{assign var="value" value=$fields.packing_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.packing_type_c.name}">{$fields.packing_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_BACK_PLATE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="back_plate_c"  >

{if !$fields.back_plate_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.back_plate_c.value) <= 0}
{assign var="value" value=$fields.back_plate_c.default_value }
{else}
{assign var="value" value=$fields.back_plate_c.value }
{/if} 
<span class="sugar_field" id="{$fields.back_plate_c.name}">{$fields.back_plate_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SHAFT_SLEEVE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="shaft_sleeve_c"  >

{if !$fields.shaft_sleeve_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.shaft_sleeve_c.value) <= 0}
{assign var="value" value=$fields.shaft_sleeve_c.default_value }
{else}
{assign var="value" value=$fields.shaft_sleeve_c.value }
{/if} 
<span class="sugar_field" id="{$fields.shaft_sleeve_c.name}">{$fields.shaft_sleeve_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SHAFT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="shaft_c"  >

{if !$fields.shaft_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.shaft_c.value) <= 0}
{assign var="value" value=$fields.shaft_c.default_value }
{else}
{assign var="value" value=$fields.shaft_c.value }
{/if} 
<span class="sugar_field" id="{$fields.shaft_c.name}">{$fields.shaft_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_BASE_FRAME' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="base_frame_c"  >

{if !$fields.base_frame_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.base_frame_c.value) <= 0}
{assign var="value" value=$fields.base_frame_c.default_value }
{else}
{assign var="value" value=$fields.base_frame_c.value }
{/if} 
<span class="sugar_field" id="{$fields.base_frame_c.name}">{$fields.base_frame_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SEAL_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="seal_type_c"  >

{if !$fields.seal_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.seal_type_c.value) <= 0}
{assign var="value" value=$fields.seal_type_c.default_value }
{else}
{assign var="value" value=$fields.seal_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.seal_type_c.name}">{$fields.seal_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_STUFFING_BOX' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="stuffing_box_c"  >

{if !$fields.stuffing_box_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.stuffing_box_c.value) <= 0}
{assign var="value" value=$fields.stuffing_box_c.default_value }
{else}
{assign var="value" value=$fields.stuffing_box_c.value }
{/if} 
<span class="sugar_field" id="{$fields.stuffing_box_c.name}">{$fields.stuffing_box_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DELIVERY_PIPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="delivery_pipe_c"  >

{if !$fields.delivery_pipe_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.delivery_pipe_c.value) <= 0}
{assign var="value" value=$fields.delivery_pipe_c.default_value }
{else}
{assign var="value" value=$fields.delivery_pipe_c.value }
{/if} 
<span class="sugar_field" id="{$fields.delivery_pipe_c.name}">{$fields.delivery_pipe_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_COLUMN_PIPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="column_pipe_c"  >

{if !$fields.column_pipe_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.column_pipe_c.value) <= 0}
{assign var="value" value=$fields.column_pipe_c.default_value }
{else}
{assign var="value" value=$fields.column_pipe_c.value }
{/if} 
<span class="sugar_field" id="{$fields.column_pipe_c.name}">{$fields.column_pipe_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_STOOL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_stool_c"  >

{if !$fields.motor_stool_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_stool_c.value) <= 0}
{assign var="value" value=$fields.motor_stool_c.default_value }
{else}
{assign var="value" value=$fields.motor_stool_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_stool_c.name}">{$fields.motor_stool_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOUNTING_PLATE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="mounting_plate_c"  >

{if !$fields.mounting_plate_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.mounting_plate_c.value) <= 0}
{assign var="value" value=$fields.mounting_plate_c.default_value }
{else}
{assign var="value" value=$fields.mounting_plate_c.value }
{/if} 
<span class="sugar_field" id="{$fields.mounting_plate_c.name}">{$fields.mounting_plate_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-6" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL13' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-6"  data-id="LBL_EDITVIEW_PANEL13">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_CASING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="mdp_casing_c"  >

{if !$fields.mdp_casing_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_casing_c.value) <= 0}
{assign var="value" value=$fields.mdp_casing_c.default_value }
{else}
{assign var="value" value=$fields.mdp_casing_c.value }
{/if} 
<span class="sugar_field" id="{$fields.mdp_casing_c.name}">{$fields.mdp_casing_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_ISOLATION_SHELL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="isolation_shell_c"  >

{if !$fields.isolation_shell_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.isolation_shell_c.value) <= 0}
{assign var="value" value=$fields.isolation_shell_c.default_value }
{else}
{assign var="value" value=$fields.isolation_shell_c.value }
{/if} 
<span class="sugar_field" id="{$fields.isolation_shell_c.name}">{$fields.isolation_shell_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_IMPELLER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="mdp_impeller_c"  >

{if !$fields.mdp_impeller_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_impeller_c.value) <= 0}
{assign var="value" value=$fields.mdp_impeller_c.default_value }
{else}
{assign var="value" value=$fields.mdp_impeller_c.value }
{/if} 
<span class="sugar_field" id="{$fields.mdp_impeller_c.name}">{$fields.mdp_impeller_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_FASTNER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="fastner_c"  >

{if !$fields.fastner_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.fastner_c.value) <= 0}
{assign var="value" value=$fields.fastner_c.default_value }
{else}
{assign var="value" value=$fields.fastner_c.value }
{/if} 
<span class="sugar_field" id="{$fields.fastner_c.name}">{$fields.fastner_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_SHAFT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="mdp_shaft_c"  >

{if !$fields.mdp_shaft_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_shaft_c.value) <= 0}
{assign var="value" value=$fields.mdp_shaft_c.default_value }
{else}
{assign var="value" value=$fields.mdp_shaft_c.value }
{/if} 
<span class="sugar_field" id="{$fields.mdp_shaft_c.name}">{$fields.mdp_shaft_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_THRUST_BEARING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="thrust_bearing_c"  >

{if !$fields.thrust_bearing_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.thrust_bearing_c.value) <= 0}
{assign var="value" value=$fields.thrust_bearing_c.default_value }
{else}
{assign var="value" value=$fields.thrust_bearing_c.value }
{/if} 
<span class="sugar_field" id="{$fields.thrust_bearing_c.name}">{$fields.thrust_bearing_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_PUMP_BODY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="mdp_pump_body_c"  >

{if !$fields.mdp_pump_body_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_pump_body_c.value) <= 0}
{assign var="value" value=$fields.mdp_pump_body_c.default_value }
{else}
{assign var="value" value=$fields.mdp_pump_body_c.value }
{/if} 
<span class="sugar_field" id="{$fields.mdp_pump_body_c.name}">{$fields.mdp_pump_body_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_BASE_FRAME' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="mdp_base_frame_c"  >

{if !$fields.mdp_base_frame_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_base_frame_c.value) <= 0}
{assign var="value" value=$fields.mdp_base_frame_c.default_value }
{else}
{assign var="value" value=$fields.mdp_base_frame_c.value }
{/if} 
<span class="sugar_field" id="{$fields.mdp_base_frame_c.name}">{$fields.mdp_base_frame_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-6" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL13' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-6" data-id="LBL_EDITVIEW_PANEL13">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_CASING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="mdp_casing_c"  >

{if !$fields.mdp_casing_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_casing_c.value) <= 0}
{assign var="value" value=$fields.mdp_casing_c.default_value }
{else}
{assign var="value" value=$fields.mdp_casing_c.value }
{/if} 
<span class="sugar_field" id="{$fields.mdp_casing_c.name}">{$fields.mdp_casing_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_ISOLATION_SHELL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="isolation_shell_c"  >

{if !$fields.isolation_shell_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.isolation_shell_c.value) <= 0}
{assign var="value" value=$fields.isolation_shell_c.default_value }
{else}
{assign var="value" value=$fields.isolation_shell_c.value }
{/if} 
<span class="sugar_field" id="{$fields.isolation_shell_c.name}">{$fields.isolation_shell_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_IMPELLER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="mdp_impeller_c"  >

{if !$fields.mdp_impeller_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_impeller_c.value) <= 0}
{assign var="value" value=$fields.mdp_impeller_c.default_value }
{else}
{assign var="value" value=$fields.mdp_impeller_c.value }
{/if} 
<span class="sugar_field" id="{$fields.mdp_impeller_c.name}">{$fields.mdp_impeller_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_FASTNER' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="fastner_c"  >

{if !$fields.fastner_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.fastner_c.value) <= 0}
{assign var="value" value=$fields.fastner_c.default_value }
{else}
{assign var="value" value=$fields.fastner_c.value }
{/if} 
<span class="sugar_field" id="{$fields.fastner_c.name}">{$fields.fastner_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_SHAFT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="mdp_shaft_c"  >

{if !$fields.mdp_shaft_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_shaft_c.value) <= 0}
{assign var="value" value=$fields.mdp_shaft_c.default_value }
{else}
{assign var="value" value=$fields.mdp_shaft_c.value }
{/if} 
<span class="sugar_field" id="{$fields.mdp_shaft_c.name}">{$fields.mdp_shaft_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_THRUST_BEARING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="thrust_bearing_c"  >

{if !$fields.thrust_bearing_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.thrust_bearing_c.value) <= 0}
{assign var="value" value=$fields.thrust_bearing_c.default_value }
{else}
{assign var="value" value=$fields.thrust_bearing_c.value }
{/if} 
<span class="sugar_field" id="{$fields.thrust_bearing_c.name}">{$fields.thrust_bearing_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_PUMP_BODY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="mdp_pump_body_c"  >

{if !$fields.mdp_pump_body_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_pump_body_c.value) <= 0}
{assign var="value" value=$fields.mdp_pump_body_c.default_value }
{else}
{assign var="value" value=$fields.mdp_pump_body_c.value }
{/if} 
<span class="sugar_field" id="{$fields.mdp_pump_body_c.name}">{$fields.mdp_pump_body_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MDP_BASE_FRAME' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="mdp_base_frame_c"  >

{if !$fields.mdp_base_frame_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.mdp_base_frame_c.value) <= 0}
{assign var="value" value=$fields.mdp_base_frame_c.default_value }
{else}
{assign var="value" value=$fields.mdp_base_frame_c.value }
{/if} 
<span class="sugar_field" id="{$fields.mdp_base_frame_c.name}">{$fields.mdp_base_frame_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-7" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL7' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-7"  data-id="LBL_EDITVIEW_PANEL7">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MAX_AIR_INLET_PRESSURE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="max_air_inlet_pressure_c"  >

{if !$fields.max_air_inlet_pressure_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.max_air_inlet_pressure_c.value) <= 0}
{assign var="value" value=$fields.max_air_inlet_pressure_c.default_value }
{else}
{assign var="value" value=$fields.max_air_inlet_pressure_c.value }
{/if} 
<span class="sugar_field" id="{$fields.max_air_inlet_pressure_c.name}">{$fields.max_air_inlet_pressure_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MAX_AIR_CONSUMPTION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="max_air_consumption_c"  >

{if !$fields.max_air_consumption_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.max_air_consumption_c.value) <= 0}
{assign var="value" value=$fields.max_air_consumption_c.default_value }
{else}
{assign var="value" value=$fields.max_air_consumption_c.value }
{/if} 
<span class="sugar_field" id="{$fields.max_air_consumption_c.name}">{$fields.max_air_consumption_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_AIR_INLET' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="air_inlet_c"  >

{if !$fields.air_inlet_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.air_inlet_c.value) <= 0}
{assign var="value" value=$fields.air_inlet_c.default_value }
{else}
{assign var="value" value=$fields.air_inlet_c.value }
{/if} 
<span class="sugar_field" id="{$fields.air_inlet_c.name}">{$fields.air_inlet_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_AIR_EXHAUST' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="air_exhaust_c"  >

{if !$fields.air_exhaust_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.air_exhaust_c.value) <= 0}
{assign var="value" value=$fields.air_exhaust_c.default_value }
{else}
{assign var="value" value=$fields.air_exhaust_c.value }
{/if} 
<span class="sugar_field" id="{$fields.air_exhaust_c.name}">{$fields.air_exhaust_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PARTICLE_SIZE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="particle_size_c"  >

{if !$fields.particle_size_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.particle_size_c.value) <= 0}
{assign var="value" value=$fields.particle_size_c.default_value }
{else}
{assign var="value" value=$fields.particle_size_c.value }
{/if} 
<span class="sugar_field" id="{$fields.particle_size_c.name}">{$fields.particle_size_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-7" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL7' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-7" data-id="LBL_EDITVIEW_PANEL7">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MAX_AIR_INLET_PRESSURE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="max_air_inlet_pressure_c"  >

{if !$fields.max_air_inlet_pressure_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.max_air_inlet_pressure_c.value) <= 0}
{assign var="value" value=$fields.max_air_inlet_pressure_c.default_value }
{else}
{assign var="value" value=$fields.max_air_inlet_pressure_c.value }
{/if} 
<span class="sugar_field" id="{$fields.max_air_inlet_pressure_c.name}">{$fields.max_air_inlet_pressure_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MAX_AIR_CONSUMPTION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="max_air_consumption_c"  >

{if !$fields.max_air_consumption_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.max_air_consumption_c.value) <= 0}
{assign var="value" value=$fields.max_air_consumption_c.default_value }
{else}
{assign var="value" value=$fields.max_air_consumption_c.value }
{/if} 
<span class="sugar_field" id="{$fields.max_air_consumption_c.name}">{$fields.max_air_consumption_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_AIR_INLET' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="air_inlet_c"  >

{if !$fields.air_inlet_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.air_inlet_c.value) <= 0}
{assign var="value" value=$fields.air_inlet_c.default_value }
{else}
{assign var="value" value=$fields.air_inlet_c.value }
{/if} 
<span class="sugar_field" id="{$fields.air_inlet_c.name}">{$fields.air_inlet_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_AIR_EXHAUST' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="air_exhaust_c"  >

{if !$fields.air_exhaust_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.air_exhaust_c.value) <= 0}
{assign var="value" value=$fields.air_exhaust_c.default_value }
{else}
{assign var="value" value=$fields.air_exhaust_c.value }
{/if} 
<span class="sugar_field" id="{$fields.air_exhaust_c.name}">{$fields.air_exhaust_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PARTICLE_SIZE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="particle_size_c"  >

{if !$fields.particle_size_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.particle_size_c.value) <= 0}
{assign var="value" value=$fields.particle_size_c.default_value }
{else}
{assign var="value" value=$fields.particle_size_c.value }
{/if} 
<span class="sugar_field" id="{$fields.particle_size_c.name}">{$fields.particle_size_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-8" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL5' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-8"  data-id="LBL_EDITVIEW_PANEL5">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_WETTED_PARTS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="wetted_parts_c"  >

{if !$fields.wetted_parts_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.wetted_parts_c.value) <= 0}
{assign var="value" value=$fields.wetted_parts_c.default_value }
{else}
{assign var="value" value=$fields.wetted_parts_c.value }
{/if} 
<span class="sugar_field" id="{$fields.wetted_parts_c.name}">{$fields.wetted_parts_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VALVE_BALL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="valve_ball_c"  >

{if !$fields.valve_ball_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.valve_ball_c.value) <= 0}
{assign var="value" value=$fields.valve_ball_c.default_value }
{else}
{assign var="value" value=$fields.valve_ball_c.value }
{/if} 
<span class="sugar_field" id="{$fields.valve_ball_c.name}">{$fields.valve_ball_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_NON_WETTED_PARTS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="non_wetted_parts_c"  >

{if !$fields.non_wetted_parts_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.non_wetted_parts_c.value) <= 0}
{assign var="value" value=$fields.non_wetted_parts_c.default_value }
{else}
{assign var="value" value=$fields.non_wetted_parts_c.value }
{/if} 
<span class="sugar_field" id="{$fields.non_wetted_parts_c.name}">{$fields.non_wetted_parts_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VALVE_SEAT_O_RING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="valve_seat_o_ring_c"  >

{if !$fields.valve_seat_o_ring_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.valve_seat_o_ring_c.value) <= 0}
{assign var="value" value=$fields.valve_seat_o_ring_c.default_value }
{else}
{assign var="value" value=$fields.valve_seat_o_ring_c.value }
{/if} 
<span class="sugar_field" id="{$fields.valve_seat_o_ring_c.name}">{$fields.valve_seat_o_ring_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DIAPHRAGM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="diaphragm_c"  >

{if !$fields.diaphragm_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.diaphragm_c.value) <= 0}
{assign var="value" value=$fields.diaphragm_c.default_value }
{else}
{assign var="value" value=$fields.diaphragm_c.value }
{/if} 
<span class="sugar_field" id="{$fields.diaphragm_c.name}">{$fields.diaphragm_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VALVE_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="valve_type_c"  >

{if !$fields.valve_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.valve_type_c.value) <= 0}
{assign var="value" value=$fields.valve_type_c.default_value }
{else}
{assign var="value" value=$fields.valve_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.valve_type_c.name}">{$fields.valve_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-8" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL5' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-8" data-id="LBL_EDITVIEW_PANEL5">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_WETTED_PARTS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="wetted_parts_c"  >

{if !$fields.wetted_parts_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.wetted_parts_c.value) <= 0}
{assign var="value" value=$fields.wetted_parts_c.default_value }
{else}
{assign var="value" value=$fields.wetted_parts_c.value }
{/if} 
<span class="sugar_field" id="{$fields.wetted_parts_c.name}">{$fields.wetted_parts_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VALVE_BALL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="valve_ball_c"  >

{if !$fields.valve_ball_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.valve_ball_c.value) <= 0}
{assign var="value" value=$fields.valve_ball_c.default_value }
{else}
{assign var="value" value=$fields.valve_ball_c.value }
{/if} 
<span class="sugar_field" id="{$fields.valve_ball_c.name}">{$fields.valve_ball_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_NON_WETTED_PARTS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="non_wetted_parts_c"  >

{if !$fields.non_wetted_parts_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.non_wetted_parts_c.value) <= 0}
{assign var="value" value=$fields.non_wetted_parts_c.default_value }
{else}
{assign var="value" value=$fields.non_wetted_parts_c.value }
{/if} 
<span class="sugar_field" id="{$fields.non_wetted_parts_c.name}">{$fields.non_wetted_parts_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VALVE_SEAT_O_RING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="valve_seat_o_ring_c"  >

{if !$fields.valve_seat_o_ring_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.valve_seat_o_ring_c.value) <= 0}
{assign var="value" value=$fields.valve_seat_o_ring_c.default_value }
{else}
{assign var="value" value=$fields.valve_seat_o_ring_c.value }
{/if} 
<span class="sugar_field" id="{$fields.valve_seat_o_ring_c.name}">{$fields.valve_seat_o_ring_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DIAPHRAGM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="diaphragm_c"  >

{if !$fields.diaphragm_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.diaphragm_c.value) <= 0}
{assign var="value" value=$fields.diaphragm_c.default_value }
{else}
{assign var="value" value=$fields.diaphragm_c.value }
{/if} 
<span class="sugar_field" id="{$fields.diaphragm_c.name}">{$fields.diaphragm_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VALVE_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="valve_type_c"  >

{if !$fields.valve_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.valve_type_c.value) <= 0}
{assign var="value" value=$fields.valve_type_c.default_value }
{else}
{assign var="value" value=$fields.valve_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.valve_type_c.name}">{$fields.valve_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-9" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL9' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-9"  data-id="LBL_EDITVIEW_PANEL9">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_TESTING_PRESSURE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="testing_pressure_c"  >

{if !$fields.testing_pressure_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.testing_pressure_c.value) <= 0}
{assign var="value" value=$fields.testing_pressure_c.default_value }
{else}
{assign var="value" value=$fields.testing_pressure_c.value }
{/if} 
<span class="sugar_field" id="{$fields.testing_pressure_c.name}">{$fields.testing_pressure_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_HYDRO_PRESSURE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="hydro_pressure_c"  >

{if !$fields.hydro_pressure_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.hydro_pressure_c.value) <= 0}
{assign var="value" value=$fields.hydro_pressure_c.default_value }
{else}
{assign var="value" value=$fields.hydro_pressure_c.value }
{/if} 
<span class="sugar_field" id="{$fields.hydro_pressure_c.name}">{$fields.hydro_pressure_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SPM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="spm_c"  >

{if !$fields.spm_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.spm_c.value) <= 0}
{assign var="value" value=$fields.spm_c.default_value }
{else}
{assign var="value" value=$fields.spm_c.value }
{/if} 
<span class="sugar_field" id="{$fields.spm_c.name}">{$fields.spm_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_GEAR_RATIO' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="gear_ratio_c"  >

{if !$fields.gear_ratio_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.gear_ratio_c.value) <= 0}
{assign var="value" value=$fields.gear_ratio_c.default_value }
{else}
{assign var="value" value=$fields.gear_ratio_c.value }
{/if} 
<span class="sugar_field" id="{$fields.gear_ratio_c.name}">{$fields.gear_ratio_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PLUNGER_DIA' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="plunger_dia_c"  >

{if !$fields.plunger_dia_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.plunger_dia_c.value) <= 0}
{assign var="value" value=$fields.plunger_dia_c.default_value }
{else}
{assign var="value" value=$fields.plunger_dia_c.value }
{/if} 
<span class="sugar_field" id="{$fields.plunger_dia_c.name}">{$fields.plunger_dia_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-9" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL9' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-9" data-id="LBL_EDITVIEW_PANEL9">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_TESTING_PRESSURE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="testing_pressure_c"  >

{if !$fields.testing_pressure_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.testing_pressure_c.value) <= 0}
{assign var="value" value=$fields.testing_pressure_c.default_value }
{else}
{assign var="value" value=$fields.testing_pressure_c.value }
{/if} 
<span class="sugar_field" id="{$fields.testing_pressure_c.name}">{$fields.testing_pressure_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_HYDRO_PRESSURE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="hydro_pressure_c"  >

{if !$fields.hydro_pressure_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.hydro_pressure_c.value) <= 0}
{assign var="value" value=$fields.hydro_pressure_c.default_value }
{else}
{assign var="value" value=$fields.hydro_pressure_c.value }
{/if} 
<span class="sugar_field" id="{$fields.hydro_pressure_c.name}">{$fields.hydro_pressure_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SPM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="spm_c"  >

{if !$fields.spm_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.spm_c.value) <= 0}
{assign var="value" value=$fields.spm_c.default_value }
{else}
{assign var="value" value=$fields.spm_c.value }
{/if} 
<span class="sugar_field" id="{$fields.spm_c.name}">{$fields.spm_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_GEAR_RATIO' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="gear_ratio_c"  >

{if !$fields.gear_ratio_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.gear_ratio_c.value) <= 0}
{assign var="value" value=$fields.gear_ratio_c.default_value }
{else}
{assign var="value" value=$fields.gear_ratio_c.value }
{/if} 
<span class="sugar_field" id="{$fields.gear_ratio_c.name}">{$fields.gear_ratio_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PLUNGER_DIA' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="plunger_dia_c"  >

{if !$fields.plunger_dia_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.plunger_dia_c.value) <= 0}
{assign var="value" value=$fields.plunger_dia_c.default_value }
{else}
{assign var="value" value=$fields.plunger_dia_c.value }
{/if} 
<span class="sugar_field" id="{$fields.plunger_dia_c.name}">{$fields.plunger_dia_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-10" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL10' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-10"  data-id="LBL_EDITVIEW_PANEL10">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_LIQUID_END' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="liquid_end_c"  >

{if !$fields.liquid_end_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.liquid_end_c.value) <= 0}
{assign var="value" value=$fields.liquid_end_c.default_value }
{else}
{assign var="value" value=$fields.liquid_end_c.value }
{/if} 
<span class="sugar_field" id="{$fields.liquid_end_c.name}">{$fields.liquid_end_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DOSING_METERING_DIAPHRAGM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="dosing_metering_diaphragm_c"  >

{if !$fields.dosing_metering_diaphragm_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.dosing_metering_diaphragm_c.value) <= 0}
{assign var="value" value=$fields.dosing_metering_diaphragm_c.default_value }
{else}
{assign var="value" value=$fields.dosing_metering_diaphragm_c.value }
{/if} 
<span class="sugar_field" id="{$fields.dosing_metering_diaphragm_c.name}">{$fields.dosing_metering_diaphragm_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DM_NRV' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="dm_nrv_c"  >

{if !$fields.dm_nrv_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.dm_nrv_c.value) <= 0}
{assign var="value" value=$fields.dm_nrv_c.default_value }
{else}
{assign var="value" value=$fields.dm_nrv_c.value }
{/if} 
<span class="sugar_field" id="{$fields.dm_nrv_c.name}">{$fields.dm_nrv_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_WORM_WHEEL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="worm_wheel_c"  >

{if !$fields.worm_wheel_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.worm_wheel_c.value) <= 0}
{assign var="value" value=$fields.worm_wheel_c.default_value }
{else}
{assign var="value" value=$fields.worm_wheel_c.value }
{/if} 
<span class="sugar_field" id="{$fields.worm_wheel_c.name}">{$fields.worm_wheel_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_GEAR_HOUSING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="gear_housing_c"  >

{if !$fields.gear_housing_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.gear_housing_c.value) <= 0}
{assign var="value" value=$fields.gear_housing_c.default_value }
{else}
{assign var="value" value=$fields.gear_housing_c.value }
{/if} 
<span class="sugar_field" id="{$fields.gear_housing_c.name}">{$fields.gear_housing_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_COUPLING_GUARD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="coupling_guard_c"  >

{if !$fields.coupling_guard_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.coupling_guard_c.value) <= 0}
{assign var="value" value=$fields.coupling_guard_c.default_value }
{else}
{assign var="value" value=$fields.coupling_guard_c.value }
{/if} 
<span class="sugar_field" id="{$fields.coupling_guard_c.name}">{$fields.coupling_guard_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PUMP_DRIVE_MOUNTING_BASE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="varchar" field="pump_drive_mounting_base_c" colspan='3' >

{if !$fields.pump_drive_mounting_base_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.pump_drive_mounting_base_c.value) <= 0}
{assign var="value" value=$fields.pump_drive_mounting_base_c.default_value }
{else}
{assign var="value" value=$fields.pump_drive_mounting_base_c.value }
{/if} 
<span class="sugar_field" id="{$fields.pump_drive_mounting_base_c.name}">{$fields.pump_drive_mounting_base_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-10" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL10' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-10" data-id="LBL_EDITVIEW_PANEL10">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_LIQUID_END' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="liquid_end_c"  >

{if !$fields.liquid_end_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.liquid_end_c.value) <= 0}
{assign var="value" value=$fields.liquid_end_c.default_value }
{else}
{assign var="value" value=$fields.liquid_end_c.value }
{/if} 
<span class="sugar_field" id="{$fields.liquid_end_c.name}">{$fields.liquid_end_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DOSING_METERING_DIAPHRAGM' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="dosing_metering_diaphragm_c"  >

{if !$fields.dosing_metering_diaphragm_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.dosing_metering_diaphragm_c.value) <= 0}
{assign var="value" value=$fields.dosing_metering_diaphragm_c.default_value }
{else}
{assign var="value" value=$fields.dosing_metering_diaphragm_c.value }
{/if} 
<span class="sugar_field" id="{$fields.dosing_metering_diaphragm_c.name}">{$fields.dosing_metering_diaphragm_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DM_NRV' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="dm_nrv_c"  >

{if !$fields.dm_nrv_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.dm_nrv_c.value) <= 0}
{assign var="value" value=$fields.dm_nrv_c.default_value }
{else}
{assign var="value" value=$fields.dm_nrv_c.value }
{/if} 
<span class="sugar_field" id="{$fields.dm_nrv_c.name}">{$fields.dm_nrv_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_WORM_WHEEL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="worm_wheel_c"  >

{if !$fields.worm_wheel_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.worm_wheel_c.value) <= 0}
{assign var="value" value=$fields.worm_wheel_c.default_value }
{else}
{assign var="value" value=$fields.worm_wheel_c.value }
{/if} 
<span class="sugar_field" id="{$fields.worm_wheel_c.name}">{$fields.worm_wheel_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_GEAR_HOUSING' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="gear_housing_c"  >

{if !$fields.gear_housing_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.gear_housing_c.value) <= 0}
{assign var="value" value=$fields.gear_housing_c.default_value }
{else}
{assign var="value" value=$fields.gear_housing_c.value }
{/if} 
<span class="sugar_field" id="{$fields.gear_housing_c.name}">{$fields.gear_housing_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_COUPLING_GUARD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="coupling_guard_c"  >

{if !$fields.coupling_guard_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.coupling_guard_c.value) <= 0}
{assign var="value" value=$fields.coupling_guard_c.default_value }
{else}
{assign var="value" value=$fields.coupling_guard_c.value }
{/if} 
<span class="sugar_field" id="{$fields.coupling_guard_c.name}">{$fields.coupling_guard_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PUMP_DRIVE_MOUNTING_BASE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="varchar" field="pump_drive_mounting_base_c" colspan='3' >

{if !$fields.pump_drive_mounting_base_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.pump_drive_mounting_base_c.value) <= 0}
{assign var="value" value=$fields.pump_drive_mounting_base_c.default_value }
{else}
{assign var="value" value=$fields.pump_drive_mounting_base_c.value }
{/if} 
<span class="sugar_field" id="{$fields.pump_drive_mounting_base_c.name}">{$fields.pump_drive_mounting_base_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-11" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_LINE_ITEMS' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-11"  data-id="LBL_LINE_ITEMS">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CURRENCY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="id" field="currency_id"  >

{if !$fields.currency_id.hidden}
{counter name="panelFieldCount" print=false}
<span id='currency_id_span'>
{$fields.currency_id.value}
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_LINE_ITEMS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="function" field="line_items" colspan='3' >

{if !$fields.line_items.hidden}
{counter name="panelFieldCount" print=false}
<span id='line_items_span'>
{$fields.line_items.value}
</span>
{/if}

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_TOTAL_AMT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="currency" field="total_amt" colspan='3' >

{if !$fields.total_amt.hidden}
{counter name="panelFieldCount" print=false}

<span id='{$fields.total_amt.name}'>
{sugar_number_format var=$fields.total_amt.value }
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DISCOUNT_AMOUNT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="currency" field="discount_amount" colspan='3' >

{if !$fields.discount_amount.hidden}
{counter name="panelFieldCount" print=false}

<span id='{$fields.discount_amount.name}'>
{sugar_number_format var=$fields.discount_amount.value }
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SUBTOTAL_AMOUNT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="currency" field="subtotal_amount" colspan='3' >

{if !$fields.subtotal_amount.hidden}
{counter name="panelFieldCount" print=false}

<span id='{$fields.subtotal_amount.name}'>
{sugar_number_format var=$fields.subtotal_amount.value }
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_TAX_AMOUNT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="currency" field="tax_amount" colspan='3' >

{if !$fields.tax_amount.hidden}
{counter name="panelFieldCount" print=false}

<span id='{$fields.tax_amount.name}'>
{sugar_number_format var=$fields.tax_amount.value }
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_GRAND_TOTAL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="currency" field="total_amount" colspan='3' >

{if !$fields.total_amount.hidden}
{counter name="panelFieldCount" print=false}

<span id='{$fields.total_amount.name}'>
{sugar_number_format var=$fields.total_amount.value }
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-11" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_LINE_ITEMS' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-11" data-id="LBL_LINE_ITEMS">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CURRENCY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="id" field="currency_id"  >

{if !$fields.currency_id.hidden}
{counter name="panelFieldCount" print=false}
<span id='currency_id_span'>
{$fields.currency_id.value}
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_LINE_ITEMS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="function" field="line_items" colspan='3' >

{if !$fields.line_items.hidden}
{counter name="panelFieldCount" print=false}
<span id='line_items_span'>
{$fields.line_items.value}
</span>
{/if}

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_TOTAL_AMT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="currency" field="total_amt" colspan='3' >

{if !$fields.total_amt.hidden}
{counter name="panelFieldCount" print=false}

<span id='{$fields.total_amt.name}'>
{sugar_number_format var=$fields.total_amt.value }
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DISCOUNT_AMOUNT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="currency" field="discount_amount" colspan='3' >

{if !$fields.discount_amount.hidden}
{counter name="panelFieldCount" print=false}

<span id='{$fields.discount_amount.name}'>
{sugar_number_format var=$fields.discount_amount.value }
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SUBTOTAL_AMOUNT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="currency" field="subtotal_amount" colspan='3' >

{if !$fields.subtotal_amount.hidden}
{counter name="panelFieldCount" print=false}

<span id='{$fields.subtotal_amount.name}'>
{sugar_number_format var=$fields.subtotal_amount.value }
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_TAX_AMOUNT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="currency" field="tax_amount" colspan='3' >

{if !$fields.tax_amount.hidden}
{counter name="panelFieldCount" print=false}

<span id='{$fields.tax_amount.name}'>
{sugar_number_format var=$fields.tax_amount.value }
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_GRAND_TOTAL' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="currency" field="total_amount" colspan='3' >

{if !$fields.total_amount.hidden}
{counter name="panelFieldCount" print=false}

<span id='{$fields.total_amount.name}'>
{sugar_number_format var=$fields.total_amount.value }
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-12" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL12' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-12"  data-id="LBL_EDITVIEW_PANEL12">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_MAKE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_make_c"  >

{if !$fields.motor_make_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_make_c.value) <= 0}
{assign var="value" value=$fields.motor_make_c.default_value }
{else}
{assign var="value" value=$fields.motor_make_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_make_c.name}">{$fields.motor_make_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_TEMP' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_temp_c"  >

{if !$fields.motor_temp_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_temp_c.value) <= 0}
{assign var="value" value=$fields.motor_temp_c.default_value }
{else}
{assign var="value" value=$fields.motor_temp_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_temp_c.name}">{$fields.motor_temp_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_MOUNT_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_mount_type_c"  >

{if !$fields.motor_mount_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_mount_type_c.value) <= 0}
{assign var="value" value=$fields.motor_mount_type_c.default_value }
{else}
{assign var="value" value=$fields.motor_mount_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_mount_type_c.name}">{$fields.motor_mount_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_PHASE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_phase_c"  >

{if !$fields.motor_phase_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_phase_c.value) <= 0}
{assign var="value" value=$fields.motor_phase_c.default_value }
{else}
{assign var="value" value=$fields.motor_phase_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_phase_c.name}">{$fields.motor_phase_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_PROTECTION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_protection_c"  >

{if !$fields.motor_protection_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_protection_c.value) <= 0}
{assign var="value" value=$fields.motor_protection_c.default_value }
{else}
{assign var="value" value=$fields.motor_protection_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_protection_c.name}">{$fields.motor_protection_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_VOLTAGE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_voltage_c"  >

{if !$fields.motor_voltage_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_voltage_c.value) <= 0}
{assign var="value" value=$fields.motor_voltage_c.default_value }
{else}
{assign var="value" value=$fields.motor_voltage_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_voltage_c.name}">{$fields.motor_voltage_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_STANDARD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_standard_c"  >

{if !$fields.motor_standard_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_standard_c.value) <= 0}
{assign var="value" value=$fields.motor_standard_c.default_value }
{else}
{assign var="value" value=$fields.motor_standard_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_standard_c.name}">{$fields.motor_standard_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_type_c"  >

{if !$fields.motor_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_type_c.value) <= 0}
{assign var="value" value=$fields.motor_type_c.default_value }
{else}
{assign var="value" value=$fields.motor_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_type_c.name}">{$fields.motor_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-12" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL12' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-12" data-id="LBL_EDITVIEW_PANEL12">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_MAKE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_make_c"  >

{if !$fields.motor_make_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_make_c.value) <= 0}
{assign var="value" value=$fields.motor_make_c.default_value }
{else}
{assign var="value" value=$fields.motor_make_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_make_c.name}">{$fields.motor_make_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_TEMP' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_temp_c"  >

{if !$fields.motor_temp_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_temp_c.value) <= 0}
{assign var="value" value=$fields.motor_temp_c.default_value }
{else}
{assign var="value" value=$fields.motor_temp_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_temp_c.name}">{$fields.motor_temp_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_MOUNT_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_mount_type_c"  >

{if !$fields.motor_mount_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_mount_type_c.value) <= 0}
{assign var="value" value=$fields.motor_mount_type_c.default_value }
{else}
{assign var="value" value=$fields.motor_mount_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_mount_type_c.name}">{$fields.motor_mount_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_PHASE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_phase_c"  >

{if !$fields.motor_phase_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_phase_c.value) <= 0}
{assign var="value" value=$fields.motor_phase_c.default_value }
{else}
{assign var="value" value=$fields.motor_phase_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_phase_c.name}">{$fields.motor_phase_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_PROTECTION' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_protection_c"  >

{if !$fields.motor_protection_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_protection_c.value) <= 0}
{assign var="value" value=$fields.motor_protection_c.default_value }
{else}
{assign var="value" value=$fields.motor_protection_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_protection_c.name}">{$fields.motor_protection_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_VOLTAGE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_voltage_c"  >

{if !$fields.motor_voltage_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_voltage_c.value) <= 0}
{assign var="value" value=$fields.motor_voltage_c.default_value }
{else}
{assign var="value" value=$fields.motor_voltage_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_voltage_c.name}">{$fields.motor_voltage_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_STANDARD' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_standard_c"  >

{if !$fields.motor_standard_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_standard_c.value) <= 0}
{assign var="value" value=$fields.motor_standard_c.default_value }
{else}
{assign var="value" value=$fields.motor_standard_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_standard_c.name}">{$fields.motor_standard_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOTOR_TYPE' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="motor_type_c"  >

{if !$fields.motor_type_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.motor_type_c.value) <= 0}
{assign var="value" value=$fields.motor_type_c.default_value }
{else}
{assign var="value" value=$fields.motor_type_c.value }
{/if} 
<span class="sugar_field" id="{$fields.motor_type_c.name}">{$fields.motor_type_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-13" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL11' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-13"  data-id="LBL_EDITVIEW_PANEL11">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SELECT_TERMS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="dynamicenum" field="select_terms_c" colspan='3' >

{if !$fields.select_terms_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.select_terms_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.select_terms_c.name}" value="{ $fields.select_terms_c.options }">
{ $fields.select_terms_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.select_terms_c.name}" value="{ $fields.select_terms_c.value }">
{ $fields.select_terms_c.options[$fields.select_terms_c.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_INCOTERMS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="varchar" field="incoterms_c" colspan='3' >

{if !$fields.incoterms_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.incoterms_c.value) <= 0}
{assign var="value" value=$fields.incoterms_c.default_value }
{else}
{assign var="value" value=$fields.incoterms_c.value }
{/if} 
<span class="sugar_field" id="{$fields.incoterms_c.name}">{$fields.incoterms_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DELIVERY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="delivery_c"  >

{if !$fields.delivery_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.delivery_c.value) <= 0}
{assign var="value" value=$fields.delivery_c.default_value }
{else}
{assign var="value" value=$fields.delivery_c.value }
{/if} 
<span class="sugar_field" id="{$fields.delivery_c.name}">{$fields.delivery_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SHIPMENT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="shipment_c"  >

{if !$fields.shipment_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.shipment_c.value) <= 0}
{assign var="value" value=$fields.shipment_c.default_value }
{else}
{assign var="value" value=$fields.shipment_c.value }
{/if} 
<span class="sugar_field" id="{$fields.shipment_c.name}">{$fields.shipment_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_FREIGHT_INS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="freight_ins_c"  >

{if !$fields.freight_ins_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.freight_ins_c.value) <= 0}
{assign var="value" value=$fields.freight_ins_c.default_value }
{else}
{assign var="value" value=$fields.freight_ins_c.value }
{/if} 
<span class="sugar_field" id="{$fields.freight_ins_c.name}">{$fields.freight_ins_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PAYMENT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="payment_c"  >

{if !$fields.payment_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.payment_c.value) <= 0}
{assign var="value" value=$fields.payment_c.default_value }
{else}
{assign var="value" value=$fields.payment_c.value }
{/if} 
<span class="sugar_field" id="{$fields.payment_c.name}">{$fields.payment_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_GST' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="gst_c"  >

{if !$fields.gst_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.gst_c.value) <= 0}
{assign var="value" value=$fields.gst_c.default_value }
{else}
{assign var="value" value=$fields.gst_c.value }
{/if} 
<span class="sugar_field" id="{$fields.gst_c.name}">{$fields.gst_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PNF_CHARGES' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="pnf_charges_c"  >

{if !$fields.pnf_charges_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.pnf_charges_c.value) <= 0}
{assign var="value" value=$fields.pnf_charges_c.default_value }
{else}
{assign var="value" value=$fields.pnf_charges_c.value }
{/if} 
<span class="sugar_field" id="{$fields.pnf_charges_c.name}">{$fields.pnf_charges_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VALIDITY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="varchar" field="validity_c" colspan='3' >

{if !$fields.validity_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.validity_c.value) <= 0}
{assign var="value" value=$fields.validity_c.default_value }
{else}
{assign var="value" value=$fields.validity_c.value }
{/if} 
<span class="sugar_field" id="{$fields.validity_c.name}">{$fields.validity_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default tab-panel-0" style="display: block;">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-13" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL11' module='AOS_Quotes'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-13" data-id="LBL_EDITVIEW_PANEL11">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SELECT_TERMS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="dynamicenum" field="select_terms_c" colspan='3' >

{if !$fields.select_terms_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.select_terms_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.select_terms_c.name}" value="{ $fields.select_terms_c.options }">
{ $fields.select_terms_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.select_terms_c.name}" value="{ $fields.select_terms_c.value }">
{ $fields.select_terms_c.options[$fields.select_terms_c.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_INCOTERMS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="varchar" field="incoterms_c" colspan='3' >

{if !$fields.incoterms_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.incoterms_c.value) <= 0}
{assign var="value" value=$fields.incoterms_c.default_value }
{else}
{assign var="value" value=$fields.incoterms_c.value }
{/if} 
<span class="sugar_field" id="{$fields.incoterms_c.name}">{$fields.incoterms_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DELIVERY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="delivery_c"  >

{if !$fields.delivery_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.delivery_c.value) <= 0}
{assign var="value" value=$fields.delivery_c.default_value }
{else}
{assign var="value" value=$fields.delivery_c.value }
{/if} 
<span class="sugar_field" id="{$fields.delivery_c.name}">{$fields.delivery_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_SHIPMENT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="shipment_c"  >

{if !$fields.shipment_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.shipment_c.value) <= 0}
{assign var="value" value=$fields.shipment_c.default_value }
{else}
{assign var="value" value=$fields.shipment_c.value }
{/if} 
<span class="sugar_field" id="{$fields.shipment_c.name}">{$fields.shipment_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_FREIGHT_INS' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="freight_ins_c"  >

{if !$fields.freight_ins_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.freight_ins_c.value) <= 0}
{assign var="value" value=$fields.freight_ins_c.default_value }
{else}
{assign var="value" value=$fields.freight_ins_c.value }
{/if} 
<span class="sugar_field" id="{$fields.freight_ins_c.name}">{$fields.freight_ins_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PAYMENT' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="payment_c"  >

{if !$fields.payment_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.payment_c.value) <= 0}
{assign var="value" value=$fields.payment_c.default_value }
{else}
{assign var="value" value=$fields.payment_c.value }
{/if} 
<span class="sugar_field" id="{$fields.payment_c.name}">{$fields.payment_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_GST' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="gst_c"  >

{if !$fields.gst_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.gst_c.value) <= 0}
{assign var="value" value=$fields.gst_c.default_value }
{else}
{assign var="value" value=$fields.gst_c.value }
{/if} 
<span class="sugar_field" id="{$fields.gst_c.name}">{$fields.gst_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PNF_CHARGES' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="pnf_charges_c"  >

{if !$fields.pnf_charges_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.pnf_charges_c.value) <= 0}
{assign var="value" value=$fields.pnf_charges_c.default_value }
{else}
{assign var="value" value=$fields.pnf_charges_c.value }
{/if} 
<span class="sugar_field" id="{$fields.pnf_charges_c.name}">{$fields.pnf_charges_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_VALIDITY' module='AOS_Quotes'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="varchar" field="validity_c" colspan='3' >

{if !$fields.validity_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.validity_c.value) <= 0}
{assign var="value" value=$fields.validity_c.default_value }
{else}
{assign var="value" value=$fields.validity_c.value }
{/if} 
<span class="sugar_field" id="{$fields.validity_c.name}">{$fields.validity_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                            </div>
</div>
</div>
{/if}
</div>
</div>

</form>
<script>SUGAR.util.doWhen("document.getElementById('form') != null",
        function(){ldelim}SUGAR.util.buildAccessKeyLabels();{rdelim});
</script>            <script type="text/javascript" src="include/InlineEditing/inlineEditing.js"></script>
<script type="text/javascript" src="modules/Favorites/favorites.js"></script>
{literal}
<script type="text/javascript">

                    var selectTabDetailView = function(tab) {
                        $('#content div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER').hide();
                        $('#content div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER').eq(tab).show().addClass('active').addClass('in');
                        $('#content div.panel-content div.panel').hide();
                        $('#content div.panel-content div.panel.tab-panel-' + tab).show();
                    };

                    var selectTabOnError = function(tab) {
                        selectTabDetailView(tab);
                        $('#content ul.nav.nav-tabs > li').removeClass('active');
                        $('#content ul.nav.nav-tabs > li a').css('color', '');

                        $('#content ul.nav.nav-tabs > li').eq(tab).find('a').first().css('color', 'red');
                        $('#content ul.nav.nav-tabs > li').eq(tab).addClass('active');

                    };

                    var selectTabOnErrorInputHandle = function(inputHandle) {
                        var tab = $(inputHandle).closest('.tab-pane-NOBOOTSTRAPTOGGLER').attr('id').match(/^detailpanel_(.*)$/)[1];
                        selectTabOnError(tab);
                    };


                    $(function(){
                        $('#content ul.nav.nav-tabs > li > a[data-toggle="tab"]').click(function(e){
                            if(typeof $(this).parent().find('a').first().attr('id') != 'undefined') {
                                var tab = parseInt($(this).parent().find('a').first().attr('id').match(/^tab(.)*$/)[1]);
                                selectTabDetailView(tab);
                            }
                        });
                    });

                </script>
{/literal}