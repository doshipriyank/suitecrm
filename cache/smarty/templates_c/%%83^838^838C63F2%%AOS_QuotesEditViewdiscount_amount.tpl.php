<?php /* Smarty version 2.6.31, created on 2019-03-05 17:07:46
         compiled from cache/include/InlineEditing/AOS_QuotesEditViewdiscount_amount.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'sugar_number_format', 'cache/include/InlineEditing/AOS_QuotesEditViewdiscount_amount.tpl', 8, false),)), $this); ?>

<?php if (strlen ( $this->_tpl_vars['fields']['discount_amount']['value'] ) <= 0): ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['discount_amount']['default_value']); ?>
<?php else: ?>
<?php $this->assign('value', $this->_tpl_vars['fields']['discount_amount']['value']); ?>
<?php endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['discount_amount']['name']; ?>
' 
id='<?php echo $this->_tpl_vars['fields']['discount_amount']['name']; ?>
' size='30' maxlength='26,6' value='<?php echo smarty_function_sugar_number_format(array('var' => $this->_tpl_vars['value']), $this);?>
' title='' tabindex='1'
 >