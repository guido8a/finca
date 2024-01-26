<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Herramienta</title>
</head>

<body>

<div class="btn-toolbar toolbar" style="margin-top: 10px">
    <div class="col-md-12">
        <label for="periodo" class="col-md-1 control-label text-info" style="text-align: right">
            Período Inicial
        </label>
        <div class="col-md-3">
            <g:select name="periodo" from="${tutor.Periodo.list([sort: 'descripcion'])}" class="form-control input-sm" optionValue="descripcion" optionKey="id" />
        </div>

        <label for="periodo" class="col-md-1 control-label text-info" style="text-align: right">
            Período Final
        </label>
        <div class="col-md-3" id="divPeriodo">

        </div>
    </div>
</div>


<script type="text/javascript">

    cargarPeriodo( $("#periodo option:selected").val());

    function cargarPeriodo(periodo){
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'herramientas', action:'periodo_ajax')}",
            data: {
                periodo: periodo
            },
            success: function (msg) {
                $("#divPeriodo").html(msg);
            } //success
        });
    }

    $("#periodo").change(function () {
        var periodo = $(this).val();
        cargarPeriodo(periodo);
    });


</script>

</body>
</html>
