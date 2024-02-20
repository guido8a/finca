<div role="main" style="margin-top: 10px;">
    <table class="table table-bordered table-striped table-condensed table-hover">
        <thead>
        <tr>
            <th style="width: 6%">Semana</th>
            <th style="width: 25%">Producto</th>
            <th style="width: 6%">Size</th>
            <th style="width: 6%">Units</th>
            <th style="width: 6%">Weight</th>
            <th style="width: 6%">Packing</th>
            <th style="width: 6%">Brand</th>
            <th style="width: 8%">Order</th>
            <th style="width: 8%">Estimated</th>
            <th style="width: 6%">Difference</th>
            <th style="width: 6%">Total</th>
            <th style="width: 11%">Acciones</th>
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
                <tr data-id="${dt.dtor__id}" class="${dt?.dtoretdo == '1' ? 'registrado' : ''}">
                    %{--<td style="width: 20%">(${dt?.orden.semana?.numero}) ${dt?.orden?.semana?.fechaInicio?.format('dd-MM-yyyy')} - ${dt?.orden?.semana?.fechaFin?.format('dd-MM-yyyy')}</td>--}%
                    <td style="width: 6%">${dt?.smnanmro}</td>
                    <td style="width: 25%; text-align: left">${dt?.prodnmbr} ${dt?.dtoretdo}</td>
                    <td style="width: 6%">${dt?.prodsize}</td>
                    <td style="width: 6%">${dt?.produnbx}</td>
                    <td style="width: 6%">${dt?.prodpeso}</td>
                    <td style="width: 6%">${dt?.prodpack}</td>
                    <td style="width: 6%">${dt?.prodbrnd}</td>
                    <td style="width: 8%; text-align: left">${dt?.dtorcntd}</td>
                    <td style="width: 8%; text-align: left">${dt?.dtorestd}</td>
                    <td style="width: 6%">${dt?.dtordiff}</td>
                    <td style="width: 6%">${dt?.dtortotl}</td>
                    <td style="width: 11%">
                        <g:if test="${finca.DetalleOrden.get(dt?.dtor__id)?.estado != '1'}">
                            <a href="#" class="btn btn-success btn-xs btnEditarOrden" title="Editar" data-id="${dt.dtor__id}"
                               data-prod="${dt?.prod__id}" data-cntd="${dt?.dtorcntd}" data-fam="${dt?.faml__id}">
                                <i class="fa fa-edit"></i>
                            </a>
                            <a href="#" class="btn btn-danger btn-xs btnBorrarOrden" data-id="${dt.dtor__id}"
                               data-producto="${dt?.prodnmbr}" title="Borrar">
                                <i class="fa fa-trash"></i>
                            </a>
                            <a href="#" class="btn btn-info btn-xs btnDistribucion" data-id="${dt.dtor__id}" title="Distribuir a fincas">
                                <i class="fa fa-random"></i>
                            </a>
                            <a href="#" class="btn btn-warning btn-xs btnRegistrar" data-id="${dt.dtor__id}" data-et="si" title="Registrar">
                                <i class="fa fa-lock"></i>
                            </a>
                        </g:if>
                        <g:else>
                            <a href="#" class="btn btn-info btn-xs btnRegistrar" data-id="${dt.dtor__id}" data-et="no" title="Quitar registro">
                                <i class="fa fa-lock"></i>
                            </a>
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


    $(".btnRegistrar").click(function () {
        var id = $(this).data("id");
        var et = $(this).data("et") === 'no' ? ' quitar el registro de ' : ' registrar ';

        bootbox.confirm({
            title: "Registro",
            message: '<i class="fa fa-exclamation-triangle text-info fa-3x"></i> <span style="font-size: 14px; font-weight: bold">Está seguro de' + et + 'esta orden de compra? </span> ',
            buttons: {
                cancel: {
                    label: '<i class="fa fa-times"></i> Cancelar',
                    className: 'btn-primary'
                },
                confirm: {
                    label: '<i class="fa fa-lock"></i> Aceptar',
                    className: 'btn-success'
                }
            },
            callback: function (result) {
                if(result){
                    $.ajax({
                        type: 'POST',
                        url: '${createLink(controller: 'orden', action: 'registrarOrden_ajax')}',
                        data:{
                            id: id
                        },
                        success: function (msg) {
                            var parts = msg.split("_");
                            if(parts[0] === 'ok'){
                                log(parts[1],"success");
                                cargarTablaOrden();
                                cancelarEdicion();
                            }else{
                                bootbox.alert('<i class="fa fa-exclamation-triangle text-danger fa-3x"></i> ' + '<strong style="font-size: 14px">' + parts[1] + '</strong>');
                                return false;
                            }
                        }
                    })
                }
            }
        });
    });


    $(".btnDistribucion").click(function () {
        var title = "Distribución por Finca";
        var id = $(this).data("id");
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'orden', action:'distribuir_ajax')}",
            data: {id: id},
            success: function (msg) {
                var b = bootbox.dialog({
                    title: title,
                    closeButton: false,
                    class: "modal-lg",
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