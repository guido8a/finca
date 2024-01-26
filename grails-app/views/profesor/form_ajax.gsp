
<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmProfesor" role="form" action="saveProfesor_ajax" method="POST">
        <g:hiddenField name="id" value="${profesor?.id}"/>

        <div class="form-group keeptogether ${hasErrors(bean: profesor, field: 'tipoProfesor', 'error')}">
            <div class="row">
                <label for="tipoProfesor" class="col-md-2 control-label">
                    Tipo de Profesor
                </label>

                <div class="col-md-4">
                    <g:select name="tipoProfesor" from="${tutor.TipoProfesor.list([sort: 'descripcion'])}" optionKey="id" optionValue="descripcion" class="form-control" value="${profesor?.tipoProfesor?.id}"/>
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: profesor, field: 'nombre', 'error')}">
            <div class="row">
                <label for="nombre" class="col-md-2 control-label">
                    Nombre
                </label>

                <div class="col-md-8">
                    <g:textField name="nombre" class="form-control required"
                                 value="${profesor?.nombre}"/>
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: profesor, field: 'apellido', 'error')}">
            <div class="row">
                <label for="apellido" class="col-md-2 control-label">
                    Apellido
                </label>

                <div class="col-md-8">
                    <g:textField name="apellido" class="form-control required"
                                 value="${profesor?.apellido}"/>
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: profesor, field: 'mail', 'error')}">
            <div class="row">
                <label for="mail" class="col-md-2 control-label">
                    Email
                </label>

                <div class="col-md-8">
                    <g:textField name="mail" class="form-control email required" value="${profesor?.mail}"/>
                </div>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: profesor, field: 'extension', 'error')}">
            <div class="row">
                <label for="extension" class="col-md-2 control-label">
                    Extensión
                </label>
                <div class="col-md-3">
                    <g:textField name="extension" class="form-control"
                                 value="${profesor?.extension}"/>
                </div>


                <label for="sexo" class="col-md-2 control-label">
                    Sexo
                </label>

                <div class="col-md-3">
                    <g:select name="sexo" from="${['F' : 'Femenino', 'M' : 'Masculino']}" optionKey="key" optionValue="value" class="form-control" value="${profesor?.sexo}"/>
                </div>

            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: profesor, field: 'horas', 'error')}">
            <div class="row">
                <label for="extension" class="col-md-2 control-label">
                    Horas
                </label>
                <div class="col-md-3">
                    <g:textField name="horas" class="form-control required" value="${profesor?.horas ?: ''}"/>
                </div>
            </div>
        </div>

    </g:form>
</div>

<script type="text/javascript">

    $("#frmProfesor").validate({
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
            submitFormProfesor();
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

    $("#numero, #horas").keydown(function (ev) {
        return validarNum(ev);
    });



</script>
