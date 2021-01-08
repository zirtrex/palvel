
 

(function ($) {

    $.AjaxList = [];  
    $.ajaxAQO = function (parameter) { 
         
        var ajax = $.ajax({
            cache: parameter.cache,
            async: parameter.async,
            url: parameter.url,
            type: parameter.type,
            dataType: parameter.dataType,
            contentType: parameter.contentType,
            data: parameter.data,
            beforeSend: function (ajax) {


                if (parameter.beforeSend != null)
                    parameter.beforeSend(ajax);
                 
            }
            , success: function (data) {
                
                $.AjaxList = jQuery.grep($.AjaxList, function (value) { return value.url != parameter.url; });

                if (parameter.success != null)
                    parameter.success(data);
                 
            }
        }); 
        $.AjaxList.push({ url: parameter.url, ajax: ajax });
         
        return this;
    };
    $.ajaxAQO.AbortAll = function () {
        $($.AjaxList).each(function (idx, jqXHR) { 
            jqXHR.ajax.abort();
        });
        $.AjaxList.length = 0
    };


    //Ajax eliminación
    $.ajaxAQODelete = function (parameterData) {
        swal({
            title: parameterData.title,
            text: "¿Esta seguro de eliminar el registro.?",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: "Si",
            cancelButtonText: "No",
            closeOnConfirm: false,
        },
            function (isConfirm) {

                if (isConfirm) {
                    CmpAjaxPost({
                        url: parameterData.url,
                        title: parameterData.title,
                        invokefunction: parameterData.invokefunction,
                        data: parameterData.data
                    });
                }
            });
    };
})(jQuery);
 