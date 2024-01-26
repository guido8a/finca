<%@ page import="tutor.Periodo" %>
<!DOCTYPE html>
<html>
<head>
    %{--<meta name="layout" content="login">--}%
    <meta name="layout" content="main">
    <title>Horario paralelo</title>

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
        background-color: #91caef;
    }
    .libre {
        text-align: center !important;
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
    <div class="btn-group">
        <g:link controller="asignatura" action="list" class="btn btn-primary">
            <i class="fa fa-arrow-left"></i> Regresar
        </g:link>
    </div>
    <h3 class="titl" style="margin-top: -35px">Horario del paralelo</h3>
</div>
<!-- botones -->
<div class="container" style="width: 1200px">
    <div class="btn-toolbar toolbar" style="margin-top: 10px">

        <div class="col-md-1">
            <label for="periodo" class="col-md-1 control-label" style="text-align: right">
                Período
            </label>
        </div>
        <div class="col-md-2">
            <g:select name="periodo" from="${tutor.Periodo.list([sort: 'descripcion'])}"
                      class="form-control input-sm required" optionValue="descripcion" optionKey="id"
            />
        </div>

        <div class="col-md-1">
            <label for="nivel" class="col-md-1 control-label" style="text-align: right">
                Nivel
            </label>
        </div>
        <div class="col-md-2">
            <g:select name="nivel" from="${tutor.Nivel.list([sort: 'numero'])}"
                      class="form-control input-sm required" optionValue="descripcion" optionKey="id"
            />
        </div>

        <div class="col-md-5" id="divParalelo">

        </div>

    </div>


    <div id="divTabla">

    </div>

</div>


<script type="text/javascript">
    //    var id = null;

    function cargaTabla(parl) {
        // var asig = $("#asignatura option:selected").val();
        var data = {parl: parl};
        console.log('cargaTabla', parl)
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'programa', action:'parl_ajax')}",
            data: data,
            success: function (msg) {
                $("#divTabla").html(msg);
            } //success
        });
        //location.reload()//ajax
    }// /createEdit


    $(document).ready(function () {
        //console.log( "ready!" );
        var asig = $("#asignatura").val();
        var parl = $("#paralelo").val();
        $("#paralelo").change()
    });

    cargaParalelo($("#periodo option:selected").val(), $("#nivel option:selected").val());

    function cargaParalelo(periodo, nivel) {
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'programa', action:'cursos_ajax')}",
            data: {
                periodo: periodo,
                nivel: nivel
            },
            success: function (msg) {
                $("#divParalelo").html(msg);
            } //success
        });
    }

    $("#nivel").change(function () {
        var idNivel = $(this).val();
        var idPeriodo = $("#periodo option:selected").val();
        cargaParalelo(idPeriodo, idNivel);
    });

    $("#periodo").change(function () {
        var idPeriodo = $(this).val();
        var idNivel = $("#nivel option:selected").val();
        cargaParalelo(idPeriodo, idNivel);
    })

</script>

</body>
</html>
