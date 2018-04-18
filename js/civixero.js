CRM.$(function($) {
    $('body').on('click','.unlink-xerocontact',function(e){
        e.preventDefault();
        var xeroid = CRM.$(this).data('xeroid');
        var title = "Unlink Record";

        CRM.confirm({
            'message': "Are you sure you want to unlink contact record?",
            'title' : title,
        })
        .on('crmConfirm:yes', function() {
            CRM.api3('AccountContact', 'delete', {
                "plugin" : "xero",
                "id" : xeroid,
            }).done(function(result) {
                if(result.is_error == 1) {
                    CRM.alert(result.error_message,title,"error");
                } else {
                    CRM.alert("Contact has been unlinked successfully.",title,"success");
                    window.location.href = '';
                }
            }).fail(function(result) {
                CRM.alert("Error occured, Please try again!",title,"error");
            });
        })
        .on('crmConfirm:no', function() {

        });
    });

    $('body').on('click','.unlink-xeroinvoice',function(e){
        e.preventDefault();
        var xeroid = CRM.$(this).data('xeroid');
        var title = "Unlink Record";

        CRM.confirm({
            'message': "Are you sure you want to unlink invoice record?",
            'title' : title,
        })
            .on('crmConfirm:yes', function() {
                CRM.api3('AccountInvoice', 'delete', {
                    "plugin" : "xero",
                    "id" : xeroid,
                }).done(function(result) {
                    if(result.is_error == 1) {
                        CRM.alert(result.error_message,title,"error");
                    } else {
                        CRM.alert("Invoice has been unlinked successfully.",title,"success");
                        CRM.tabHeader.resetTab("#tab_contribute", true);
                    }
                }).fail(function(result) {
                    CRM.alert("Error occured, Please try again!",title,"error");
                });
            })
            .on('crmConfirm:no', function() {

            });
    });
});