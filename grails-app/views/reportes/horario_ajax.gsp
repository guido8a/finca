%{--<%@ page import="tutor.Periodo" %>--}%
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-1">
                <label>
                    Período
                </label>
            </div>
            <div class="col-md-4">
                %{--<g:select name="periodo" from="${tutor.Periodo.list([sort: 'descripcion'])}"--}%
                          %{--class="form-control input-sm required" optionValue="descripcion" optionKey="id"--}%
                %{--/>--}%
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-1">
                <label>
                    Nivel
                </label>
            </div>
            <div class="col-md-4">
                <g:select name="nivel" from="${tutor.Nivel.list([sort: 'numero'])}" class="form-control" optionKey="id" optionValue="descripcion"/>
            </div>
        </div>
    </div>

    <div class="row" id="divParalelo">

    </div>

</div>

<script type="text/javascript">

    cargarParalelo($("#periodo option:selected").val(), $("#nivel option:selected").val());

    function cargarParalelo(periodo, nivel){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'reportes', action: 'paralelo_ajax')}',
            data:{
                periodo: periodo,
                nivel: nivel
            },
            success: function (msg) {
                $("#divParalelo").html(msg)
            }
        })
    }

    $("#periodo").change(function () {
        var periodo = $(this).val();
        var nivel = $("#nivel option:selected").val();
        cargarParalelo(periodo, nivel)
    });

    $("#nivel").change(function () {
        var nivel = $(this).val();
        var periodo = $("#periodo option:selected").val();
        cargarParalelo(periodo, nivel)
    });


</script>