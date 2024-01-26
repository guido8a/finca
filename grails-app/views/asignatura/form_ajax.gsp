<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmAsignatura" role="form" action="save_ajax" method="POST">
        <g:hiddenField name="id" value="${asignatura?.id}"/>

        <div class="form-group keeptogether ${hasErrors(bean: asignatura, field: 'nombre', 'error')}">

            <div class="row">
                <label for="nombre" class="col-md-2 control-label" style="text-align: right">
                    Código
                </label>

                <div class="col-md-3">
                    <g:textField name="codigo" maxlength="63" class="form-control required text-uppercase"
                          style="border:solid 1px #ccc;"
                                 value="${asignatura?.codigo}"/>
                </div>

                <label for="carrera" class="col-md-2 control-label" style="text-align: right">
                    Carrera
                </label>

                <div class="col-md-4">
                    <g:select name="carrera" from="${tutor.Carrera.list([sort: 'nombre'])}"
                              class="form-control input-sm required" optionValue="nombre" optionKey="id"
                              value="${asignatura?.carrera?.id}" noSelection="[null: 'Ninguno']"/>
                </div>
            </div>

            <div class="row" style="margin-top: 15px">
                <label for="nivel" class="col-md-2 control-label" style="text-align: right">
                    Nivel
                </label>

                <div class="col-md-2">
                    <g:select name="nivel" from="${tutor.Nivel.list([sort: 'numero'])}"
                              style="width: 120px"  optionValue="descripcion" optionKey="id"
                              class="form-control input-sm required"
                              value="${asignatura?.nivel?.id}" noSelection="[null: 'Ninguno']"/>
                </div>

                <label for="tipoActividad" class="col-md-3 control-label" style="text-align: right">
                    Tipo de Actividad
                </label>

                <div class="col-md-4">
                    <g:select name="tipoActividad" from="${tutor.TipoActividad.list([sort: 'descripcion'])}"
                              class="form-control input-sm required"  optionValue="descripcion" optionKey="id"
                              value="${asignatura?.tipoActividad?.id}"/>
                </div>
            </div>

            <div class="row" style="margin-top: 15px">
                <label for="creditos" class="col-md-3 control-label" style="text-align: right">
                    Número de créditos
                </label>

                <div class="col-md-2">
                    <g:textField name="creditos" maxlength="3" class="form-control input-sm required"
                                 style="border:solid 1px #ccc; width: 40px"
                                 value="${asignatura?.creditos}"/>
                </div>

                <label for="horasTeoria" class="col-md-1 control-label" style="text-align: right">
                    Horas teoría
                </label>

                <div class="col-md-1">
                    <g:textField name="horasTeoria" maxlength="3" class="form-control input-sm required"
                                 style="border:solid 1px #ccc; width: 40px"
                                 value="${asignatura?.horasTeoria}"/>
                </div>

                <label for="horasTeoria" class="col-md-3 control-label" style="text-align: right; margin-left: -20px">
                    Horas práctica
                </label>

                <div class="col-md-1">
                    <g:textField name="horasPractica" maxlength="3" class="form-control input-sm required"
                                 style="border:solid 1px #ccc; width: 40px"
                                 value="${asignatura?.horasPractica}"/>
                </div>
            </div>
            <div class="row" style="margin-top: 15px">
                <label for="nombre" class="col-md-2 control-label" style="text-align: right">
                    Asignatura
                </label>

                <div class="col-md-9">
                    <g:textField name="nombre" maxlength="70" class="form-control input-sm required"
                                 style="border:solid 1px #ccc;"
                                 value="${asignatura?.nombre}"/>
                </div>
            </div>

            <div class="row" style="margin-top: 15px">
                <label for="factorPreparacion" class="col-md-2 control-label" style="text-align: right">
                    Factor de Preparación
                </label>

                <div class="col-md-2">
                    <g:textField name="factorPreparacion" maxlength="4" class="form-control input-sm required"
                                 style="border:solid 1px #ccc; width: 50px"
                                 value="${asignatura?.factorPreparacion}" />
                </div>

                <label for="horasGestion" class="col-md-2 control-label" style="text-align: right">
                    Horas de gestión
                </label>

                <div class="col-md-1">
                    <g:textField name="horasGestion" maxlength="4" class="form-control input-sm required"
                                 style="border:solid 1px #ccc; width: 40px"
                                 value="${asignatura?.horasGestion}"/>
                </div>

                <label for="conjunta" class="col-md-3 control-label" style="text-align: right">
                    Asignatura conjunta
                </label>

                <div class="col-md-1">
                    <g:select name="conjunta" from="${['S': 'Si', 'N': 'No']}" required="" optionKey="key" optionValue="value"
                              class="form-control input-sm required" value="${asignatura?.conjunta?:'N'}" style="width: 50px"/>
                </div>
            </div>
        </div>
    </g:form>
%{--    <div class="col-md-12" style="text-align: end; border-top: solid #345; border-width: 1px; padding-top: 15px">--}%
%{--        <button id="cerrar" class="btn btn-primary">Cancelar</button>--}%
%{--        <button id="grabar" class="btn btn-info">Grabar</button>--}%
%{--    </div>--}%
</div>

<script type="text/javascript">


    $("#frmAsignatura").validate({
        errorClass     : "help-block",
        errorPlacement : function (error, element) {
            if (element.parent().hasClass("input-group")) {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);
            }
            element.parents(".grupo").addClass('has-error');
        },
        success        : function (label) {
            label.parents(".grupo").removeClass('has-error');
        }
    });

    $(".form-control").keydown(function (ev) {
        if (ev.keyCode === 13) {
            submitFormAsignatura();
            return false;
        }
        return true;
    });



    // $(".form-control").keydown(function (ev) {
    //     if (ev.keyCode == 13) {
    //         console.log("Llama a validar")
    //         $("#grabar").click()
    //         return false;
    //     }
    //     return true;
    // });


    %{--$("#grabar").click(function () {--}%
    %{--    var nombre = $("#nombre").val();--}%
    %{--    var apellido = $('#apellido').val();--}%
    %{--    var mail = $('#mail').val();--}%
    %{--    var sexo = $('#sexo').val();--}%
    %{--    var url = "${createLink(controller: 'asignatura', action:'list')}"--}%
    %{--    console.log("validando...")--}%

    %{--    if (nombre == '' || apellido == '' || mail == '' || sexo == '') {--}%
    %{--        bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +--}%
    %{--            " Llene todos los campos")--}%
    %{--    } else {--}%
    %{--        submitForm();--}%
    %{--        setTimeout(function () {--}%
    %{--            location.reload(true)--}%
    %{--        }, 300);--}%
    %{--    }--}%

    %{--});--}%

    %{--$("#cerrar").click(function () {--}%
    %{--    //location.href("${createLink(controller: 'asignatura', action:'list')}")--}%
    %{--    location.reload(true)--}%
    %{--});--}%
</script>
