<div role="main" style="margin-top: 10px;">
    <table class="table table-bordered table-striped table-condensed table-hover">
        <thead>
        <tr>
            <th style="width: 6%">Semana</th>
            <th style="width: 26%">Producto</th>
            <th style="width: 6%">Size</th>
            <th style="width: 6%">Units</th>
            <th style="width: 6%">Weight</th>
            <th style="width: 6%">Packing</th>
            <th style="width: 6%">Brand</th>
            <th style="width: 8%">Distribuido</th>
            <th style="width: 8%">Estimated</th>
            <th style="width: 6%">Difference</th>
            <th style="width: 6%">Total</th>
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
                <tr data-id="${dt.dtor__id}">
                    <td style="width: 6%">${dt?.smnanmro}</td>
                    <td style="width: 26%; text-align: left">${dt?.prodnmbr}</td>
                    <td style="width: 6%">${dt?.prodsize}</td>
                    <td style="width: 6%">${dt?.produnbx}</td>
                    <td style="width: 6%">${dt?.prodpeso}</td>
                    <td style="width: 6%">${dt?.prodpack}</td>
                    <td style="width: 6%">${dt?.prodbrnd}</td>
                    <td style="width: 8%; text-align: left">${dt?.dtordist}</td>
                    <td style="width: 8%; text-align: left">${dt?.dtorestd}</td>
                    <td style="width: 6%">${dt?.dtordiff}</td>
                    <td style="width: 6%">${dt?.dtortotl}</td>
                    <td style="width: 10%; text-align: center">
                        <g:if test="${finca.DetalleOrden.get(dt.dtor__id)?.estado != '1'}">
                            <a href="#" class="btn btn-success btn-xs btnConfirmarOrden" title="Confirmar" data-id="${dt.dtor__id}"
                               data-prod="${dt?.prod__id}" data-cntd="${dt?.dtorcntd}" data-fam="${dt?.faml__id}" data-dsfn="${dt?.dsfn__id}">
                                <i class="fa fa-check-circle"></i>
                            </a>
                        </g:if>
                        <g:else>
                            <span title="Orden ya se encuentra registrada"><i class="fa fa-exclamation-triangle text-danger fa-1x"></i>Registrada</span>
                        </g:else>
                    </td>
                </tr>

                <g:set var="total" value="${total += (dt.dtorcntd ?: 0)}" />

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

    var dcd;

    $(".btnConfirmarOrden").click(function () {
        var title = "Confirmación";
        var id = $(this).data("dsfn");
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'distribucion', action:'confirmar_ajax')}",
            data: {id: id},
            success: function (msg) {
                dcd = bootbox.dialog({
                    title: title,
                    closeButton: false,
                    class: "modal-lg",
                    message: msg,
                    // buttons: {
                    //     aceptar: {
                    //         label: "Aceptar",
                    //         className: "btn-primary",
                    //         callback: function () {
                    //         }
                    //     }
                    // }
                }); //dialog
            } //successJava
        });
        //location.reload()//ajax
    });

    function cerrarDialogoConfirmarDistribucion(){
        dcd.modal("hide");
    }


    // cargarTotales();

    %{--function cargarTotales(){--}%
        %{--var total = '${total}';--}%
        %{--$.ajax({--}%
           %{--type: 'POST',--}%
           %{--url: '${createLink(controller: 'programa', action: 'tablaTotales_ajax')}',--}%
           %{--data:{--}%
               %{--total:total--}%
           %{--},--}%
           %{--success:function (msg) {--}%
               %{--$("#divTotales").html(msg)--}%
           %{--} --}%
        %{--});--}%
    %{--}--}%

    $(".btnEditarOrden").click(function () {
        var id = $(this).data("id");
        var prod = $(this).data("prod");
        var cntd = $(this).data("cntd");
        var fam = $(this).data("fam");



        $("#idOrden").val(id);
        $("#familia").val(fam);
        cargaProducto(fam);

        setTimeout(function () {
            $("#producto").val(prod);
        }, 600);

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