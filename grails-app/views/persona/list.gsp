<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de Personas</title>
</head>

<body>

<!-- botones -->
<div class="btn-toolbar toolbar">
    <div class="btn-group">
        <a href="#" class="btn btn-info btnCrear">
            <i class="fa fa-user"></i> Nueva persona
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
        <label for="apellido" class="col-md-1 control-label text-info" style="text-align: right">
            Apellido
        </label>
        <div class="col-md-3">
            <g:textField name="apellido" class="form-control" />
        </div>
        <a href="#" class="btn btn-success btnBuscar">
            <i class="fa fa-search"></i> Buscar
        </a>

%{--        <a href="#" class="btn btn-warning btnEnviar">--}%
%{--            <i class="fa fa-envelope"></i> Enviar--}%
%{--        </a>--}%
    </div>
</div>


<table class="table table-condensed table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th style="width: 20%">Apellido</th>
        <th style="width: 20%">Nombre</th>
        <th style="width: 20%">Cédula</th>
        <th style="width: 10%">Cargo</th>
        <th style="width: 10%">Teléfono</th>
        <th style="width: 10%">Mail</th>
        <th style="width: 10%">Acciones</th>
    </tr>
    </thead>
</table>

<div id="divPersonas">

</div>


<script type="text/javascript">
    var id = null;

    $(".btnBuscar").click(function () {
        cargarTablaPersonas($("#nombre").val(), $("#apellido").val());
    });

    cargarTablaPersonas($("#nombre").val(), $("#apellido").val());

    function cargarTablaPersonas(nombre, apellido){
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'persona', action:'tablaPersonas_ajax')}",
            data: {
                nombre: nombre,
                apellido: apellido
            },
            success: function (msg) {
                $("#divPersonas").html(msg);
            } //success
        });
    }

    // $("#tipoProfesor").change(function () {
    //     var tipoProfesor = $(this).val();
    //     cargarTablaProfesores(tipoProfesor)
    // });

    function createEditRowPersona(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? {id: id} : {};
        $.ajax({
            type    : "POST",
            url: "${createLink(controller: 'persona', action:'form_ajax')}",
            data    : data,
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Persona",
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
                                return submitFormPersona();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    function submitFormPersona() {
        var $form = $("#frmPersona");
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
                        cargarTablaPersonas($("#nombre").val(), $("#apellido").val());
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
                "¿Está seguro que desea eliminar esta persona ? Esta acción no se puede deshacer.</p>",
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
                            url: '${createLink(controller: 'persona', action:'delete_ajax')}',
                            data: {
                                id: itemId
                            },
                            success: function (msg) {
                                db.modal("hide");
                                var parts = msg.split("_");
                                if (parts[0] === 'ok') {
                                    log(parts[1], "success");
                                    cargarTablaPersonas($("#nombre").val(), $("#apellido").val());
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
        createEditRowPersona();
        return false;
    });

    $(".btnEnviar").click(function () {
        $.ajax({
            type: "POST",
            url: '${createLink(controller: 'persona', action:'enviarCorreo')}',
            data: {
            },
            success: function (msg) {
                var parts = msg.split("_");
                if (parts[0] === 'ok') {
                    log(parts[1], "success");
                } else {
                    bootbox.alert('<i class="fa fa-exclamation-triangle text-danger fa-3x"></i> ' + '<strong style="font-size: 14px">' + parts[1] + '</strong>');
                }
            }
        });
    })

</script>

</body>
</html>
