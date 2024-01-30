<div role="main" style="margin-top: 10px;">
    <table class="table table-bordered table-striped table-condensed table-hover">
        <thead>
        <tr>
            <th style="width: 20%">Semana</th>
            <th style="width: 34%">Producto</th>
            <th style="width: 10%">Orden</th>
            <th style="width: 10%">Estimado</th>
            <th style="width: 8%">Diferencia</th>
            <th style="width: 8%">Total</th>
            <th style="width: 10%">Acciones</th>
        </tr>
        </thead>
    </table>
</div>

<div class="" style="width: 99.7%;height: 600px; overflow-y: auto;float: right; margin-top: -20px">
    <table class="table-bordered table-striped table-condensed table-hover" style="width: 100%">
        <tbody>
        <g:if test="${detalle.size() > 0}">
            <g:set var="total" value="${0}" />

            <g:each in="${detalle}" status="i" var="dt">
                <tr data-id="${dt.id}">
                    <td style="width: 20%">(${dt?.orden.semana?.numero}) ${dt?.orden?.semana?.fechaInicio?.format('dd-MM-yyyy')} - ${dt?.orden?.semana?.fechaFin?.format('dd-MM-yyyy')}</td>
                    <td style="width: 34%; text-align: left">${dt?.producto?.nombre}</td>
                    <td style="width: 10%; text-align: left">${dt?.cantidad}</td>
                    <td style="width: 10%; text-align: left">${dt?.cantidad}</td>
                    <td style="width: 8%">${dt?.cantidad}</td>
                    <td style="width: 8%">${dt?.cantidad}</td>
                    <td style="width: 10%">
                        <a href="#" class="btn btn-success btn-xs btnEditarOrden" title="Editar" data-id="${dt.id}"
                           data-prod="${dt?.producto?.id}" data-cntd="${dt?.cantidad}">
                            <i class="fa fa-edit"></i>
                        </a>
                        <a href="#" class="btn btn-danger btn-xs btnBorrarOrden" data-id="${dt.id}"
                           data-producto="${dt?.producto?.nombre}" title="Borrar">
                            <i class="fa fa-trash"></i>
                        </a>
                        <a href="#" class="btn btn-info btn-xs btnObservacionOrden" data-id="${dt.id}" title="Observaciones">
                            <i class="fa fa-book"></i>
                        </a>
                    </td>
                </tr>

                <g:set var="total" value="${total += (dt.cantidad ?: 0)}" />

            </g:each>

            <tr id="divTotales" style="background-color: #89b674" data-valor="${total}">

            </tr>

        </g:if>
        <g:else>
            <div class="alert alert-warning" style="text-align: center; font-size: 14px"><i class="fa fa-exclamation-triangle fa-3x text-info"></i>
                No existen datos para la semana <strong>${smna?.numero}</strong> </div>
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

    $(".btnEditarOrden").click(function () {
        var id = $(this).data("id");
        var prod = $(this).data("prod");
        var cntd = $(this).data("cntd");

        $("#idOrden").val(id);
        $("#producto").val(prod);
        $("#cantidad").val(cntd);

        $("#divBoton").addClass("hide");
        $("#divBoton2").removeClass("hide");
    });

    $(".btnBorrarOrden").click(function () {
        var id = $(this).data("id");
        var producto = $(this).data("producto");
        borrarProducto(id, producto);
    });

    $(".btnObservacionOrden").click(function () {
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
                        bootbox.alert('<i class="fa fa-exclamation-triangle text-danger fa-3x"></i> ' +
                            '<strong style="font-size: 14px">' + parts[1] + '</strong>');
                        return false;
                    }
                }
            });
        } else {
            return false;
        }
    }


</script>