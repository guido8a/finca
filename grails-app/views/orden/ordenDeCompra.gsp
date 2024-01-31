<%@ page import="finca.Producto; finca.Semana; finca.Cliente" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Orden</title>

    <style type="text/css">
    .gestion > td {
        background-color: #ff8080;
        color: #0c0460;
    }

    .normal > td {
        background-color: #d7dff9;
        color: #0c3440;
    }
    .usado {
        text-align: center !important;
        background-color: #91caef !important;
    }
    .otro {
        text-align: center !important;
        background-color: #d7bec8 !important;
    }
    .libre {
    //background-color: #dadada;
        color: #606060;
    }
    .horas {
        text-align: center !important;
    }

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
        <h3 class="titl" style="text-align: right">Orden de Compra de ${cliente.nombre}</h3>
    </div>
    <div class="col-md-3" style="margin-top: 14px">
        %{--<label for="semana" class="control-label" style="text-align: right">--}%
            %{--Semana--}%
        %{--</label>--}%
        <g:select name="semana" from="${finca.Semana.list([sort: 'numero'])}"
                  class="form-control input-sm required text-info" optionValue="${{'Semana ' + it.numero + ' : ' + it.fechaInicio.format('dd-MM-yyyyy') +
                " - " +  it.fechaFin.format('dd-MM-yyyyy')}}" optionKey="id"
        />
    </div>
    <div class="col-md-1">
        <a href="#" class="btn btn-sm btn-success" id="btnActual" style="margin-top: 14px">
            <i class="fa fa-sync"></i> Actualizar
        </a>
    </div>

</div>
<!-- botones -->
<div class="container" style="width: 1200px">
    <div class="btn-toolbar toolbar" style="margin-top: 10px">

        <g:hiddenField name="idOrden" value="" />

        <div class="col-md-12" style="margin-top: 25px">
            <div class="col-md-3">

            </div>
            <div class="col-md-1">
                <label for="producto" class="control-label" style="text-align: right">
                    Producto
                </label>
            </div>

            <div class="col-md-4">
                <g:select name="producto" from="${finca.Producto.list([sort: 'nombre'])}"
                          class="form-control input-sm required" optionValue="nombre" optionKey="id"
                />
            </div>

            <div class="col-md-1">
                <label for="cantidad" class="control-label" style="text-align: right">
                    Cantidad
                </label>
            </div>

            <div class="col-md-1">
                <g:textField name="cantidad" maxlength="5" class="form-control required text-uppercase"
                             style="border:solid 1px #ccc; width: 60px"
                             value="${''}"/>
            </div>

            <div class="col-md-1" id="divBoton">
                <a href="#" class="btn btn-success" id="btnAsignar" title="Asignar">
                    <i class="fa fa-check"></i> Aceptar
                </a>
            </div>

            <div class="col-md-1 hide" id="divBoton2" style="width: 180px; padding: 0; margin-left: -5px">
                <a href="#" class="btn btn-success" id="btnGuardarEdicion" title="Guardar">
                    <i class="fa fa-save"></i> Guradar
                </a>
                <a href="#" class="btn btn-info" id="btnCancelarEdicion" title="Cancelar">
                    <i class="fa fa-times"></i> Cancelar
                </a>
            </div>


        </div>
    </div>

    <div id="divTabla">

    </div>

</div>

%{--<elm:pagination total="${tipoElementoInstanceCount}" params="${params}"/>--}%

<script type="text/javascript">
    var id = null;


    cargarTablaOrden();

    $("#semana").change(function () {
        cargarTablaOrden();
        cancelarEdicion();
    });

    $("#btnActual").click(function () {
        cargarTablaOrden();
        cancelarEdicion();
    });

    function cargarTablaOrden(){
        var smna = $("#semana option:selected").val();
        var ordn = $("#orden").val();
//        var ck_prdo = $("#prdoChck").is(':checked');
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'orden', action:'tablaOrden_ajax')}",
            data: {
                id: ordn, smna: smna
            },
            success: function (msg) {
                $("#divTabla").html(msg);
                $("#idOrden").val(${ordn?.id})
            } //success
        });
    }

    $("#btnAsignar").click(function () {
        guardarGestion();
    });

    function guardarGestion () {
        var d = cargarLoader("Guardando...");
        var id = $("#idOrden").val();
        var clnt = $("#cliente option:selected").val();
        var smna = $("#semana option:selected").val();
        var prod = $("#producto option:selected").val();
        var cntd = $("#cantidad").val();
        console.log('data:', id, clnt, smna, prod, cntd);

        if(cntd != null && cntd !== ''){
            $.ajax({
                type: "POST",
                url: "${createLink(controller: 'orden', action:'save_ajax')}",
                data: {
                    id: id,
                    clnt: clnt,
                    smna: smna,
                    prod: prod,
                    cntd: cntd
                },
                success: function (msg) {
                    d.modal("hide");
                    var parts = msg.split("_");
                    if(parts[0] === 'ok'){
                        log(parts[1],  "success");
                        cargarTablaOrden();
                    }else{
                        bootbox.alert( '<div style="text-align: center">' +
                            '<i class="fa fa-exclamation-triangle fa-2x text-danger"></i>'  +
                            '<strong style="font-size: 14px">' +  parts[1] +  '</strong>' + '</div>')
                    }
                } //success
            });
        }else{
            d.modal("hide");
            bootbox.alert( '<div style="text-align: center">' + '<i class="fa fa-exclamation-triangle fa-2x text-info"></i>'  +
                '<strong style="font-size: 14px">' + ' Ingrese la cantidad de la Órden' +  '</strong>' + '</div>')
        }
    }

    $("#btnCancelarEdicion").click(function () {
        cancelarEdicion();
    });

    function cancelarEdicion(){
        $("#producto").val('');
        $("#cantidad").val('');
        $("#divBoton").removeClass("hide");
        $("#divBoton2").addClass("hide");
    }

    $("#btnGuardarEdicion").click(function () {
        guardarGestion();
        setTimeout(function () {
            cancelarEdicion();
        }, 800);
    });

    function borrarProducto(itemId, producto) {
        console.log('id', itemId, producto)
        bootbox.dialog({
            title   : "Alerta",
            message : '<div style="text-align: center">' + '<i class="fa fa-trash fa-2x text-danger"></i>'  +
               ' ¿Está seguro que desea borrar ' + '<strong style="font-size: 14px">' +  producto + '?</strong></div>',
            buttons : {
                cancelar : {
                    label     : "Cancelar",
                    className : "btn-primary",
                    callback  : function () {
                    }
                },
                eliminar : {
                    label     : "<i class='fa fa-trash'></i> Eliminar",
                    className : "btn-danger",
                    callback  : function () {
                        var v = cargarLoader("Eliminando...");
                        $.ajax({
                            type    : "POST",
                            url     : '${createLink(action:'borrarProducto_ajax')}',
                            data    : {
                                id : itemId
                            },
                            success : function (msg) {
                                v.modal("hide");
                                var parts = msg.split("_");
                                if(parts[0] === 'ok'){
                                    log(parts[1],"success");
                                    cargarTablaOrden();
                                    setTimeout(function () {
                                        cancelarEdicion();
                                    }, 800);
                                }else{
                                    log(parts[1],"error")
                                }
                            }
                        });
                    }
                }
            }
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

   $("#hora").keydown(function (ev) {
       return validarNum(ev);
   });



</script>

</body>
</html>