<%@ page import="finca.Familia; finca.Producto; finca.Semana; finca.Cliente" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Orden</title>

    <style type="text/css">
    .titl {
        font-family: 'open sans condensed';
        font-weight: bold;
        text-shadow: -2px 2px 1px rgba(0, 0, 0, 0.25);
        color: #0070B0;
        margin-top: 15px;
        text-align: center;
    }
    </style>

</head>

<body>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>


<div class="col-md-12">
    <div class="col-md-6">
        <h3 class="titl" style="text-align: right">Asignaciones para la Finca ${usro?.finca?.nombre}</h3>
        %{--<h3 class="titl" style="text-align: right">Asignación a la Finca ...</h3>--}%
    </div>

    <div class="col-md-2" style="margin-top: 14px">
        <g:select name="semana" from="${finca.Semana.list([sort: 'numero'])}"
                  class="form-control input-sm required text-info" optionValue="${{ 'Semana ' + it.numero }}"
                  optionKey="id"/>
    </div>

    <div class="col-md-1">
        <a href="#" class="btn btn-sm btn-success" id="btnActual" style="margin-top: 14px">
            <i class="fa fa-sync"></i> Actualizar
        </a>
    </div>

</div>
<div class="container" style="width: 1200px">

    <div id="divTabla">

    </div>

</div>

%{--<elm:pagination total="${tipoElementoInstanceCount}" params="${params}"/>--}%

<script type="text/javascript">
    var id = null;

    cargarTablaOrden();

    $("#semana").change(function () {
        cargarTablaOrden();
    });

    $("#btnActual").click(function () {
        cargarTablaOrden();
    });

    function cargarTablaOrden() {
        var smna = $("#semana option:selected").val();
        var ordn = $("#orden").val();
//        var ck_prdo = $("#prdoChck").is(':checked');
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'distribucion', action:'tablaFinca_ajax')}",
            data: {
                id: ordn, smna: smna
            },
            success: function (msg) {
                $("#divTabla").html(msg);
                $("#idOrden").val(${ordn?.id})
            } //success
        });
    }

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
        ev.keyCode === 190 || ev.keyCode === 110 ||
        ev.keyCode === 8 || ev.keyCode === 46 || ev.keyCode === 9 ||
        ev.keyCode === 37 || ev.keyCode === 39);
    }

</script>

</body>
</html>
