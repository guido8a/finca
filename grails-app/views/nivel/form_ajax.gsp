
<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmNivel" role="form" action="saveNivel_ajax" method="POST">
        <g:hiddenField name="id" value="${nivel?.id}"/>

        <div class="form-group keeptogether ${hasErrors(bean: nivel, field: 'numero', 'error')}">
            <div class="row">
                <label for="numero" class="col-md-2 control-label">
                    Número
                </label>

                <div class="col-md-2">
                    <g:textField name="numero" maxlength="3" class="form-control required"
                                 value="${nivel?.numero ?: ''}"/>
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: nivel, field: 'descripcion', 'error')}">
            <div class="row">
                <label for="descripcion" class="col-md-2 control-label">
                    Descripción
                </label>

                <div class="col-md-4">
                    <g:textField name="descripcion" class="form-control required"
                                 value="${nivel?.descripcion ?: ''}"/>
                </div>
            </div>
        </div>

    </g:form>
</div>

<script type="text/javascript">

    $("#frmNivel").validate({
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
            submitFormNivel();
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

    $("#numero").keydown(function (ev) {
        return validarNum(ev);
    });



</script>
