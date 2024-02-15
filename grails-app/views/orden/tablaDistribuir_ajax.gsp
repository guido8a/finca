<div class="" style="width: 99.7%;height: 200px; overflow-y: auto;float: right; margin-top: -20px">
    <table class="table-bordered table-striped table-condensed table-hover" style="width: 100%">
        <tbody>
        <g:if test="${detalles.size() > 0}">
            <g:each in="${detalles}" var="detalle">
                <tr>
                    <td style="width: 14%">${detalle?.finca?.nombre}</td>
                    <td style="width: 14%">${detalle?.detalleOrden?.producto?.nombre}</td>
                    <td style="width: 8%">${detalle?.detalleOrden?.producto?.size}</td>
                    <td style="width: 8%">${detalle?.detalleOrden?.producto?.unindadesCaja}</td>
                    <td style="width: 8%">${detalle?.detalleOrden?.producto?.peso}</td>
                    <td style="width: 8%">${detalle?.detalleOrden?.producto?.empaque}</td>
                    <td style="width: 8%">${detalle?.detalleOrden?.producto?.marca}</td>
                    <td style="width: 8%">${detalle?.cantidad}</td>
                    <td style="width: 8%">${detalle?.estimado}</td>
                    <td style="width: 8%">${detalle?.diferencia}</td>
                    <td style="width: 8%; text-align: center">
                        <a href="#" data-id="${detalle?.id}" class="btn btn-danger btn-xs btnBorrarDistribuir btn-ajax" title="Eliminar">
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

    function deleteRowD(itemId) {
        bootbox.dialog({
            title: "Alerta",
            message: "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p style='font-size: 14px; font-weight: bold'>" +
                "¿Está seguro que desea eliminar este registro ? Esta acción no se puede deshacer.</p>",
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
                            url: '${createLink(controller: 'orden', action:'borrarDistribuir_ajax')}',
                            data: {
                                id: itemId
                            },
                            success: function (msg) {
                                db.modal("hide");
                                var parts = msg.split("_");
                                if (parts[0] === 'ok') {
                                    log(parts[1], "success");
                                    cargarTablaDistribucion();
                                    cargarFincas();
                                    cargarEstimado();
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

    $(".btnBorrarDistribuir").click(function () {
        var id = $(this).data("id");
        deleteRowD(id)
    });

</script>