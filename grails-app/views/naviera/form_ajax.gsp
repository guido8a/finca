<%@ page import="seguridad.Prfl; seguridad.Persona" %>

<style type="text/css">

</style>

<g:if test="${!naviera}">
    Error
</g:if>
<g:else>

    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmNaviera" role="form" controller="naviera" action="saveNaviera_ajax" method="POST">
            <g:hiddenField name="id" value="${naviera?.id}"/>

            <div class="form-group keeptogether ${hasErrors(bean: naviera, field: 'nombre', 'error')} required">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="nombre" class="col-md-2 control-label">
                            Nombre
                        </label>

                        <span class="col-md-10">
                            <g:textField name="nombre" maxlength="63" minlength="3" required="" class="form-control input-sm required" value="${naviera?.nombre}"/>
                        </span>
                    </span>
                </div>
            </div>


        </g:form>
    </div>

    <script type="text/javascript">

        var validator = $("#frmNaviera").validate({
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
                submitFormNaviera();
                return false;
            }
            return true;
        });

    </script>

</g:else>