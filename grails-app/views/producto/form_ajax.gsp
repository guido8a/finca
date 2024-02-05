<%@ page import="seguridad.Prfl; seguridad.Persona" %>

<style type="text/css">

</style>

<g:if test="${!producto}">
    Error
</g:if>
<g:else>

    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmProducto" role="form" controller="producto" action="saveProducto_ajax" method="POST">
            <g:hiddenField name="id" value="${producto?.id}"/>

            <div class="form-group keeptogether ${hasErrors(bean: producto, field: 'familia', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="familia" class="col-md-2 control-label">
                            Familia
                        </label>
                        <span class="col-md-10">
                            <g:select name="familia" from="${finca.Familia.list([sort: 'descripcion'])}" class="form-control" optionValue="descripcion" optionKey="id" value="${producto?.familia?.id}"/>
                        </span>
                    </span>
                </div>
            </div>

            <div class="form-group keeptogether ${hasErrors(bean: producto, field: 'nombre', 'error')} required">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="nombre" class="col-md-2 control-label">
                            Nombre
                        </label>

                        <span class="col-md-10">
                            <g:textField name="nombre" maxlength="65" minlength="3" required="" class="form-control input-sm required" value="${producto?.nombre}"/>
                        </span>
                    </span>
                </div>
            </div>
            <div class="form-group keeptogether ${hasErrors(bean: producto, field: 'descripcion', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="descripcion" class="col-md-2 control-label">
                            Descripción
                        </label>

                        <span class="col-md-10">
                            <g:textField name="descripcion" maxlength="255"  class="form-control input-sm" value="${producto?.descripcion}"/>
                        </span>
                    </span>
                </div>
            </div>
            <div class="form-group keeptogether ${hasErrors(bean: producto, field: 'sku', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="sku" class="col-md-2 control-label">
                            Sku
                        </label>

                        <span class="col-md-10">
                            <g:textField name="sku" maxlength="31"  class="form-control input-sm" value="${producto?.sku}"/>
                        </span>
                    </span>
                </div>
            </div>
            <div class="form-group keeptogether ${hasErrors(bean: producto, field: 'marca', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="marca" class="col-md-2 control-label">
                            Marca
                        </label>

                        <span class="col-md-10">
                            <g:textField name="marca" maxlength="31"  class="form-control input-sm" value="${producto?.marca}"/>
                        </span>
                    </span>
                </div>
            </div>
            <div class="form-group keeptogether ${hasErrors(bean: producto, field: 'etiqueta', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="etiqueta" class="col-md-2 control-label">
                            Etiqueta
                        </label>

                        <span class="col-md-10">
                            <g:textField name="etiqueta" maxlength="31"  class="form-control input-sm" value="${producto?.etiqueta}"/>
                        </span>
                    </span>
                </div>
            </div>
            <div class="form-group keeptogether ${hasErrors(bean: producto, field: 'empaque', 'error')}">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="empaque" class="col-md-2 control-label">
                            Empaque
                        </label>

                        <span class="col-md-10">
                            <g:textField name="empaque" maxlength="31"  class="form-control input-sm" value="${producto?.empaque}"/>
                        </span>
                    </span>
                </div>
            </div>

            <div class="form-group keeptogether ${hasErrors(bean: producto, field: 'calibre', 'error')} ${hasErrors(bean: producto, field: 'size', 'error')}">
                <div class="col-md-6">
                    <span class="grupo">
                        <label for="calibre" class="col-md-4 control-label">
                            Calibre
                        </label>
                        <span class="col-md-8">
                            <g:textField name="calibre" class="form-control input-sm" value="${producto?.calibre}"/>
                        </span>
                    </span>
                </div>
                <div class="col-md-6">
                    <span class="grupo">
                        <label for="size" class="col-md-4 control-label">
                            Size
                        </label>
                        <span class="col-md-8">
                            <g:textField name="size" class="form-control input-sm" value="${producto?.size}"/>
                        </span>
                    </span>
                </div>
            </div>

            <div class="form-group keeptogether ${hasErrors(bean: producto, field: 'unindadesCaja', 'error')} ${hasErrors(bean: producto, field: 'peso', 'error')}">
                <div class="col-md-6">
                    <span class="grupo">
                        <label for="peso" class="col-md-4 control-label">
                            Peso
                        </label>
                        <span class="col-md-8">
                            <g:textField name="peso" class="form-control input-sm" value="${producto?.peso}"/>
                        </span>
                    </span>
                </div>
                <div class="col-md-6">
                    <span class="grupo">
                        <label for="unindadesCaja" class="col-md-4 control-label">
                            Unidades
                        </label>
                        <span class="col-md-8">
                            <g:textField name="unindadesCaja" class="form-control input-sm" value="${producto?.unindadesCaja}"/>
                        </span>
                    </span>
                </div>
            </div>

            <div class="form-group keeptogether ${hasErrors(bean: producto, field: 'tipo', 'error')} ${hasErrors(bean: producto, field: 'cajasPalet', 'error')}">
                <div class="col-md-6">
                    <span class="grupo">
                        <label for="cajasPalet" class="col-md-4 control-label">
                            Palet
                        </label>
                        <span class="col-md-8">
                            <g:textField name="cajasPalet" class="form-control input-sm" value="${producto?.cajasPalet}"/>
                        </span>
                    </span>
                </div>
                <div class="col-md-6">
                    <span class="grupo">
                        <label for="tipo" class="col-md-4 control-label">
                            Tipo
                        </label>
                        <span class="col-md-8">
                            <g:select name="tipo" from="${[0 : 'NO', 1: 'SI']}" class="form-control" optionValue="value" optionKey="key" value="${producto?.tipo}"/>
                        </span>
                    </span>
                </div>

            </div>

            <div class="form-group keeptogether ${hasErrors(bean: producto, field: 'fairTrade', 'error')} ${hasErrors(bean: producto, field: 'organico', 'error')}">
                <div class="col-md-6">
                    <span class="grupo">
                        <label for="organico" class="col-md-4 control-label">
                            Orgánico
                        </label>
                        <span class="col-md-8">
                            <g:select name="organico" from="${[0 : 'NO', 1: 'SI']}" class="form-control" optionValue="value" optionKey="key" value="${producto?.organico}" />
                        </span>
                    </span>
                </div>
                <div class="col-md-6">
                    <span class="grupo">
                        <label for="fairTrade" class="col-md-4 control-label">
                            Fair Trade
                        </label>
                        <span class="col-md-8">
                            <g:select name="fairTrade" from="${[0 : 'NO', 1: 'SI']}" class="form-control" optionValue="value" optionKey="key" value="${producto?.fairTrade}" />
                        </span>
                    </span>
                </div>
            </div>

        </g:form>
    </div>

    <script type="text/javascript">
        var validator = $("#frmProducto").validate({
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
                submitFormProducto();
                return false;
            }
            return true;
        });

    </script>

</g:else>