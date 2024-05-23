<%@ page import="finca.DetalleOrden" %>
<table class="table table-bordered table-striped table-condensed table-hover">
    <thead>
    <tr>
        <th style="width: 10%">Producto</th>
        <th style="width: 5%">Size</th>
        <th style="width: 5%">Units</th>
        <th style="width: 5%">Weight</th>
        <th style="width: 6%">Packing</th>
        <th style="width: 6%">Brand</th>
        <th style="width: 4%">Order</th>
        <th style="width: 5%">Estimated</th>
        <th style="width: 5%">Difference</th>
        <th style="width: 4%">Total</th>
        <th style="width: 5%">Acciones</th>
        <th style="width: 3%; background-color: white"></th>
        <g:each in="${finca.Finca.list().sort{it.nombre}}" var="finca">
            <th style="width: 6%">${finca?.nombre}</th>
        </g:each>
        <th style="width: 5%">Guardar</th>
    </tr>
    </thead>
</table>

<g:if test="${detalle.size() > 0}">
    <div style="margin-top: -20px">
        <g:each in="${detalle}" var="dt" status="k">
            <g:set var="total" value="${0}" />
            <table class="table-bordered table-striped table-condensed table-hover">
                <tbody>
                <tr data-id="${dt.dtor__id}" class="${dt?.dtoretdo == '1' ? 'registrado' : ''}">
                    <td style="width: 11%; text-align: left">${dt?.prodnmbr} ${dt?.dtoretdo}</td>
                    <td style="width: 5%; text-align: center">${dt?.prodsize}</td>
                    <td style="width: 5%; text-align: center">${dt?.produnbx}</td>
                    <td style="width: 5%; text-align: center">${dt?.prodpeso}</td>
                    <td style="width: 6%; text-align: center">${dt?.prodpack}</td>
                    <td style="width: 7%; text-align: center">${dt?.prodbrnd}</td>
                    <td style="width: 5%; text-align: center">${dt?.dtorcntd}</td>
                    <td style="width: 5%; text-align: center">${dt?.dtorestd}</td>
                    <td style="width: 5%; text-align: center">${dt?.dtordiff}</td>
                    <td style="width: 5%; text-align: center">${dt?.dtortotl}</td>
                    <td style="width: 6%; text-align: center">
                        <a href="#" class="btn btn-success btn-xs btnEditarOrden" title="Editar" data-id="${dt.dtor__id}"
                           data-prod="${dt?.prod__id}" data-cntd="${dt?.dtorcntd}" data-fam="${dt?.faml__id}">
                            <i class="fa fa-edit"></i>
                        </a>
                        <a href="#" class="btn btn-danger btn-xs btnBorrarOrden" data-id="${dt.dtor__id}"
                           data-producto="${dt?.prodnmbr}" title="Borrar">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                    <td style="width: 3%; background-color: white"></td>
                    <g:each in="${finca.Finca.list().sort{it.nombre}}" var="fincaTD" status="i">
                        <g:set var="distribuido" value="${finca.DetalleFinca.findByFincaAndDetalleOrden(fincaTD, DetalleOrden.get(dt?.dtor__id))}"/>
                        <td data-id="123">
                            <g:textField name="dist_${dt?.dtor__id}" id="${fincaTD?.id}_${dt?.dtor__id}_${distribuido?.id}"
                                         data-id="${fincaTD?.id}_${dt?.dtor__id}_${distribuido?.id}"  class="fincas_${dt?.dtor__id}"
                                         value="${distribuido ? distribuido?.cantidad : 0}" style="width: 45px" />
                        </td>
                    </g:each>
                    <td style="width: 5%" id="tdUltimo" data-v="${dt.dtor__id}">
                        <a href="#" class="btn btn-success btn-xs btnGuardarDistribucion" data-id="${dt.dtor__id}" title="Guardar">
                            <i class="fa fa-save"></i>
                        </a>
                    </td>
                </tr>
                </tbody>
            </table>
        </g:each>
    </div>
</g:if>
<g:else>
    <div class="alert alert-warning" style="text-align: center; font-size: 14px; margin-top: -20px"><i class="fa fa-exclamation-triangle fa-3x text-info"></i>
        No existen datos para la semana <strong>${smna?.numero}</strong> </div>
</g:else>

<script type="text/javascript">


    $(".btnGuardarDistribucion").click(function () {
        var id = $(this).data("id")

        // var hermanos = $(".fincas_" + id).data("id");

        $('.fincas_' + id).each(function() {
            var valor = this.value
            var todo = this.id
            var finca = todo.split("_")[0]
            var detalleOrden = todo.split("_")[1]
            var id = todo.split("_")[2]

            guardarValoresDistribucion(id, finca, detalleOrden, valor)
        });

    });

    // $(".fincas").click(function () {
    //     var data = $(this).data("id")
    //     console.log("clic: ", data)
    // });

    function guardarValoresDistribucion(id, finca, orden, valor){
        var d = cargarLoader("Guardando...");
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'orden', action: 'guardarDistribucion_ajax')}",
            data    : {
                id: id,
                finca: finca,
                orden: orden,
                valor: valor
            },
            success : function (msg) {
                d.modal('hide');
                var parts = msg.split("_");
                if(parts[0] === 'ok'){
                    log(parts[1], "success");
                }else{
                    bootbox.alert('<i class="fa fa-exclamation-triangle text-danger fa-3x"></i> ' +
                        '<strong style="font-size: 14px">' + parts[1] + '</strong>');
                    return false;
                }
            }
        });
    }


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