<div class="modal-contenido">

    <div class="form-group keeptogether">
        <div class="col-md-12">
            <label class="col-md-2 control-label" style="text-align: right">
                Profesor
            </label>
            <div class="col-md-8">
                <g:select name="profesor" from="${tutor.Profesor.list([sort: 'apellido'])}"
                          class="form-control input-sm" optionValue="${{it.apellido + " " + it.nombre}}" optionKey="id"
                />
            </div>
            <div class="col-md-2">
                <div class="btn-group">
                    <a href="#" id="btnAsignarProfesor" class="btn btn-success">
                        <i class="fa fa-user"></i> Asignar
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div id="divTablaProfesor">

    </div>

</div>

<script type="text/javascript">

    cargarTablaProfesor();

    function cargarTablaProfesor(){
        var asignatura = '${asignatura?.id}';
        var paralelo = '${paralelo?.id}';
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'programa', action:'tablaProfesorAsignado_ajax')}",
            data: {
                asignatura: asignatura,
                paralelo: paralelo
            },
            success: function (msg) {
                $("#divTablaProfesor").html(msg);
            } //success
        });
    }

    $("#btnAsignarProfesor").click(function () {
        var d = cargarLoader("Guardando...");
        var profesor = $("#profesor option:selected").val();
        var asignatura = '${asignatura?.id}';
        var paralelo = '${paralelo?.id}';
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'programa', action:'saveProfesor_ajax')}",
            data: {
                profesor: profesor,
                paralelo: paralelo,
                asignatura: asignatura
            },
            success: function (msg) {
                d.modal("hide");
                var parts = msg.split("_");
                if(parts[0] === 'ok'){
                    log(parts[1],  "success");
                    cargarTablaProfesor();
                    cargaTabla($("#paralelo option:selected").val(), $("#asignatura option:selected").val());
                }else{
                    bootbox.alert( '<div style="text-align: center">' +
                        '<i class="fa fa-exclamation-triangle fa-2x text-danger"></i>'  +
                        '<strong style="font-size: 14px">' +  parts[1] +  '</strong>' + '</div>')
                }
            } //success
        });
    });

</script>