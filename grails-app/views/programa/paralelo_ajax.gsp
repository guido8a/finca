<div class="col-md-3">
    <label for="paralelo" class="col-md-1 control-label" style="text-align: right">
        Paralelo
    </label>
    <g:select name="paralelo" from="${paralelos}" style="margin-left: -20px; width: 130px"
              class="form-control input-sm required" optionValue="${{it.nivel.descripcion + " - " + it.numero}}"
              optionKey="id" />
</div>

<div id="divAsignatura">

</div>

%{--<div class="col-md-8">--}%
%{--    <label for="asignatura" class="col-md-1 control-label" style="text-align: right">--}%
%{--        Asignatura--}%
%{--    </label>--}%
%{--    <g:select name="asignatura" from="${asignatura}"--}%
%{--              class="form-control input-sm required" optionValue="${{it.nivel.descripcion + " - " + it.nombre + " (" +--}%
%{--            it.carrera.codigo + ")"}}"--}%
%{--              optionKey="id" value="params.asig"--}%
%{--    />--}%
%{--</div>--}%

%{--<div class="col-md-1" style="margin-top: 19px">--}%
%{--    <div class="btn-group">--}%
%{--        <a href="#" id="btnVerProfesor" class="btn btn-info">--}%
%{--            <i class="fa fa-user"></i> Profesor--}%
%{--        </a>--}%
%{--    </div>--}%
%{--</div>--}%

<script type="text/javascript">

    cargarAsignatura($("#paralelo option:selected").val());

    function cargarAsignatura(idParalelo){
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'programa', action:'asignatura_ajax')}",
            data: {
                paralelo: idParalelo
            },
            success: function (msg1) {
                $("#divAsignatura").html(msg1);
//                $("#asignatura").change()
            } //success
        });
    }

    $("#paralelo").change(function () {
        var paralelo = $(this).val();
        console.log('Paral:', paralelo)
        if(paralelo) {
            cargarAsignatura(paralelo)
//            cargaTabla($("#paralelo option:selected").val(), $("#asignatura option:selected").val());
        }
    });


//    $("#asignatura").change(function () {
//        var asignatura = $(this).val();
//        var paralelo = $("#paralelo option:selected").val();
//        console.log('Asig.', asignatura)
//        if(asignatura) {
//            cargaTabla(paralelo, asignatura);
//        }
//    });

    %{--$("#btnVerProfesor").click(function () {--}%
    %{--    var asignatura = $("#asignatura option:selected").val();--}%
    %{--    var paralelo = $("#paralelo option:selected").val();--}%
    %{--    $.ajax({--}%
    %{--        type    : "POST",--}%
    %{--        url: "${createLink(action:'profesores_ajax')}",--}%
    %{--        data    : {--}%
    %{--            asignatura: asignatura,--}%
    %{--            paralelo: paralelo--}%
    %{--        },--}%
    %{--        success : function (msg) {--}%
    %{--            var b = bootbox.dialog({--}%
    %{--                id      : "dlgProfesor",--}%
    %{--                title   : "Profesor asignado",--}%
    %{--                message : msg,--}%
    %{--                buttons : {--}%
    %{--                    cancelar : {--}%
    %{--                        label     : "Cancelar",--}%
    %{--                        className : "btn-primary",--}%
    %{--                        callback  : function () {--}%
    %{--                        }--}%
    %{--                    }--}%
    %{--                 } //buttons--}%
    %{--            }); //dialog--}%
    %{--        } //success--}%
    %{--    }); //ajax--}%
    %{--});--}%

</script>