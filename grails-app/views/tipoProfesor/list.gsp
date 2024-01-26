<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Tipo Profesor</title>

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
            <i class="fa fa-clipboard-list"></i> Nuevo Tipo Profesor
        </a>
    </div>
</div>

<table class="table table-condensed table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th style="width: 10%">Id</th>
        <th style="width: 60%">Descripciòn</th>
        <th style="width: 30%">Acciones</th>
    </tr>
    </thead>
    <tbody>
    <g:if test="${tipoProfesores.size() > 0}">
        <g:each in="${tipoProfesores}" var="tipoProfesor">
            <tr data-id="${tipoProfesor?.id}">
                <td style="width: 10%">${tipoProfesor?.id}</td>
                <td style="width: 60%">${tipoProfesor?.descripcion}</td>
                <td style="width: 30%; text-align: center">
                    <a href="#" data-id="${tipoProfesor?.id}" class="btn btn-success btn-xs btn-edit btn-ajax" title="Editar">
                        <i class="fa fa-edit"></i>
                    </a>
                    <a href="#" data-id="${tipoProfesor?.id}" class="btn btn-danger btn-xs btn-borrar btn-ajax" title="Eliminar">
                        <i class="fa fa-trash"></i>
                    </a>
                    <a href="#" data-id="${tipoProfesor?.id}" class="btn btn-info btn-xs btn-show btn-ajax" title="Ver">
                        <i class="fa fa-search"></i>
                    </a>
                </td>
            </tr>
        </g:each>
    </g:if>
    <g:else>
        <tr>
            <td class="text-center" colspan="3">
                <i class="fa fa-exclamation-triangle text-info fa-3x"></i> <strong style="font-size: 14px"> No se encontraron registros que mostrar </strong>
            </td>
        </tr>
    </g:else>
    </tbody>
</table>


<script type="text/javascript">
    var id = null;

    function createEditRowTipoProfesor(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? {id: id} : {};
        $.ajax({
            type    : "POST",
            url: "${createLink(controller: 'tipoProfesor', action:'form_ajax')}",
            data    : data,
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Tipo Profesor",
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
                                return submitFormTipoProfesor();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    function submitFormTipoProfesor() {
        var $form = $("#frmtipoprofesor");
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
                        setTimeout(function () {
                            location.reload();
                        }, 800);
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
            "¿Está seguro que desea eliminar el Tipo de Profesor ? Esta acción no se puede deshacer.</p>",
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
                            url: '${createLink(controller: 'tipoProfesor', action:'delete_ajax')}',
                            data: {
                                id: itemId
                            },
                            success: function (msg) {
                                db.modal("hide");
                                if (msg === 'ok') {
                                    log("Borrado correctamente", "success");
                                    setTimeout(function () {
                                        location.reload();
                                    }, 800);
                                } else {
                                    log("Error al borrar el tipo de profesor", "error")
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
            type: "POST",
            url: "${createLink(controller: 'tipoProfesor', action:'form_ajax')}",
            data: data,
            success: function (msg) {
                var b = bootbox.dialog({
                    title: title + " tipoProfesor" ,
                    closeButton: false,
                    message: msg
                }); //dialog
                setTimeout(function () {
                    b.find(".form-control").first().focus()
                }, 500);
            } //success
        });
        //location.reload()//ajax
    } //createEdit


        $(".btnCrear").click(function () {
            createEditRowTipoProfesor();
            return false;
        });

        $(".btn-edit").click(function () {
            var id = $(this).data("id");
            createEditRowTipoProfesor(id);
        });
        $(".btn-borrar").click(function () {
            var id = $(this).data("id");
            deleteRow(id);
        });

        $(".btn-show").click(function () {
            var title = "Ver Profesor";
            var id = $(this).data("id");
            $.ajax({
                type: "POST",
                url: "${createLink(controller: 'tipoProfesor', action:'show_ajax')}",
                data: {id: id},
                success: function (msg) {
                    var b = bootbox.dialog({
                        title: title,
                        closeButton: false,
                        message: msg,
                        buttons: {
                            aceptar: {
                                label: "Aceptar",
                                className: "btn-primary",
                                callback: function () {
                                }
                            }
                        }
                    }); //dialog
                } //successJava
            });
        });

</script>

</body>
</html>
