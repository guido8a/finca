<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de Profesores</title>
</head>

<body>

<!-- botones -->
<div class="btn-toolbar toolbar">
    <div class="btn-group">
        <g:link controller="inicio" action="index" class="btn btn-primary">
            <i class="fa fa-arrow-left"></i> Regresar
        </g:link>
    </div>

    <div class="btn-group">
        <a href="#" class="btn btn-info btnCrear">
            <i class="fa fa-clipboard-list"></i> Nuevo profesor
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
    </div>
</div>


<table class="table table-condensed table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th style="width: 20%">Tipo Profesor</th>
        <th style="width: 20%">Apellido</th>
        <th style="width: 20%">Nombre</th>
        <th style="width: 13%">Email</th>
        <th style="width: 10%">Teléfono</th>
        <th style="width: 7%">Horas</th>
        <th style="width: 10%">Acciones</th>
    </tr>
    </thead>
</table>

<div id="divProfesores">

</div>


<script type="text/javascript">
    var id = null;

    $(".btnBuscar").click(function () {
        cargarTablaProfesores($("#nombre").val(), $("#apellido").val());
    });

    cargarTablaProfesores($("#nombre").val(), $("#apellido").val());

    function cargarTablaProfesores(nombre, apellido){
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'profesor', action:'tablaProfesores_ajax')}",
            data: {
                nombre: nombre,
                apellido: apellido
            },
            success: function (msg) {
                $("#divProfesores").html(msg);
            } //success
        });
    }

    $("#tipoProfesor").change(function () {
        var tipoProfesor = $(this).val();
        cargarTablaProfesores(tipoProfesor)
    });

    function createEditRowProfesor(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? {id: id} : {};
        $.ajax({
            type    : "POST",
            url: "${createLink(controller: 'profesor', action:'form_ajax')}",
            data    : data,
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Profesor",
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
                                return submitFormProfesor();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    function submitFormProfesor() {
        var $form = $("#frmProfesor");
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
                        cargarTablaProfesores( $("#tipoProfesor option:selected").val());
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
                "¿Está seguro que desea eliminar este profesor ? Esta acción no se puede deshacer.</p>",
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
                            url: '${createLink(controller: 'profesor', action:'delete_ajax')}',
                            data: {
                                id: itemId
                            },
                            success: function (msg) {
                                db.modal("hide");
                                var parts = msg.split("_");
                                if (parts[0] === 'ok') {
                                    log(parts[1], "success");
                                    cargarTablaProfesores( $("#tipoProfesor option:selected").val());
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
        createEditRowProfesor();
        return false;
    });

</script>

</body>
</html>
