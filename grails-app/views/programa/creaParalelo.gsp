<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmAsignatura" role="form" action="grabaParalelo" method="POST">
        <g:hiddenField name="id" value="${paralelo?.id}"/>
        <g:hiddenField name="asig" value="${asignatura?.id}"/>

        <div class="form-group keeptogether ${hasErrors(bean: paralelo, field: 'nombre', 'error')}">

            <div class="row">
                <label for="numero" class="col-md-4 control-label" style="text-align: right">
                    Paralelo Número
                </label>

                <div class="col-md-1">
                    <g:textField name="numero" maxlength="1" class="form-control required text-uppercase"
                          style="border:solid 1px #ccc; width: 40px"
                                 value="${paralelo?.numero}"/>
                </div>

                <label for="nrc" class="col-md-3 control-label" style="text-align: right">
                    NRC
                </label>

                <div class="col-md-2">
                    <g:textField name="nrc" maxlength="4" class="form-control required text-uppercase"
                                 style="border:solid 1px #ccc;"
                                 value="${paralelo?.nrc}"/>
                </div>
            </div>

            <div class="row" style="margin-top: 15px">
                <label for="numEstudiantes" class="col-md-4 control-label" style="text-align: right">
                    Núm. de estudiantes esperados
                </label>

                <div class="col-md-2">
                    <g:textField name="numEstudiantes" maxlength="2" class="form-control input-sm required"
                                 style="border:solid 1px #ccc; width: 60px"
                                 value="${paralelo?.numEstudiantes}"/>
                </div>

                <label for="cupo" class="col-md-2 control-label" style="text-align: right">
                    Cupo
                </label>

                <div class="col-md-1">
                    <g:textField name="cupo" maxlength="2" class="form-control input-sm required"
                                 style="border:solid 1px #ccc; width: 60px"
                                 value="${paralelo?.cupo}"/>
                </div>

            </div>
        </div>
    </g:form>
    <div class="col-md-12" style="text-align: end; border-top: solid #345; border-width: 1px; padding-top: 15px">
        <button id="cerrar" class="btn btn-primary">Cancelar</button>
        <button id="grabar" class="btn btn-info">Grabar</button>
    </div>
</div>

<script type="text/javascript">
    $(".form-control").keydown(function (ev) {
        if (ev.keyCode == 13) {
            console.log("Llama a validar")
            $("#grabar").click()
            return false;
        }
        return true;
    });


    $("#grabar").click(function () {
        var numero = $("#numero").val();
        var nrc = $('#nrc').val();
        var numEstudiantes = $('#numEstudiantes').val();
        var cupo = $('#cupo').val();

        console.log("validando...")

        if (numero == '' || nrc == '' || numEstudiantes == '' || cupo == '') {
            bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +
                " Llene todos los campos")
        } else {
            submitForm();
            //$(".modal-dialog").hide()
            setTimeout(function () {

                location.reload(true)
            }, 300);
            //location.reload(true)
        }

    });

    $("#cerrar").click(function () {
        location.reload(true)
    });
</script>
