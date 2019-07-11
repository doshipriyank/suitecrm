/*
 * Description:
 * This is custom javascript for AOS_Quotes module. This script changes UI based on
 * product type
 *
 * CHANGELOG :
 * @author PJD 18/03/19 - Added feature to disable all panels on quotes page load
 * @author PJD 25/03/19 - Added more options drop down list
 * @author PJD 25/03/19 - Show / Hide Panels and fields based on selection "Product Type" for (Dosing Pump)
 * @author PJD 26/03/19 - Show / Hide Panels and fields based on selection "Product Type" for (Vertical Submersible Pump)
 * @author PJD 10/07/19 - FIX : Hide Suc /Delivery field when selecting Terms Drop Down Menu "International"  
 *
 *
 */
$(document).ready(function () {

    /*
     * Define and Declare CONSTANTS variables
     */

    //QUOTE - Drop Down Product Types
    const SELECT_PRODUCT_TYPE = 'Select Product Type';
    const HORIZONTAL_CENTRIFUGAL_PUMP = 'Horizontal Centrifugal Pump';
    const VERTICAL_CENTRIFUGAL_PUMP = 'Vertical Centrifugal Pump';
    const AODD = 'AODD';
    const DOSING_PLUNGER = 'Dosing Plunger Pump';
    const DOSING_DIAPHRAGM = 'Dosing Hydraulic Diaphragm Pump';
    const MDP = 'Magnetic Drive Pump';

    //QUOTE Drop Down Select Terms & Cond Drop Down
    const DOMESTIC = "Domestic";
    const INTL = "International";
    const SELECT_TERMS = "Select Terms";


    //PANEL HEADINGS
    //1. Array Panel Heading Centrifugal Pump
    var panel_heading_cp = {
        PUMPSPECS_CP: 'Pump Specification Centrifugal Pump',
        MOC_CP: 'Material of Construction Centrifugal Pump'
    };

    var panel_heading_mandatory = {
        PRODUCT_TYPE: 'Product Type', OVERVIEW: 'Overview',
        ACCOUNT_COMPANY: 'Account / Company', PROC_DETAILS: 'Process Details', PUMP_DETAILS: 'Pump Details',
        LINE_ITEMS: 'Line Items', MOTOR: 'MOTOR', T_C: 'TERMS & CONDITIONS'
    };

    var panel_heading_aodd = {
        PUMPSPEC_AODD: 'Pump Specification AODD Pump',
        MOC_AODD: 'Material of Construction AODD Pump'
    };

    var panel_heading_dosing = {
        PUMPSPEC_DOSING: 'Pump Specification Dosing / Metering',
        MOC_DOSING: 'MOC Dosing / Metering'
    };

    var panel_heading_mdp = {
        PUMPSPECS_CP: 'Pump Specification Centrifugal Pump',
        MOC_MDP : 'Material Of Construction - MDP'
    };

    //DOSING PLUNGER CONSTANTS Fields
    var dosing_plunger_fields = {
        WORM_WHEEL: 'Worm Wheel', GEAR_HOUSING: 'Gear Housing',
        COUPLING_GUARD: 'Coupling Guard', PUMP_MOUNTING: 'Pump Drive Mounting Base'
    };

    //VERTICAL SUBMERSIBLE FIELDS
    var vcp_fields = {
        STRAINER: 'Strainer', STUFFBOX: 'Stuffing Box',
        COL_PIPE: 'Column Pipe', DEL_PIPE: 'Delivery Pipe', MOUNT_PLATE: 'Mounting Plate',
        MOTOR_STOOL: 'Motor Stool'
    };

    //T&C FIELDS
    var tc_intl_fields = {
        INCOTERMS: 'Incoterms', SHIPMENT: 'Shipment'

    };

    var tc_all_fields = {
        INCOTERMS: 'Incoterms', SHIPMENT: 'Shipment', DELIVERY: 'Delivery:', FREIGHT_INS: 'Freight & Ins',
        PF_CHARGES: 'P&F Charges', GST: 'GST', PAYMENT: 'Payment', VALIDITY: 'Validity'
    };

    var tc_common_fields = {PAYMENT: 'Payment', VALIDITY: 'Validity'};

    var tc_dom_fields = {
        DELIVERY: 'Delivery:', FREIGHT_INS: 'Freight & Ins',
        PF_CHARGES: 'P&F Charges', GST: 'GST'
    };
    //ERROR MESSAGES
    const ERR_PROD_MSG = "  Please Select One of the following Product Type.";
    const ERR_TERM_MSG = "  Please select One of the following International or Domestic T&Cs.";

    //CONSTANTS MODULE TITLE
    const MODULE_TITLE_QUOTES = "Quotes";
    const MODULE_TITLE_CREATE = "CREATE";
    // END OF CONSTANTS

    //LOCAL variables
    var optProdTypeErrorCount = 0;
    var optTermErrorCount = 0;


    //#### start Events on DOM html ####

    /**
     * OnClick Create QUOTES all panels should be hiding
     */
    if ($(".module-title-text").text().trim() === MODULE_TITLE_CREATE &&
        $('#SAVE').length && $('#CANCEL').length) {
        hideAllPanels();
    }

    /*
     * AOS_Quotes module with "Select_Product_Type" drop down list
     * on select option will generate required options
     *
     */
    $("select#product_type_c").on('change', function () {

        var product = $('#product_type_c :selected').text().trim();
        showPanelsByProducts($('#product_type_c :selected').text().trim());

    });


    /**
     *
     * @param product
     */
    function showPanelsByProducts(product, isViewQuotes) {


        switch (product) {

            case SELECT_PRODUCT_TYPE :
                if (optProdTypeErrorCount === 0) {
                    addErrorMsg(ERR_PROD_MSG);
                }

                optProdTypeErrorCount++;

                //disable SAVE button
                toggleSAVEAndCANCELButton(true);
                break;

            case HORIZONTAL_CENTRIFUGAL_PUMP :
                console.log("Product Selected - " + HORIZONTAL_CENTRIFUGAL_PUMP);
                hideAllPanels();
                hidePanelsAndFields(panel_heading_mandatory, tc_all_fields, true);
                hidePanelsAndFields(panel_heading_cp, vcp_fields, true);
                break;

            case VERTICAL_CENTRIFUGAL_PUMP :
                console.log("Product Selected - " + VERTICAL_CENTRIFUGAL_PUMP);
                hideAllPanels();
                hidePanelsAndFields(panel_heading_mandatory, tc_all_fields, true);
                hidePanelsAndFields(panel_heading_cp, vcp_fields, false);
                break;

            case AODD :
                console.log("Product Selected - " + DOSING_DIAPHRAGM);
                hideAllPanels();
                hidePanelsAndFields(panel_heading_mandatory, tc_all_fields, true);
                hidePanelsAndFields(panel_heading_aodd);
                break;

            case DOSING_DIAPHRAGM :
                console.log("Product Selected - " + DOSING_DIAPHRAGM);
                hideAllPanels();
                hidePanelsAndFields(panel_heading_mandatory, tc_all_fields, true);
                hidePanelsAndFields(panel_heading_dosing, dosing_plunger_fields, true);
                break;

            case DOSING_PLUNGER :
                console.log("Product Selected - " + DOSING_PLUNGER);
                hideAllPanels();
                hidePanelsAndFields(panel_heading_mandatory, tc_all_fields, true);
                hidePanelsAndFields(panel_heading_dosing, dosing_plunger_fields, false);
                break;

            case MDP :
                console.log("Product Selected - " + MDP);
                hideAllPanels();
                hidePanelsAndFields(panel_heading_mandatory, tc_all_fields, true);
                hidePanelsAndFields(panel_heading_mdp, false);
                break;

            default :
                console.log("Product Not Available - "+product);
                break;
        }


    }


    /**
     *
     *
     * @param panels
     * @param fields
     * @param isForShow
     * */
    function hidePanelsAndFields(panels, fields, isForHide) {

        $('.panel-heading').each(function () {

            var panel_heading = $(this).children().last().text().trim();


            for (var key in panels) {

                //If T&Cs hide all fields

                if (panel_heading === panels[key]) {

                    //Show Panels of product
                    $(this).parent('div.panel').show();

                    //label or fields
                    $('div.label').each(function () {
                        //field value
                        var field = $(this).text().trim();

                        //No of Fields to be shown or hidden
                        for (var key in fields) {
                            //check the flag isForShow

                            //  hide fields when hideflag is true
                            if (field.match(fields[key]) && isForHide) {
                                $(this).parent().hide();
                            }

                            // show fields when hideflag is false
                            if (field.match(fields[key]) && !isForHide) {
                                $(this).parent().show();
                            }
                        }

                    });
                }
            }

        });

    }


    //5. On Select Terms & Conditions
    $("select#select_terms_c").on('change', function () {

        var term = $('#select_terms_c :selected').text().trim();
        showFieldsByTerms(term);

    });


    //show select terms


    /**
     *
     *
     * @param typeOfTerms
     */
    function showFieldsByTerms(typeOfTerms) {
        switch (typeOfTerms) {

            case SELECT_TERMS:
                if (optTermErrorCount == 0) {
                    addErrorMsg(ERR_TERM_MSG);
                }

                optTermErrorCount++;

                //disable SAVE button
                toggleSAVEAndCANCELButton(true);
                break;

            case DOMESTIC:
                console.log("TERMS SELECTED - " + DOMESTIC);
                showFields(tc_common_fields, true);
                showFields(tc_dom_fields, true);
                showFields(tc_intl_fields, false);
                break;

            case INTL:
                console.log("TERMS SELECTED - " + INTL);
                showFields(tc_common_fields, true);
                showFields(tc_intl_fields, true);
                showFields(tc_dom_fields, false);
                break;


        }
    }

    /**
     *
     * Show fields is for users to show and hide fields. Used to show/hide
     * T&Cs
     *
     * @param fields
     */
    function showFields(fields, toShow) {
        $('div.label').each(function () {

            //field value
            var field = $(this).text().trim();

            if (toShow) {
                //No of Fields to be shown or hidden
                for (var key in fields) {

                    if (field.match(fields[key])) {
                        $(this).parent().show();
                    }
                }
            }


            if (!toShow) {
                for (var key in fields) {

                    if (field.match(fields[key])) {
                        $(this).parent().hide();
                    }
                }
            }
        });

    }

    // On Error Close reset message counter
    $(document).on('click', 'a.close', function () {

        console.log("Product Type - " + optProdTypeErrorCount + "; T&C Count - " + optTermErrorCount);

        if ($(this).parent('div.errMsg').text().trim().match(ERR_PROD_MSG.trim())) {
            optProdTypeErrorCount--;
        } else {

            optTermErrorCount--;
        }

        if (optProdTypeErrorCount == 0 && optTermErrorCount == 0) {
            toggleSAVEAndCANCELButton(false);
        }
    });

    //### End of Events Code ###


    /**
     * Displays Error Messages and disable save button
     * @param msg
     */
    function addErrorMsg(msg) {

        $("#EditView_tabs").prepend('<div  class="errMsg alert alert-danger fade in">' +
            '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>' +
            '<strong>Error!</strong>' + msg + '</div>');
    }

    /**
     * Enable  Save Button when no errors
     * Disable Save Button when errors
     */
    function toggleSAVEAndCANCELButton(val) {

        $("[id=SAVE]").attr('disabled', val);
        $("[id=CANCEL]").attr('disabled', val);

    }

    /**
     * Hidel All the Elements on CREATE FORM
     * @param element
     */
    function hideAllPanels() {

        //initial hide all panels on creating quotes
        $('.panel-heading').each(function () {
            $(this).parent('div.panel').hide();
        });
    }



    //2. Check if the page is View Quotes and show panels accordingly

    if ($(".module-title-text").text().trim() !== MODULE_TITLE_QUOTES && $(".module-title-text").text().trim() !== MODULE_TITLE_QUOTES
     && $("#tab-actions > a.dropdown-toggle").text() == "ACTIONS") {

        var product = $("div[field='product_type_c']").text().trim();
        showPanelsByProducts(product);

        var t_c = $("div[field='select_terms_c']").text().trim();
        showFieldsByTerms(t_c);

    }


});
