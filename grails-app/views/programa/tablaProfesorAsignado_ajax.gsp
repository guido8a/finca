<g:if test="${dicta}">
    <div role="main" style="margin-top: 10px;">
        <table class="table table-bordered table-striped table-condensed table-hover">
            <thead>
            <tr>
                <th style="width: 45%">Apellido</th>
                <th style="width: 45%">Nombre</th>
                <th style="width: 10%">Acciones</th>
            </tr>
            </thead>

            <tbody>
            <tr >
                <td style="width: 45%">${dicta?.profesor?.apellido}</td>
                <td style="width: 45%">${dicta?.profesor?.nombre}</td>
                <td style="width: 10%; text-align: center">
                    <a href="#" class="btn btn-danger btn-xs btnBorrarProfesor" data-id="${dicta.id}" title="Borrar">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>

            </tbody>
        </table>
    </div>
</g:if>
<g:else>
    <div class="alert alert-warning" style="text-align: center; font-size: 14px">
        <i class="fa fa-exclamation-triangle fa-3x text-info"></i> No existe profesor asignado para: <br>
        <strong>${paralelo?.nivel?.descripcion + " - " + paralelo?.numero + " , "  + asignatura?.nombre}</strong>
    </div>
</g:else>

<script type="text/javascript">

    $(".btnBorrarProfesor").click(function () {
        var id = $(this).data("id");
        deleteProfesor(id);
    });

    function deleteProfesor(itemId) {
        bootbox.dialog({
            title: "Alerta",
            message: "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>" +
                "¿Está seguro que desea quitar al profesor asignado?.</p>",
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
                            url: '${createLink(controller: 'programa', action:'deleteProfesor_ajax')}',
                            data: {
                                id: itemId
                            },
                            success: function (msg) {
                                var parts =  msg.split("_");
                                if (parts[0] === 'ok') {
                                    log(parts[1], "success");
                                    cargarTablaProfesor();
                                    cargaTabla($("#paralelo option:selected").val(), $("#asignatura option:selected").val());
                                } else {
                                    log(parts[1], "error")
                                }
                            }
                        });
                    }
                }
            }
        });
    }

</script>
