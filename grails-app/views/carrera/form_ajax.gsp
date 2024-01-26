
<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmCarrera" role="form" action="saveCarrera_ajax" method="POST">
        <g:hiddenField name="id" value="${carrera?.id}"/>

        <div class="form-group keeptogether ${hasErrors(bean: carrera, field: 'facultad', 'error')}">
            <div class="row">
                <label for="facultad" class="col-md-2 control-label">
                    Facultad
                </label>

                <div class="col-md-6">
                    <g:select name="facultad" class="form-control" from="${tutor.Facultad.list([sort: 'nombre'])}" optionValue="nombre" optionKey="id" value="${carrera?.facultad?.id}" />
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: carrera, field: 'nombre', 'error')}">
            <div class="row">
                <label for="nombre" class="col-md-2 control-label">
                    Nombre
                </label>

                <div class="col-md-8">
                    <g:textField name="nombre" class="form-control required"
                                 value="${carrera?.nombre}"/>
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: carrera, field: 'codigo', 'error')}">
            <div class="row">
                <label for="codigo" class="col-md-2 control-label">
                    Código
                </label>

                <div class="col-md-4">
                    <g:textField name="codigo" class="form-control required"
                                 value="${carrera?.codigo}"/>
                </div>
            </div>
        </div>


    </g:form>
</div>

<script type="text/javascript">

    $("#frmCarrera").validate({
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
            submitFormCarrera();
            return false;
        }
        return true;
    });

</script>
