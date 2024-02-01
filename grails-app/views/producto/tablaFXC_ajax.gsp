<table class="table table-condensed table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th style="width: 30%">Producto</th>
        <th style="width: 20%">Finca</th>
        <th style="width: 35%">Etiqueta</th>
        <th style="width: 15%">Acciones</th>

    </tr>
    </thead>
</table>

<div class="" style="width: 99.7%;height: 200px; overflow-y: auto;float: right; margin-top: -20px">
<table class="table-bordered table-striped table-condensed table-hover" style="width: 100%">
    <tbody>
    <g:if test="${productos.size() > 0}">
        <g:each in="${productos}" var="producto">
            <tr data-id="${producto?.id}">
                <td style="width: 30%">${producto?.producto?.nombre}</td>
                <td style="width: 20%">${producto?.finca?.nombre}</td>
                <td style="width: 35%">${producto?.etiqueta}</td>
                <td style="width: 15%; text-align: center">
                    <a href="#" data-id="${producto?.id}" class="btn btn-success btn-xs btnEditarEtiqueta btn-ajax" title="Editar">
                        <i class="fa fa-edit"></i>
                    </a>
                    <a href="#" data-id="${producto?.id}" class="btn btn-danger btn-xs btnBorrarPxF btn-ajax" title="Eliminar">
                        <i class="fa fa-trash"></i>
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
</div>

<script type="text/javascript">

    $(".btnEditarEtiqueta").click(function () {
        var id = $(this).data("id");
        cargarFormEtiqueta(id)
    });

    $(".btnBorrarPxF").click(function () {
        var id = $(this).data("id");
        deleteRowPxF(id)
    });

    function deleteRowPxF(itemId) {
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
                            url: '${createLink(controller: 'producto', action:'deletePxF_ajax')}',
                            data: {
                                id: itemId
                            },
                            success: function (msg) {
                                db.modal("hide");
                                var parts = msg.split("_");
                                if (parts[0] === 'ok') {
                                    log(parts[1], "success");
                                    cargarFXC();
                                    cargarFincas();
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


</script>