<?php /* Smarty version 2.6.31, created on 2019-02-20 19:30:10
         compiled from modules/Emails/include/ImportView/ImportView.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'sugar_include', 'modules/Emails/include/ImportView/ImportView.tpl', 42, false),array('function', 'counter', 'modules/Emails/include/ImportView/ImportView.tpl', 55, false),array('modifier', 'upper', 'modules/Emails/include/ImportView/ImportView.tpl', 67, false),)), $this); ?>
{*
/**
 *
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.
 *
 * SuiteCRM is an extension to SugarCRM Community Edition developed by SalesAgility Ltd.
 * Copyright (C) 2011 - 2018 SalesAgility Ltd.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for technical reasons, the Appropriate Legal Notices must
 * display the words "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 */
*}

<?php echo smarty_function_sugar_include(array('type' => 'smarty','file' => $this->_tpl_vars['headerTpl']), $this);?>

{sugar_include include=$includes}
<form class="email-import-view" id="EditView" name="EditNonImported" method="POST" action="index.php?module=Emails&action=send">
    <input type="hidden" name="module" value="Emails">
    <input type="hidden" name="action" value="Import">
    <input type="hidden" name="record" value="">
    <input type="hidden" name="type" value="out">
    <input type="hidden" name="send" value="1">
    <input type="hidden" name="return_module" value="{$RETURN_MODULE}">
    <input type="hidden" name="return_action" value="{$RETURN_ACTION}">
    <input type="hidden" name="inbound_email_id" value="{$INBOUND_ID}">
<div id="EditView_tabs">
    {*display tabs*}
    <?php echo smarty_function_counter(array('name' => 'tabCount','start' => -1,'print' => false,'assign' => 'tabCount'), $this);?>


    <div class="clearfix"></div>
    <?php if ($this->_tpl_vars['useTabs']): ?>
    <div class="tab-content">
        <?php else: ?>
        <div class="tab-content" style="padding: 0; border: 0;">
            <?php endif; ?>
            <?php echo smarty_function_counter(array('name' => 'tabCount','start' => 0,'print' => false,'assign' => 'tabCount'), $this);?>

            {* Loop through all top level panels first *}
            <?php if ($this->_tpl_vars['useTabs']): ?>
            <?php $_from = $this->_tpl_vars['sectionPanels']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['section'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['section']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['label'] => $this->_tpl_vars['panel']):
        $this->_foreach['section']['iteration']++;
?>
            <?php ob_start(); ?><?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('upper', true, $_tmp) : smarty_modifier_upper($_tmp)); ?>
<?php $this->_smarty_vars['capture']['label_upper'] = ob_get_contents();  $this->assign('label_upper', ob_get_contents());ob_end_clean(); ?>
            <?php if (isset ( $this->_tpl_vars['tabDefs'][$this->_tpl_vars['label_upper']]['newTab'] ) && $this->_tpl_vars['tabDefs'][$this->_tpl_vars['label_upper']]['newTab'] == true): ?>
            <?php if ($this->_tpl_vars['tabCount'] == '0'): ?>
            <div class="tab-pane-NOBOOTSTRAPTOGGLER active fade in" id='tab-content-<?php echo $this->_tpl_vars['tabCount']; ?>
'>
                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'themes/SuiteP/include/EditView/tab_panel_content.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
            </div>
            <?php else: ?>
            <div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-<?php echo $this->_tpl_vars['tabCount']; ?>
'>
                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'themes/SuiteP/include/EditView/tab_panel_content.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
            </div>
            <?php endif; ?>
             <?php echo smarty_function_counter(array('name' => 'tabCount','print' => false), $this);?>

            <?php endif; ?>
            <?php endforeach; endif; unset($_from); ?>
            <?php else: ?>
            <div class="tab-pane panel-collapse">&nbsp;</div>
            <?php endif; ?>
        </div>
        {*display panels*}
        <div class="panel-content">
            <div>&nbsp;</div>
            <?php echo smarty_function_counter(array('name' => 'panelCount','start' => -1,'print' => false,'assign' => 'panelCount'), $this);?>

            <?php $_from = $this->_tpl_vars['sectionPanels']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['section'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['section']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['label'] => $this->_tpl_vars['panel']):
        $this->_foreach['section']['iteration']++;
?>
            <?php ob_start(); ?><?php echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('upper', true, $_tmp) : smarty_modifier_upper($_tmp)); ?>
<?php $this->_smarty_vars['capture']['label_upper'] = ob_get_contents();  $this->assign('label_upper', ob_get_contents());ob_end_clean(); ?>
            {* if tab *}
            <?php if (( isset ( $this->_tpl_vars['tabDefs'][$this->_tpl_vars['label_upper']]['newTab'] ) && $this->_tpl_vars['tabDefs'][$this->_tpl_vars['label_upper']]['newTab'] == true && $this->_tpl_vars['useTabs'] )): ?>
            {*if tab skip*}
            <?php else: ?>
            {* if panel display*}
            {*if panel collasped*}
            <?php if (( isset ( $this->_tpl_vars['tabDefs'][$this->_tpl_vars['label_upper']]['panelDefault'] ) && $this->_tpl_vars['tabDefs'][$this->_tpl_vars['label_upper']]['panelDefault'] == 'collapsed' )): ?>
            {*collapse panel*}
            <?php $this->assign('collapse', "panel-collapse collapse"); ?>
            <?php $this->assign('collapsed', 'collapsed'); ?>
            <?php $this->assign('collapseIcon', "glyphicon glyphicon-plus"); ?>
            <?php $this->assign('panelHeadingCollapse', "panel-heading-collapse"); ?>
            <?php else: ?>
            {*expand panel*}
            <?php $this->assign('collapse', "panel-collapse collapse in"); ?>
            <?php $this->assign('collapseIcon', "glyphicon glyphicon-minus"); ?>
            <?php $this->assign('panelHeadingCollapse', ""); ?>
            <?php endif; ?>

            <div class="panel panel-default">
                <div class="panel-heading <?php echo $this->_tpl_vars['panelHeadingCollapse']; ?>
">
                    <a class="<?php echo $this->_tpl_vars['collapsed']; ?>
" role="button" data-toggle="collapse-edit" aria-expanded="false">
                        <div class="col-xs-10 col-sm-11 col-md-11">
                            {sugar_translate label='<?php echo $this->_tpl_vars['label']; ?>
' module='<?php echo $this->_tpl_vars['module']; ?>
'}
                        </div>
                    </a>
                </div>
                <div class="panel-body <?php echo $this->_tpl_vars['collapse']; ?>
" id="detailpanel_<?php echo $this->_tpl_vars['panelCount']; ?>
">
                    <div class="tab-content">
                        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'themes/SuiteP/include/EditView/tab_panel_content.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                    </div>
                </div>
            </div>
            <?php endif; ?>
            <?php echo smarty_function_counter(array('name' => 'panelCount','print' => false), $this);?>

            <?php endforeach; endif; unset($_from); ?>
        </div>
    </div>
<?php echo smarty_function_sugar_include(array('type' => 'smarty','file' => $this->_tpl_vars['footerTpl']), $this);?>


{if $RETURN_MODULE}
    {literal}

        <script type="text/javascript">

        var selectTab = function(tab) {
            $('#EditView_tabs div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER').hide();
            $('#EditView_tabs div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER').eq(tab).show().addClass('active').addClass('in');
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

    {/literal}
    {/if}
</form>