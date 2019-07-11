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
    Check on quotes.jsp
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
  
### MIGRATING TO PROD ###
+ ADDED A RECORD WITH CRM AND IP ADDRESS
+ Created virtualhost in crm.conf folder in /etc/httpd/conf.d/

### ADDING SSL CERTIFICATE ###
* Successfully issued certificate from https://www.sslforfree.com/certificates
* Downloaded certificate from https://www.sslforfree.com/certificates 
* Created directory ssl.key, ssl.crt ssl in server crm-sando in folder /etc/httpd/conf/
* Added VirtualHost Configuration in crm.conf
* Download apache ssl module "yum install mod24_ssl"
* Follow Youtube tutorial [HOW INSTALL SSL CERTIFICATE](https://www.youtube.com/watch?v=Bb57H3-oqE0&feature=youtu.be&t=14m18s)




BUG FIXES
1. The mpm module (prefork.c) is not supported by mod_http2
https://www.youtube.com/watch?v=zT2iCk7-HLs

#Enable_HTTP/2 #Amazon #EC2 #Apache
How to fix the below error and enable HTTP/2 in Amazon EC2 Instance:

Error Message:
"The mpm module (prefork.c) is not supported by mod_http2. The mpm determines how things are processed in your server. HTTP/2 has more demands in this regard and the currently selected mpm will just not do. This is an advisory warning. Your server will continue to work, but the HTTP/2 protocol will be inactive."


Important: 
1. Take a backup of your conf files and folders before trying any the below commands.
2. **** Your website should already be configured to run on https, else HTTP/2 will not work *****



Run the below command:

httpd -V | grep MPM

Output will be:
Server MPM:     prefork

We are going to change this and start using event

Step 1: 
httpd -v
Ensure your httpd version is greater than or equal to 2.4.37

Server version: Apache/2.4.37 (Amazon)


Step 2: Modify the 00_mpm.conf

cd /etc/httpd/conf.modules.d
vim 00-mpm.conf


Uncomment the following line:
LoadModule mpm_event_module modules/mod_mpm_event.so


and comment the below lines if they are enabled:
LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
LoadModule mpm_worker_module modules/mod_mpm_worker.so


Save the file by pressing 'Esc' button :wq!

Run the below command:
httpd -V | grep MPM

Output will be:
Server MPM:     event


Step 3:
cd /etc/httpd/conf
vim httpd.conf

Add the below lines to bottom of the page:
Protocols h2 http/1.1
Protocols h2 h2c http/1.1


Step 4:
sudo service httpd restart
sudo service mysqld restart


Step 5:
Ensure your website is still up and running without any issues

Check if HTTP/2 is successfully enabled using the below website:
https://http2.pro/



2. BUG FIX : MYSQL FATAL CANNOT ALLOCATE MEMORY
   
   https://stackoverflow.com/questions/25965638/mysql-fatal-error-cannot-allocate-memory-for-the-buffer-pool/32932601
   
   http://www.webtrafficexchange.com/solved-mysql-crash-fatal-error-cannot-allocate-memory-buffer-pool
   
   Added “innodb_buffer_pool_size=64M” to ‘etc/my.cnf’

