<%@ page import="tutor.Asignatura" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Asignaturas</title>

    <style type="text/css">
    .gestion > td {
        background-color: #e7ffe9;
        color: #0c5460;
    }

    .normal > td {
        background-color: #d7dff9;
        color: #0c3440;
    }
    </style>

</head>

<body>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<!-- botones -->
<div class="btn-toolbar toolbar col-md-2">
    <div class="btn-group">
        <g:link controller="inicio" action="index" class="btn btn-primary">
            <i class="fa fa-arrow-left"></i>
        </g:link>
    </div>

    <div class="btn-group">
        <a href="#" class="btn btn-info btnCrear">
            <i class="fa fa-clipboard-list"></i> Nueva Asignatura
        </a>
    </div>
</div>
<div class="col-md-6" style="background-color: #d8dbdf; padding-bottom: 10px">
    <div class="col-md-7" >
        <label class="control-label text-info">Carrera</label>
        <g:select name="carrera" class="col-md-12 form-control"
                  from="${tutor.Carrera.list([sort: 'nombre'])}" optionKey="id" optionValue="nombre" />
    </div>
    <div class="col-md-3" style="margin-left: -20px">
        <label class="control-label text-info">Nivel</label>
        <g:select name="nivel" class="form-control" from="${tutor.Nivel.list([sort: 'id'])}"
                  optionKey="id" optionValue="descripcion" />
    </div>
    <div class="col-md-2" style="margin-left: -20px">
        <label class="control-label text-info">Buscar</label>
        <button class="btn btn-info" id="btnBuscar"><i class="fa fa-search"></i> Asignaturas</button>
    </div>

    %{--<div class="col-md-2">--}%
        %{--<label class="control-label text-info">Buscar</label>--}%
        %{--<button class="btn btn-danger" id="btnBuscaGes"><i class="fa fa-search"></i>Gestión</button>--}%
    %{--</div>--}%

</div>
<div class="col-md-4" style="background-color: #ede4e3; padding-bottom: 10px">
    <div class="col-md-5">
        <label class="control-label">Criterio Global</label>
        <g:textField name="criterio" id="criterio" class="form-control" />
    </div>

    <div class="col-md-7">
        <label class="control-label">Buscar con Criterio Global</label><br>
        <button class="btn btn-info" id="btnBuscarGeneral"><i class="fa fa-search"></i> Asignaturas</button>
        <button class="btn btn-danger" id="btnBuscaGesGeneral"><i class="fa fa-search"></i> Gestión</button>
    </div>
</div>


%{--<div class="btn-toolbar toolbar alert" style="text-align: center">--}%
    %{--<div class="col-md-4" >--}%
        %{--<label class="control-label text-info">Carrera</label>--}%
        %{--<g:select name="carrera" class="col-md-12 form-control"--}%
                  %{--from="${tutor.Carrera.list([sort: 'nombre'])}" optionKey="id" optionValue="nombre" />--}%
    %{--</div>--}%
    %{--<div class="col-md-2" style="margin-left: -20px">--}%
        %{--<label class="control-label text-info">Nivel</label>--}%
        %{--<g:select name="nivel" class="form-control" from="${tutor.Nivel.list([sort: 'id'])}"--}%
                  %{--optionKey="id" optionValue="descripcion" />--}%
    %{--</div>--}%
    %{--<div class="col-md-1" style="margin-left: -20px">--}%
        %{--<label class="control-label text-info">Buscar</label>--}%
        %{--<button class="btn btn-info" id="btnBuscar"><i class="fa fa-search"></i> Asignaturas</button>--}%
    %{--</div>--}%

    %{--<div class="col-md-1">--}%
        %{--<label class="control-label text-info">Buscar</label>--}%
        %{--<button class="btn btn-danger" id="btnBuscaGes"><i class="fa fa-search"></i>Gestión</button>--}%
    %{--</div>--}%

    %{--<div class="col-md-2" style="margin-left: 40px">--}%
        %{--<label class="control-label">Criterio Global</label>--}%
        %{--<g:textField name="criterio" id="criterio" class="form-control" />--}%
    %{--</div>--}%
    %{--<div class="col-md-2" style="width: 240px; margin-left: -35px">--}%
        %{--<label class="control-label">Buscar con Criterio Global</label><br>--}%
        %{--<button class="btn btn-info" id="btnBuscarGeneral"><i class="fa fa-search"></i> Asignaturas</button>--}%
        %{--<button class="btn btn-danger" id="btnBuscaGesGeneral"><i class="fa fa-search"></i>Gestión</button>--}%
    %{--</div>--}%

%{--</div>--}%


