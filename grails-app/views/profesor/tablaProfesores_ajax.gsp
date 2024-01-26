<div class="" style="width: 99.7%;height: 600px; overflow-y: auto;float: right; margin-top: -20px">
    <table class="table-bordered table-striped table-condensed table-hover" style="width: 100%">
        <tbody>
        <g:if test="${profesores.size() > 0}">
            <g:each in="${profesores}" var="profesor">
                <tr data-id="${profesor?.id}">
                    <td style="width: 20%">${profesor?.tipoProfesor?.descripcion}</td>
                    <td style="width: 20%">${profesor?.apellido}</td>
                    <td style="width: 20%">${profesor?.nombre}</td>
                    <td style="width: 13%">${profesor?.mail}</td>
                    <td style="width: 10%">${profesor?.extension}</td>
                    <td style="width: 7%; text-align: center">${profesor?.horas}</td>
                    <td style="width: 10%; text-align: center">
                        <a href="#" data-id="${profesor?.id}" class="btn btn-success btn-xs btn-edit btn-ajax" title="Editar">
                            <i class="fa fa-edit"></i>
                        </a>
                        <a href="#" data-id="${profesor?.id}" class="btn btn-danger btn-xs btn-borrar btn-ajax" title="Eliminar">
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
        createEditRowProfesor(id);
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
            url: "${createLink(controller: 'profesor', action:'show_ajax')}",
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