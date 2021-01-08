

function DatePickerFormat() {
    $.fn.datepicker.dates['en'] = {
        days: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"],
        daysShort: ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"],
        daysMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sá"],
        months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Setiembre", "Octubre", "Noviembre", "Diciembre"],
        monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
        today: "Hoy",
        clear: "Clear"
    };

    return {
        languaje: 'es',
        startView: 1,
        todayBtn: "linked",
        keyboardNavigation: false,
        forceParse: false,
        autoclose: true,
        format: "dd/mm/yyyy",
    };
}

function DatePicker(IdDate, anio, mes, dia) {

    var propiedad = DatePickerFormat();


    var fechaActual = new Date();
    if (anio == 0)
        anio = fechaActual.getFullYear();
    else
        anio = fechaActual.getFullYear() + anio;

    if (mes == 0)
        mes = fechaActual.getMonth();
    else
        mes = fechaActual.getMonth() + mes;

    if (dia == 0)
        dia = fechaActual.getDate();
    else
        dia = fechaActual.getDate() + dia;

    $(IdDate).datepicker(propiedad).datepicker("setDate", new Date(anio, mes, dia));
}

function FormatoNumero(nStr) {
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}


function TreeGridCrearFooter(TableId, position = 4) {

    var IdTable = TableId.replace('#', '') + '_gridcontrol_footer_table';
    var HTML = '<div class="e-gridfooter e-footerpadding"><div class="e-summarycontent"><table class="e-table" cellspacing="0.25px" style="position: relative;" role="grid" id="' + IdTable + '"><colgroup id="' + TableId.replace('#', '') + '_gridcontrolcolGroup">';

    //Crear columna
    $(TableId + '_gridcontrol_content_table colgroup col').each(function (index, ele) {
        HTML += '<col style="width: ' + $(ele).css("width") + ';">'
    });
    HTML += '</colgroup><tbody></tbody><tfoot><tr class="e-summaryrow" data-uid="grid-row1033">';

    //Crear fila
    var index = 0;
    $(TableId + '_gridcontrol_content_table colgroup col').each(function (index, ele) {
        if (index == 0)
            HTML += '<td class="e-summarycell" role="gridcell" tabindex="-1" aria-label="empty column header undefined" index="" style="text-align: left;"></td>';
        else
            HTML += '<td class="e-summarycell" role="gridcell" tabindex="-1" aria-label="empty column header undefined" index="" style="text-align: right;"></td>';

        index++;
    });
    HTML += '</tr></tfoot></table></div></div>';

    $(TableId + "_gridcontrol > div:nth-child(" + position + ")").after(HTML);


    //Algoritmo para que se mueva el total con el scroll
    if (position == 4) {
        var hijo2 = $(TableId).children()[1];
        var hijo3 = $(hijo2).children()[2];
        var DivScroll = $(hijo3).children()[0];

        if ($(DivScroll).children().length > 1) {
            //Cuando tiene propiedad isFrozen
            DivScroll = $(DivScroll).children()[1];
        }

        $(DivScroll).on('scroll', function () {
            $("#" + IdTable).css("left", (-1 * $(this).scrollLeft()) + "px");
        });
    }
    else {
        var hijo2 = $(TableId).children()[1];
        var hijo3 = $(hijo2).children()[4];
        var DivScroll = $(hijo3).children()[0];

        if ($(DivScroll).children().length > 1) {
            //Cuando tiene propiedad isFrozen
            DivScroll = $(DivScroll).children()[1];
        }

        $(DivScroll).on('scroll', function () {
            $("#" + IdTable).css("left", (-1 * $(this).scrollLeft()) + "px");
        });
    }
}


$TreeGrid_Update = [];
function TreeGrid_Create(property, IdGrid, EnabledRemoveStyle) {


    $(IdGrid).html("");
    ej.base.enableRipple(true);

    //Aqui te va a generar otro tipo de table una pivot, vamos a buscar una que dice solo grid
    TreeGridGrid1 = new ej.treegrid.TreeGrid(property);
    TreeGridGrid1.appendTo(IdGrid);
    TreeGridGrid1.refresh(); 
    $TreeGrid_Update[IdGrid] = TreeGridGrid1;
    $(".e-gridpager").remove();

    if (!EnabledRemoveStyle) {
        //Reseteamos boton niveles
        var x = document.getElementsByClassName("btn-nivel");
        $.each(x, function (index, value) {
            var grid = ($(value).attr("data-grid"));
            if ('#' + grid == IdGrid) {
                $(value).removeClass("active");
                $(value).removeClass("btn-success");
                $(value).addClass("btn-white");
            }
        });
    }

    return TreeGridGrid1; 
}

$Grid_Update = [];
function Grid_Create(property, IdGrid) {


    $(IdGrid).html(""); 

    ej.base.L10n.load({
        "es-ES": {
            "grid": {
                "GroupDropArea": "Arrastra un encabezado de columna aquí para agrupar su columna",
                "Add": "agregar",
                "Edit": "editar",
                "Cancel": "cancelar",
                "Update": "actualizar",
                "StartsWith": "Comienza con",
                "EndsWith": "Termina con",
                "Contains": "contiene",
                "Equal": "Igual",
                "NotEqual": "No es igual",
                "AND": "Y",
                "OR": "O",
                "ClearFilter": "Borrar filtro",
                "TextFilter": "Filtros de texto",
                "DateFilter": "Filtros de fecha",
                "DateTimeFilter": "Fecha filtros de tiempo",
                "ButtonCancel": "Cancelar",
                "Search": "Buscar",
                "MatchCase": "Coincidencia",
                "CancelButton": "Cancelar",
                "CustomFilter": "Filtro Personalizado",
                "CustomFilterPlaceHolder": "Ingrese un valor",
                "ShowRowsWhere": "Mostrar filas donde:",
                "SelectAll": "Seleccionar Todo",
                "OKButton": "Aceptar"
            }
        }
    });

    property.locale = "es-ES";
    GridGrid1 = new ej.grids.Grid(property);
    GridGrid1.appendTo(IdGrid);
    GridGrid1.refresh();
    $Grid_Update[IdGrid] = GridGrid1;

    $(".e-gridpager").remove();
    

    return GridGrid1;
}
function Grid_GetDiv(args) {

    if (args.requestType === 'beginEdit') {
        return args.row.offsetParent.id.replace("_content_table", "");
    }
    if (args.requestType === 'delete') {
        return args.tr[0].offsetParent.id.replace("_content_table", "");
    }
}
function Grid_GetData(args) {

    if (args.requestType === 'beginEdit') {
        return args.rowData;
    }
    if (args.requestType === 'delete') {
        return args.data[0];
    }
} 


function TreeGrid_CollapseAndExpand(className) {

    $(className).click(function () {
        var nivel = ($(this).attr("data-nivel"));
        var grid = ($(this).attr("data-grid"));

        if ($(this).attr('class').includes('active')) {
            $TreeGrid_Update['#' + grid].collapseAtLevel(parseInt(nivel));
            $(this).removeClass("active");
            $(this).removeClass("btn-success");
            $(this).addClass("btn-white");
        }
        else {
            $TreeGrid_Update['#' + grid].expandAtLevel(parseInt(nivel));
            $(this).removeClass("btn-white");
            $(this).addClass("active");
            $(this).addClass("btn-success");
        }

    });
}
 