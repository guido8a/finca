
<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmPeriodo" role="form" action="savePeriodo_ajax" method="POST">
        <g:hiddenField name="id" value="${periodo?.id}"/>

        <div class="form-group keeptogether ${hasErrors(bean: periodo, field: 'padre', 'error')}">
            <div class="row">
                <label for="padre" class="col-md-2 control-label">
                    Padre
                </label>

                <div class="col-md-8">
                    <g:select name="padre" class="form-control" from="${tutor.Periodo.list([sort: 'descripcion'])}" optionKey="id" optionValue="descripcion" noSelection="[null : 'Ninguno']" value="${periodo?.padre?.id}" />
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: periodo, field: 'descripcion', 'error')}">
            <div class="row">
                <label for="descripcion" class="col-md-2 control-label">
                    Descripción
                </label>

                <div class="col-md-8">
                    <g:textField name="descripcion" maxlength="200" class="form-control required"
                                 value="${periodo?.descripcion}"/>
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: periodo, field: 'tipo', 'error')}">
            <div class="row">
                <label for="tipo" class="col-md-2 control-label">
                    Tipo
                </label>

                <div class="col-md-8">
                    <g:select name="tipo" class="form-control" from="${['I' : 'Intersemestral', 'N' : 'Normal']}" optionKey="key" optionValue="value"  value="${periodo?.tipo}" />
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: periodo, field: 'semanas', 'error')}">
            <div class="row">
                <label for="semanas" class="col-md-2 control-label">
                    Semanas
                </label>

                <div class="col-md-3">
                    <g:textField name="semanas" maxlength="3" class="form-control required"
                                 value="${periodo?.semanas ?: ''}"/>
                </div>
            </div>
        </div>
    </g:form>
</div>

<script type="text/javascript">


    $("#frmPeriodo").validate({
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
            submitPeriodo();
            return false;
        }
        return true;
    });

    function validarNum(ev) {
        /*
         48-57      -> numeros
         96-105     -> teclado numerico
         188        -> , (coma)
         190        -> . (punto) teclado
         110        -> . (punto) teclado numerico
         8          -> backspace
         46         -> delete
         9          -> tab
         37         -> flecha izq
         39         -> flecha der
         */
        return ((ev.keyCode >= 48 && ev.keyCode <= 57) ||
            (ev.keyCode >= 96 && ev.keyCode <= 105) ||
            // ev.keyCode === 190 || ev.keyCode === 110 ||
            ev.keyCode === 8 || ev.keyCode === 46 || ev.keyCode === 9 ||
            ev.keyCode === 37 || ev.keyCode === 39);
    }

    $("#semanas").keydown(function (ev) {
        return validarNum(ev);
    });

</script>