<div role="main">
    <table class="table table-bordered table-striped table-condensed table-hover">
        <thead>
        <tr>
            <th style="width: 7%">Código</th>
            <th style="width: 25%">Asignatura</th>
            <th style="width: 23%">Carrera</th>
            <th style="width: 10%">Nivel</th>
            <th style="width: 5%">Créd.</th>
            <th style="width: 5%">Teór.</th>
            <th style="width: 5%">Práct.</th>
            <th style="width: 5%">Gest.</th>
            <th style="width: 15%">Acciones</th>
        </tr>
        </thead>
    </table>
</div>

<div id="divTablaAsignaturas">

</div>



<script type="text/javascript">
    var id = null;

    cargarTablaAsignaturas($("#carrera option:selected").val(), $("#nivel option:selected").val(), $("#criterio").val(), 1);


    function cargarTablaAsignaturas(carrera, nivel, criterio, tipo){
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'asignatura', action:'tablaAsignaturas_ajax')}",
            data: {
                carrera: carrera,
                nivel: nivel,
                criterio: criterio,
                tipo: tipo
            },
            success: function (msg) {
                $("#divTablaAsignaturas").html(msg);
            } //success
        });
    }

    function submitForm() {
        var $form = $("#frmAsignatura");
        var $btn = $("#dlgCreateEdit").find("#btnSave");
        $.ajax({
            type: "POST",
            url: $form.attr("action"),
            data: $form.serialize(),
            success: function (msg) {
                if (msg === 'ok') {
                    log("Asignatura guardada correctamente", "success");
                    cargarTablaAsignaturas($("#carrera option:selected").val(), $("#nivel option:selected").val(), $("#criterio").val(), 1);
                } else {
                    log("Error al guardar la asignatura", "error")
                }
            }
        });
    }

    function deleteRow(itemId) {
        bootbox.dialog({
            title: "Alerta",
            message: "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>" +
                "¿Está seguro que desea eliminar la asignatura seleccionada? Esta acción no se puede deshacer.</p>",
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
                        $.ajax({
                            type: "POST",
                            url: '${createLink(controller: 'asignatura', action:'delete_ajax')}',
                            data: {
                                id: itemId
                            },
                            success: function (msg) {
                                if (msg === 'ok') {
                                    log("Borrado correctamente", "success");
                                    cargarTablaAsignaturas($("#carrera option:selected").val(), $("#nivel option:selected").val(), $("#criterio").val(), 1);
                                } else {
                                    log("Error al borrar la asignatura", "error")
                                }
                            }
                        });
                    }
                }
            }
        });
    }

    function createEditRow(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? {id: id} : {};
        $.ajax({
            type    : "POST",
            url: "${createLink(controller: 'asignatura', action:'form_ajax')}",
            data    : data,
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Asignatura",
                    class: "modal-lg",
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
                                return submitFormAsignatura();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit


    function submitFormAsignatura() {
        var $form = $("#frmAsignatura");
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
                        cargarTablaAsignaturas($("#carrera option:selected").val(), $("#nivel option:selected").val(), $("#criterio").val(), 1);
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


    $(".btnCrear").click(function () {
        createEditRow();
        return false;
    });


    %{--function buscarAsignaturas(){--}%
    %{--    var d = cargarLoader("Cargando...");--}%
    %{--    var carrera = $('#buscarPor option:selected').val();--}%
    %{--    var nivel = $('#nivel option:selected').val();--}%
    %{--    var criterio = $('#criterioCriterio').val();--}%
    %{--    console.log('Buscar', carrera, nivel, criterio)--}%
    %{--    location.href = "${createLink(controller: 'asignatura', action:'list')}"--}%
    %{--        + "?carrera=" + carrera + "&nivel=" + nivel + "&criterio=" + criterio--}%
    %{--}--}%

    $("#btnBuscar").click(function () {
        var carrera = $('#carrera option:selected').val();
        var nivel = $('#nivel option:selected').val();
        cargarTablaAsignaturas(carrera, nivel, null, 1)
        // buscarAsignaturas();
    });

    $("#btnBuscaGes, #btnBuscaGesGeneral").click(function () {
        var criterio = $("#criterio").val();
        cargarTablaAsignaturas(null, null, criterio, 2);
        %{--var criterio = $('#criterioCriterio').val();--}%
        %{--console.log('BuscarGes', criterio)--}%
        %{--location.href = "${createLink(controller: 'asignatura', action:'list')}"--}%
        %{--    + "?criterioGes=" + criterio--}%
    });

    $("#btnBuscarGeneral").click(function () {
        var criterio = $("#criterio").val();
        cargarTablaAsignaturas(null, null, criterio, 1);
    })

</script>

</body>
</html>
