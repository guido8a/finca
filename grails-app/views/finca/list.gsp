<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de Fincas</title>
</head>

<body>

<!-- botones -->
<div class="btn-toolbar toolbar">
    <div class="btn-group">
        <a href="#" class="btn btn-info btnCrear">
            <i class="fa fa-file"></i> Nueva finca
        </a>
    </div>
</div>

<div class="btn-toolbar toolbar" style="margin-top: 10px">
    <div class="col-md-12">
        <label for="nombre" class="col-md-1 control-label text-info" style="text-align: right">
            Nombre
        </label>
        <div class="col-md-3">
            <g:textField name="nombre" class="form-control" />
        </div>
        <a href="#" class="btn btn-success btnBuscar">
            <i class="fa fa-search"></i> Buscar
        </a>
        <a href="#" class="btn btn-info btnLimpiar">
            <i class="fa fa-eraser"></i> Limpiar
        </a>
    </div>
</div>


<table class="table table-condensed table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th style="width: 30%">Nombre</th>
        <th style="width: 10%">RUC</th>
        <th style="width: 10%">Ciudad</th>
        <th style="width: 20%">Dirección</th>
        <th style="width: 10%">Teléfono</th>
        <th style="width: 10%">Mail</th>
        <th style="width: 10%">Acciones</th>
    </tr>
    </thead>
</table>

<div id="divFinca">

</div>


<script type="text/javascript">
    var id = null;

    $(".btnLimpiar").click(function ( ) {
        cargarTablaFinca('');
        $("#nombre").val('');
    });

    $(".btnBuscar").click(function () {
        cargarTablaFinca($("#nombre").val());
    });

    cargarTablaFinca($("#nombre").val());

    function cargarTablaFinca(nombre){
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'finca', action:'tablaFincas_ajax')}",
            data: {
                nombre: nombre
            },
            success: function (msg) {
                $("#divFinca").html(msg);
            } //success
        });
    }

    function createEditRowFinca(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? {id: id} : {};
        $.ajax({
            type    : "POST",
            url: "${createLink(controller: 'finca', action:'form_ajax')}",
            data    : data,
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Finca",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        },
                        guardar  : {
                            id        : "btnSave",
                            label     : "<i class='fa fa-save'></i> Guardar",
                            className : "btn-success",
                            callback  : function () {
                                return submitFormFinca();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    function submitFormFinca() {
        var $form = $("#frmFinca");
        if ($form.valid()) {
            var data = $form.serialize();
            var dialog = cargarLoader("Guardando...");
            $.ajax({
                type    : "POST",
                url     : $form.attr("action"),
                data    : data,
                success : function (msg) {
                    dialog.modal('hide');
                    var parts = msg.split("_");
                    if(parts[0] === 'ok'){
                        log(parts[1], "success");
                        cargarTablaFinca($("#nombre").val());
                    }else{
                        bootbox.alert('<i class="fa fa-exclamation-triangle text-danger fa-3x"></i> ' + '<strong style="font-size: 14px">' + parts[1] + '</strong>');
                        return false;
                    }
                }
            });
        } else {
            return false;
        }
    }

    function deleteRow(itemId) {
        bootbox.dialog({
            title: "Alerta",
            message: "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p style='font-size: 14px; font-weight: bold'>" +
                "¿Está seguro que desea eliminar este producto ? Esta acción no se puede deshacer.</p>",
            closeButton: false,
            buttons: {
                cancelar: {
                    label: "Cancelar",
                    className: "btn-primary",
                    callback: function () {
                    }
                },
                eliminar: {
                    label: "<i class='fa fa-trash'></i> Eliminar",
                    className: "btn-danger",
                    callback: function () {
                        var db= cargarLoader("Borrando...");
                        $.ajax({
                            type: "POST",
                            url: '${createLink(controller: 'producto', action:'delete_ajax')}',
                            data: {
                                id: itemId
                            },
                            success: function (msg) {
                                db.modal("hide");
                                var parts = msg.split("_");
                                if (parts[0] === 'ok') {
                                    log(parts[1], "success");
                                    cargarTablaFinca($("#nombre").val());
                                } else {
                                    bootbox.alert('<i class="fa fa-exclamation-triangle text-danger fa-3x"></i> ' + '<strong style="font-size: 14px">' + parts[1] + '</strong>');
                                }
                            }
                        });
                    }
                }
            }
        });
    }

    $(".btnCrear").click(function () {
        createEditRowFinca();
        return false;
    });

</script>

</body>
</html>
>