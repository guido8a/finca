<div class="" style="width: 99.7%;height: 600px; overflow-y: auto;float: right; margin-top: -20px">
    <table class="table-bordered table-striped table-condensed table-hover" style="width: 100%">
        <tbody>
        <g:if test="${personas.size() > 0}">
            <g:each in="${personas}" var="persona">
                <tr data-id="${persona?.id}">
                    <td style="width: 20%">${persona?.apellido}</td>
                    <td style="width: 20%">${persona?.nombre}</td>
                    <td style="width: 20%">${persona?.cedula}</td>
                    <td style="width: 10%">${persona?.cargo}</td>
                    <td style="width: 10%">${persona?.telefono}</td>
                    <td style="width: 10%">${persona?.mail}</td>
                    <td style="width: 10%; text-align: center">
                        <a href="#" data-id="${persona?.id}" class="btn btn-success btn-xs btn-edit btn-ajax" title="Editar">
                            <i class="fa fa-edit"></i>
                        </a>
                        <a href="#" data-id="${persona?.id}" class="btn btn-danger btn-xs btn-borrar btn-ajax" title="Eliminar">
                            <i class="fa fa-trash"></i>
                        </a>
                        <a href="#" data-id="${persona?.id}" class="btn btn-warning btn-xs btn-pefiles " title="Perfiles">
                            <i class="fa fa-bookmark"></i>
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
    $(".btn-pefiles").click(function () {
        var id = $(this).data("id");
        location.href="${createLink(controller: 'persona', action: 'config')}?id=" + id
    });

</script>