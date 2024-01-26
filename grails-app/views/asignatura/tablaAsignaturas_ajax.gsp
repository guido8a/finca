<div class="" style="width: 99.7%;height: 500px; overflow-y: auto;float: right; margin-top: -20px">
    <table class="table-bordered table-striped table-condensed table-hover" style="width: 100%">

        <tbody>
        <g:if test="${asignaturas?.size() > 0}">
            <g:each in="${asignaturas}" var="asignatura">
                <tr data-id="${asignatura?.id}">
                    <td style="width: 7%">${asignatura?.codigo}</td>
                    <td style="width: 25%">${asignatura?.nombre} (${asignatura?.id})</td>
                    <td style="width: 23%">${asignatura?.carrera?.nombre}</td>
                    <td style="width: 10%">${asignatura?.nivel?.descripcion}</td>
                    <td style="width: 5%">${asignatura?.creditos}</td>
                    <td style="width: 5%">${asignatura?.horasTeoria}</td>
                    <td style="width: 5%">${asignatura?.horasPractica}</td>
                    <td style="width: 5%">${asignatura?.horasGestion}</td>

                    <td style="width: 15%">
                        <a href="#" data-id="${asignatura?.id}" class="btn btn-success btn-xs btn-edit btn-ajax"
                           title="Editar">
                            <i class="fa fa-edit"></i>
                        </a>
                        <a href="#" data-id="${asignatura?.id}" class="btn btn-danger btn-xs btn-borrar btn-ajax"
                           title="Eliminar">
                            <i class="fa fa-trash"></i>
                        </a>
                        <a href="#" data-id="${asignatura?.id}" class="btn btn-info btn-xs btn-show btn-ajax" title="Ver">
                            <i class="fa fa-search"></i>
                        </a>
                        <g:if test="${asignatura?.tipoActividad?.descripcion == 'Académica'}">
                            <a href="#" data-id="${asignatura?.id}" class="btn btn-warning btn-xs btn-curso btn-ajax"
                               title="Programación académica">
                                <i class="fa fa-check"></i>
                            </a>
                        </g:if>
                    </td>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <tr>
                <td class="text-center" colspan="9">
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
        createEditRow(id);
    });

    $(".btn-borrar").click(function () {
        var id = $(this).data("id");
        deleteRow(id);
    });

    $(".btn-show").click(function () {
        var title = "Ver Asignatura";
        var id = $(this).data("id");
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'asignatura', action:'show_ajax')}",
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
                setTimeout(function () {
                    b.find(".form-control").first().focus()
                }, 500);
            } //successJava
        });
        //location.reload()//ajax
    });


    $(".btn-curso").click(function () {
        var id = $(this).data("id");
        location.href = "${createLink(controller: 'programa', action:'horario')}" + "?id=" + id
    });


</script>