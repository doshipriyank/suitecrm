/*
 * Description:
 * This is custom javascript for AOS_Quotes module. Inorder o aciv
 * @author PJD
 *
 */
$(document).ready(function () {

    //$(".panel").hide().children();
    // $(".panel").click(function () {
    //
    //  alert("HELLO WORLDS");
    // })


    $("select#product_type_c").on('change', function () {
        console.log($('#product_type_c :selected').text());
    })
})