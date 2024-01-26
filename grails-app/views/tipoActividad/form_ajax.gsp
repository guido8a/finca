
<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmTipoActividad" role="form" action="saveTipoActividad_ajax" method="POST">
        <g:hiddenField name="id" value="${tipoActividad?.id}"/>

        <div class="form-group keeptogether ${hasErrors(bean: tipoActividad, field: 'descripcion', 'error')}">
            <div class="row">
                <label for="descripcion" class="col-md-2 control-label">
                    Descripcion
                </label>

                <div class="col-md-8">
                    <g:textField name="descripcion" maxlength="200" class="form-control input-sm required"
                                 value="${tipoActividad?.descripcion}"/>
                </div>
            </div>
            <br>
        </div>
    </g:form>
</div>

<script type="text/javascript">


    $("#frmTipoActividad").validate({
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
            submitFormTipoActividad();
            return false;
        }
        return true;
    });
</script>
