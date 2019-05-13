<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require_once('include/MVC/View/views/view.list.php');
class AOS_QuotesViewList extends ViewList
{
    function __construct()
    {
        parent::__construct();
    }
    function preDisplay()
    {
        echo '<script type="text/javascript"  src="custom/modules/AOS_Quotes/custom_quotes.js"></script>';
        parent::preDisplay();
    }
}
?>