<div role="main" style="margin-top: 10px;">
    <table class="table table-bordered table-striped table-condensed table-hover">
        <thead>
        <tr>
            <th style="width: 10%">Período</th>
            <th style="width: 24%">Asignatura</th>
            <th style="width: 20%">Observaciones</th>
            <th style="width: 20%">Profesor</th>
            <th style="width: 8%">Horas</th>
            <th style="width: 8%">Total</th>
            <th style="width: 10%">Acciones</th>
        </tr>
        </thead>
    </table>
</div>

<div class="" style="width: 99.7%;height: 600px; overflow-y: auto;float: right; margin-top: -20px">
    <table class="table-bordered table-striped table-condensed table-hover" style="width: 100%">
        <tbody>
        <g:if test="${gestiones.size() > 0}">
            <g:set var="total" value="${0}" />

            <g:each in="${gestiones}" status="i" var="gestion">
                <tr data-id="${gestion.id}">
                    <td style="width: 10%">${gestion?.periodo?.descripcion} ${gestion?.periodo?.id}</td>
                    <td style="width: 24%; text-align: left">${gestion?.asignatura?.nombre}</td>
                    <td style="width: 20%; text-align: left">${gestion?.observaciones}</td>
                    <td style="width: 20%; text-align: left">${gestion?.profesor?.apellido + " " + gestion?.profesor?.nombre}</td>
                    <td style="width: 8%">${gestion?.hora}</td>
                    <td style="width: 8%">${gestion?.horas}</td>
                    <td style="width: 10%">
                        <a href="#" class="btn btn-success btn-xs btnEditarGestion" title="Editar" data-id="${gestion.id}"
                           data-prof="${gestion?.profesor?.id}" data-asig="${gestion?.asignatura?.id}" data-hora="${gestion?.hora}">
                            <i class="fa fa-edit"></i>
                        </a>
                        <a href="#" class="btn btn-danger btn-xs btnBorrarGestion" data-id="${gestion.id}" title="Borrar">
                            <i class="fa fa-trash"></i>
                        </a>
                        <a href="#" class="btn btn-info btn-xs btnObservacionGestion" data-id="${gestion.id}" title="Observaciones">
                            <i class="fa fa-book"></i>
                        </a>
                    </td>
                </tr>

                <g:set var="total" value="${total += (gestion.horas ?: 0)}" />

            </g:each>

            <tr id="divTotales" style="background-color: #89b674" data-valor="${total}">

            </tr>

        </g:if>
        <g:else>
            <div class="alert alert-warning" style="text-align: center; font-size: 14px"><i class="fa fa-exclamation-triangle fa-3x text-info"></i>
                No existen datos para el período <strong>${periodo?.descripcion}</strong> </div>
        </g:else>
        </tbody>
    </table>
</div>

<script type="text/javascript">

    cargarTotales();

    function cargarTotales(){
        var total = '${total}';
        $.ajax({
           type: 'POST',
           url: '${createLink(controller: 'programa', action: 'tablaTotales_ajax')}',
           data:{
               total:total
           },
           success:function (msg) {
               $("#divTotales").html(msg)
           } 
        });
    }

    $(".btnEditarGestion").click(function () {
        var id = $(this).data("id");
        var profesor = $(this).data("prof");
        var asignatura = $(this).data("asig");
        var hora = $(this).data("hora");

        $("#idGestion").val(id);
        $("#profesor").val(profesor);
        $("#asignatura").val(asignatura);
        $("#hora").val(hora);

        $("#divBoton").addClass("hide");
        $("#divBoton2").removeClass("hide");
    });

    $(".btnBorrarGestion").click(function () {
        var id = $(this).data("id");
        borrarGestion(id);
    });

    $(".btnObservacionGestion").click(function () {
        var id = $(this).data("id");
        $.ajax({
            type    : "POST",
            url: "${createLink(action:'observaciones_ajax')}",
            data    : {
                id: id
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgObservaciones",
                    title   : "Observaciones",
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
                                return submitFormObservaciones();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    });

    function submitFormObservaciones() {
        var $form = $("#frmObservaciones");
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
                        cargarTablaGestion();
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


</script>