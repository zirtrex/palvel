
$(document).ready(function () {
    var GridTaxpayer;
    var dsh = {

        init: function () {
            //Selección de menú
            $('.nav metismenu').find('li.active').removeClass('active');
            $('#Taxpayer').addClass('active');

            //Cargamos eventos de todos los controles
            dsh.Evento();
            dsh.CreateGrid();

        },

        Clear_Input() {

        },

        Evento: function () {

            $('#btn_nuevo').click(function () {
                $(".btn-data").data("option", "I");
            });
             
            $('#modal_Taxpayer').on('show.bs.modal', function (event) {
                var option = $(".btn-data").data("option");
                var e_license_Taxpayer = $(".btn-data").data("e_license_Taxpayer"); console.log(e_license_Taxpayer);
                var modal = $(this);
                var title = "";

                if (option == "I") {
                    dsh.Clear_Input();
                    e_license_Taxpayer = {};
                    title = "Nuevo Solicitante";
                    modal.find('.modal-title').text(title);
                    modal.find('#modal_inner_insert_update').show();
                    modal.find('#modal_inner_delete').hide();
                } else if (option == "U") {
                    modal.find('#id_taxpayer').val(e_license_Taxpayer.id_zoning);
                    modal.find('#description').val(e_license_Taxpayer.description);
                    modal.find('#abbreviation').val(e_license_Taxpayer.abbreviation);
                    modal.find('#zone').val(e_license_Taxpayer.zone);
                    title = "Editar Solicitante";
                    modal.find('.modal-title').text(title);
                    modal.find('#modal_inner_insert_update').show();
                    modal.find('#modal_inner_delete').hide();
                } else if (option == "D") {
                    modal.find('#id_taxpayer').val(e_license_Taxpayer.id_zoning);
                    modal.find('#txt_zoning_description').text(e_license_Taxpayer.description);
                    modal.find('#txt_zoning_abbreviation').text(e_license_Taxpayer.abbreviation);
                    var title = "Eliminar Solicitante";
                    modal.find('.modal-title').text(title);
                    modal.find('#modal_inner_insert_update').hide();
                    modal.find('#modal_inner_delete').show();
                }

                modal.find('#btn_save_Taxpayer').click(function () {
                    var e_license_Taxpayer = {
                        option_value: option,
                        id_taxpayer: modal.find('#id_zoning').val(),
                        description: modal.find('#description').val(),
                        abbreviation: modal.find('#abbreviation').val(),
                        zone: modal.find('#zone').val(),
                        state: 1
                    };
                    console.log(e_license_Taxpayer);
                    dsh.SET_Zoning(e_license_Taxpayer, title, option);
                });
            });

        },

        CreateGrid() {

            ej.base.enableRipple(true);
            GridTaxpayer = new ej.grids.Grid({
                dataSource: {},
                height: 250,
                allowPaging: true,
                pageSettings: { pageCount: 5, pageSize: 9999 },
                enableCollapseAll: true,
                treeColumnIndex: 0,
                allowExcelExport: true,
                allowSorting: true,
                allowTextWrap: true,
                columns: [
                    { field: 'company_name', headerText: 'Nombres/Razón Social', textAlign: 'Left', width: '140' },
                    { field: 'agent_dni', headerText: 'N° DNI / N° C.E.', textAlign: 'Left', width: 'auto' },
                    { field: 'ruc', headerText: 'N° RUC', textAlign: 'Left', width: 'auto' },
                    { field: 'address', headerText: 'Dirección', textAlign: 'Left', width: 'auto' },
                    //{ field: 'agent_fullname', headerText: 'fullname', textAlign: 'Left', width: 'auto' },
                    {
                        headerText: 'Opciones', width: '120', commands: [
                            {
                                buttonOption: {
                                    content: 'Editar',
                                    cssClass: 'e-link btn-data',
                                    click: function (args) {                       
                                        var index = $(args.target).parent().parent().attr('index');
                                        var item = GridTaxpayer.currentViewData[index];

                                        $(".btn-data").data("option", "U");
                                        $(".btn-data").data("e_license_Taxpayer", item);
                                        $("#modal_Taxpayer").modal('show');
                                    }
                                }
                            }, {
                                buttonOption: {
                                    content: '(+) Declaración',
                                    cssClass: 'e-link btn-data',
                                    click: function (args) {                                       

                                        var index = $(args.target).parent().parent().attr('index');
                                        var item = GridTaxpayer.currentViewData[index];

                                        //$(".btn-data").data("option", "U");

                                        console.log(URL_Index_Affidavit + '/index/' + item.id_taxpayer);
                                        window.location = URL_Index_Affidavit + '/index/' + item.id_taxpayer;
                                        
                                        //<li id="Affidavit">
                                        //    <a href='@Url.Action("Index", "Affidavit")' class="ajaxAQO"><i class="fa fa-list"></i> <span class="nav-label">Solicitud de licencia</span></a>
                                        //</li>
                                    }
                                }
                            }
                        ]
                    }
                ]

            });
            GridTaxpayer.appendTo("#Grid_Taxpayer");
            GridTaxpayer.refresh();

            dsh.GET_All_Taxpayer();
        },

        GET_All_Taxpayer() {

            $.ajaxAQO({
                cache: false,
                async: true,
                url: URL_GET_All_Taxpayer,
                type: "POST",
                dataType: 'json',
                contentType: "application/json;charset=UTF-8",
                data: JSON.stringify({
                    ParametroTaxpayer: {
                        valor: "Hola",
                    }
                }),
                beforeSend: function (data) {
                    $('#ibox_Taxpayer').children('.ibox-content').toggleClass('sk-loading');
                }
                , success: function (data) {
                    $('#ibox_Taxpayer').children('.ibox-content').toggleClass('sk-loading');
                    if (data.status) {
                        GridTaxpayer.dataSource = (data.value);
                        GridTaxpayer.refresh();
                    }
                    else {
                        swal({
                            title: "",
                            text: data.value,
                            type: "warning",
                            showCancelButton: false,
                            confirmButtonText: "OK",
                        });
                    }
                }, error: function (jqXHR, exception) {
                    console.log(jqXHR);
                    console.log(exception);
                }
            });
        },        

        GET_Taxpayer(id_taxpayer_in, index) {
            $.ajaxAQO({
                cache: false,
                async: true,
                url: URL_GET_Taxpayer,
                type: "POST",
                dataType: 'json',
                contentType: "application/json;charset=UTF-8",
                data: JSON.stringify({
                    ParametroTaxpayer: {
                        id_taxpayer: id_taxpayer_in,
                    }
                }),
                beforeSend: function (data) {
                    dsh.Clear_Input();
                    $('#ibox_Taxpayer').children('.ibox-content').toggleClass('sk-loading');
                },
                success: function (data) {
                    $('#ibox_Taxpayer').children('.ibox-content').toggleClass('sk-loading');


                    if (data.status) { 

                        $('#m_tax_payer').modal({
                            show: true,
                            data: { option: "U" }
                        }); 
                    }
                    else {
                        swal({
                            title: "error",
                            text: data.value,
                            type: "warning",
                            showCancelButton: false,
                            confirmButtonText: "OK",
                        });
                    }
                },
                error: function (jqXHR, exception) {
                    console.log(jqXHR);
                    console.log(exception);
                }
            });
        },

        SET_Taxpayer() {

            $.ajaxAQO({
                url: URL_SET_Taxpayer,
                data: JSON.stringify({
                    option_value: "I",
                    Contrasenia: $("#Contrasenia").val()
                }),
                type: "POST",
                cache: false,
                async: true,
                contentType: "application/json;charset=UTF-8",
                datatype: "json",
                beforeSend: function (data) {

                },
                success: function (data) {

                    if (data.status == true) {

                    }
                    else {
                        swal({
                            title: "Contribuyente",
                            text: data.value,
                            type: "warning",
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
        },
    }
    dsh.init();
});