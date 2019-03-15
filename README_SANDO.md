## Technical Infrastructure SuiteCRM 7.10.13 Poweredby LogN Systems

##Customization for SANDO CRM
This software is customised based on SANDO's requirements. Customization include 
changing existing module like Quotes, PdfTemplate. Personalising Login_Page

 **NOTE**: Developers need to make sure that any customisation to SuiteCRM has to take place in _custom_ folder 
           so that any upgradation of software will not loose any changes made previously. In short the software 
           will be upgrade safe.

 
 **CHANGELOG** 

 **Changed Login Page to Sando CRM 02/03/2019 - @author PJD**  
   *  Added all tpl files to _custom/modules/themes/SuiteP_ to fix the BUG "sidebar toggle not closing"
   *  Added Sando CRM logo in css file _custom/modules/themes/SuiteP/css/dawn/syles.scss_  which is displayed on login page header. 
   *  Added SANDO CRM header image in _custom/themes/SuiteP/images/sando_crm_xsmall.png_
   *  Added Custom Javascript file _custom/modules/AOS_Quotes/custom_quotes.js for AOS_Quotes module
   *  Changed favicon to sando.ico in SuiteCRM\include\MVC\View\SugarView.php
   
  
  **INSTRUCTIONS**
   * **How to successfully add custom javascript in SuiteCRM ,** Below are steps requires:
      * For AOS_Quotes -> Define  "'includes' => array ( 0 => array ('file' => 'custom/modules/AOS_Quotes/custom_quotes.js',),),"
        in editviewsdef.php & detailviewdef.php
        
   * **How to delete custom field in suitecrm**
       1) Remove custom field entry in table "fields_meta_data"
       
       2) Remove field from module_name_cstm table
       
       3) Remove file from custom/extension/modules/<Yourmodule>/Ext/Vardefs/sugarfield_<Field name>.php
       
       4) Remove field from all the view if you have added any.




<title>CREATE » Quotes » SandoCRM</title>