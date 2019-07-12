<?php /* Smarty version 2.6.31, created on 2019-07-12 11:14:47
         compiled from modules/Administration/Diagnostic.tpl */ ?>

<form name="Diagnostic" method="POST" action="index.php">
<input type="hidden" name="module" value="Administration">
<input type="hidden" name="action" value="DiagnosticRun">
 
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="actionsContainer">
	<tr>
	<td>
	<input title="<?php echo $this->_tpl_vars['MOD']['LBL_DIAG_EXECUTE_BUTTON']; ?>
" class="button" onclick="this.form.action.value='DiagnosticRun';" type="submit" name="button" value="  <?php echo $this->_tpl_vars['MOD']['LBL_DIAG_EXECUTE_BUTTON']; ?>
  " >
	<input title="<?php echo $this->_tpl_vars['MOD']['LBL_DIAG_CANCEL_BUTTON']; ?>
" class="button" onclick="this.form.action.value='index'; this.form.module.value='Administration'; " type="submit" name="button" value="  <?php echo $this->_tpl_vars['MOD']['LBL_DIAG_CANCEL_BUTTON']; ?>
  "></td>

	</tr>
</table>
<div id="table" style="visibility:visible">
<table id="maintable" width="430" border="0" cellspacing="0" cellpadding="0" class="edit view">
<tr>
	<td scope="row"><span><?php echo $this->_tpl_vars['MOD']['LBL_DIAGNOSTIC_CONFIGPHP']; ?>
</span></td>
	<td ><span><input name='configphp' class="checkbox" type="checkbox" tabindex='1' checked></span></td>
	</tr><tr>
	<td scope="row"><span><?php echo $this->_tpl_vars['MOD']['LBL_DIAGNOSTIC_CUSTOMDIR']; ?>
</span></td>
	<td ><span><input name='custom_dir' class="checkbox" type="checkbox" tabindex='2' checked></span></td>
	</tr><tr>

	<td scope="row"><span><?php echo $this->_tpl_vars['MOD']['LBL_DIAGNOSTIC_PHPINFO']; ?>
</span></td>
	<td ><span><input name='phpinfo' class="checkbox" type="checkbox" tabindex='3' checked></span></td>
	</tr><tr>
	<td scope="row"><span><?php echo $this->_tpl_vars['DB_NAME']; ?>
 - <?php echo $this->_tpl_vars['MOD']['LBL_DIAGNOSTIC_MYSQLDUMPS']; ?>
</span></td>
	<td ><span><input name='mysql_dumps' class="checkbox" type="checkbox" tabindex='4' checked></span></td>
	</tr><tr>
	<td scope="row"><span><?php echo $this->_tpl_vars['DB_NAME']; ?>
 - <?php echo $this->_tpl_vars['MOD']['LBL_DIAGNOSTIC_MYSQLSCHEMA']; ?>
</span></td>

	<td ><span><input name='mysql_schema' class="checkbox" type="checkbox" tabindex='5' checked></span></td>
	</tr><tr>
	<td scope="row"><span><?php echo $this->_tpl_vars['DB_NAME']; ?>
 - <?php echo $this->_tpl_vars['MOD']['LBL_DIAGNOSTIC_MYSQLINFO']; ?>
</span></td>
	<td ><span><input name='mysql_info' class="checkbox" type="checkbox" tabindex='6' checked></span></td>
	</tr><tr>
	<td scope="row"><span><?php echo $this->_tpl_vars['MOD']['LBL_DIAGNOSTIC_MD5']; ?>
</span></td>
	<td ><span><input name='md5' class="checkbox" type="checkbox" tabindex='7' onclick="md5checkboxes()" checked></span></td>
	</tr><tr>

	<td scope="row"><span><?php echo $this->_tpl_vars['MOD']['LBL_DIAGNOSTIC_FILESMD5']; ?>
</span></td>
	<td ><span><input name='md5filesmd5' class="checkbox" type="checkbox" tabindex='8' ></span></td>
	</tr><tr>
	<td scope="row"><span><?php echo $this->_tpl_vars['MOD']['LBL_DIAGNOSTIC_CALCMD5']; ?>
</span></td>
	<td ><span><input name='md5calculated' class="checkbox" type="checkbox" tabindex='9' ></span></td>
	</tr><tr>
	<td scope="row"><span><?php echo $this->_tpl_vars['MOD']['LBL_DIAGNOSTIC_BLBF']; ?>
</span></td>

	<td ><span><input name='beanlistbeanfiles' class="checkbox" type="checkbox" tabindex='10' checked></span></td>
	</tr><tr>
	<td scope="row"><span><?php echo $this->_tpl_vars['MOD']['LBL_DIAGNOSTIC_SUITELOG']; ?>
</span></td>
	<td ><span><input name='sugarlog' class="checkbox" type="checkbox" tabindex='11' checked></span></td>
	</tr><tr>
	<td scope="row"><span><?php echo $this->_tpl_vars['MOD']['LBL_DIAGNOSTIC_VARDEFS']; ?>
</span></td>
	<td ><span><input name='vardefs' class="checkbox" type="checkbox" tabindex='11' checked></span></td>
	</tr>
</table>
</div>
</form>

<?php echo '
<script type="text/javascript" language="Javascript">
  var md5filesmd5_checked;
  var md5calculated_checked;
  function show(id) {
      document.getElementById(id).style.display="block";
  }
  function md5checkboxes(){
    if (document.Diagnostic.md5.checked == false){
      md5filesmd5_checked = document.Diagnostic.md5filesmd5.checked;
      md5calculated_checked = document.Diagnostic.md5calculated.checked;
      document.Diagnostic.md5filesmd5.checked=false;
      document.Diagnostic.md5calculated.checked=false;
      document.Diagnostic.md5filesmd5.disabled=true;
      document.Diagnostic.md5calculated.disabled=true;
    }
    else{
      document.Diagnostic.md5filesmd5.disabled=false;
      document.Diagnostic.md5calculated.disabled=false;
      document.Diagnostic.md5filesmd5.checked=md5filesmd5_checked;
      document.Diagnostic.md5calculated.checked=md5calculated_checked;
    }
  }
</script>
'; ?>