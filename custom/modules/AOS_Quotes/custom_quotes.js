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
 *
 *
 */
$(document).ready(function () {

    /*
     * Define and Declare constant variables
     */

    //AOS_Quotes - Drop Down Product Types Constants
    var SELECT_PRODUCT_TYPE = 'Select Product Type';
    var HORIZONTAL_CENTRIFUGAL_PUMP = 'Horizontal Centrifugal Pump';
    var VERTICAL_CENTRIFUGAL_PUMP = 'Vertical Centrifugal Pump';
    var AODD = 'AODD';
    var DOSING_PLUNGER = 'Dosing Plunger Pump';
    var DOSING_DIAPHRAGM = 'Dosing Hydraulic Diaphragm Pump';
    var MDP = 'Magnetic Drive Pump';

    //AOS_Quotes - Drop Down Select Terms & Cond Drop Down
    var DOMESTIC = "Domestic";
    var INTL = "International";
    var SELECT_TERMS = "Select Terms";

    //AOS_Quotes - Panel Heading
    var PRODUCT_TYPE = 'Product Type';
    var OVERVIEW = 'Overview';
    var ACCOUNT_COMPANY = 'Account / Company';
    var PROC_DETAILS = 'Process Details';
    var PUMP_DETAILS = 'Pump Details';
    var PUMPSPECS_CP = 'Pump Specification Centrifugal Pump';
    var MOC_CP = 'Material of Construction Centrifugal Pump';
    var PUMPSPEC_AODD = 'Pump Specification AODD Pump';
    var MOC_AODD = 'Material of Construction AODD Pump';
    var LINE_ITEMS = 'Line Items';
    var PUMPSPEC_DOSING = 'Pump Specification Dosing / Metering';
    var MOC_DOSING = 'MOC Dosing / Metering';

    //DOSING PLUNGER Fields Constants
    var WORM_WHEEL = "Worm Wheel";
    var GEAR_HOUSING = "Gear Housing";
    var COUPLING_GUARD = "Coupling Guard";
    var PUMP_MOUNTING = "Pump Drive Mounting Base";

    //VERTICAL SUBMERSIBLE FIELDS
    var STRAINER = 'Strainer';
    var STUFFBOX = 'Stuffing Box';
    var COL_PIPE = 'Column Pipe';
    var DEL_PIPE = 'Delivery Pipe';
    var MOUNT_PLATE = 'Mounting Plate';
    var MOTOR_STOOL = 'Motor Stool';

    //Terms & Conditions
    var INCOTERMS = 'Incoterms';
    var SHIPMENT = 'Shipment';
    var DELIVERY = 'Delivery';
    var FREIGHT_INS = 'Freight & Ins';
    var PF_CHARGES = 'P&F Charges';
    var GST = 'GST';


    //ERROR MESSAGES
    var ERR_PROD_MSG = "  Please Select One of the following Product Type.";
    var ERR_TERM_MSG = "  Please select one of the following Internation or Domestic T&Cs.";

    //global variables
    var optProdTypeErrorCount = 0;
    var optTermErrrorCount = 0;


    //#### start Events on DOM html ####

    //initial hide all panels.
    $('.panel-heading').each(function () {

        var panel = $(this).children().last().text().trim();

        if (panel !== PRODUCT_TYPE) {
            $(this).parent('div.panel').hide();
        }
    });


    /*
     * AOS_Quotes module with "Select_Product_Type" drop down list
     * on select option will generate required options
     *
     */
    $("select#product_type_c").on('change', function () {
        console.log("Option Selected :" + $('#product_type_c :selected').text().trim());


        //1. On selecting "SELECT_PRODUCT TYPE" throw Error Message
        if ($('#product_type_c :selected').text().trim() === SELECT_PRODUCT_TYPE) {

            if (optProdTypeErrorCount === 0) {
                addErrorMsg(ERR_PROD_MSG);
            }

            optProdTypeErrorCount++;

            //disable SAVE button
            toggleSAVEAndCANCELButton(true);

        }


        //2. Horizontal / Vertical  Centrifugal Pump
        var isHorizontalCP = $('#product_type_c :selected').text().trim() === HORIZONTAL_CENTRIFUGAL_PUMP;
        var isVerticalCP = $('#product_type_c :selected').text().trim() === VERTICAL_CENTRIFUGAL_PUMP;

        if (isHorizontalCP || isVerticalCP) {

            $('.panel-heading').each(function () {

                var panel_heading = $(this).children().last().text().trim();

                //Hide AODD SPECS on selecting option horizontal_centrifugal_pump
                if (panel_heading.trim() === PUMPSPEC_AODD || panel_heading.trim() === MOC_AODD
                    || panel_heading.trim() === PUMPSPEC_DOSING || panel_heading.trim() == MOC_DOSING) {

                    $(this).parent('div.panel').hide();

                } else {
                    $(this).parent('div.panel').show();


                    if (isHorizontalCP) {


                        $('div.label').each(function () {

                            if ($(this).text().trim().match(STRAINER) || $(this).text().trim().match(STUFFBOX) ||
                                $(this).text().trim().match(COL_PIPE) || $(this).text().trim().match(DEL_PIPE) ||
                                $(this).text().trim().match(MOUNT_PLATE) || $(this).text().trim().match(MOTOR_STOOL)) {


                                $(this).parent().hide();

                            }
                        });

                    }

                    if (isVerticalCP) {

                        $('div.label').each(function () {

                            $(this).parent().show();
                        });
                    }


                }

            });
        }


        //3. AODD pump selection
        if ($('#product_type_c :selected').text().trim() === AODD) {

            $('.panel-heading').each(function () {

                var panel_heading = $(this).children().last().text().trim();

                //Hide Centrifugal SPECS on selecting option AODD
                if (panel_heading.trim() === PUMPSPECS_CP || panel_heading.trim() === MOC_CP
                    || panel_heading.trim() === PUMPSPEC_DOSING || panel_heading.trim() == MOC_DOSING) {
                    $(this).parent('div.panel').hide();
                } else {
                    $(this).parent('div.panel').show();
                }

            });


        }

        //4. Dosing Pump Selection
        var isDosingPlunger = ($('#product_type_c :selected').text().trim() === DOSING_PLUNGER);
        var isDosingDiaphragm = ($('#product_type_c :selected').text().trim() === DOSING_DIAPHRAGM);

        if (isDosingPlunger || isDosingDiaphragm) {

            $('.panel-heading').each(function () {

                var panel_heading = $(this).children().last().text().trim();
                var div_panel = $(this).parent('div.panel');

                //Hide Centrifugal SPECS on selecting option AODD
                if (panel_heading.trim() === PUMPSPECS_CP || panel_heading.trim() === MOC_CP
                    || panel_heading.trim() === PUMPSPEC_AODD || panel_heading.trim() === MOC_AODD) {

                    div_panel.hide();

                } else {

                    div_panel.show();

                    if (isDosingDiaphragm) {


                        $('div.label').each(function () {

                            if ($(this).text().trim().match(WORM_WHEEL) || $(this).text().trim().match(GEAR_HOUSING) ||
                                $(this).text().trim().match(COUPLING_GUARD) || $(this).text().trim().match(PUMP_MOUNTING)) {
                                $(this).parent().hide();
                            }
                        });

                    }

                    if (isDosingPlunger) {


                        $('div.label').each(function () {

                            $(this).parent().show();
                        });

                    }

                }

            });
        }


    });


    //5. On Select Terms & Conditions
    $("select#select_terms_c").on('change', function () {

        if ($('#select_terms_c :selected').text().trim() === SELECT_TERMS) {

            if (optTermErrrorCount == 0) {
                addErrorMsg(ERR_TERM_MSG);
            }

            optTermErrrorCount++;

            //disable SAVE button
            toggleSAVEButton(true);

        }

        if ($('#select_terms_c :selected').text().trim() === DOMESTIC) {
            $('div.label').each(function () {

                if ($(this).text().trim().match(INCOTERMS) || $(this).text().trim().match(SHIPMENT)) {
                    $(this).parent().hide();
                } else {
                    $(this).parent().show();
                }
            });

        }

        if ($('#select_terms_c :selected').text().trim() === INTL) {

            $('div.label').each(function () {

                if ($(this).text().trim().match(DELIVERY) || $(this).text().trim().match(FREIGHT_INS) ||
                    $(this).text().trim().match(PF_CHARGES) || $(this).text().trim().match(GST)) {
                    $(this).parent().hide();
                } else {
                    $(this).parent().show();
                }
            });
        }

    });


    // On Error Close reset message counter
    $(document).on('click', 'a.close', function () {

        if ($(this).parent('div.errMsg').text().trim().match(ERR_PROD_MSG)) {
            optProdTypeErrorCount--;
        } else {

            optTermErrrorCount--;
        }


        if(optProdTypeErrorCount == 0 && optTermErrrorCount == 0) {
            toggleSAVEAndCANCELButton(false);
        }
    });

    //### End of Events Code ###


    //functions

    /**
     * Displays Error Messages and disable save button
     * @param msg
     */
    function addErrorMsg(msg) {

        $(".tab-content").first().after('<div  class="errMsg alert alert-danger fade in">' +
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



})