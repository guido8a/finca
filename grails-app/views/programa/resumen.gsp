<%@ page import="tutor.Periodo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Resumen</title>

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
    .otro {
        text-align: center !important;
        background-color: #d7bec8;
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
        margin-top: 0px;
        text-align: center;
    }
    </style>

</head>

<body>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>


<div class="col-md-12">
    <div class="col-md-2">
        <g:link controller="asignatura" action="list" class="btn btn-primary">
            <i class="fa fa-arrow-left"></i> Regresar
        </g:link>
    </div>
    <div class="col-md-6">
        <h3 class="titl">Resumen de cargas horarias</h3>
    </div>
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
</div>

<div id="divTabla">

</div>

<script type="text/javascript">

    function cargaTabla(prdo) {
        var data = {prdo: prdo};
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'programa', action:'rsmn_ajax')}",
            data: data,
            success: function (msg) {
                $("#divTabla").html(msg);
            } //success
        });
        //location.reload()//ajax
    }// /createEdit

    $( document ).ready(function() {
        $("#periodo").change()
    });

    $("#periodo").change(function () {
        var idPeriodo = $(this).val();
        cargaTabla(idPeriodo);
    })

</script>

</body>
</html>
