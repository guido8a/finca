<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de Productos</title>
</head>

<body>

<!-- botones -->
<div class="btn-toolbar toolbar">
    <div class="btn-group">
        <a href="#" class="btn btn-info btnCrear">
            <i class="fa fa-file"></i> Nuevo producto
        </a>
    </div>
</div>


<div class="btn-toolbar toolbar" style="margin-top: 10px">
    <div class="col-md-12">
        <label for="familia" class="col-md-1 control-label text-info" style="text-align: right">
            Familia
        </label>
        <div class="col-md-3">
            <g:select name="familia" from="${finca.Familia.list([sort: 'descripcion'])}" optionKey="id" optionValue="descripcion" class="form-control" noSelection="${[null: 'Todas']}" />
        </div>
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
        <th style="width: 20%">Nombre</th>
        <th style="width: 20%">Descripción</th>
        <th style="width: 10%">Sku</th>
        <th style="width: 10%">Calibre</th>
        <th style="width: 10%">Size</th>
        <th style="width: 10%">Unidades</th>
        <th style="width: 10%">Peso</th>
        <th style="width: 10%">Acciones</th>
    </tr>
    </thead>
</table>

<div id="divProducto">

</div>


<script type="text/javascript">
    var id = null;

    $(".btnLimpiar").click(function ( ) {
        cargarTablaProducto('');
        $("#nombre").val('');
        $("#familia").val('null');
    });

    $(".btnBuscar").click(function () {
        cargarTablaProducto($("#nombre").val(), $("#familia option:selected").val());
    });

    cargarTablaProducto($("#nombre").val(), $("#familia option:selected").val());

    function cargarTablaProducto(nombre, familia){
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'producto', action:'tablaProductos_ajax')}",
            data: {
                nombre: nombre,
                familia: familia
            },
            success: function (msg) {
                $("#divProducto").html(msg);
            } //success
        });
    }

    function createEditRowProducto(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? {id: id} : {};
        $.ajax({
            type    : "POST",
            url: "${createLink(controller: 'producto', action:'form_ajax')}",
            data    : data,
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Producto",
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
                                return submitFormProducto();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    function submitFormProducto() {
        var $form = $("#frmProducto");
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
                        cargarTablaProducto($("#nombre").val(), $("#familia option:selected").val());
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
                                    cargarTablaProducto($("#nombre").val(), $("#familia option:selected").val());
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
        createEditRowProducto();
        return false;
    });

</script>

</body>
</html>
>