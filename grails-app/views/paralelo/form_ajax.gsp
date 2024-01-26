
<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmParalelo" role="form" action="saveParalelo_ajax" method="POST">
        <g:hiddenField name="id" value="${paralelo?.id}"/>

        <div class="form-group keeptogether ${hasErrors(bean: paralelo, field: 'periodo', 'error')}">
            <div class="row">
                <label for="periodo" class="col-md-2 control-label">
                    Período
                </label>

                <div class="col-md-6">
                   <g:select name="periodo" class="form-control" from="${tutor.Periodo?.list([sort: 'descripcion'])}" optionValue="descripcion" optionKey="id" value="${paralelo?.periodo?.id}" />
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: paralelo, field: 'carrera', 'error')}">
            <div class="row">
                <label for="carrera" class="col-md-2 control-label">
                    Carrera
                </label>

                <div class="col-md-6">
                    <g:select name="carrera" class="form-control" from="${tutor.Carrera?.list([sort: 'nombre'])}" optionValue="nombre" optionKey="id" value="${paralelo?.carrera?.id}" />
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: paralelo, field: 'nivel', 'error')}">
            <div class="row">
                <label for="nivel" class="col-md-2 control-label">
                    Nivel
                </label>

                <div class="col-md-6">
                    <g:select name="nivel" class="form-control" from="${tutor.Nivel?.list([sort: 'numero'])}" optionValue="descripcion" optionKey="id" value="${paralelo?.nivel?.id}" />
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: paralelo, field: 'numero', 'error')}">
            <div class="row">
                <label for="numero" class="col-md-2 control-label">
                    Paralelo
                </label>

                <div class="col-md-3">
                    <g:textField name="numero" maxlength="10" class="form-control required"
                                 value="${paralelo?.numero}"/>
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: paralelo, field: 'numEstudiantes', 'error')}">
            <div class="row">
                <label for="numEstudiantes" class="col-md-2 control-label">
                    Número de estudiantes
                </label>

                <div class="col-md-2">
                    <g:textField name="numEstudiantes" maxlength="10" class="form-control required"
                                 value="${paralelo?.numEstudiantes ?: 1}"/>
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: paralelo, field: 'cupo', 'error')}">
            <div class="row">
                <label for="cupo" class="col-md-2 control-label">
                    Paralelo
                </label>

                <div class="col-md-2">
                    <g:textField name="cupo" maxlength="10" class="form-control required"
                                 value="${paralelo?.cupo ?: 1}"/>
                </div>
            </div>
        </div>

    </g:form>
</div>

<script type="text/javascript">


    $("#frmParalelo").validate({
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
            submitFormParalelo();
            return false;
        }
        return true;
    });

</script>
