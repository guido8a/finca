<%@ page import="finca.DetalleOrden" %>
<div role="main" style="margin-top: 10px;">
    <table class="table table-bordered table-striped table-condensed table-hover">
        <thead>
        <tr>
            <th style="width: 6%">Semana</th>
            <th style="width: 21%">Producto</th>
            <th style="width: 6%">Size</th>
            <th style="width: 6%">Units</th>
            <th style="width: 6%">Weight</th>
            <th style="width: 8%">Packing</th>
            <th style="width: 8%">Brand</th>
            <th style="width: 8%">Order</th>
            <th style="width: 8%">Estimated</th>
            <th style="width: 6%">Difference</th>
            <th style="width: 6%">Total</th>
            <th style="width: 11%">Acciones</th>
        </tr>
        </thead>
    </table>
</div>

<g:if test="${detalle.size() > 0}">
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="margin-top: -20px">
        <g:each in="${detalle}" var="dt" status="k">
            <g:set var="total" value="${0}" />
            <div class="panel">
                <div class="dt-orden" role="tab" id="headingComp${k + 1}">
                    <h4 class="panel-title" data-toggle="collapse" data-parent="#accordion" href="#componente${k + 1}"
                        aria-expanded="false" aria-controls="componente${k + 1}" style="font-weight: normal">
                            <table class="" style="width: 100%">
                                <tbody>
                                <tr data-id="${dt.dtor__id}" class="${dt?.dtoretdo == '1' ? 'registrado' : ''}">
                                    <td style="width: 6%">${dt?.smnanmro}</td>
                                    <td style="width: 21%; text-align: left">${dt?.prodnmbr} ${dt?.dtoretdo}</td>
                                    <td style="width: 6%; text-align: center">${dt?.prodsize}</td>
                                    <td style="width: 6%; text-align: center">${dt?.produnbx}</td>
                                    <td style="width: 6%; text-align: center">${dt?.prodpeso}</td>
                                    <td style="width: 8%; text-align: center">${dt?.prodpack}</td>
                                    <td style="width: 6%; text-align: center">${dt?.prodbrnd}</td>
                                    <td style="width: 8%; text-align: center">${dt?.dtorcntd}</td>
                                    <td style="width: 8%; text-align: center">${dt?.dtorestd}</td>
                                    <td style="width: 6%; text-align: center">${dt?.dtordiff}</td>
                                    <td style="width: 6%; text-align: center">${dt?.dtortotl}</td>
                                    <td style="width: 11%; text-align: right">
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
                                </tbody>
                            </table>
                    </h4>
                </div>

                <div id="componente${k + 1}" class="panel-collapse collapse " role="tabpanel" aria-labelledby="headingComp${k + 1}">
                    <table class="table table-bordered table-condensed table-hover">
                        <thead>
                        <tr style="width: 100%">
                            <th style="width: 14%">Finca</th>
                            <th style="width: 14%">Producto</th>
                            <th style="width: 8%">Size</th>
                            <th style="width: 8%">Units</th>
                            <th style="width: 8%">Weight</th>
                            <th style="width: 8%">Packing</th>
                            <th style="width: 8%">Brand</th>
                            <th style="width: 8%">Distribuido</th>
                            <th style="width: 8%">Estimado</th>
                            <th style="width: 8%">Diferencia</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:set var="dist" value="${finca.DetalleFinca.findAllByDetalleOrden(finca.DetalleOrden.get(dt?.dtor__id))}"/>
                        <g:if test="${dist.size() > 0}">
                            <g:each in="${dist}" var="detalle">
                                <tr>
                                    <td style="width: 14%">${detalle?.finca?.nombre}</td>
                                    <td style="width: 14%">${detalle?.detalleOrden?.producto?.nombre}</td>
                                    <td style="width: 8%">${detalle?.detalleOrden?.producto?.size}</td>
                                    <td style="width: 8%">${detalle?.detalleOrden?.producto?.unindadesCaja}</td>
                                    <td style="width: 8%">${detalle?.detalleOrden?.producto?.peso}</td>
                                    <td style="width: 8%">${detalle?.detalleOrden?.producto?.empaque}</td>
                                    <td style="width: 8%">${detalle?.detalleOrden?.producto?.marca}</td>
                                    <td style="width: 8%">${detalle?.cantidad}</td>
                                    <td style="width: 8%">${detalle?.estimado}</td>
                                    <td style="width: 8%">${detalle?.diferencia}</td>
                                </tr>
                            </g:each>
                        </g:if>
                        <g:else>
                            <tr>
                                <td class="text-center" colspan="10">
                                    <i class="fa fa-exclamation-triangle text-info fa-3x"></i> <strong style="font-size: 14px"> No se encontraron registros que mostrar </strong>
                                </td>
                            </tr>
                        </g:else>
                        </tbody>
                    </table>
                </div>
            </div>
        </g:each>
    </div>
</g:if>
<g:else>
    <div class="alert alert-warning" style="text-align: center; font-size: 14px"><i class="fa fa-exclamation-triangle fa-3x text-info"></i>
        No existen datos para la semana <strong>${smna?.numero}</strong> </div>
</g:else>

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