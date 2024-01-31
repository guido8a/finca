<%@ page import="seguridad.Prfl; seguridad.Persona" %>

<style type="text/css">

</style>

<g:if test="${!finca}">
    Error
</g:if>
<g:else>

    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmFinca" role="form" controller="finca" action="saveFinca_ajax" method="POST">
            <g:hiddenField name="id" value="${finca?.id}"/>

            <div class="form-group keeptogether ${hasErrors(bean: finca, field: 'ciudad', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="ruc" class="col-md-2 control-label">
                            Ciudad
                        </label>

                        <span class="col-md-10">
                            <g:select name="ciudad" from="${geografia.Ciudad.list([sort: 'nombre'])}" optionKey="id" optionValue="nombre" class="form-control"/>
                        </span>
                    </span>
                </div>
            </div>

            <div class="form-group keeptogether ${hasErrors(bean: finca, field: 'ruc', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="ruc" class="col-md-2 control-label">
                            RUC
                        </label>

                        <span class="col-md-6">
                            <g:textField name="ruc" maxlength="13" minlength="10"  class="form-control input-sm required" value="${finca?.ruc}"/>
                        </span>
                    </span>
                </div>
            </div>

            <div class="form-group keeptogether ${hasErrors(bean: finca, field: 'nombre', 'error')} required">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="nombre" class="col-md-2 control-label">
                            Nombre
                        </label>

                        <span class="col-md-10">
                            <g:textField name="nombre" maxlength="63" minlength="3" required="" class="form-control input-sm required" value="${finca?.nombre}"/>
                        </span>
                    </span>
                </div>
            </div>

            <div class="form-group keeptogether ${hasErrors(bean: finca, field: 'direccion', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="direccion" class="col-md-2 control-label">
                            Dirección
                        </label>

                        <span class="col-md-10">
                            <g:textField name="direccion" maxlength="255"  class="form-control input-sm" value="${finca?.direccion}"/>
                        </span>
                    </span>
                </div>
            </div>
            <div class="form-group keeptogether ${hasErrors(bean: finca, field: 'telefono', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="telefono" class="col-md-2 control-label">
                            Teléfono
                        </label>

                        <span class="col-md-8">
                            <g:textField name="telefono" maxlength="63"  class="form-control input-sm" value="${finca?.telefono}"/>
                        </span>
                    </span>
                </div>
            </div>
            <div class="form-group keeptogether ${hasErrors(bean: finca, field: 'mail', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="etiqueta" class="col-md-2 control-label">
                            Mail
                        </label>

                        <span class="col-md-8">
                            <g:textField name="etiqueta" maxlength="63"  class="form-control input-sm mail email" value="${finca?.mail}"/>
                        </span>
                    </span>
                </div>
            </div>

            <div class="form-group keeptogether ${hasErrors(bean: finca, field: 'fechaInicio', 'error')} ${hasErrors(bean: finca, field: 'fechaFin', 'error')}">
                <div class="col-md-6">
                    <span class="grupo">
                        <label for="fechaInicio" class="col-md-4 control-label">
                            Fecha Inicio
                        </label>
                        <div class="col-md-8">
                            <div class="input-group input-group-sm">
                                <input aria-label="" name="fechaInicio" id='fechaInicio' type='text' class="form-control" value="${finca?.fechaInicio?.format("dd-MM-yyyy")}" />
                            </div>
                        </div>
                    </span>
                </div>
                <div class="col-md-6">
                    <span class="grupo">
                        <label for="fechaFin" class="col-md-4 control-label">
                            Fecha Fin
                        </label>
                        <div class="col-md-8">
                            <input aria-label="" name="fechaFin" id='fechaFin' type='text' class="form-control" value="${finca?.fechaFin?.format("dd-MM-yyyy")}" />
                        </div>
                    </span>
                </div>
            </div>

        </g:form>
    </div>

    <script type="text/javascript">

        $('#fechaInicio, #fechaFin').datetimepicker({
            locale: 'es',
            format: 'DD-MM-YYYY',
            sideBySide: true,
            showClose: true,
            icons: {
            }
        })


        var validator = $("#frmFinca").validate({
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
                submitFormFinca();
                return false;
            }
            return true;
        });

    </script>

</g:else>