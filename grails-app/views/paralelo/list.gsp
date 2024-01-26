<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de Paralelos</title>
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
            <i class="fa fa-clipboard-list"></i> Nuevo Paralelo
        </a>
    </div>
</div>


<div class="btn-toolbar toolbar" style="margin-top: 10px">
    <div class="col-md-12">
        <label for="periodo" class="col-md-1 control-label text-info" style="text-align: right">
            Período
        </label>
        <div class="col-md-2">
            <g:select name="periodo" from="${tutor.Periodo.list([sort: 'descripcion'])}"
                      class="form-control input-sm" optionValue="descripcion" optionKey="id"
            />
        </div>
        <label for="carrera" class="col-md-1 control-label text-info" style="text-align: right">
            Carrera
        </label>
        <div class="col-md-4">
            <g:select name="carrera" from="${tutor.Carrera.list([sort: 'nombre'])}"
                      class="form-control input-sm" optionValue="nombre" optionKey="id"
            />
        </div>
        <label for="nivel" class="col-md-1 control-label text-info" style="text-align: right">
            Nivel
        </label>
        <div class="col-md-2">
            <g:select name="nivel" from="${tutor.Nivel.list([sort: 'numero'])}"
                      class="form-control input-sm" optionValue="descripcion" optionKey="id"
            />
        </div>
%{--        <div class="col-md-1">--}%
%{--            <a href="#" class="btn btn-success btnBuscar">--}%
%{--                <i class="fa fa-search"></i>--}%
%{--            </a>--}%
%{--        </div>--}%
    </div>
</div>


<table class="table table-condensed table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th style="width: 15%">Período</th>
        <th style="width: 30%">Carrera</th>
        <th style="width: 15%">Nivel</th>
        <th style="width: 10%">Paralelo</th>
        <th style="width: 10%">Número de estudiantes</th>
        <th style="width: 10%">Cupo</th>
        <th style="width: 15%">Acciones</th>
    </tr>
    </thead>
</table>

<div id="divParalelos">

</div>


<script type="text/javascript">
    var id = null;

    // $(".btnBuscar").click(function () {
    //     cargarTablaParalelos( $("#periodo option:selected").val(), $("#carrera option:selected").val(), $("#nivel option:selected").val());
    // });

    cargarTablaParalelos( $("#periodo option:selected").val(), $("#carrera option:selected").val(), $("#nivel option:selected").val());

    function cargarTablaParalelos(periodo, carrera, nivel){
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'paralelo', action:'tablaParalelos_ajax')}",
            data: {
                periodo: periodo,
                carrera: carrera,
                nivel: nivel
            },
            success: function (msg) {
                $("#divParalelos").html(msg);
            } //success
        });
    }

    $("#periodo").change(function () {
        var periodo = $(this).val();
        var carrera = $("#carrera option:selected").val();
        var nivel = $("#nivel option:selected").val();
        cargarTablaParalelos(periodo, carrera, nivel)
    });

    $("#carrera").change(function () {
        var carrera = $(this).val();
        var periodo = $("#periodo option:selected").val();
        var nivel = $("#nivel option:selected").val();
        cargarTablaParalelos(periodo, carrera, nivel)
    });


    $("#nivel").change(function () {
        var nivel = $(this).val();
        var carrera = $("#carrera option:selected").val();
        var periodo = $("#periodo option:selected").val();
        cargarTablaParalelos(periodo, carrera, nivel)
    });

    function createEditRowParalelo(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? {id: id} : {};
        $.ajax({
            type    : "POST",
            url: "${createLink(controller: 'paralelo', action:'form_ajax')}",
            data    : data,
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Paralelo",
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
                                return submitFormParalelo();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    function submitFormParalelo() {
        var $form = $("#frmParalelo");
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
                        cargarTablaParalelos( $("#periodo option:selected").val());
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
                "¿Está seguro que desea eliminar el paralelo ? Esta acción no se puede deshacer.</p>",
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
                            url: '${createLink(controller: 'paralelo', action:'delete_ajax')}',
                            data: {
                                id: itemId
                            },
                            success: function (msg) {
                                db.modal("hide");
                                var parts = msg.split("_");
                                if (parts[0] === 'ok') {
                                    log(parts[1], "success");
                                    cargarTablaParalelos( $("#periodo option:selected").val());
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
        createEditRowParalelo();
        return false;
    });

</script>

</body>
</html>
