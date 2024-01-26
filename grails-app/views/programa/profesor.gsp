<%@ page import="tutor.Periodo" %>
<!DOCTYPE html>
<html>
<head>
    %{--<meta name="layout" content="login">--}%
    <meta name="layout" content="main">
    <title>Horario profesor</title>

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
    <h3 class="titl" style="margin-top: -35px">Carga horaria por profesor</h3>
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

        <div class="col-md-7" id="divProfesor">

        </div>
    </div>

    <div id="divTabla">

    </div>

</div>


<script type="text/javascript">
    var id = null;

    function cargaTabla(prof) {
        var prdo = $("#periodo option:selected").val();
        var data = {prof: prof, prdo: prdo};

        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'programa', action:'prof_ajax')}",
            data: data,
            success: function (msg) {
                $("#divTabla").html(msg);
            } //success
        });
        //location.reload()//ajax
    }// /createEdit

    cargarProfesor( $("#periodo option:selected").val() );

    function cargarProfesor(periodo){
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'programa', action:'dictan_ajax')}",
            data: {
                periodo: periodo
            },
            success: function (msg) {
                $("#divProfesor").html(msg);
            } //success
        });
    }

    $("#periodo").change(function () {
        var idPeriodo = $(this).val();
        cargarProfesor(idPeriodo);
    })

</script>

</body>
</html>
