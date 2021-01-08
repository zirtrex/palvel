var CmpGlobalVariableUrl401;
var validateEdition;
var CmpEstadoHomologacion;
var CmpValuedate;
var Image ="";

$(function ($) {
    //$.datepicker.regional['es'] = {
    //    closeText: 'Cerrar',
    //    prevText: 'Ant',
    //    nextText: 'Sig',
    //    currentText: 'Hoy',
    //    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    //    monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
    //    dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado'],
    //    dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
    //    dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'S&aacute'],
    //    weekHeader: 'Sm',
    //    dateFormat: 'dd/mm/yy',
    //    firstDay: 1,
    //    isRTL: false,
    //    showMonthAfterYear: false,
    //    yearSuffix: ''
    //};
    //$.datepicker.setDefaults($.datepicker.regional['es']);
});

function CmpMessage(title, message, typemessage) {
    swal({
        title: title,
        text: message,
        type: typemessage,
        showCancelButton: false,
        confirmButtonText: "OK",
    });
};



function CmpAjaxPost(parameterData) {
     
    $.ajaxAQO({
        url: parameterData.url,
        data: JSON.stringify(parameterData.data),
        type: "POST",
        cache: false,
        async: true,
        contentType: "application/json;charset=UTF-8",
        datatype: "json",
        success: function (data) {
            if (data.status) {
                swal({
                    title: parameterData.title,
                    text: "¡Éxito! datos procesados satisfactoriamente.",
                    type: "success",
                    showCancelButton: false,
                    confirmButtonText: "OK",
                },
                    function () {
                        if (parameterData.invokefunction != null) {
                            parameterData.invokefunction.call();
                        }
                    });
            }
            else {
                swal({
                    title: parameterData.title,
                    text: data.value,
                    type: "info",
                    showCancelButton: false,
                    confirmButtonText: "OK",
                });
            }
             
        },
        error: function (request, status, error) {
            if (request.status == 500) {
                swal({
                    title: "error",
                    text: request.responseText,
                    type: "error",
                    showCancelButton: false,
                    confirmButtonText: "OK",
                });
            }
            if (request.status == 401) {
                document.location.href = CmpGlobalVariableUrl401;
            }
        }
    });
}

function CmpAjaxLoadDropDownList(parameterData) {
    var ItemCount = 1;
    $.ajaxAQO({
        url: parameterData.url,
        data:parameterData.data,
        type: "GET",
        cache: false,
        async: true,
        contentType: "application/json;charset=UTF-8",
        datatype: "json",
        success: function (data) {
            if (data.status) {
                var DropDownList = $(parameterData.id);
                DropDownList.empty();
                if (parameterData.addDefaultSelected) {
                    DropDownList.append('<option selected="selected" value="">' + ((parameterData.addDefaultSelectedName == null) ? "Seleccione.." : parameterData.addDefaultSelectedName) +  "</option>").trigger("chosen:updated")
                }
                $.each(data.value, function (index, item) {
                    if (data.value.length == 1 && parameterData.select_valueOne != null) {
                        DropDownList.append('<option value="' + item.Key + '" selected="selected" >' + item.Value +  "</option>").trigger("chosen:updated")
                    }
                    else {
                        if (ItemCount == 1 && parameterData.select_valueOne != null) {
                            DropDownList.append('<option value="' + item.Key + '" selected="selected" >' + item.Value +  "</option>").trigger("chosen:updated")
                        }
                        else {
                            DropDownList.append('<option value="' + item.Key + '">' + item.Value +  "</option>").trigger("chosen:updated")
                        }
                    }
                    ItemCount++;
                });

                if (parameterData.invokefunction != null) {
                    parameterData.invokefunction.call();
                }
            } else {
                swal({
                    title: "Problema en el servidor",
                    text: data.value,
                    type: "info",
                    showCancelButton: false,
                    confirmButtonText: "OK",
                });
            }
        },
        error: function (request, status, error) {
            $("#progress").hide();
            if (request.status == 500) {
                swal({
                    title: "error",
                    text: request.responseText,
                    type: "error",
                    showCancelButton: false,
                    confirmButtonText: "OK",
                });
            }
            if (request.status == 401) {
                document.location.href = CmpGlobalVariableUrl401;
            }
        }
    });
}

function CmpValidaLetra(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
    especiales = "8-37-39-46";

    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }
    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        return false;
    }
}
function CmpValidaLetraUsuario(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " .áéíóúabcdefghijklmnñopqrstuvwxyz";
    especiales = "8-37-39-46";
    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }
    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        return false;
    }
}


function CmpValidaEmail(Email) {
    var emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
    if (emailRegex.test(Email)) {
        return false;
    } else {
        return true;
    }
}

function CmpHighchartAddClip(div, filtro) {

    var filtroclass = filtro.replace(/\s+/g, '')
        .replace('/', '')
        .replace('(', '')
        .replace(')', '')
        .replace('[', '')
        .replace(']', '')
        .replace('%', '')
        .replace('.', '')
        .replace('&', '')
        .replace('-', '');


    $("#" + div + "filtro").html("<div class='chip'> " + filtro + "<span class='closebtn chip" + filtroclass + "'>&times;</span></div>");
    $('.chip' + filtroclass).unbind('click');
    $('.chip' + filtroclass).on('click', function (event) {
        $("#" + div + "filtro").html('');
        var chartstemp = Highcharts.charts;
        chartstemp.forEach(function (chart, index) {
            if (chart != null) {
                if (chart.renderTo.id === div) {
                    var item = chart.series[0];
                    for (var i = 0; i < item.data.length; i++) {
                        var point = item.data[i];
                        if (point.selected) {
                            point.select(false, true);
                            if (point.events.click != null) {
                                point.events.click.call();
                            }
                        }

                    }

                }
            }
        });

    });
    
}