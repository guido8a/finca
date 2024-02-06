<div class="" style="width: 99.7%;height: 200px; overflow-y: auto;float: right; margin-top: -20px">
    <table class="table-bordered table-striped table-condensed table-hover" style="width: 100%">
        <tbody>
        <g:if test="${detalles.size() > 0}">
            <g:each in="${detalles}" var="detalle">
                <tr>
                    <td style="width: 30%">${detalle?.finca?.nombre}</td>
                    <td style="width: 30%">${detalle?.detalleOrden?.producto?.nombre}</td>
                    <td style="width: 10%">${detalle?.cantidad}</td>
                    <td style="width: 10%">${detalle?.estimado}</td>
                    <td style="width: 10%">${detalle?.diferencia}</td>
                    <td style="width: 10%; text-align: center">
                        <a href="#" data-id="${detalle?.id}" class="btn btn-success btn-xs btn-edit btn-ajax" title="Editar">
                            <i class="fa fa-edit"></i>
                        </a>
                        <a href="#" data-id="${detalle?.id}" class="btn btn-danger btn-xs btn-borrar btn-ajax" title="Eliminar">
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

    $(".btn-edit").click(function () {
        var id = $(this).data("id");
        createEditRowPersona(id);
    });
    $(".btn-borrar").click(function () {
        var id = $(this).data("id");
        deleteRow(id);
    });

</script>