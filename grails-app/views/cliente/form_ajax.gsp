<%@ page import="seguridad.Prfl; seguridad.Persona" %>

<style type="text/css">

</style>

<g:if test="${!cliente}">
    Error
</g:if>
<g:else>

    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmCliente" role="form" controller="cliente" action="saveCliente_ajax" method="POST">
            <g:hiddenField name="id" value="${cliente?.id}"/>

            <div class="form-group keeptogether ${hasErrors(bean: cliente, field: 'ciudad', 'error')} required">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="ciudad" class="col-md-2 control-label">
                            Ciudad
                        </label>

                        <span class="col-md-10">
                           <g:select name="ciudad" from="${geografia.Ciudad.list([sort: 'nombre'])}" optionKey="id" optionValue="nombre" class="form-control" />
                        </span>
                    </span>
                </div>
            </div>

            <div class="form-group keeptogether ${hasErrors(bean: cliente, field: 'nombre', 'error')} required">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="nombre" class="col-md-2 control-label">
                            Nombre
                        </label>

                        <span class="col-md-10">
                            <g:textField name="nombre" maxlength="127" minlength="3" required="" class="form-control input-sm required" value="${cliente?.nombre}"/>
                        </span>
                    </span>
                </div>
            </div>
            <div class="form-group keeptogether ${hasErrors(bean: cliente, field: 'mail', 'error')} required">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="mail" class="col-md-2 control-label">
                            Mail
                        </label>

                        <span class="col-md-10">
                            <g:textField name="mail" maxlength="63" required="" class="form-control input-sm mail email required" value="${cliente?.mail}"/>
                        </span>
                    </span>
                </div>
            </div>

        </g:form>
    </div>

    <script type="text/javascript">

        var validator = $("#frmCliente").validate({
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
                submitFormCliente();
                return false;
            }
            return true;
        });

    </script>

</g:else>