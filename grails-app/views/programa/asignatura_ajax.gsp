<div class="col-md-8">
    <label for="asignatura" class="col-md-1 control-label" style="text-align: right">
        Asignatura
    </label>
    <g:select name="asignatura" from="${asignaturas}"
              class="form-control input-sm required" optionValue="${{it.nivel.descripcion + " - " + it.nombre + " (" +
            it.carrera.codigo + ")"}}"
              optionKey="${{it.id}}" />
</div>

<div class="col-md-1" style="margin-top: 19px">
    <div class="btn-group">
        <a href="#" id="btnVerProfesor" class="btn btn-info">
            <i class="fa fa-user"></i> Profesor
        </a>
    </div>
</div>

<script type="text/javascript">

    cargaTabla($("#paralelo option:selected").val(), $("#asignatura option:selected").val());


    $("#asignatura").change(function () {
        var asignatura = $(this).val();
        var asig = $("#asignatura").val();
        var paralelo = $("#paralelo option:selected").val();
        console.log('asig:', asignatura, asig)
        if(asignatura) {
            cargaTabla(paralelo, asignatura);
        }
    });

    $("#btnVerProfesor").click(function () {
        var asignatura = $("#asignatura option:selected").val();
        var paralelo = $("#paralelo option:selected").val();
        $.ajax({
            type    : "POST",
            url: "${createLink(action:'profesores_ajax')}",
            data    : {
                asignatura: asignatura,
                paralelo: paralelo
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgProfesor",
                    title   : "Profesor asignado",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        }
                     } //buttons
                }); //dialog
            } //success
        }); //ajax
    });

</script>