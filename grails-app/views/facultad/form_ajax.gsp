
<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmFacultad" role="form" action="saveFacultad_ajax" method="POST">
        <g:hiddenField name="id" value="${facultad?.id}"/>

        <div class="form-group keeptogether ${hasErrors(bean: facultad, field: 'nombre', 'error')}">
            <div class="row">
                <label for="nombre" class="col-md-2 control-label">
                    Nombre
                </label>

                <div class="col-md-8">
                    <g:textField name="nombre" class="form-control required"
                                 value="${facultad?.nombre}"/>
                </div>
            </div>
        </div>
    </g:form>
</div>

<script type="text/javascript">

    $("#frmFacultad").validate({
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
            submitFormFacultad();
            return false;
        }
        return true;
    });

</script>
