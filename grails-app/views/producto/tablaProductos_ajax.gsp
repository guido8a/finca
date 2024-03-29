<div class="" style="width: 99.7%;height: 600px; overflow-y: auto;float: right; margin-top: -20px">
    <table class="table-bordered table-striped table-condensed table-hover" style="width: 100%">
        <tbody>
        <g:if test="${productos.size() > 0}">
            <g:each in="${productos}" var="producto">
                <tr data-id="${producto?.id}">
                    <td style="width: 10%">${producto?.familia?.descripcion}</td>
                    <td style="width: 24%">${producto?.nombre}</td>
                    <td style="width: 24%">${producto?.descripcion}</td>
                    <td style="width: 8%">${producto?.calibre}</td>
                    <td style="width: 8%">${producto?.size}</td>
                    <td style="width: 8%">${producto?.unindadesCaja}</td>
                    <td style="width: 8%">${producto?.peso}</td>
                    <td style="width: 10%; text-align: center">
                        <a href="#" data-id="${producto?.id}" class="btn btn-success btn-xs btn-edit btn-ajax" title="Editar">
                            <i class="fa fa-edit"></i>
                        </a>
                        <a href="#" data-id="${producto?.id}" class="btn btn-danger btn-xs btn-borrar btn-ajax" title="Eliminar">
                            <i class="fa fa-trash"></i>
                        </a>
                        <a href="#" data-id="${producto?.id}" class="btn btn-info btn-xs btn-show " title="Mostrar">
                            <i class="fa fa-search-plus"></i>
                        </a>
                        <a href="#" data-id="${producto?.id}" class="btn btn-warning btn-xs btn-finca " title="Finca">
                            <i class="fa fa-building"></i>
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
        createEditRowProducto(id);
    });
    $(".btn-borrar").click(function () {
        var id = $(this).data("id");
        deleteRow(id);
    });

    $(".btn-show").click(function () {
        var title = "Ver Producto";
        var id = $(this).data("id");
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'producto', action:'show_ajax')}",
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
        //location.reload()//ajax
    });

    $(".btn-finca").click(function () {
        var title = "Producto x Finca";
        var id = $(this).data("id");
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'producto', action:'productosXfinca_ajax')}",
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
        //location.reload()//ajax
    });

</script>