<?php /* Smarty version 2.6.31, created on 2019-02-21 15:43:52
         compiled from cache/themes/SuiteP/modules/Emails/EmailsDetailView.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'sugar_include', 'cache/themes/SuiteP/modules/Emails/EmailsDetailView.tpl', 48, false),array('function', 'sugar_translate', 'cache/themes/SuiteP/modules/Emails/EmailsDetailView.tpl', 57, false),array('function', 'counter', 'cache/themes/SuiteP/modules/Emails/EmailsDetailView.tpl', 123, false),array('function', 'sugar_literal', 'cache/themes/SuiteP/modules/Emails/EmailsDetailView.tpl', 337, false),array('modifier', 'strip_semicolon', 'cache/themes/SuiteP/modules/Emails/EmailsDetailView.tpl', 116, false),)), $this); ?>


<script language="javascript">
    <?php echo '
    SUGAR.util.doWhen(function () {
        return $("#contentTable").length == 0;
    }, SUGAR.themes.actionMenu);
    '; ?>

</script>
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="">
<tr>
<td class="buttons" align="left" NOWRAP width="80%">
<div class="actionsContainer">
<form action="index.php" method="post" name="DetailView" id="formDetailView">
<input type="hidden" name="module" value="<?php echo $this->_tpl_vars['module']; ?>
">
<input type="hidden" name="record" value="<?php echo $this->_tpl_vars['fields']['id']['value']; ?>
">
<input type="hidden" name="return_action">
<input type="hidden" name="return_module">
<input type="hidden" name="return_id">
<input type="hidden" name="module_tab">
<input type="hidden" name="isDuplicate" value="false">
<input type="hidden" name="offset" value="<?php echo $this->_tpl_vars['offset']; ?>
">
<input type="hidden" name="action" value="EditView">
<input type="hidden" name="sugar_body_only">
<?php if (! $this->_tpl_vars['config']['enable_action_menu']): ?>
<div class="buttons">
<?php if ($this->_tpl_vars['bean']->aclAccess('edit')): ?><input title="<?php echo $this->_tpl_vars['APP']['LBL_EDIT_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_EDIT_BUTTON_KEY']; ?>
" class="button primary" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Emails'; _form.return_action.value='DetailView'; _form.return_id.value='<?php echo $this->_tpl_vars['id']; ?>
'; _form.action.value='EditView';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Edit" id="edit_button" value="<?php echo $this->_tpl_vars['APP']['LBL_EDIT_BUTTON_LABEL']; ?>
"><?php endif; ?> 
<?php if ($this->_tpl_vars['bean']->aclAccess('edit')): ?><input title="<?php echo $this->_tpl_vars['APP']['LBL_DUPLICATE_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_DUPLICATE_BUTTON_KEY']; ?>
" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Emails'; _form.return_action.value='DetailView'; _form.isDuplicate.value=true; _form.action.value='EditView'; _form.return_id.value='<?php echo $this->_tpl_vars['id']; ?>
';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Duplicate" value="<?php echo $this->_tpl_vars['APP']['LBL_DUPLICATE_BUTTON_LABEL']; ?>
" id="duplicate_button"><?php endif; ?> 
<?php if ($this->_tpl_vars['bean']->aclAccess('delete')): ?><input title="<?php echo $this->_tpl_vars['APP']['LBL_DELETE_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_DELETE_BUTTON_KEY']; ?>
" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Emails'; _form.return_action.value='ListView'; _form.action.value='Delete'; if(confirm('<?php echo $this->_tpl_vars['APP']['NTC_DELETE_CONFIRMATION']; ?>
')) SUGAR.ajaxUI.submitForm(_form); return false;" type="submit" name="Delete" value="<?php echo $this->_tpl_vars['APP']['LBL_DELETE_BUTTON_LABEL']; ?>
" id="delete_button"><?php endif; ?> 
<?php if ($this->_tpl_vars['bean']->aclAccess('edit') && $this->_tpl_vars['bean']->aclAccess('delete')): ?><input title="<?php echo $this->_tpl_vars['APP']['LBL_DUP_MERGE']; ?>
" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Emails'; _form.return_action.value='DetailView'; _form.return_id.value='<?php echo $this->_tpl_vars['id']; ?>
'; _form.action.value='Step1'; _form.module.value='MergeRecords';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Merge" value="<?php echo $this->_tpl_vars['APP']['LBL_DUP_MERGE']; ?>
" id="merge_duplicate_button"><?php endif; ?> 
<input type="button" onclick="window.location.href='index.php?module=Emails&action=ReplyTo&return_module=Emails&return_action=index&folder=INBOX.TestInbox&folder=inbound&inbound_email_record=<?php echo $this->_tpl_vars['bean']->inbound_email_record; ?>
&uid=<?php echo $this->_tpl_vars['bean']->uid; ?>
&msgno=<?php echo $this->_tpl_vars['bean']->msgno; ?>
&record=<?php echo $this->_tpl_vars['bean']->id; ?>
';" value="<?php echo $this->_tpl_vars['MOD']['LBL_BUTTON_REPLY_TITLE']; ?>
"/>
<input type="button" onclick="window.location.href='index.php?module=Emails&action=ReplyToAll&return_module=Emails&return_action=index&folder=INBOX.TestInbox&folder=inbound&inbound_email_record=<?php echo $this->_tpl_vars['bean']->inbound_email_record; ?>
&uid=<?php echo $this->_tpl_vars['bean']->uid; ?>
&msgno=<?php echo $this->_tpl_vars['bean']->msgno; ?>
&record=<?php echo $this->_tpl_vars['bean']->id; ?>
';" value="<?php echo $this->_tpl_vars['MOD']['LBL_BUTTON_REPLY_ALL']; ?>
"/>
<input type="button" onclick="window.location.href='index.php?module=Emails&action=Forward&return_module=Emails&return_action=index&folder=INBOX.TestInbox&folder=inbound&inbound_email_record=<?php echo $this->_tpl_vars['bean']->inbound_email_record; ?>
&uid=<?php echo $this->_tpl_vars['bean']->uid; ?>
&msgno=<?php echo $this->_tpl_vars['bean']->msgno; ?>
&record=<?php echo $this->_tpl_vars['bean']->id; ?>
';" value="<?php echo $this->_tpl_vars['MOD']['LBL_BUTTON_FORWARD']; ?>
"/>
<input type="button" onclick="openQuickCreateModal('Bugs','&name=<?php echo $this->_tpl_vars['bean']->name; ?>
','<?php echo $this->_tpl_vars['bean']->from_addr_name; ?>
');" value="<?php echo $this->_tpl_vars['MOD']['LBL_CREATE']; ?>
 <?php echo $this->_tpl_vars['APP']['LBL_EMAIL_QC_BUGS']; ?>
"/><input type="hidden" id="parentEmailId" name="parentEmailId" value="<?php echo $this->_tpl_vars['bean']->id; ?>
"/>
<input type="button" onclick="openQuickCreateModal('Cases','&name=<?php echo $this->_tpl_vars['bean']->name; ?>
','<?php echo $this->_tpl_vars['bean']->from_addr_name; ?>
');" value="<?php echo $this->_tpl_vars['MOD']['LBL_CREATE']; ?>
 <?php echo $this->_tpl_vars['APP']['LBL_EMAIL_QC_CASES']; ?>
"/><input type="hidden" id="parentEmailId" name="parentEmailId" value="<?php echo $this->_tpl_vars['bean']->id; ?>
"/>
<input type="button" onclick="openQuickCreateModal('Contacts','&last_name=<?php echo $this->_tpl_vars['bean']->name; ?>
','<?php echo $this->_tpl_vars['bean']->from_addr_name; ?>
');" value="<?php echo $this->_tpl_vars['MOD']['LBL_CREATE']; ?>
 <?php echo $this->_tpl_vars['APP']['LBL_EMAIL_QC_CONTACTS']; ?>
"/><input type="hidden" id="parentEmailId" name="parentEmailId" value="<?php echo $this->_tpl_vars['bean']->id; ?>
"/>
<input type="button" onclick="openQuickCreateModal('Leads','&last_name=<?php echo $this->_tpl_vars['bean']->name; ?>
','<?php echo $this->_tpl_vars['bean']->from_addr_name; ?>
');" value="<?php echo $this->_tpl_vars['MOD']['LBL_CREATE']; ?>
 <?php echo $this->_tpl_vars['APP']['LBL_EMAIL_QC_LEADS']; ?>
"/><input type="hidden" id="parentEmailId" name="parentEmailId" value="<?php echo $this->_tpl_vars['bean']->id; ?>
"/>
<input type="button" onclick="openQuickCreateModal('Opportunities','&name=<?php echo $this->_tpl_vars['bean']->name; ?>
','<?php echo $this->_tpl_vars['bean']->from_addr_name; ?>
');" value="<?php echo $this->_tpl_vars['MOD']['LBL_CREATE']; ?>
 <?php echo $this->_tpl_vars['APP']['LBL_EMAIL_QC_OPPORTUNITIES']; ?>
"/><input type="hidden" id="parentEmailId" name="parentEmailId" value="<?php echo $this->_tpl_vars['bean']->id; ?>
"/>
<?php if ($this->_tpl_vars['bean']->aclAccess('detail')): ?><?php if (! empty ( $this->_tpl_vars['fields']['id']['value'] ) && $this->_tpl_vars['isAuditEnabled']): ?><input id="btn_view_change_log" title="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
" class="button" onclick='open_popup("Audit", "600", "400", "&record=<?php echo $this->_tpl_vars['fields']['id']['value']; ?>
&module_name=Emails", true, false,  { "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] } ); return false;' type="button" value="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
"><?php endif; ?><?php endif; ?>
</div>                    <?php endif; ?>
</form>
</div>
</td>
<td align="right" width="20%" class="buttons"><?php echo $this->_tpl_vars['ADMIN_EDIT']; ?>

</td>
</tr>
</table>
<?php echo smarty_function_sugar_include(array('include' => $this->_tpl_vars['includes']), $this);?>

<div class="detail-view">
<div class="mobile-pagination"><?php echo $this->_tpl_vars['PAGINATION']; ?>
</div>

<ul class="nav nav-tabs">

<?php if ($this->_tpl_vars['config']['enable_action_menu'] && $this->_tpl_vars['config']['enable_action_menu'] != false): ?>
<li role="presentation" class="active">
<a id="tab0" data-toggle="tab" class="hidden-xs">
<?php echo smarty_function_sugar_translate(array('label' => 'LBL_EMAIL_INFORMATION','module' => 'Emails'), $this);?>

</a>
<a id="xstab0" href="#" class="visible-xs first-tab dropdown-toggle" data-toggle="dropdown">
<?php echo smarty_function_sugar_translate(array('label' => 'LBL_EMAIL_INFORMATION','module' => 'Emails'), $this);?>

</a>
</li>
<?php endif; ?>
<?php if ($this->_tpl_vars['config']['enable_action_menu'] && $this->_tpl_vars['config']['enable_action_menu'] != false): ?>
<li id="tab-actions" class="dropdown">
<a class="dropdown-toggle" data-toggle="dropdown" href="#">ACTIONS<span class="suitepicon suitepicon-action-caret"></span></a>
<ul class="dropdown-menu">
<li><?php if ($this->_tpl_vars['bean']->aclAccess('edit')): ?><input title="<?php echo $this->_tpl_vars['APP']['LBL_EDIT_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_EDIT_BUTTON_KEY']; ?>
" class="button primary" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Emails'; _form.return_action.value='DetailView'; _form.return_id.value='<?php echo $this->_tpl_vars['id']; ?>
'; _form.action.value='EditView';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Edit" id="edit_button" value="<?php echo $this->_tpl_vars['APP']['LBL_EDIT_BUTTON_LABEL']; ?>
"><?php endif; ?> </li>
<li><?php if ($this->_tpl_vars['bean']->aclAccess('edit')): ?><input title="<?php echo $this->_tpl_vars['APP']['LBL_DUPLICATE_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_DUPLICATE_BUTTON_KEY']; ?>
" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Emails'; _form.return_action.value='DetailView'; _form.isDuplicate.value=true; _form.action.value='EditView'; _form.return_id.value='<?php echo $this->_tpl_vars['id']; ?>
';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Duplicate" value="<?php echo $this->_tpl_vars['APP']['LBL_DUPLICATE_BUTTON_LABEL']; ?>
" id="duplicate_button"><?php endif; ?> </li>
<li><?php if ($this->_tpl_vars['bean']->aclAccess('delete')): ?><input title="<?php echo $this->_tpl_vars['APP']['LBL_DELETE_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_DELETE_BUTTON_KEY']; ?>
" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Emails'; _form.return_action.value='ListView'; _form.action.value='Delete'; if(confirm('<?php echo $this->_tpl_vars['APP']['NTC_DELETE_CONFIRMATION']; ?>
')) SUGAR.ajaxUI.submitForm(_form); return false;" type="submit" name="Delete" value="<?php echo $this->_tpl_vars['APP']['LBL_DELETE_BUTTON_LABEL']; ?>
" id="delete_button"><?php endif; ?> </li>
<li><?php if ($this->_tpl_vars['bean']->aclAccess('edit') && $this->_tpl_vars['bean']->aclAccess('delete')): ?><input title="<?php echo $this->_tpl_vars['APP']['LBL_DUP_MERGE']; ?>
" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Emails'; _form.return_action.value='DetailView'; _form.return_id.value='<?php echo $this->_tpl_vars['id']; ?>
'; _form.action.value='Step1'; _form.module.value='MergeRecords';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Merge" value="<?php echo $this->_tpl_vars['APP']['LBL_DUP_MERGE']; ?>
" id="merge_duplicate_button"><?php endif; ?> </li>
<li><input type="button" onclick="window.location.href='index.php?module=Emails&action=ReplyTo&return_module=Emails&return_action=index&folder=INBOX.TestInbox&folder=inbound&inbound_email_record=<?php echo $this->_tpl_vars['bean']->inbound_email_record; ?>
&uid=<?php echo $this->_tpl_vars['bean']->uid; ?>
&msgno=<?php echo $this->_tpl_vars['bean']->msgno; ?>
&record=<?php echo $this->_tpl_vars['bean']->id; ?>
';" value="<?php echo $this->_tpl_vars['MOD']['LBL_BUTTON_REPLY_TITLE']; ?>
"/></li>
<li><input type="button" onclick="window.location.href='index.php?module=Emails&action=ReplyToAll&return_module=Emails&return_action=index&folder=INBOX.TestInbox&folder=inbound&inbound_email_record=<?php echo $this->_tpl_vars['bean']->inbound_email_record; ?>
&uid=<?php echo $this->_tpl_vars['bean']->uid; ?>
&msgno=<?php echo $this->_tpl_vars['bean']->msgno; ?>
&record=<?php echo $this->_tpl_vars['bean']->id; ?>
';" value="<?php echo $this->_tpl_vars['MOD']['LBL_BUTTON_REPLY_ALL']; ?>
"/></li>
<li><input type="button" onclick="window.location.href='index.php?module=Emails&action=Forward&return_module=Emails&return_action=index&folder=INBOX.TestInbox&folder=inbound&inbound_email_record=<?php echo $this->_tpl_vars['bean']->inbound_email_record; ?>
&uid=<?php echo $this->_tpl_vars['bean']->uid; ?>
&msgno=<?php echo $this->_tpl_vars['bean']->msgno; ?>
&record=<?php echo $this->_tpl_vars['bean']->id; ?>
';" value="<?php echo $this->_tpl_vars['MOD']['LBL_BUTTON_FORWARD']; ?>
"/></li>
<li><input type="button" onclick="openQuickCreateModal('Bugs','&name=<?php echo $this->_tpl_vars['bean']->name; ?>
','<?php echo $this->_tpl_vars['bean']->from_addr_name; ?>
');" value="<?php echo $this->_tpl_vars['MOD']['LBL_CREATE']; ?>
 <?php echo $this->_tpl_vars['APP']['LBL_EMAIL_QC_BUGS']; ?>
"/><input type="hidden" id="parentEmailId" name="parentEmailId" value="<?php echo $this->_tpl_vars['bean']->id; ?>
"/></li>
<li><input type="button" onclick="openQuickCreateModal('Cases','&name=<?php echo $this->_tpl_vars['bean']->name; ?>
','<?php echo $this->_tpl_vars['bean']->from_addr_name; ?>
');" value="<?php echo $this->_tpl_vars['MOD']['LBL_CREATE']; ?>
 <?php echo $this->_tpl_vars['APP']['LBL_EMAIL_QC_CASES']; ?>
"/><input type="hidden" id="parentEmailId" name="parentEmailId" value="<?php echo $this->_tpl_vars['bean']->id; ?>
"/></li>
<li><input type="button" onclick="openQuickCreateModal('Contacts','&last_name=<?php echo $this->_tpl_vars['bean']->name; ?>
','<?php echo $this->_tpl_vars['bean']->from_addr_name; ?>
');" value="<?php echo $this->_tpl_vars['MOD']['LBL_CREATE']; ?>
 <?php echo $this->_tpl_vars['APP']['LBL_EMAIL_QC_CONTACTS']; ?>
"/><input type="hidden" id="parentEmailId" name="parentEmailId" value="<?php echo $this->_tpl_vars['bean']->id; ?>
"/></li>
<li><input type="button" onclick="openQuickCreateModal('Leads','&last_name=<?php echo $this->_tpl_vars['bean']->name; ?>
','<?php echo $this->_tpl_vars['bean']->from_addr_name; ?>
');" value="<?php echo $this->_tpl_vars['MOD']['LBL_CREATE']; ?>
 <?php echo $this->_tpl_vars['APP']['LBL_EMAIL_QC_LEADS']; ?>
"/><input type="hidden" id="parentEmailId" name="parentEmailId" value="<?php echo $this->_tpl_vars['bean']->id; ?>
"/></li>
<li><input type="button" onclick="openQuickCreateModal('Opportunities','&name=<?php echo $this->_tpl_vars['bean']->name; ?>
','<?php echo $this->_tpl_vars['bean']->from_addr_name; ?>
');" value="<?php echo $this->_tpl_vars['MOD']['LBL_CREATE']; ?>
 <?php echo $this->_tpl_vars['APP']['LBL_EMAIL_QC_OPPORTUNITIES']; ?>
"/><input type="hidden" id="parentEmailId" name="parentEmailId" value="<?php echo $this->_tpl_vars['bean']->id; ?>
"/></li>
<li><?php if ($this->_tpl_vars['bean']->aclAccess('detail')): ?><?php if (! empty ( $this->_tpl_vars['fields']['id']['value'] ) && $this->_tpl_vars['isAuditEnabled']): ?><input id="btn_view_change_log" title="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
" class="button" onclick='open_popup("Audit", "600", "400", "&record=<?php echo $this->_tpl_vars['fields']['id']['value']; ?>
&module_name=Emails", true, false,  { "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] } ); return false;' type="button" value="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
"><?php endif; ?><?php endif; ?></li>
</ul>        </li>
<li class="tab-inline-pagination">
<?php echo $this->_tpl_vars['PAGINATION']; ?>

</li>
<?php endif; ?>
</ul>
<div class="clearfix"></div>

<?php if ($this->_tpl_vars['config']['enable_action_menu'] && $this->_tpl_vars['config']['enable_action_menu'] != false): ?>

<div class="tab-content">
<?php else: ?>

<div class="tab-content" style="padding: 0; border: 0;">
<?php endif; ?>


<?php if ($this->_tpl_vars['config']['enable_action_menu'] && $this->_tpl_vars['config']['enable_action_menu'] != false): ?>
<div class="tab-pane-NOBOOTSTRAPTOGGLER active fade in" id='tab-content-0'>





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_OPT_IN','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="function" field="opt_in" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['opt_in']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>

<span id='opt_in_span'>
<?php echo $this->_tpl_vars['fields']['opt_in']['value']; ?>

</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_FROM','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="varchar" field="from_addr_name" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['from_addr_name']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['from_addr_name']['value'] ) <= 0): ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['from_addr_name']['default_value']); ?>
<?php else: ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['from_addr_name']['value']); ?>
<?php endif; ?> 
<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['from_addr_name']['name']; ?>
"><?php echo $this->_tpl_vars['fields']['from_addr_name']['value']; ?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_TO','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="varchar" field="to_addrs_names" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['to_addrs_names']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['to_addrs_names']['value'] ) <= 0): ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['to_addrs_names']['default_value']); ?>
<?php else: ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['to_addrs_names']['value']); ?>
<?php endif; ?> 
<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['to_addrs_names']['name']; ?>
"><?php echo $this->_tpl_vars['fields']['to_addrs_names']['value']; ?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_CC','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="varchar" field="cc_addrs_names" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['cc_addrs_names']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['cc_addrs_names']['value'] ) <= 0): ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['cc_addrs_names']['default_value']); ?>
<?php else: ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['cc_addrs_names']['value']); ?>
<?php endif; ?> 
<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['cc_addrs_names']['name']; ?>
"><?php echo $this->_tpl_vars['fields']['cc_addrs_names']['value']; ?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_BCC','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="varchar" field="bcc_addrs_names" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['bcc_addrs_names']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['bcc_addrs_names']['value'] ) <= 0): ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['bcc_addrs_names']['default_value']); ?>
<?php else: ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['bcc_addrs_names']['value']); ?>
<?php endif; ?> 
<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['bcc_addrs_names']['name']; ?>
"><?php echo $this->_tpl_vars['fields']['bcc_addrs_names']['value']; ?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_SUBJECT','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="name" field="name" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['name']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['name']['value'] ) <= 0): ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['name']['default_value']); ?>
<?php else: ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['name']['value']); ?>
<?php endif; ?> 
<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['name']['name']; ?>
"><?php echo $this->_tpl_vars['fields']['name']['value']; ?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_BODY','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="emailbody" field="description_html" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['description_html']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['description_html']['name']; ?>
"><?php echo smarty_function_sugar_literal(array('content' => $this->_tpl_vars['fields']['description_html']['value']), $this);?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_EMAIL_RELATE','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="parent" field="parent_name" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['parent_name']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<input type="hidden" class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['parent_name']['name']; ?>
" value="<?php echo $this->_tpl_vars['fields']['parent_name']['value']; ?>
">
<input type="hidden" class="sugar_field" id="parent_id" value="<?php echo $this->_tpl_vars['fields']['parent_id']['value']; ?>
">
<a href="index.php?module=<?php echo $this->_tpl_vars['fields']['parent_type']['value']; ?>
&action=DetailView&record=<?php echo $this->_tpl_vars['fields']['parent_id']['value']; ?>
" class="tabDetailViewDFLink"><?php echo $this->_tpl_vars['fields']['parent_name']['value']; ?>
</a>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_DATE_ENTERED','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="datetime" field="date_entered" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['date_entered']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>



<?php $this->assign('value', "02/21/2019"); ?>
<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['date_entered']['name']; ?>
"><?php echo $this->_tpl_vars['value']; ?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_CATEGORY','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="enum" field="category_id" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['category_id']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>



<?php if (is_string ( $this->_tpl_vars['fields']['category_id']['options'] )): ?>
<input type="hidden" class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['category_id']['name']; ?>
" value="<?php echo $this->_tpl_vars['fields']['category_id']['options']; ?>
">
<?php echo $this->_tpl_vars['fields']['category_id']['options']; ?>

<?php else: ?>
<input type="hidden" class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['category_id']['name']; ?>
" value="<?php echo $this->_tpl_vars['fields']['category_id']['value']; ?>
">
<?php echo $this->_tpl_vars['fields']['category_id']['options'][$this->_tpl_vars['fields']['category_id']['value']]; ?>

<?php endif; ?>
<?php endif; ?>

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

</div>
                        </div>
<?php else: ?>

<div class="tab-pane-NOBOOTSTRAPTOGGLER panel-collapse"></div>
<?php endif; ?>
</div>

<div class="panel-content">
<div>&nbsp;</div>





<?php if ($this->_tpl_vars['config']['enable_action_menu'] && $this->_tpl_vars['config']['enable_action_menu'] != false): ?>

<?php else: ?>

<div class="panel panel-default">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel--1" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
<?php echo smarty_function_sugar_translate(array('label' => 'LBL_EMAIL_INFORMATION','module' => 'Emails'), $this);?>

</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel--1" data-id="LBL_EMAIL_INFORMATION">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_OPT_IN','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="function" field="opt_in" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['opt_in']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>

<span id='opt_in_span'>
<?php echo $this->_tpl_vars['fields']['opt_in']['value']; ?>

</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_FROM','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="varchar" field="from_addr_name" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['from_addr_name']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['from_addr_name']['value'] ) <= 0): ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['from_addr_name']['default_value']); ?>
<?php else: ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['from_addr_name']['value']); ?>
<?php endif; ?> 
<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['from_addr_name']['name']; ?>
"><?php echo $this->_tpl_vars['fields']['from_addr_name']['value']; ?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_TO','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="varchar" field="to_addrs_names" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['to_addrs_names']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['to_addrs_names']['value'] ) <= 0): ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['to_addrs_names']['default_value']); ?>
<?php else: ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['to_addrs_names']['value']); ?>
<?php endif; ?> 
<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['to_addrs_names']['name']; ?>
"><?php echo $this->_tpl_vars['fields']['to_addrs_names']['value']; ?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_CC','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="varchar" field="cc_addrs_names" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['cc_addrs_names']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['cc_addrs_names']['value'] ) <= 0): ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['cc_addrs_names']['default_value']); ?>
<?php else: ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['cc_addrs_names']['value']); ?>
<?php endif; ?> 
<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['cc_addrs_names']['name']; ?>
"><?php echo $this->_tpl_vars['fields']['cc_addrs_names']['value']; ?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_BCC','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="varchar" field="bcc_addrs_names" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['bcc_addrs_names']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['bcc_addrs_names']['value'] ) <= 0): ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['bcc_addrs_names']['default_value']); ?>
<?php else: ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['bcc_addrs_names']['value']); ?>
<?php endif; ?> 
<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['bcc_addrs_names']['name']; ?>
"><?php echo $this->_tpl_vars['fields']['bcc_addrs_names']['value']; ?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_SUBJECT','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="name" field="name" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['name']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['name']['value'] ) <= 0): ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['name']['default_value']); ?>
<?php else: ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['name']['value']); ?>
<?php endif; ?> 
<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['name']['name']; ?>
"><?php echo $this->_tpl_vars['fields']['name']['value']; ?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_BODY','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="emailbody" field="description_html" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['description_html']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['description_html']['name']; ?>
"><?php echo smarty_function_sugar_literal(array('content' => $this->_tpl_vars['fields']['description_html']['value']), $this);?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_EMAIL_RELATE','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="parent" field="parent_name" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['parent_name']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>


<input type="hidden" class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['parent_name']['name']; ?>
" value="<?php echo $this->_tpl_vars['fields']['parent_name']['value']; ?>
">
<input type="hidden" class="sugar_field" id="parent_id" value="<?php echo $this->_tpl_vars['fields']['parent_id']['value']; ?>
">
<a href="index.php?module=<?php echo $this->_tpl_vars['fields']['parent_type']['value']; ?>
&action=DetailView&record=<?php echo $this->_tpl_vars['fields']['parent_id']['value']; ?>
" class="tabDetailViewDFLink"><?php echo $this->_tpl_vars['fields']['parent_name']['value']; ?>
</a>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_DATE_ENTERED','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field " type="datetime" field="date_entered" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['date_entered']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>



<?php $this->assign('value', "02/21/2019"); ?>
<span class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['date_entered']['name']; ?>
"><?php echo $this->_tpl_vars['value']; ?>
</span>
<?php endif; ?>

</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


<?php ob_start(); ?><?php echo smarty_function_sugar_translate(array('label' => 'LBL_CATEGORY','module' => 'Emails'), $this);?>
<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean(); ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="enum" field="category_id" colspan='3' >

<?php if (! $this->_tpl_vars['fields']['category_id']['hidden']): ?>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','print' => false), $this);?>



<?php if (is_string ( $this->_tpl_vars['fields']['category_id']['options'] )): ?>
<input type="hidden" class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['category_id']['name']; ?>
" value="<?php echo $this->_tpl_vars['fields']['category_id']['options']; ?>
">
<?php echo $this->_tpl_vars['fields']['category_id']['options']; ?>

<?php else: ?>
<input type="hidden" class="sugar_field" id="<?php echo $this->_tpl_vars['fields']['category_id']['name']; ?>
" value="<?php echo $this->_tpl_vars['fields']['category_id']['value']; ?>
">
<?php echo $this->_tpl_vars['fields']['category_id']['options'][$this->_tpl_vars['fields']['category_id']['value']]; ?>

<?php endif; ?>
<?php endif; ?>

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
<?php endif; ?>
</div>
</div>

</form>
<script>SUGAR.util.doWhen("document.getElementById('form') != null",
        function(){SUGAR.util.buildAccessKeyLabels();});
</script>            <script type="text/javascript" src="include/InlineEditing/inlineEditing.js"></script>
<script type="text/javascript" src="modules/Favorites/favorites.js"></script>
<?php echo '
<script type="text/javascript">

                    var selectTabDetailView = function(tab) {
                        $(\'#content div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER\').hide();
                        $(\'#content div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER\').eq(tab).show().addClass(\'active\').addClass(\'in\');
                        $(\'#content div.panel-content div.panel\').hide();
                        $(\'#content div.panel-content div.panel.tab-panel-\' + tab).show();
                    };

                    var selectTabOnError = function(tab) {
                        selectTabDetailView(tab);
                        $(\'#content ul.nav.nav-tabs > li\').removeClass(\'active\');
                        $(\'#content ul.nav.nav-tabs > li a\').css(\'color\', \'\');

                        $(\'#content ul.nav.nav-tabs > li\').eq(tab).find(\'a\').first().css(\'color\', \'red\');
                        $(\'#content ul.nav.nav-tabs > li\').eq(tab).addClass(\'active\');

                    };

                    var selectTabOnErrorInputHandle = function(inputHandle) {
                        var tab = $(inputHandle).closest(\'.tab-pane-NOBOOTSTRAPTOGGLER\').attr(\'id\').match(/^detailpanel_(.*)$/)[1];
                        selectTabOnError(tab);
                    };


                    $(function(){
                        $(\'#content ul.nav.nav-tabs > li > a[data-toggle="tab"]\').click(function(e){
                            if(typeof $(this).parent().find(\'a\').first().attr(\'id\') != \'undefined\') {
                                var tab = parseInt($(this).parent().find(\'a\').first().attr(\'id\').match(/^tab(.)*$/)[1]);
                                selectTabDetailView(tab);
                            }
                        });
                    });

                </script>
'; ?>