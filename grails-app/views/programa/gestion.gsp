<%@ page import="tutor.Profesor; tutor.TipoActividad; tutor.Periodo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Gestión</title>

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
    <h3 class="titl">Programación de Gestión </h3>
</div>
<!-- botones -->
<div class="container" style="width: 1200px">
    <div class="btn-toolbar toolbar" style="margin-top: 10px">

        <g:hiddenField name="idGestion" value="" />

        <div class="col-md-12" style="margin-top: 25px">
            <div class="col-md-2">
                <label for="periodo" class="col-md-1 control-label text-info" style="text-align: right">
                    Período
                </label>
                <input type="checkbox" id="prdoChck" name="prdoChck" style="margin-left: 40px"/> Todos
                    <g:select name="periodo" from="${Periodo.list([sort: 'descripcion'])}"
                              class="form-control input-sm required" optionValue="descripcion" optionKey="id"
                    />
            </div>

            <div class="col-md-3">
                <label for="profesor" class="control-label" style="text-align: right">
                    Profesor
                </label>
                <a href="#" class="btn btn-xs btn-success" id="btnActual" style="margin-left: 40px">
                    <i class="fa fa-sync"></i> Actualizar
                </a>
                <g:select name="profesor" from="${tutor.Profesor.list([sort: 'apellido'])}"
                          class="form-control input-sm required" optionValue="${{it.apellido + " " +  it.nombre}}" optionKey="id"
                />
            </div>

            <div class="col-md-5">
                <label for="asignatura" class="control-label" style="text-align: right">
                    Actividad de Gestión
                </label>
                <g:select name="asignatura" from="${tutor.Asignatura.findAllByTipoActividad(tutor.TipoActividad.get(2) ,[sort: 'nombre'])}"
                          class="form-control input-sm required" optionValue="nombre" optionKey="id"
                />
            </div>

            <div class="col-md-1">
                <label for="hora" class="control-label" style="text-align: right">
                    Horas
                </label>
                <g:textField name="hora" maxlength="5" class="form-control required text-uppercase"
                             style="border:solid 1px #ccc; width: 60px"
                             value="${''}"/>
            </div>

            <div class="col-md-1" id="divBoton" style="margin-top: 23px">
                <a href="#" class="btn btn-success" id="btnAsignar" title="Asignar">
                    <i class="fa fa-check"></i> Asignar
                </a>
            </div>

            <div class="col-md-1 hide" id="divBoton2" style="margin-top: 23px; width: 80px; padding: 0; margin-left: -5px">
                <a href="#" class="btn btn-success" id="btnGuardarEdicion" title="Guardar">
                    <i class="fa fa-save"></i>
                </a>
                <a href="#" class="btn btn-info" id="btnCancelarEdicion" title="Cancelar">
                    <i class="fa fa-times"></i>
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


    cargarTablaGestion();

    $("#profesor").change(function () {
        cargarTablaGestion();
        cancelarEdicion();
    });

    $("#btnActual").click(function () {
        cargarTablaGestion();
        cancelarEdicion();
    });

    function cargarTablaGestion(){
        var idPeriodo = $("#periodo option:selected").val();
        var prof = $("#profesor").val();
        var ck_prdo = $("#prdoChck").is(':checked');
//        console.log('ck', ck_prdo)
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'programa', action:'tablaGestion_ajax')}",
            data: {
                id: idPeriodo, prof: prof, ck_prdo: ck_prdo
            },
            success: function (msg) {
                $("#divTabla").html(msg);
            } //success
        });
    }

    $("#btnAsignar").click(function () {
        guardarGestion();
    });

    function guardarGestion () {
        var d = cargarLoader("Guardando...");
        var id = $("#idGestion").val();
        var periodo = $("#periodo option:selected").val();
        var profesor = $("#profesor option:selected").val();
        var asignatura = $("#asignatura option:selected").val();
        var hora = $("#hora").val();

        if(hora != null && hora!== ''){
            $.ajax({
                type: "POST",
                url: "${createLink(controller: 'programa', action:'guardarGestion_ajax')}",
                data: {
                    id: id,
                    periodo: periodo,
                    profesor: profesor,
                    asignatura: asignatura,
                    hora: hora
                },
                success: function (msg) {
                    d.modal("hide");
                    var parts = msg.split("_");
                    if(parts[0] === 'ok'){
                        log(parts[1],  "success");
                        cargarTablaGestion();
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
                '<strong style="font-size: 14px">' +  'Ingrese el número de horas' +  '</strong>' + '</div>')
        }
    }

    $("#btnCancelarEdicion").click(function () {
        cancelarEdicion();
    });

    function cancelarEdicion(){
        $("#hora").val('');
        $("#idGestion").val('');
        $("#divBoton").removeClass("hide");
        $("#divBoton2").addClass("hide");
    }

    $("#btnGuardarEdicion").click(function () {
        guardarGestion();
        setTimeout(function () {
            cancelarEdicion();
        }, 800);
    });

    function borrarGestion(itemId) {
        bootbox.dialog({
            title   : "Alerta",
            message : '<div style="text-align: center">' + '<i class="fa fa-trash fa-2x text-danger"></i>'  +
            '<strong style="font-size: 14px">' +  'Está seguro que desea borrar este registro?' +  '</strong>' + '</div>',
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
                            url     : '${createLink(action:'borrarGestion_ajax')}',
                            data    : {
                                id : itemId
                            },
                            success : function (msg) {
                                v.modal("hide");
                                var parts = msg.split("_");
                                if(parts[0] === 'ok'){
                                    log(parts[1],"success");
                                    cargarTablaGestion();
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
