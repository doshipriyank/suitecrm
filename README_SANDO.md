## Technical Infrastructure SuiteCRM 7.10.13 Poweredby LogN Systems

##Customization for SANDO CRM
This software is customised based on SANDO's requirements. Customization include 
changing existing module like Quotes, PdfTemplate. Personalising Login_Page

 **NOTE**: Developers need to make sure that any customisation to SuiteCRM has to take place in _custom_ folder 
           so that any upgradation of software will not loose any changes made previously. In short the software 
           will be upgrade safe.

 
 **CHANGELOG** 

   *  Changed Login Page to Sando CRM 02/03/2019 - @author PJD 
   *  Added all tpl files to _custom/modules/themes/SuiteP_ to fix the BUG "sidebar toggle not closing"
   *  Added Sando CRM logo in css file _custom/modules/themes/SuiteP/css/dawn/syles.scss_  which is displayed on login page header. 
   *  Added SANDO CRM header image in _custom/themes/SuiteP/images/sando_crm_xsmall.png_
   *  Added Custom Javascript file _custom/modules/AOS_Quotes/custom_quotes.js for AOS_Quotes module 
   *  Changed favicon to sando.ico in SuiteCRM\include\MVC\View\SugarView.php - 16/03/19 / @author PJD
   *  Added Bootstrap library in _head.tpl file in _custom/themes/SuiteP/tpls/_head.tpl - 17/03/19 / @author PJD
   *  Added drop downlist quote_type_dom , quote_terms_type_dom in Studio -> Dropdown Editor
   *  Added custom.js quote in listview.php. Please check instruction <i> https://phpbugs.wordpress.com/2011/06/17/sugarcrm-include-javascript-file-on-listview/ </i>
   
  **INSTRUCTIONS**
   * **How to successfully add custom javascript in SuiteCRM ,** Below are steps requires:
      * For AOS_Quotes -> Define  "'includes' => array ( 0 => array ('file' => 'custom/modules/AOS_Quotes/custom_quotes.js',),),"
        in editviewsdef.php & detailviewdef.php
        
   * **How to delete custom field in suitecrm**
       1) Remove custom field entry in table "fields_meta_data"
       
       2) Remove field from module_name_cstm table
       
       3) Remove file from custom/extension/modules/<Yourmodule>/Ext/Vardefs/sugarfield_<Field name>.php
       
       4) Remove field from all the view if you have added any.

   * **How to add custom javascript in List View**
    
   `<?php
   if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
   require_once('include/MVC/View/views/view.list.php');
   class {ModuleName}ViewList extends ViewList
   {
       function __construct()
       {
           parent::__construct();
       }
       function preDisplay()
       {
           echo '<script type="text/javascript" src="{INCLUDE_FILE_PATH}"></script>';
           parent::preDisplay();
       }
   }
   ?>
`
* **PERFORMANCE TWEAKING
 
   * OPCACHE CONFIGURATION CHANGE
       Follow Steps from : https://www.tecmint.com/install-opcache-in-centos-7/	       Follow Steps from WIKI : https://wiki.mikejung.biz/PHP_OPcache   	
       1. opcache.max_accelerated_files = 7963
       2. opcache.validate_timestamps = 0
       3. opcache.enable_cli=1
       4. opcache.memory_consumption=128
       5. opcache.interned_strings_buffer=8
       6. opcache.revalidate_freq=60
       7. opcache.fast_shutdown=1

  
   * MYSQL CONFIG CHANGE
       1. Run Perl Diagnostic script :  Perl mysqltuner.pl
       2. Added skip-name-resolve=1 in my.cnf file 

  * Link to ENABLE GZIP COMPRESSION 
	1. Follow Steps in the link https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-mod_deflate-on-centos-7
        2. Added gzip configuration in /etc/httpd/conf.d/mod_deflate.conf 
  
