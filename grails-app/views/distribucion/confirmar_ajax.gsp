<div class="row alert alert-info" style="margin-left: 10px; margin-right: 10px; font-size: 14px">
    <div class="col-md-4 show-label">
        Orden compra de SIIM para la semana:
    </div>
    <div class="col-md-2">
        <span >${detalle?.detalleOrden?.orden?.semana?.numero}</span>
    </div>
    <div class="col-md-2 show-label">
        Producto:
    </div>
    <div class="col-md-4">
        <span >${detalle?.detalleOrden?.producto?.nombre}</span>
    </div>
</div>

<div class="row" style="margin-left: 10px; margin-right: 10px; font-size: 14px">
    <div class="col-md-4 alert alert-info">
        <div class="col-md-2 show-label">
            Order:
        </div>
        <div class="col-md-2">
            <span >${detalle?.cantidad}</span>
        </div>
    </div>
    <div id="divEstimadoConfirmar">

    </div>
</div>

<div class="row" style="margin-left: 10px; margin-right: 10px; font-size: 14px">
    <div id="divFincas">

    </div>
    <div class="col-md-4">
        <div class="col-md-3 show-label">
            Estimado:
        </div>
        <div class="col-md-6">
            <span>
                <g:textField name="cantidadDistribuir" class="form-control" value="${detalle?.estimado ?: ''}"/>
            </span>
        </div>
    </div>
    <div class="col-md-1">
        <a href="#" class="btn btn-sm btn-success" id="btnAgregar">
            <i class="fa fa-plus"></i> Agregar
        </a>
    </div>
</div>

%{--<div class="row" style="margin-left: 10px; margin-right: 10px">--}%
%{--    <table class="table table-condensed table-bordered table-striped table-hover" style="margin-top: 10px">--}%
%{--        <thead>--}%
%{--        <tr>--}%
%{--            <th style="width: 14%">Finca</th>--}%
%{--            <th style="width: 14%">Producto</th>--}%
%{--            <th style="width: 8%">Size</th>--}%
%{--            <th style="width: 8%">Units</th>--}%
%{--            <th style="width: 8%">Weight</th>--}%
%{--            <th style="width: 8%">Packing</th>--}%
%{--            <th style="width: 8%">Brand</th>--}%
%{--            <th style="width: 8%">Cantidad</th>--}%
%{--            <th style="width: 8%">Estimado</th>--}%
%{--            <th style="width: 8%">Diferencia</th>--}%
%{--            <th style="width: 8%">Acciones</th>--}%
%{--        </tr>--}%
%{--        </thead>--}%
%{--    </table>--}%

%{--    <div id="divTablaDistribuir">--}%

%{--    </div>--}%
%{--</div>--}%

<script type="text/javascript">

    cargarEstimado();

    function cargarEstimado() {
        var id = '${detalle?.id}';
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'distribucion', action:'estimadoConfirmar_ajax')}",
            data: {
                id: id
            },
            success: function (msg) {
                $("#divEstimadoConfirmar").html(msg);
            } //success
        });
    }

    %{--cargarFincas();--}%

    %{--function cargarFincas() {--}%
    %{--    var id = '${detalle?.id}';--}%
    %{--    $.ajax({--}%
    %{--        type: "POST",--}%
    %{--        url: "${createLink(controller: 'orden', action:'fincas_ajax')}",--}%
    %{--        data: {--}%
    %{--            id: id--}%
    %{--        },--}%
    %{--        success: function (msg) {--}%
    %{--            $("#divFincas").html(msg);--}%
    %{--        } //success--}%
    %{--    });--}%
    %{--}--}%

    %{--cargarTablaDistribucion();--}%

    %{--function cargarTablaDistribucion() {--}%
    %{--    var id = '${detalle?.id}';--}%
    %{--    $.ajax({--}%
    %{--        type: "POST",--}%
    %{--        url: "${createLink(controller: 'orden', action:'tablaDistribuir_ajax')}",--}%
    %{--        data: {--}%
    %{--            id: id--}%
    %{--        },--}%
    %{--        success: function (msg) {--}%
    %{--            $("#divTablaDistribuir").html(msg);--}%
    %{--        } //success--}%
    %{--    });--}%
    %{--}--}%

    $("#btnAgregar").click(function () {
        var cantidad = $("#cantidadDistribuir").val();
        var dsfn = '${detalle?.id}';

        if(cantidad){
                var d = cargarLoader("Guardando...");
                $.ajax({
                    type    : "POST",
                    url     : "${createLink(controller: 'distribucion', action: 'saveConfirmar_ajax')}",
                    data    : {
                        id: dsfn,
                        cantidad: cantidad
                    },
                    success : function (msg) {
                        d.modal('hide');
                        var parts = msg.split("_");
                        if(parts[0] === 'ok'){
                            log(parts[1], "success");
                            cargarTablaOrden();
                            cargarEstimado();
                        }else{
                            bootbox.alert('<i class="fa fa-exclamation-triangle text-danger fa-3x"></i> ' + '<strong style="font-size: 14px">' + parts[1] + '</strong>');
                            return false;
                        }
                    }
                });
        }else{
            bootbox.alert('<i class="fa fa-exclamation-triangle text-danger fa-3x"></i> ' + '<strong style="font-size: 14px">' + "Ingrese la cantidad" + '</strong>');
            return false;
        }
    });

    function validarNum(ev) {
        /*
         48-57      -> numeros
         96-105     -> teclado numerico
         188        -> , (coma)
         190        -> . (punto) teclado
         110        -> . (punto) teclado numerico
         8          -> backspace
         46         -> delete
         9          -> tab
         37         -> flecha izq
         39         -> flecha der
         */
        return ((ev.keyCode >= 48 && ev.keyCode <= 57) ||
            (ev.keyCode >= 96 && ev.keyCode <= 105) ||
            ev.keyCode === 8 || ev.keyCode === 46 || ev.keyCode === 9 ||
            ev.keyCode === 37 || ev.keyCode === 39);
    }

    $("#cantidadDistribuir").keydown(function (ev) {
        return validarNum(ev);
    });


</script>